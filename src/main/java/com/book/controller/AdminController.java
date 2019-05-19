package com.book.controller;

import com.book.service.BookService;
import com.book.service.OrderDetailService;
import com.book.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    BookService bookService;
    @Autowired
    OrderService orderService;
    @Autowired
    OrderDetailService orderDetailService;

    @RequestMapping("")
    public String admin(ModelMap mm) {
        mm.addAttribute("totalOrder", orderService.totalOrder());
        mm.addAttribute("revenue", orderService.getRevenue());
        mm.addAttribute("productSold", orderDetailService.productSold());
        return "admin/index";
    }

    @RequestMapping("/book-manager")
    public String bookManager(ModelMap mm){
        mm.addAttribute("books", bookService.getAllBook());
        return "/admin/book_manager";
    }

    @RequestMapping("/login")
    public String login() {
        return "/admin/login";
    }
}
