package com.book.controller;

import com.book.model.District;
import com.book.model.Province;
import com.book.model.Ward;
import com.book.service.DistrictService;
import com.book.service.ProvinceService;
import com.book.service.WardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class AddressController {
    @Autowired
    ProvinceService provinceService;

    @Autowired
    DistrictService districtService;

    @Autowired
    WardService wardService;

    @RequestMapping("/address/provinces")
    public List<Province> provinces() {
        return provinceService.getAll();
    }

    @GetMapping("/address/{provinceid}")
    public List<District> districts(@PathVariable String provinceid) {
        return districtService.getByProvinceid(provinceid);
    }
    @GetMapping("/address/district/{id}")
    public List<Ward> wards(@PathVariable String id) {
        return wardService.getByDistrictid(id);
    }
}
