package com.book.service;

import com.book.model.ParentCategory;
import com.book.repository.ParentCaterotyRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ParentCategoryService {
    @Autowired
    ParentCaterotyRepository parentCaterotyRepository;

    public List<ParentCategory> getAll() {
        return parentCaterotyRepository.findAll();
    }

    public ParentCategory getParentById(int id) {
        return parentCaterotyRepository.getOne(id);
    }
}
