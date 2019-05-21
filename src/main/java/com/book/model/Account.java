package com.book.model;

import com.book.validator.AccountConstraint;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotEmpty;
import java.util.Date;

@Entity
@Table(name = "account")
@Data
public class Account {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @AccountConstraint(message = "Email đã tồn tại")
    @NotEmpty(message = "Email không được để trống")
    private String email;
    private String name;
    private String phone;
    private String password;
    @Column(name = "reset_token")
    private String resetToken;
    private Date created;
    @Column(name = "birthdate")
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date birthDate;
    private Integer gender;
    private String role;
}
