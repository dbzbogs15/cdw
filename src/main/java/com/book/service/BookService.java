package com.book.service;

import com.book.model.Book;
import com.book.repository.BookRepository;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
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
    public List<Book> getBookByName(String name) {
        return bookRepository.findByNameContainingIgnoreCase(name);
    }
    public List<Book> getBookByParent(int id) {
        return bookRepository.findAllByCategoryParentCategoryId(id);
    }
    public List<Book> getBookByCategory(int id) {
        return bookRepository.findAllByCategoryId(id);
    }
}
