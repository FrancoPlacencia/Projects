package com.fpc.chfs.churchfinancialsystem.category;

import com.fpc.chfs.churchfinancialsystem.category.dto.CategoryDTO;
import com.fpc.chfs.churchfinancialsystem.category.dto.CategorySimpleDTO;
import com.fpc.chfs.churchfinancialsystem.shared.dto.CommonResponseDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/admin")
public class CategoryController {

    @Autowired
    CategoryService categoryService;

    @PostMapping("/category")
    public ResponseEntity<CommonResponseDTO> create(@RequestBody CategoryDTO categoryRequestDTO) {
        return categoryService.create(categoryRequestDTO);
    }

    @GetMapping("/category-list")
    public ResponseEntity<List<CategoryDTO>> read() {
        return categoryService.read();
    }

    @GetMapping("/church-category-list")
    public ResponseEntity<List<CategorySimpleDTO>> readSimple(@RequestParam Integer churchId) {
        return categoryService.readSimple(churchId);
    }

    @GetMapping("/category")
    public ResponseEntity<CategoryDTO> read(@RequestParam Integer id) {
        return categoryService.read(id);
    }

    @PutMapping("/category")
    public ResponseEntity<CommonResponseDTO> update(@RequestBody CategoryDTO category) {
        return categoryService.update(category);
    }

    @DeleteMapping("/category")
    public ResponseEntity<CommonResponseDTO> delete(@RequestParam String name) {
        return categoryService.delete(name);
    }

}
