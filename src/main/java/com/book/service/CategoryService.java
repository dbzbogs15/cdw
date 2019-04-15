package com.book.service;

import com.book.model.Category;
import com.book.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService {
    @Autowired
    CategoryRepository categoryRepository;

    public List<Category> getAllCategory() {
        return categoryRepository.findAll();
    }

    public List<Category> getAllByParentId(int id) {
        return categoryRepository.findAllByParentId(id);
    }
}
