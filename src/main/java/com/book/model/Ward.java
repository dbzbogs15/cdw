package com.book.model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "ward")
@Data
public class Ward {
    @Id
    private String wardid;
    private String name;
    private String districtid;

    @ManyToOne
    @JoinColumn(name = "districtid", insertable = false, updatable = false)
    private District district;
}
