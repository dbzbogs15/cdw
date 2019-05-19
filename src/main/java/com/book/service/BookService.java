package com.book.service;

import com.book.model.Book;
import com.book.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import javax.persistence.EntityManager;
import java.util.List;

@Service
public class BookService {
    @Autowired
    BookRepository bookRepository;

    @Autowired
    EntityManager entityManager;

    public List<Book> getAllBook() {
        return bookRepository.findAll();
    }

//    public List<Book> getAllBook() {
//        return entityManager.createQuery("select b from Book b where b.isActive = true", Book.class).getResultList();
//    }

    public Page<Book> getNewBook(int page, int size) {
        return bookRepository.findAll(
                PageRequest.of(page, size, Sort.by(
                        Sort.Direction.DESC, "created")
                )
        );
    }

    public Book getBookById(int id) {
        return bookRepository.getOne(id);
    }
    //Chức năng tìm kiếm
    public List<Book> getBookByName(String name) {
        return bookRepository.findByNameContainingIgnoreCase(name);
    }
    public List<Book> getBookByParent(int id) {
        return bookRepository.findAllByCategoryParentCategoryId(id);
    }
    public List<Book> getBookByCategory(int id) {
        return bookRepository.findAllByCategoryId(id);
    }
    public List<Book> getBookIsActive() {
        return bookRepository.findAllByIsActiveIsTrue();
    }
    public Book addBook(Book book) {
        return bookRepository.save(book);
    }
    public void deleteBook(Integer id) {
        bookRepository.deleteById(id);
    }
}
