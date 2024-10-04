package com.fpc.chfs.churchfinancialsystem.church;

import com.fpc.chfs.churchfinancialsystem.church.dto.ChurchDTO;
import com.fpc.chfs.churchfinancialsystem.church.dto.ChurchResponseDTO;
import com.fpc.chfs.churchfinancialsystem.church.dto.ChurchOptionResponseDTO;
import com.fpc.chfs.churchfinancialsystem.church.dto.PermissionDTO;
import com.fpc.chfs.churchfinancialsystem.shared.dto.CommonResponseDTO;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface ChurchService {


    ResponseEntity<CommonResponseDTO> createChurch(ChurchDTO request);

    ResponseEntity<List<ChurchResponseDTO>> getAllChurches();

    ResponseEntity<ChurchResponseDTO> getChurchById(Integer churchId);

    ResponseEntity<CommonResponseDTO> updateChurch(ChurchDTO church);

    ResponseEntity<CommonResponseDTO> deleteChurch(String name);

    ResponseEntity<List<ChurchOptionResponseDTO>> getAllChurchOptions();

    ResponseEntity<List<ChurchOptionResponseDTO>> getAllChurchOptionsByUser(Integer userId);

    ResponseEntity<List<ChurchOptionResponseDTO>> getAllChurchOptionsMissingByUser(Integer userId);

    ResponseEntity<CommonResponseDTO> addPermission(PermissionDTO permission);

}
