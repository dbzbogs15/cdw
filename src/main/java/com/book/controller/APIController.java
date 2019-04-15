package com.book.controller;

import com.book.model.Book;
import com.book.model.Category;
import com.book.service.BookService;
import com.book.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class APIController {

    @Autowired
    BookService bookService;
    @Autowired
    CategoryService categoryService;

    @RequestMapping("/api/newbook")
    public ResponseEntity<List<Book>> getNewBook(@RequestParam int page) {
        List<Book> list = bookService.getNewBook(page-1).getContent();
        return new ResponseEntity<>(list, HttpStatus.OK);
    }
    @RequestMapping("/search/autocomplete")
    public ResponseEntity<List<Book>> searchBook(@RequestParam String keywords) {
        List<Book> list = bookService.getBookByName(keywords);
        if(keywords.length() == 0) {
            return new ResponseEntity<>(null, HttpStatus.OK);
        }
        return new ResponseEntity<>(list, HttpStatus.OK);
    }
    @RequestMapping("/api/categories")
    public ResponseEntity<List<Category>> getCategories(@RequestParam int parentid) {
        List<Category> categories = categoryService.getAllByParentId(parentid);
        return new ResponseEntity<>(categories, HttpStatus.OK);
    }

}
