package com.book.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "book")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Book {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    private String image;
    private String author;
    private Integer saleoff;
    @Column(name = "price_new")
    private Integer priceNew;
    @Column(name = "price_old")
    private Integer priceOld;
    @Column(name = "category_id")
    private Integer categoryId;
    @Column(name = "publisher_id")
    private Integer publisherId;
    private LocalDateTime created;
    private Integer quantity;
    @Column(name = "employee_id")
    private Integer employeeId;
    private String description;
}
