package com.book.controller;

import com.book.model.Book;
import com.book.model.Cart;
import com.book.model.Item;
import com.book.service.BookService;
import com.book.service.ParentCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/cart")
public class CardController {
    @Autowired
    BookService bookService;
    @Autowired
    ParentCategoryService parentCategoryService;

    @RequestMapping("")
    public String cart(ModelMap mm, HttpSession session) {
        Cart cart = (Cart) session.getAttribute("cart");
        if(cart == null) {
            mm.addAttribute("cart", null);
        } else {
            mm.addAttribute("cart", cart.getItems());
            mm.addAttribute("total", cart.amountTotal());
        }
        mm.addAttribute("parent", parentCategoryService.getAll());
        return "cart";
    }

    @ResponseBody
    @RequestMapping("/getCart")
    public ResponseEntity<List<Item>> getCart(@SessionAttribute(required = false) Cart cart) {
        if (cart == null) {
            return new ResponseEntity<>(null, HttpStatus.ACCEPTED);
        }
        return new ResponseEntity<>(cart.getItems(), HttpStatus.OK);
    }

    @RequestMapping("/addCart")
    @ResponseBody
    public Book addCart(@RequestParam(required = false) Integer id,
                        HttpSession session) {
        Book book = bookService.getBookById(id);
        System.out.println(book.toString());
        Cart cart = (Cart) session.getAttribute("cart");
        if (session.getAttribute("cart") == null) {
            cart = new Cart();
            cart.addItem(book);
        } else {
            cart.addItem(book);
        }
        session.setAttribute("cart", cart);
        return book;
    }

    @RequestMapping("/changeCart")
    @ResponseBody
    public Map<String, Integer> changeCart(@RequestParam Integer id,
                                           @RequestParam Integer value,
                                           HttpSession session,
                                           @RequestParam Integer type) {
        System.out.println(value + " - " + id + " - " + type);
        Map<String, Integer> data = new HashMap<>();
        Cart cart = (Cart) session.getAttribute("cart");
        if ((type == 1 || type == 2) && null != value) {
            cart.updateItem(id, value);
            data.put("quantity", cart.getItems().get(cart.exists(id)).getQuantity());
            data.put("subtotal", cart.subTotal(id));
            data.put("total", cart.amountTotal());
            session.setAttribute("cart", cart);
        }
        if (type == 1 && null == value) {
            cart.updateItem(id, 0);
            data.put("quantity", 0);
            data.put("subtotal", 0);
            data.put("total", cart.amountTotal());
            session.setAttribute("cart", cart);
        }
        if (type == 2 && (null == value || value == 0)) {
            cart.removeItem(id);
            if (cart.quantityTotal() == 0) {
                session.removeAttribute("cart");
            }
            data.put("quantity", 0);
            data.put("del", 1);
            data.put("total", cart.amountTotal());
        }
        return data;
    }

    @RequestMapping("/total")
    @ResponseBody
    public int totalAmount(@SessionAttribute(required = false) Cart cart) {
        return cart.amountTotal();
    }
//
//    public int exists(int id, List<Item> items) {
//        for (int i = 0; i < items.size(); i++) {
//            if (items.get(i).getBook().getId() == id) {
//                return i;
//            }
//        }
//        return -1;
//    }
//
//    public List<Item> removeItem(Integer id) {
//        for (int i = 0; i < items.size(); i++) {
//            if (items.get(i).getBook().getId() == id) {
//                this.items.remove(i);
//            }
//        }
//        return this.items;
//    }
//
//    public Integer quantityTotal() {
//        return this.items.size();
//    }
//
//    public Integer amountTotal() {
//        int sum = 0;
//        for (Item item : items) {
//            sum += item.getBook().getPriceNew() * item.getQuantity();
//        }
//        return sum;
//    }
}
