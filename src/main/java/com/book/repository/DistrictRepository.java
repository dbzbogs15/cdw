package com.book.repository;

import com.book.model.District;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface DistrictRepository extends JpaRepository<District, String> {
    List<District> findAllByProvinceid(String provinceid);
}
