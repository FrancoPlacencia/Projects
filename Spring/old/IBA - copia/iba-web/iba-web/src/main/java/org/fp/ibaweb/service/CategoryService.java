package org.fp.ibaweb.service;

import org.fp.ibaweb.Model.Category;
import org.fp.ibaweb.Model.Role;
import org.springframework.http.ResponseEntity;

import java.util.List;

public interface CategoryService {

    public ResponseEntity<List<Category>> getAll();

    public ResponseEntity<Category> getSingle(Category category);

    public ResponseEntity<Category> post(Category category);

    public ResponseEntity<Category> put(Category category);

    public ResponseEntity<Category> patch(Category category);

    public ResponseEntity<Category> delete(Category category);
}
