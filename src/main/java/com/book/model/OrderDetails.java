package com.book.model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "order_detail")
@Data
public class OrderDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "order_id")
    private Integer orderId;
    @Column(name = "book_id")
    private Integer bookId;
    private Integer quantity;
    @Column(name = "unit_price")
    private Integer unitPrice;
}
