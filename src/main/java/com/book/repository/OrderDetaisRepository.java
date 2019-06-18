package com.book.repository;

import com.book.model.OrderDetails;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface OrderDetaisRepository extends JpaRepository<OrderDetails, Integer> {
    @Query("select o from OrderDetails o group by o.id, o.bookId order by sum(o.quantity) desc")
    Page<OrderDetails> getBestsellers(Pageable pageable);

    //Sách đã bán
    @Query("select sum(od.quantity) from OrderDetails od " +
            "inner join Order o on o.id = od.orderId " +
            "where o.status ='Đã giao hàng'")
    int productSold();
}
