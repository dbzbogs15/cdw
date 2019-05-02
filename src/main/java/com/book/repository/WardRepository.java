package com.book.repository;

import com.book.model.Ward;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface WardRepository extends JpaRepository<Ward, String> {
    List<Ward> findAllByDistrictid(String districtid);
}
