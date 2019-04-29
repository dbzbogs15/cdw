package com.book.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.*;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
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
    @NotEmpty(message = "Tên sách không được để trống")
    private String name;
    private String image;
    @NotEmpty(message = "Tác giả không được để trông")
    private String author;
    @NotNull(message = "{typeMismatch.java.lang.Integer}")
    private Integer saleoff;
    @Column(name = "price_new")
    @NotNull(message = "{typeMismath.book.priceNew}")
    private Integer priceNew;
    @Column(name = "price_old")
    @NotNull(message = "{typeMismatch.java.lang.Integer}")
    private Integer priceOld;
    @NotNull(message = "Vui lòng chọn danh mục")
    @Column(name = "category_id")
    private Integer categoryId;
    @NotNull(message = "Vui lòng chọn nhà xuất bản")
    @Column(name = "publisher_id")
    private Integer publisherId;
    @NotNull(message = "{typeMismatch.java.lang.Integer}")
    @DateTimeFormat(pattern = "dd-MM-yyyy")
    @Temporal(TemporalType.TIMESTAMP)
    private Date created;
    @NotNull(message = "{typeMismatch.java.lang.Integer}")
    private Integer quantity;
    @Column(name = "employee_id")
    private Integer employeeId;
    @NotNull(message = "Không được để trống trường này")
    private String description;
    @NotNull(message = "{typeMismatch.java.lang.Integer}")
    @Column(name = "number_page")
    private Integer numberPage;
    @NotNull(message = "Không được để trống trường này")
    private String size;
    @NotNull(message = "{typeMismatch.java.lang.Integer}")
    private Integer weight;
    @NotNull(message = "Ngày xuất bản không được để trống!")
    @DateTimeFormat(pattern = "dd-MM-yyyy")
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
