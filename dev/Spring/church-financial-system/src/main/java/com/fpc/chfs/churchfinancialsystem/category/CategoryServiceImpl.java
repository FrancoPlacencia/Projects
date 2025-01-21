package com.fpc.chfs.churchfinancialsystem.category;

import com.fpc.chfs.churchfinancialsystem.category.dto.CategoryDTO;
import com.fpc.chfs.churchfinancialsystem.category.dto.CategorySimpleDTO;
import com.fpc.chfs.churchfinancialsystem.church.Church;
import com.fpc.chfs.churchfinancialsystem.church.ChurchRepository;
import com.fpc.chfs.churchfinancialsystem.fund.Fund;
import com.fpc.chfs.churchfinancialsystem.fund.FundRepository;
import com.fpc.chfs.churchfinancialsystem.shared.dto.CommonResponseDTO;
import com.fpc.chfs.churchfinancialsystem.user.UserService;
import com.fpc.chfs.churchfinancialsystem.util.CHFSConstants;
import com.fpc.chfs.churchfinancialsystem.util.CHFSResponseUtil;
import com.fpc.chfs.churchfinancialsystem.util.CHFSUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.*;

@Slf4j
@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    CategoryRepository categoryRepository;

    @Autowired
    ChurchRepository churchRepository;

    @Autowired
    FundRepository fundRepository;

    @Autowired
    UserService userService;

    @Override
    public ResponseEntity<CommonResponseDTO> create(CategoryDTO request) {
        log.info("create request {}", request);
        Category category = getNewCategory(request);

        if (StringUtils.isEmpty(category.getName()) || StringUtils.isEmpty(category.getDescription())) {
            return CHFSResponseUtil.getDataMissingResponse();
        }

        if (categoryRepository.existsByName(category.getName())) {
            return CHFSResponseUtil.getAlreadyExistsResponse(CHFSConstants.CATEGORY);
        }

        //churchRepository.findByName(request.getChurch().getName()).ifPresent(category::setChurch);
        // fundRepository.findByName(request.getFund().getName()).ifPresent(category::setFund);
        log.info("create object {}", category);
        categoryRepository.save(category);
        return CHFSResponseUtil.getSuccessResponse(CHFSConstants.CATEGORY, CHFSConstants.CREATED);
    }

    @Override
    public ResponseEntity<List<CategoryDTO>> read() {
        List<Category> categories = categoryRepository.findAll();
        List<CategoryDTO> categoryResponseDTOs = new ArrayList<>();
        if (categories.isEmpty()) {
            return new ResponseEntity<>(categoryResponseDTOs, HttpStatus.OK);
        }

        for (Category category : categories) {
            categoryResponseDTOs.add(getCategoryDTO(category));
        }
        return new ResponseEntity<>(categoryResponseDTOs, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<List<CategorySimpleDTO>> readSimple(Integer churchId) {
        List<Category> categories = categoryRepository.findByChurchId(churchId);
        List<CategorySimpleDTO> categoryResponseDTOs = new ArrayList<>();
        if (categories.isEmpty()) {
            return new ResponseEntity<>(categoryResponseDTOs, HttpStatus.OK);
        }

        for (Category category : categories) {
            categoryResponseDTOs.add(getCategorySimpleDTO(category));
        }
        return new ResponseEntity<>(categoryResponseDTOs, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<CategoryDTO> read(Integer id) {
        return null;
    }

    @Override
    public ResponseEntity<CommonResponseDTO> update(CategoryDTO request) {
        Category category = getEditCategory(request);
        log.info("Update Request {}", CHFSUtil.objectToJSON(category, Category.class));

        if (
                StringUtils.isEmpty(category.getName()) ||
                StringUtils.isEmpty(category.getDescription()) ||
                category.getCategoryId() <= 0) {
            return CHFSResponseUtil.getDataMissingResponse();
        }

        Category dbCategory = categoryRepository.findById(category.getCategoryId()).orElse(null);
        if (dbCategory == null) {
            return CHFSResponseUtil.getNotFoundResponse(CHFSConstants.CATEGORY);
        }

        compareCategory(category, dbCategory);

        categoryRepository.save(dbCategory);

        int requestChurchID = category.getChurch().getChurchId();
        int dbChurchID = dbCategory.getChurch().getChurchId();
        log.info("churchID {} - {}", requestChurchID, dbChurchID);
        /*
        if(requestChurchID != dbChurchID) {
            churchRepository.findByChurchId(category.getChurch().getChurchId()).ifPresent(
                church -> categoryRepository.updateCategoryChurch(church.getChurchId(), dbCategory.getCategoryId())
            );
        }
*/
        if(requestChurchID != dbChurchID) {
            churchRepository.findByChurchId(category.getChurch().getChurchId()).ifPresent(dbCategory::setChurch);
        }

        int requestFundID = category.getFund().getFundId();
        int dbFundID = dbCategory.getFund().getFundId();
        log.info("fundID {} - {}", requestFundID, dbFundID);
        if(requestFundID != dbFundID) {
            fundRepository.findByFundId(category.getFund().getFundId()).ifPresent(dbCategory::setFund);
        }
/*
        if(requestFundID != dbFundID) {
            fundRepository.findByFundId(category.getFund().getFundId()).ifPresent(
                fund -> categoryRepository.updateCategoryFund(fund.getFundId(), dbCategory.getCategoryId())
            );
        }
*/

        categoryRepository.save(dbCategory);
        return CHFSResponseUtil.getSuccessResponse(CHFSConstants.CATEGORY, CHFSConstants.UPDATED);
    }

    @Override
    public ResponseEntity<CommonResponseDTO> delete(String name) {
        if (StringUtils.isEmpty(name)) {
            return CHFSResponseUtil.getDataMissingResponse();
        }

        Category category = categoryRepository.findByName(name).orElse(null);
        if (category == null) {
            return CHFSResponseUtil.getNotFoundResponse(CHFSConstants.CATEGORY);
        }

        categoryRepository.delete(category);
        return CHFSResponseUtil.getSuccessResponse(CHFSConstants.CATEGORY, CHFSConstants.DELETED);

    }

    private Category getNewCategory(CategoryDTO request) {
        return Category.builder()
                .name(request.getName())
                .description(request.getDescription())
                .createdBy(userService.getUserID())
                .createdOn(new Date(System.currentTimeMillis()))
                .fund(request.getFund())
                .church(request.getChurch())
                .build();
    }

    private Category getEditCategory(CategoryDTO request) {
        return Category.builder()
                .categoryId(request.getId())
                .name(request.getName())
                .description(request.getDescription())
                .updatedBy(userService.getUserID())
                .updatedOn(new Date(System.currentTimeMillis()))
                .church(request.getChurch())
                .fund(request.getFund())
                .build();
    }

    private CategoryDTO getCategoryDTO(Category category) {
        return CategoryDTO.builder()
                .id(category.getCategoryId())
                .name(category.getName())
                .description(category.getDescription())
                .fund(category.getFund())
                .church(category.getChurch())
                .build();
    }


    private CategorySimpleDTO getCategorySimpleDTO(Category category) {
        return CategorySimpleDTO.builder()
                .id(category.getCategoryId())
                .name(category.getName())
                .description(category.getDescription())
                .build();
    }

    private void compareCategory(Category category, Category dbCategory) {
        if (!category.getName().equals(dbCategory.getName())) {
            dbCategory.setName(category.getName());
        }
        if (!category.getDescription().equals(dbCategory.getDescription())) {
            dbCategory.setDescription(category.getDescription());
        }
        dbCategory.setUpdatedBy(category.getUpdatedBy());
        dbCategory.setUpdatedOn(category.getUpdatedOn());
    }

}
