package com.fpc.chfs.churchfinancialsystem.fund;

import com.fpc.chfs.churchfinancialsystem.fund.dto.FundDTO;
import com.fpc.chfs.churchfinancialsystem.shared.dto.CommonResponseDTO;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface FundService {
    ResponseEntity<CommonResponseDTO> create(FundDTO request);

    ResponseEntity<List<FundDTO>> read();

    ResponseEntity<FundDTO> read(Integer id);

    ResponseEntity<CommonResponseDTO> update(FundDTO church);

    ResponseEntity<CommonResponseDTO> delete(String name);
}
