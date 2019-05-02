package com.book.model;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table
@Data
public class District {
    @Id
    private String districtid;
    private String name;
    private String provinceid;

    @ManyToOne
    @JoinColumn(name = "provinceid", updatable = false, insertable = false)
    private Province province;
}
