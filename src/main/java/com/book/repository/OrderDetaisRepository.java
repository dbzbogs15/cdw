package com.book.repository;

import com.book.model.OrderDetails;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderDetaisRepository extends JpaRepository<OrderDetails, Integer> {
}
