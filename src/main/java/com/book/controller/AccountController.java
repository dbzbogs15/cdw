package com.book.controller;

import com.book.model.Account;
import com.book.model.MD5;
import com.book.model.Order;
import com.book.service.AccountService;
import com.book.service.OrderService;
import com.book.service.ParentCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/account")
public class AccountController {
    @Autowired
    AccountService accountService;

    @Autowired
    ParentCategoryService parentCategoryService;

    @Autowired
    OrderService orderService;

    @GetMapping("/login")
    public String login(ModelMap mm) {
        mm.addAttribute("parent", parentCategoryService.getAll());
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String email, @RequestParam String password,
                        HttpSession session, RedirectAttributes rd) {
        Account account = accountService.getAccount(email, MD5.md5(password));
        System.out.println(account);
        if(account != null) {
            session.setAttribute("account", account);
            return "redirect:/";
        }
        rd.addFlashAttribute("message", "Email hoặc mật khẩu không đúng");
        return "redirect:/account/login";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute(name = "account") Account account, BindingResult bindingResult,
                           RedirectAttributes rd) {
        if(bindingResult.hasErrors()) {
            return "register";
        }
        account.setPassword(MD5.md5(account.getPassword()));
        System.out.println(account.toString());
        accountService.addAccount(account);
        rd.addFlashAttribute("message", "Đăng ký tài khoản thành công!");
        return "redirect:/account/login";
    }

    @GetMapping("/register")
    public String register(ModelMap mm) {
        mm.addAttribute("account", new Account());
        mm.addAttribute("parent", parentCategoryService.getAll());
        return "/register";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("account");
        return "redirect:/";
    }

    @PostMapping("/checkEmail")
    @ResponseBody
    public boolean checkEmail(@RequestParam String email) {
        System.out.println(email);
        if(accountService.findByEmail(email) == null) {
            return true;
        }
        return false;
    }

    @GetMapping("/order")
    public String customerOder() {
        return "customer_order";
    }

    @GetMapping("/my-order")
    @ResponseBody
    public ResponseEntity<Object> myOrders(@SessionAttribute(required = false) Account account) {
        if(account == null) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        List<Order> result = orderService.getOrderByEmail(account.getEmail());
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
}
