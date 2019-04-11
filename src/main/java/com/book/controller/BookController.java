package com.book.controller;

import com.book.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BookController {
    @Autowired
    BookService bookService;
    @RequestMapping("/product")
    public String book(@RequestParam int bookid, ModelMap mm) {
        mm.addAttribute("book", bookService.getBookById(bookid));
        mm.addAttribute("quanTam", bookService.getNewBook(0).getContent());
        return "product";
    }
}
