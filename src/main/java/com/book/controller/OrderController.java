package com.book.controller;

import com.book.model.*;
import com.book.service.OrderDetailService;
import com.book.service.OrderService;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.Date;

@Controller
public class OrderController {
    @Autowired
    OrderService orderService;

    @Autowired
    OrderDetailService orderDetailService;

    @Autowired
    JavaMailSender javaMailSender;

    @RequestMapping("/order")
    public String order(@SessionAttribute(required = false) Cart cart,
                        @SessionAttribute(required = false) Account account,
                        ModelMap mm,
                        RedirectAttributes rd
                        ) {
        if(account == null) {
            rd.addFlashAttribute("message", "Vui lòng đăng nhập để tiếp tục");
            return "redirect:/account/login";
        }
        if(cart == null) {
            rd.addFlashAttribute("message",
                    "Bạn không có sản phẩm nào trong giỏ hàng để tiến hành thanh toán!");
            return "redirect:/cart";
        }
        mm.addAttribute("cart", cart.getItems());
        return "order";
    }
    @PostMapping("/order/checkout")
    public String checkout(@Valid Order order,
                           HttpSession session,
                           ModelMap mm,
                           RedirectAttributes rd,
                           @SessionAttribute(required = false) Account account,
                           @SessionAttribute(required = false) Cart cart) {
        if(account == null) {
            rd.addFlashAttribute("message", "Vui lòng đăng nhập để tiếp tục");
            return "redirect:/account/login";
        }
        String trackingNumber = RandomStringUtils.randomNumeric(8);
        order.setTrackingNumber(trackingNumber);
        order.setTotalPrice(cart.amountTotal());
        order.setCustomerid(account.getId());
        Date dt = new Date();
        order.setEmail(account.getEmail());
        order.setOrderdate(dt);
        order.setReceivedate(new Date(dt.getTime() + (1000 * 60 * 60 * 24 * 7)));
        orderService.addOrder(order);
        for(int i = 0; i < cart.quantityTotal(); i++) {
            OrderDetails orderDetails = new OrderDetails();
            orderDetails.setBookId(cart.getItems().get(i).getBook().getId());
            orderDetails.setOrderId(order.getId());
            orderDetails.setQuantity(cart.getItems().get(i).getQuantity());
            orderDetails.setUnitPrice(cart.subTotal(cart.getItems().get(i).getBook().getId()));
            orderDetailService.addOrderDetail(orderDetails);
        }
        MimeMessage message = javaMailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setFrom("dbzbogs15@gmail.com");
            helper.setTo(order.getEmail());
            helper.setSubject("Order Book");
            String text = "Đơn hàng của bạn đã được xác nhận với Mã đơn hàng: " + trackingNumber;
            helper.setText(text + "<br> Vui lòng đăng nhập để kiểm tra tình trạng đơn hàng", true);
            javaMailSender.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        session.removeAttribute("cart");
        mm.addAttribute("message", "Bạn đã đặt hàng thành công vui lòng kiểm tra Email: " +order.getEmail());
        return "checkout_success";
    }
}
