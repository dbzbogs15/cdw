package com.book.controller;

import com.book.model.Order;
import com.book.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminOrderController {
    @Autowired
    OrderService orderService;

    @PostMapping("/order")
    @ResponseBody
    public boolean changeStatus(@RequestParam int id, @RequestParam String status) {
        Order order = orderService.getOrder(id);
        order.setStatus(status);
        try {
            orderService.addOrder(order);
        } catch (Exception e) {
            return false;
        }
        return true;
    }

    @PostMapping("/order/status")
    @ResponseBody
    public List<Order> findByStatus(@RequestParam String status) {
        return orderService.findByStatus(status);
    }
}
