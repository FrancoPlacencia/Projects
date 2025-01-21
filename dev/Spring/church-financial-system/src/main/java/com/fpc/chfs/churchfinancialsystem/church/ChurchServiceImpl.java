package com.fpc.chfs.churchfinancialsystem.church;

import com.fpc.chfs.churchfinancialsystem.category.Category;
import com.fpc.chfs.churchfinancialsystem.category.CategoryRepository;
import com.fpc.chfs.churchfinancialsystem.church.dto.ChurchDTO;
import com.fpc.chfs.churchfinancialsystem.church.dto.ChurchResponseDTO;
import com.fpc.chfs.churchfinancialsystem.church.dto.ChurchOptionResponseDTO;
import com.fpc.chfs.churchfinancialsystem.church.dto.PermissionDTO;
import com.fpc.chfs.churchfinancialsystem.shared.dto.CommonResponseDTO;
import com.fpc.chfs.churchfinancialsystem.user.User;
import com.fpc.chfs.churchfinancialsystem.user.UserRepository;
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

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Slf4j
@Service
public class ChurchServiceImpl implements ChurchService {

    @Autowired
    ChurchRepository churchRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    UserService userService;

    @Override
    public ResponseEntity<CommonResponseDTO> createChurch(ChurchDTO request) {
        Church church = getChurch(request);
        if (StringUtils.isEmpty(church.getName()) ||
                StringUtils.isEmpty(church.getDenomination()) ||
                StringUtils.isEmpty(church.getAddress()) ||
                StringUtils.isEmpty(church.getRegistration())
        ) {
            return CHFSResponseUtil.getDataMissingResponse();
        }

        if (churchExists(church.getName())) {
            return CHFSResponseUtil.getAlreadyExistsResponse(CHFSConstants.CHURCH);
        }

        churchRepository.save(church);
        return CHFSResponseUtil.getSuccessResponse(CHFSConstants.CHURCH, CHFSConstants.CREATED);
    }

    @Override
    public ResponseEntity<List<ChurchResponseDTO>> getAllChurches() {
        List<Church> churches = churchRepository.findAll();
        List<ChurchResponseDTO> churchResponseDTOs = new ArrayList<>();
        if (churches.isEmpty()) {
            return new ResponseEntity<>(churchResponseDTOs, HttpStatus.OK);
        }

        for (Church church : churches) {
            churchResponseDTOs.add(getChurchDTO(church));
        }
        return new ResponseEntity<>(churchResponseDTOs, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<ChurchResponseDTO> getChurchById(Integer churchId) {
        if (churchId == null || churchId <= 0) {
            return new ResponseEntity<>(getChurchDTO(new Church()), HttpStatus.BAD_REQUEST);
        }

        Church church = churchRepository.findByChurchId(churchId).orElse(null);
        if (church == null) {
            return new ResponseEntity<>(getChurchDTO(new Church()), HttpStatus.NOT_FOUND);
        }

        return new ResponseEntity<>(getChurchDTO(church), HttpStatus.OK);
    }

    @Override
    public ResponseEntity<CommonResponseDTO> updateChurch(ChurchDTO churchRequestDTO) {
        Church church = getChurch(churchRequestDTO);
        if (church.getChurchId() == null || church.getChurchId() <= 0) {
            return CHFSResponseUtil.getDataMissingResponse();
        }

        Church dbChurch = churchRepository.findByChurchId(church.getChurchId()).orElse(null);
        if (dbChurch == null) {
            return CHFSResponseUtil.getNotFoundResponse(CHFSConstants.CHURCH);
        }

        compareChurch(church, dbChurch);
        churchRepository.save(dbChurch);
        return CHFSResponseUtil.getSuccessResponse(CHFSConstants.CHURCH, CHFSConstants.UPDATED);
    }

    @Override
    public ResponseEntity<CommonResponseDTO> deleteChurch(String name) {
        if (StringUtils.isEmpty(name)) {
            return CHFSResponseUtil.getDataMissingResponse();

        }

        Church church = churchRepository.findByName(name).orElse(null);
        if (church == null) {
            return CHFSResponseUtil.getNotFoundResponse(CHFSConstants.CHURCH);
        }

        churchRepository.delete(church);
        return CHFSResponseUtil.getSuccessResponse(CHFSConstants.CHURCH, CHFSConstants.DELETED);
    }

    @Override
    public ResponseEntity<List<ChurchOptionResponseDTO>> getAllChurchOptions() {
        List<Church> churches = churchRepository.findAll();
        List<ChurchOptionResponseDTO> churchOptionResponseDTOs = new ArrayList<>();
        if (churches.isEmpty()) {
            return new ResponseEntity<>(churchOptionResponseDTOs, HttpStatus.OK);

        }
        for (Church church : churches) {
            churchOptionResponseDTOs.add(getChurchOptionDTO(church));
        }
        return new ResponseEntity<>(churchOptionResponseDTOs, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<List<ChurchOptionResponseDTO>> getAllChurchOptionsByUser(Integer userId) {
        List<ChurchOptionResponseDTO> churchOptionResponseDTOs = new ArrayList<>();
        if (userId == null || userId <= 0) {
            return new ResponseEntity<>(churchOptionResponseDTOs, HttpStatus.BAD_REQUEST);
        }

        List<Church> churches = churchRepository.findAllByUserId(userId);
        if (churches.isEmpty()) {
            return new ResponseEntity<>(churchOptionResponseDTOs, HttpStatus.OK);
        }

        for (Church church : churches) {
            churchOptionResponseDTOs.add(getChurchOptionDTO(church));
        }
        return new ResponseEntity<>(churchOptionResponseDTOs, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<List<ChurchOptionResponseDTO>> getAllChurchOptionsMissingByUser(Integer userId) {
        List<ChurchOptionResponseDTO> churchOptionResponseDTOs = new ArrayList<>();
        if (userId == null || userId <= 0) {
            return new ResponseEntity<>(churchOptionResponseDTOs, HttpStatus.BAD_REQUEST);
        }

        List<Church> churches = churchRepository.findAllMissingByUser(userId);
        if (churches.isEmpty()) {
            return new ResponseEntity<>(churchOptionResponseDTOs, HttpStatus.OK);
        }

        for (Church church : churches) {
            churchOptionResponseDTOs.add(getChurchOptionDTO(church));
        }
        return new ResponseEntity<>(churchOptionResponseDTOs, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<CommonResponseDTO> addPermission(PermissionDTO permission) {
        if (permission.getUserId() == null || permission.getUserId() <= 0 ||
                permission.getChurchId() == null || permission.getChurchId() <= 0) {
            return CHFSResponseUtil.getDataMissingResponse();
        }

        Church church = churchRepository.findByChurchId(permission.getChurchId()).orElse(null);
        if (church == null) {
            return CHFSResponseUtil.getNotFoundResponse(CHFSConstants.CHURCH);
        }

        User user = userRepository.findByUserId(permission.getUserId()).orElse(null);
        if (user == null) {
            return CHFSResponseUtil.getNotFoundResponse(CHFSConstants.USER);
        }
        user.getChurches().add(church);
        user.setChurches(user.getChurches());
        log.info("User with new permission {}",user);
        userRepository.save(user);
        return CHFSResponseUtil.getSuccessResponse(CHFSConstants.PERMISSION, CHFSConstants.CREATED);
    }


    private Church getChurch(ChurchDTO request) {
        return Church.builder()
                .churchId(request.getChurchId())
                .name(request.getName())
                .denomination(request.getDenomination())
                .address(request.getAddress())
                .registration(request.getRegistration())
                .createdBy(userService.getUserID())
                .createdOn(new Date(System.currentTimeMillis()))
                .build();
    }

    private ChurchResponseDTO getChurchDTO(Church church) {
        return ChurchResponseDTO.builder()
                .churchId(church.getChurchId())
                .name(church.getName())
                .denomination(church.getDenomination())
                .address(church.getAddress())
                .registration(church.getRegistration())
                .categories(church.getCategories())
                .build();
    }

    private ChurchOptionResponseDTO getChurchOptionDTO(Church church) {
        return ChurchOptionResponseDTO.builder()
                .churchId(church.getChurchId())
                .name(church.getName())
                .build();
    }

    private boolean churchExists(String name) {
        Church dbChurch = churchRepository.findByName(name).orElse(null);
        return dbChurch != null;
    }

    private void compareChurch(Church church, Church dbChurch) {
        if (!church.getName().equals(dbChurch.getName())) {
            dbChurch.setName(church.getName());
        }
        if (!church.getDenomination().equals(dbChurch.getDenomination())) {
            dbChurch.setDenomination(church.getDenomination());
        }
        if (!church.getAddress().equals(dbChurch.getAddress())) {
            dbChurch.setAddress(church.getAddress());
        }
        if (!church.getRegistration().equals(dbChurch.getRegistration())) {
            dbChurch.setRegistration(church.getRegistration());
        }
        dbChurch.setUpdatedBy(userService.getUserID());
        dbChurch.setUpdatedOn(new Date(System.currentTimeMillis()));
    }
}
