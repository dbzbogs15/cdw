package com.book.service;

import com.book.model.Order;
import com.book.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService {
    @Autowired
    OrderRepository orderRepository;

    public Order addOrder(Order order) {
        return orderRepository.save(order);
    }
}
