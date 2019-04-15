package com.book.controller;

import com.book.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
    @Autowired
    BookService bookService;

    @RequestMapping("/admin")
    public String admin() {
        return "admin/index";
    }

    @RequestMapping("/admin/book-manager")
    public String bookManager(ModelMap mm){
        mm.addAttribute("books", bookService.getAllBook());
        return "/admin/book_manager";
    }
}
