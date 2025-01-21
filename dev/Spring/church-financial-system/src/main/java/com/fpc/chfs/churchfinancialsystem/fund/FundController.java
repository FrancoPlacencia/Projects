package com.fpc.chfs.churchfinancialsystem.fund;

import com.fpc.chfs.churchfinancialsystem.fund.dto.FundDTO;
import com.fpc.chfs.churchfinancialsystem.shared.dto.CommonResponseDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/admin")
public class FundController {


    @Autowired
    FundService fundService;

    @PostMapping("/fund")
    public ResponseEntity<CommonResponseDTO> create(@RequestBody FundDTO request) {
        return fundService.create(request);
    }

    @GetMapping("/fund-list")
    public ResponseEntity<List<FundDTO>> read() {
        return fundService.read();
    }

    @GetMapping("/fund")
    public ResponseEntity<FundDTO> read(@RequestParam Integer id) {
        return fundService.read(id);
    }

    @PutMapping("/fund")
    public ResponseEntity<CommonResponseDTO> update(@RequestBody FundDTO request) {
        return fundService.update(request);
    }

    @DeleteMapping("/fund")
    public ResponseEntity<CommonResponseDTO> delete(@RequestParam String name) {
        return fundService.delete(name);
    }

}
