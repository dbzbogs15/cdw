package com.book.repository;

import com.book.model.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface BookRepository extends JpaRepository<Book, Integer> {
    List<Book> findByNameContainingIgnoreCase(String name);
    List<Book> findAllByCategoryParentCategoryId(int id);
    List<Book> findAllByCategoryId(int id);
}
