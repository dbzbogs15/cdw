package com.book.service;

import com.book.model.Ward;
import com.book.repository.WardRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WardService {
    @Autowired
    WardRepository wardRepository;

    public List<Ward> getByDistrictid(String districtid) {
        return wardRepository.findAllByDistrictid(districtid);
    }
}
