package com.book.service;

import com.book.model.Publisher;
import com.book.repository.PublisherRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PublisherService {
    @Autowired
    PublisherRepository publisherRepository;

    public List<Publisher> getAll() {
        return publisherRepository.findAll();
    }
}
