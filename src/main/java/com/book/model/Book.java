package com.book.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Calendar;
import java.util.Date;

@Entity
@Table(name = "book")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Book implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
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
    @Temporal(TemporalType.TIMESTAMP)
    private Date created;
    private Integer quantity;
    @Column(name = "employee_id")
    private Integer employeeId;
    private String description;

    @ManyToOne
    @JoinColumn(name = "category_id", updatable = false, insertable = false)
    private Category category;
}
