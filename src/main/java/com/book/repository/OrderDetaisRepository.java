package com.book.repository;

import com.book.model.OrderDetails;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface OrderDetaisRepository extends JpaRepository<OrderDetails, Integer> {
    @Query("from OrderDetails o group by o.bookId order by sum(o.quantity) desc")
    Page<OrderDetails> getBestsellers(Pageable pageable);
}
