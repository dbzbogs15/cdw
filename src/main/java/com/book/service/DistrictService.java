package com.book.service;

import com.book.model.District;
import com.book.repository.DistrictRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DistrictService {
    @Autowired
    DistrictRepository districtRepository;
    public List<District> getByProvinceid(String provinceid) {
        return districtRepository.findAllByProvinceid(provinceid);
    }
}
