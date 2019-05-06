package com.book.service;

import com.book.model.OrderDetails;
import com.book.repository.OrderDetaisRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;


@Service
public class OrderDetailService {
    @Autowired
    OrderDetaisRepository orderDetaisRepository;

    public OrderDetails addOrderDetail(OrderDetails orderDetails) {
        return orderDetaisRepository.save(orderDetails);
    }
    public Page<OrderDetails> getBestsellers(int page) {
        return orderDetaisRepository.getBestsellers(
                PageRequest.of(page, 5)
        );
    }
}
