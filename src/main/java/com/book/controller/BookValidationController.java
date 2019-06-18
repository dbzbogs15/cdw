package com.book.controller;

import com.book.model.Book;
import org.apache.commons.lang.math.NumberUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;

import javax.validation.Valid;
import java.util.*;

@Controller
public class BookValidationController {

    @PostMapping("/bookValidateName")
    @ResponseBody
    public String validateName(WebRequest wr) {
        List<String> list = new ArrayList<>();
        Iterator<String> iterator = wr.getParameterNames();
        iterator.forEachRemaining(list::add);
        System.out.println(list.get(0));
        String result = "";
        String param = list.get(0);
        if (param.equalsIgnoreCase("name")) {
            String name = wr.getParameter(param);
            if (name.length() == 0) {
                System.out.println("ahdhahda");
                return "Tên sách không được để trống!";
            }
        }
        if (param.equalsIgnoreCase("author")) {
            String author = wr.getParameter(param);
            if (author.length() == 0) {
                return "Tác giả không được để trống!";
            }
        }
        if (param.equalsIgnoreCase("priceNew")) {
            String priceNew = wr.getParameter("priceNew");
            if (priceNew.length() == 0) {
                return "Giá sản phẩm không được để trống";
            }
            if (!NumberUtils.isNumber(priceNew) || NumberUtils.toInt(priceNew) < 0) {
                return "Giá sản phẩm phải không hợp lệ";
            }
        }
        if (param.equalsIgnoreCase("priceOld")) {
            String priceOld = wr.getParameter("priceOld");
            if (priceOld.length() == 0) {
                return "Giá sản phẩm không được để trống";
            }
            if (!NumberUtils.isNumber(priceOld) || NumberUtils.toInt(priceOld) < 0) {
                return "Giá sản phẩm phải không hợp lệ";
            }
        }
        if (param.equalsIgnoreCase("quantity")) {
            String quantity = wr.getParameter("quantity");
            if (quantity.length() == 0) {
                return "Số lượng không được để trống";
            }
            if (!NumberUtils.isNumber(quantity) || NumberUtils.toInt(quantity) < 0) {
                return "Số lượng không hợp lệ!";
            }
        }
        if (param.equalsIgnoreCase("saleoff")) {
            String saleoff = wr.getParameter("saleoff");
            if (saleoff.length() == 0) {
                return "Khuyến mãi không được để trống";
            }
            if (!NumberUtils.isNumber(saleoff)) {
                return "Khuyến mãi không hợp lệ!";
            }
        }
        if (param.equalsIgnoreCase("number_page")) {
            String number_page = wr.getParameter("number_page");
            if (number_page.length() == 0) {
                return "Số trang không được để trống";
            }
            if (!NumberUtils.isNumber(number_page) || NumberUtils.toInt(number_page) < 0) {
                return "Số trang không hợp lệ!";
            }
        }
        return result;
    }

    @PostMapping("/formsubmit")
    public ResponseEntity<Map<String, String>> ex(@Valid Book book, BindingResult result) {
        Map<String, String> errors = new HashMap<>();
        List<FieldError> e = result.getFieldErrors();
        for (FieldError error : e) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
            errors.put(error.getField(), error.getDefaultMessage());
        }
        return new ResponseEntity<>(errors, HttpStatus.OK);
    }
}
