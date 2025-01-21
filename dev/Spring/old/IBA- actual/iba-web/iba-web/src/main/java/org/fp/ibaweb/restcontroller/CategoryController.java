package org.fp.ibaweb.restcontroller;

import org.fp.ibaweb.Model.Category;
import org.fp.ibaweb.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("api/")
public class CategoryController {

    @Autowired
    CategoryService categoryService;

    @GetMapping("categories")
    public ResponseEntity<List<Category>> getCategories(){
        return categoryService.getAll();
    }

    @GetMapping("category")
    public ResponseEntity<Category> getCategory(@RequestParam(value="id", required = true) Integer categoryId){
        Category category = new Category();
        category.setId(categoryId);
        return categoryService.getSingle(category);
    }

    @PostMapping("categories")
    public ResponseEntity<Category> postCategory(@RequestBody Category category){
        return categoryService.post(category);
    }
}
