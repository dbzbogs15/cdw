package com.book.service;

import com.book.model.Order;
import com.book.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderService {
    @Autowired
    OrderRepository orderRepository;

    public Order getOrder(int id) {
        return orderRepository.getOne(id);
    }
    public List<Order> getAll() {
        return orderRepository.findAll();
    }
    public Order addOrder(Order order) {
        return orderRepository.save(order);
    }
    public List<Order> getOrderByEmail(String email) {
        return orderRepository.findAllByEmail(email);
    }
    public long totalOrder() {
        return orderRepository.count();
    }
    public int getRevenue(String status) { return orderRepository.revenue(status); }
    public List<Order> findByStatus(String status) {
        return orderRepository.findAllByStatus(status);
    }
}
