package com.book.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "bookcategory")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Category {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    private String name;
    private String description;
    @Column(name = "parent_id")
    private Integer parentId;

    @JsonIgnore
    @ManyToOne
    @JoinColumn(name = "parent_id", insertable = false, updatable = false)
    private ParentCategory parentCategory;
}
