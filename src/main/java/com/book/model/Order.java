package com.book.model;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "orders")
@Data
public class Order {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "tracking_number")
    private String trackingNumber;
    private String fullname;
    private String email;
    private String phone;
    private String wardid;
    private String address;
    private String status;
    @Column(name = "totalprice")
    private Integer totalPrice;
    private Integer employeeid;
    private Integer customerid;
    private Date orderdate;
    private Date receivedate;
}
