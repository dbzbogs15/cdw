package com.book.service;

import com.book.model.OrderDetails;
import com.book.repository.OrderDetaisRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderDetailService {
    @Autowired
    OrderDetaisRepository orderDetaisRepository;

    public OrderDetails addOrderDetail(OrderDetails orderDetails) {
        return orderDetaisRepository.save(orderDetails);
    }
}
