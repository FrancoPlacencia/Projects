package com.fpc.chfs.churchfinancialsystem.fund;

import com.fpc.chfs.churchfinancialsystem.fund.dto.FundDTO;
import com.fpc.chfs.churchfinancialsystem.shared.dto.CommonResponseDTO;
import com.fpc.chfs.churchfinancialsystem.user.UserService;
import com.fpc.chfs.churchfinancialsystem.util.CHFSConstants;
import com.fpc.chfs.churchfinancialsystem.util.CHFSResponseUtil;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Slf4j
@Service
public class FundServiceImpl implements FundService {

    @Autowired
    FundRepository fundRepository;

    @Autowired
    UserService userService;

    @Override
    public ResponseEntity<CommonResponseDTO> create(FundDTO request) {
        Fund fund = getNew(request);
        if(!StringUtils.isEmpty(fund.getName()) || !StringUtils.isEmpty(fund.getDescription())) {
            if (!fundRepository.existsByName(fund.getName())) {
                try {
                    fundRepository.save(fund);
                } catch (Exception e) {
                    return CHFSResponseUtil.getServerErrorResponse();
                }
                return CHFSResponseUtil.getSuccessResponse(CHFSConstants.FUND, CHFSConstants.CREATED);
            } else {
                return CHFSResponseUtil.getAlreadyExistsResponse(CHFSConstants.FUND);
            }
        } else{
            return CHFSResponseUtil.getDataMissingResponse();
        }
    }

    @Override
    public ResponseEntity<List<FundDTO>> read() {
        List<Fund> funds = fundRepository.findAll();
        List<FundDTO> fundResponseDTOs = new ArrayList<>();
        if (!funds.isEmpty()) {
            for (Fund fund : funds) {
                fundResponseDTOs.add(getDTO(fund));
            }
            return new ResponseEntity<>(fundResponseDTOs, HttpStatus.OK);
        }
        return new ResponseEntity<>(fundResponseDTOs, HttpStatus.OK);
    }

    @Override
    public ResponseEntity<FundDTO> read(Integer id) {
        return null;
    }

    @Override
    public ResponseEntity<CommonResponseDTO> update(FundDTO request) {
        Fund fund = getEdit(request);
        log.info("request {}\n fund {}", request, fund);
        if (!StringUtils.isEmpty(fund.getName()) || !StringUtils.isEmpty(fund.getDescription()) || fund.getFundId() > 0) {
            Fund dbFund  = fundRepository.findById(fund.getFundId()).orElse(null);
            if (dbFund != null) {
                compare(fund, dbFund);
                fundRepository.save(dbFund);
                return CHFSResponseUtil.getSuccessResponse(CHFSConstants.FUND, CHFSConstants.UPDATED);
            } else {
                return CHFSResponseUtil.getNotFoundResponse(CHFSConstants.FUND);
            }
        } else {
            return CHFSResponseUtil.getDataMissingResponse();
        }
    }

    @Override
    public ResponseEntity<CommonResponseDTO> delete(String name) {
        if (!StringUtils.isEmpty(name)) {
            Fund fund  = fundRepository.findByName(name).orElse(null);
            if (fund != null) {
                fundRepository.delete(fund);
                return CHFSResponseUtil.getSuccessResponse(CHFSConstants.FUND, CHFSConstants.DELETED);
            } else {
                return CHFSResponseUtil.getNotFoundResponse(CHFSConstants.FUND);
            }
        } else {
            return CHFSResponseUtil.getDataMissingResponse();
        }
    }

    private Fund getNew(FundDTO request) {
        return Fund.builder()
                .name(request.getName())
                .description(request.getDescription())
                .createdBy(userService.getUserID())
                .createdOn(new Date(System.currentTimeMillis()))
                .build();
    }

    private Fund getEdit(FundDTO request) {
        return Fund.builder()
                .fundId(request.getFundId())
                .name(request.getName())
                .description(request.getDescription())
                .updatedBy(userService.getUserID())
                .updatedOn(new Date(System.currentTimeMillis()))
                .build();
    }

    private FundDTO getDTO(Fund fund) {
        return FundDTO.builder()
                .fundId(fund.getFundId())
                .name(fund.getName())
                .description(fund.getDescription())
                .build();
    }

    private void compare(Fund fund, Fund dbFund) {
        if (!fund.getName().equals(dbFund.getName())) {
            dbFund.setName(fund.getName());
        }
        if (!fund.getDescription().equals(dbFund.getDescription())) {
            dbFund.setDescription(fund.getDescription());
        }
        dbFund.setUpdatedBy(fund.getUpdatedBy());
        dbFund.setUpdatedOn(fund.getUpdatedOn());
    }

}
