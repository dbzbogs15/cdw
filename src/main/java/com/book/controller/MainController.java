package com.book.controller;

import com.book.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
    @Autowired
    BookService bookService;
    @RequestMapping("/")
    public String index(ModelMap mm) {

        mm.addAttribute("newBook", bookService.getNewBook(0).getContent());
        return "index";
    }
}
