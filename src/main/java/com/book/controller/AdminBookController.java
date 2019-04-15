package com.book.controller;

import com.book.service.BookService;
import com.book.service.ParentCategoryService;
import com.book.service.PublisherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminBookController {
    @Autowired
    BookService bookService;
    @Autowired
    ParentCategoryService parentCategoryService;
    @Autowired
    PublisherService publisherService;

    @GetMapping("/book-manager/add-book")
    public String addBook(ModelMap mm) {
        mm.addAttribute("publisher", publisherService.getAll());
        mm.addAttribute("parent", parentCategoryService.getAll());
        return "/admin/book_add";
    }
}
