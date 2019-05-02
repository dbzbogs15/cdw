package com.book.controller;

import com.book.model.Item;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.List;

@Controller
public class OrderController {
    @RequestMapping("/order")
    public String order(@SessionAttribute(required = false) List<Item> cart,
                        ModelMap mm) {
        mm.addAttribute("cart", cart);
        return "order";
    }
}
