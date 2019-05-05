package com.book.controller;

import com.book.model.Cart;
import com.book.model.Item;
import com.book.model.Order;
import com.book.model.OrderDetails;
import com.book.service.OrderDetailService;
import com.book.service.OrderService;
import org.apache.commons.lang.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class OrderController {
    @Autowired
    OrderService orderService;

    @Autowired
    OrderDetailService orderDetailService;

    @RequestMapping("/order")
    public String order(@SessionAttribute(required = false) Cart cart,
                        ModelMap mm,
                        RedirectAttributes rd
                        ) {
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
                           @SessionAttribute(required = false) Cart cart) {
        String trackingNumber = RandomStringUtils.randomNumeric(8);
        order.setTrackingNumber(trackingNumber);
        order.setTotalPrice(cart.amountTotal());
        orderService.addOrder(order);
        for(int i = 0; i < cart.quantityTotal(); i++) {
            OrderDetails orderDetails = new OrderDetails();
            orderDetails.setBookId(cart.getItems().get(i).getBook().getId());
            orderDetails.setOrderId(order.getId());
            orderDetails.setQuantity(cart.getItems().get(i).getQuantity());
            orderDetails.setUnitPrice(cart.subTotal(cart.getItems().get(i).getBook().getId()));
            orderDetailService.addOrderDetail(orderDetails);
        }
        session.removeAttribute("cart");
        mm.addAttribute("message", "Bạn đã đặt hàng thành công vui lòng kiểm tra Email");
        return "checkout_success";
    }
}
