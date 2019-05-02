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
import java.util.ArrayList;
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

    List<Item> cart = new ArrayList<>();

    @RequestMapping("")
    public String cart(ModelMap mm, @SessionAttribute(required = false) List<Item> cart) {
        mm.addAttribute("cart", cart);
        mm.addAttribute("total", this.amountTotal());
        mm.addAttribute("parent", parentCategoryService.getAll());
        return "cart";
    }

    @ResponseBody
    @RequestMapping("/getCart")
    public ResponseEntity<List<Item>> getCart(HttpSession session) {
        List<Item> cart = (List<Item>) session.getAttribute("cart");
        if (cart == null) {
            return new ResponseEntity<>(null, HttpStatus.ACCEPTED);
        }
        return new ResponseEntity<>(cart, HttpStatus.OK);
    }

    @RequestMapping("/addCart")
    @ResponseBody
    public Book addCart(@RequestParam(required = false) Integer id,
                        HttpSession session) {
        Book book = bookService.getBookById(id);
        if (session.getAttribute("cart") == null) {
            this.cart.add(new Item(book, 1));
            session.setAttribute("cart", cart);
        } else {
            this.cart = (List<Item>) session.getAttribute("cart");
            int index = this.exists(id, cart);
            if (index == -1) {
                cart.add(new Item(book, 1));
            } else {
                int quantityNew = this.cart.get(index).getQuantity() + 1;
                this.cart.get(index).setQuantity(quantityNew);
            }
            session.setAttribute("cart", this.cart);
        }
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
        cart = (List<Item>) session.getAttribute("cart");
        int index = exists(id, cart);
        if ((type == 1 || type == 2) && null != value) {
            cart.get(index).setQuantity(value);
            data.put("quantity", cart.get(index).getQuantity());
            data.put("subtotal", cart.get(index).getQuantity() * cart.get(index).getBook().getPriceNew());
            data.put("total", amountTotal());
        }
        if (type == 1 && null == value) {
            cart.get(index).setQuantity(0);
            data.put("quantity", 0);
            data.put("subtotal", 0);
            data.put("total", amountTotal());
        }
        if (type == 2 && (null == value || value == 0)) {
            cart = removeItem(id);
            if (cart.size() == 0) {
                session.removeAttribute("cart");
            }
            data.put("del", 1);
            data.put("total", amountTotal());
        }
        return data;
    }

    @RequestMapping("/total")
    @ResponseBody
    public int totalAmount() {
        return amountTotal();
    }

    public int exists(int id, List<Item> cart) {
        for (int i = 0; i < cart.size(); i++) {
            if (cart.get(i).getBook().getId() == id) {
                return i;
            }
        }
        return -1;
    }

    public List<Item> removeItem(Integer id) {
        for (int i = 0; i < cart.size(); i++) {
            if (cart.get(i).getBook().getId() == id) {
                this.cart.remove(i);
            }
        }
        return this.cart;
    }

    public Integer quantityTotal() {
        return this.cart.size();
    }

    public Integer amountTotal() {
        int sum = 0;
        for (Item item : cart) {
            sum += item.getBook().getPriceNew() * item.getQuantity();
        }
        return sum;
    }
}
