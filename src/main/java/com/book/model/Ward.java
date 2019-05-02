package com.book.model;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ward")
@Data
public class Ward {
    @Id
    private String wardid;
    private String name;
    private String districtid;
}
