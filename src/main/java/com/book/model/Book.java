package com.book.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "book")
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
@ToString
public class Book implements Serializable {
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
    @Temporal(TemporalType.TIMESTAMP)
    private Date created;
    private Integer quantity;
    @Column(name = "employee_id")
    private Integer employeeId;
    private String description;
    @Column(name = "number_page")
    private Integer numberPage;
    private String size;
    private Integer weight;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    @Column(name = "published_date")
    private Date publishedDate;

    @ManyToOne
    @JoinColumn(name = "category_id", updatable = false, insertable = false)
    private Category category;

    @ManyToOne
    @JoinColumn(name = "publisher_id", updatable = false, insertable = false)
    private Publisher publisher;
}
