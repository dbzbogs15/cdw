package com.book.service;

import com.book.model.Book;
import com.book.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookService {
    @Autowired
    BookRepository bookRepository;

    public List<Book> getAllBook() {
        return bookRepository.findAll();
    }

    public Page<Book> getNewBook(int page) {
        return bookRepository.findAll(
                PageRequest.of(page, 5, Sort.by(
                        Sort.Direction.DESC, "created")
                )
        );
    }

    public Book getBookById(int id) {
        return bookRepository.getOne(id);
    }
}
