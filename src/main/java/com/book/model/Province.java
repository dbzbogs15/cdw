package com.book.model;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "province")
@Data
public class Province {
    @Id
    private String provinceid;
    private String name;
}
