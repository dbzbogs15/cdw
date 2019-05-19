package com.book.repository;

import com.book.model.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrderRepository extends JpaRepository<Order, Integer> {
    List<Order> findAllByEmail(String email);
    //doanh thu
    @Query("select sum(totalPrice) from Order ")
    int revenue();
}