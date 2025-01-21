package com.fpc.chfs.churchfinancialsystem.church;


import com.fpc.chfs.churchfinancialsystem.church.dto.ChurchDTO;
import com.fpc.chfs.churchfinancialsystem.church.dto.ChurchResponseDTO;
import com.fpc.chfs.churchfinancialsystem.church.dto.ChurchOptionResponseDTO;
import com.fpc.chfs.churchfinancialsystem.church.dto.PermissionDTO;
import com.fpc.chfs.churchfinancialsystem.shared.dto.CommonResponseDTO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/admin")
public class ChurchController {

    @Autowired
    ChurchService churchService;

    @PostMapping("/church")
    public ResponseEntity<CommonResponseDTO> createChurch(@RequestBody ChurchDTO church) {
        return churchService.createChurch(church);
    }

    @GetMapping("/churches")
    public ResponseEntity<List<ChurchResponseDTO>> getChurches() {
        return churchService.getAllChurches();
    }

    @GetMapping("/church")
    public ResponseEntity<ChurchResponseDTO> getChurchById(@RequestParam Integer churchId) {
        return churchService.getChurchById(churchId);
    }

    @PutMapping("/church")
    public ResponseEntity<CommonResponseDTO> updateChurch(@RequestBody ChurchDTO church) {
        return churchService.updateChurch(church);
    }

    @DeleteMapping("/church")
    public ResponseEntity<CommonResponseDTO> deleteChurch(@RequestParam String name) {
        return churchService.deleteChurch(name);
    }

    @GetMapping("/church-options")
    public ResponseEntity<List<ChurchOptionResponseDTO>> getChurchOptions() {
        return churchService.getAllChurchOptions();
    }

    @GetMapping("/user-churches")
    public ResponseEntity<List<ChurchOptionResponseDTO>> getChurchByUser(@RequestParam Integer userId) {
        return churchService.getAllChurchOptionsByUser(userId);
    }

    @GetMapping("/user-missing-churches")
    public ResponseEntity<List<ChurchOptionResponseDTO>> getChurchMissingByUser(@RequestParam Integer userId) {
        return churchService.getAllChurchOptionsMissingByUser(userId);
    }

    @PostMapping("/permission")
    public ResponseEntity<CommonResponseDTO> addPermission(@RequestBody PermissionDTO permission) {
        return churchService.addPermission(permission);
    }
}
