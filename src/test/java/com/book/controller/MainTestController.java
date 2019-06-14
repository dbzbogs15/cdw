package com.book.controller;
import com.book.model.Book;
import com.book.service.BookService;
import org.junit.Assert;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class MainTestController {
    @Autowired
    BookService bookService;

    @Test
    public void saveBookTest() {
        Book book = new Book();
        book.setImage("sấ");
        Book savedBook = bookService.addBook(book);
        Assert.assertNotNull(savedBook.getImage());
    }
}
