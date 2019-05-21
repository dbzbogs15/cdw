package com.book.controller;

import com.book.model.Account;
import com.book.service.AccountService;
import com.book.service.BookService;
import com.book.service.OrderDetailService;
import com.book.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.security.Principal;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    BookService bookService;
    @Autowired
    OrderService orderService;
    @Autowired
    OrderDetailService orderDetailService;
    @Autowired
    AccountService accountService;
    @Autowired
    BCryptPasswordEncoder passwordEncoder;
    @RequestMapping("")
    public String admin(ModelMap mm, Principal principal, HttpSession session) {
        session.setAttribute("accountAdmin", accountService.findByEmail(principal.getName()));
        mm.addAttribute("totalOrder", orderService.totalOrder());
        mm.addAttribute("revenue", orderService.getRevenue("Đã giao hàng"));
        mm.addAttribute("productSold", orderDetailService.productSold());
        return "admin/index";
    }

    @RequestMapping("/book-manager")
    public String bookManager(ModelMap mm){
        mm.addAttribute("books", bookService.getAllBook());
        return "/admin/book_manager";
    }

    @GetMapping("/order-manager")
    public String orderManager(ModelMap mm) {
        mm.addAttribute("orderList", orderService.getAll());
        return "/admin/order_manager";
    }

    @RequestMapping("/login")
    public String login() {
        return "/admin/login";
    }

    @RequestMapping("/logout")
    public String logout() {
        return "/212121212";
    }
}
