package org.fp.ibaweb.service.impl;

import org.fp.ibaweb.Model.Category;
import org.fp.ibaweb.Model.Role;
import org.fp.ibaweb.repository.CategoryRepository;
import org.fp.ibaweb.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    CategoryRepository categoryRepository;

    @Override
    public ResponseEntity<List<Category>> getAll() {
        return new ResponseEntity(categoryRepository.findAll(), HttpStatus.OK);
    }

    @Override
    public ResponseEntity<Category> getSingle(Category category) {
        Optional<Category> optionalCategory = categoryRepository.findById(category.getId());
        if (optionalCategory == null) {
            return new ResponseEntity(category, HttpStatus.NOT_FOUND);
        } else {
            return new ResponseEntity(optionalCategory.get(), HttpStatus.OK);
        }
    }

    @Override
    public ResponseEntity<Category> post(Category category) {

        if (category.getId() == null) {
            return new ResponseEntity(save(category), HttpStatus.CREATED);
        } else {
            Optional<Category> optionalCategory = categoryRepository.findById(category.getId());
            if (optionalCategory == null) {
                return new ResponseEntity(save(category), HttpStatus.CREATED);
            } else {
                return new ResponseEntity(category, HttpStatus.METHOD_NOT_ALLOWED);
            }
        }
    }

    @Override
    public ResponseEntity<Category> put(Category category) {
        return new ResponseEntity(save(category), HttpStatus.OK);
    }

    @Override
    public ResponseEntity<Category> patch(Category category) {
        return new ResponseEntity(save(category), HttpStatus.OK);
    }

    @Override
    public ResponseEntity<Category> delete(Category category) {
        categoryRepository.delete(category);
        return new ResponseEntity(new Role(), HttpStatus.NO_CONTENT);
    }

    private Category save(Category category){
        return categoryRepository.saveAndFlush(category);
    }
}
