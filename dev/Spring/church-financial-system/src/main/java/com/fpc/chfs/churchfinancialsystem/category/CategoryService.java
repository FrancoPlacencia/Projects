package com.fpc.chfs.churchfinancialsystem.category;

import com.fpc.chfs.churchfinancialsystem.category.dto.CategoryDTO;
import com.fpc.chfs.churchfinancialsystem.category.dto.CategorySimpleDTO;
import com.fpc.chfs.churchfinancialsystem.shared.dto.CommonResponseDTO;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface CategoryService {
    ResponseEntity<CommonResponseDTO> create(CategoryDTO request);

    ResponseEntity<List<CategoryDTO>> read();

    ResponseEntity<List<CategorySimpleDTO>> readSimple(Integer churchId);

    ResponseEntity<CategoryDTO> read(Integer id);

    ResponseEntity<CommonResponseDTO> update(CategoryDTO church);

    ResponseEntity<CommonResponseDTO> delete(String name);

}
