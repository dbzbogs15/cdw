package com.book.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    List<Item> cart = new ArrayList<>();

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
    public List<Item> removeItem(Integer id) {
        for(int i = 0; i < cart.size(); i++) {
            if(cart.get(i).getBook().getId() == id) {
                this.cart.remove(i);
            }
        }
        return this.cart;
    }
    public boolean exists(Integer id) {
        for(Item item: cart) {
            if(item.getBook().getId() == id) {
                return true;
            }
        }
        return false;
    }
}
