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
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/account")
public class AccountController {
    @Autowired
    AccountService accountService;

    @Autowired
    ParentCategoryService parentCategoryService;

    @Autowired
    OrderService orderService;

    @Autowired
    JavaMailSender javaMailSender;

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
        if (account != null) {
            session.setAttribute("account", account);
            return "redirect:/";
        }
        rd.addFlashAttribute("message", "Email hoặc mật khẩu không đúng");
        return "redirect:/account/login";
    }

    @PostMapping("/register")
    public String register(@Valid @ModelAttribute(name = "account") Account account, BindingResult bindingResult,
                           RedirectAttributes rd) {
        if (bindingResult.hasErrors()) {
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
        if (accountService.findByEmail(email) == null) {
            return true;
        }
        return false;
    }

    @GetMapping("/order")
    public String customerOder() {
        return "customer_order";
    }

    @GetMapping("/manager")
    public String customerManager() {
        return "customer_manager";
    }

    @GetMapping("/info")
    public String customerInfo() {
        return "customer_info";
    }

    @PostMapping("/info")
    @ResponseBody
    public boolean customerChangeInfo(Account account, @SessionAttribute("account") Account accountS,
                                      HttpSession session) {
        System.out.println(account.toString());
        Account accountCurrent = accountService.findByEmail(accountS.getEmail());
        accountCurrent.setBirthDate(account.getBirthDate());
        accountCurrent.setPhone(account.getPhone());
        accountCurrent.setGender(account.getGender());
        try {
            accountService.addAccount(accountCurrent);
            session.setAttribute("account", accountCurrent);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @GetMapping("/change-password")
    public String changePass() {
        return "customer_password";
    }

    @PostMapping("/change-password")
    public String changePassword(@RequestParam String newpassword,
                                 HttpSession session,
                                 RedirectAttributes rd,
                                 @SessionAttribute Account account) {
        account = accountService.findByEmail(account.getEmail());
        account.setPassword(MD5.md5(newpassword));
        try {
            accountService.addAccount(account);
            rd.addFlashAttribute("message", "Đổi mật khẩu thành công");
        } catch (Exception e) {
            rd.addFlashAttribute("message", "Có lỗi xảy ra, đổi mật khẩu không thành công");
        }
        session.setAttribute("account", account);
        return "redirect:/account/change-password";
    }

    @PostMapping("/auth-password")
    @ResponseBody
    public boolean authPassword(@RequestParam String oldpassword, @SessionAttribute Account account) {
        if (MD5.md5(oldpassword).equals(account.getPassword())) {
            return true;
        }
        return false;
    }

    @GetMapping("/forgot-password")
    public String forgotPassword() {
        return "forgot_password";
    }

    @PostMapping("/forgot-password")
    @ResponseBody
    public boolean processForgotPassword(@RequestParam String email) {
        Account account = accountService.findByEmail(email);
        System.out.println(account.toString());
        if (account == null) {
            return false;
        }
        account.setResetToken(UUID.randomUUID().toString());
        accountService.addAccount(account);
        String appURL = "http://localhost:8080";
        SimpleMailMessage passwordResetMail = new SimpleMailMessage();
        passwordResetMail.setFrom("dbzbogs15@gmail.com");
        passwordResetMail.setTo(account.getEmail());
        passwordResetMail.setSubject("Xác nhận reset mật khẩu");
        passwordResetMail.setText("Để reset mật khẩu, vui lòng click vào liên kết này:\n" + appURL +
                "/account/reset?token=" + account.getResetToken());
        javaMailSender.send(passwordResetMail);
        return true;
    }

    @GetMapping("/reset")
    public String displayResetPasswordPage(@RequestParam String token, ModelMap mm) {
        Account account = accountService.findByResetToken(token);
        if (account == null) {
            mm.addAttribute("message", "Đây là một liên kết đặt lại mật khẩu không hợp lệ");
        } else {
            mm.addAttribute("token", token);
        }
        return "reset_password";
    }

    @PostMapping("/reset")
    public String setNewPassword(@RequestParam String token,
                                 @RequestParam String password,
                                 RedirectAttributes rd) {
        Account account = accountService.findByResetToken(token);
        if (account != null) {
            account.setPassword(MD5.md5(password));
            account.setResetToken(null);
            accountService.addAccount(account);
            rd.addFlashAttribute("message", "Đặt lại mật khẩu thành công, bây giờ bạn có thể đăng nhập.");
        } else {
            rd.addFlashAttribute("message", "Liên kết xác nhận không hợp lệ");
        }
        return "redirect:/account/login";
    }

    @GetMapping("/my-order")
    @ResponseBody
    public ResponseEntity<Object> myOrders(@SessionAttribute(required = false) Account account) {
        if (account == null) {
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        List<Order> result = orderService.getOrderByEmail(account.getEmail());
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
}
