package com.book.model;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class Cart {
    List<Item> items = new ArrayList<>();

    public void addItem(Book book) {
        int index = exists(book.getId());
        System.out.println("index: " + index);
        if (index == -1) {
            items.add(new Item(book, 1));
        } else {
            int news = items.get(index).getQuantity() + 1;
            items.get(index).setQuantity(news);
        }
    }

    public void updateItem(int bookId, int itemQuantity) {
        int index = exists(bookId);
        items.get(index).setQuantity(itemQuantity);
    }

    public int subTotal(int id) {
        int index = exists(id);
        return items.get(index).getQuantity() * items.get(index).getBook().getPriceNew();
    }

    public Integer quantityTotal() {
        return this.items.size();
    }

    public Integer amountTotal() {
        int sum = 0;
        for (Item item : items) {
            sum += item.getBook().getPriceNew() * item.getQuantity();
        }
        return sum;
    }

    public List<Item> removeItem(Integer id) {
        for (int i = 0; i < items.size(); i++) {
            if (items.get(i).getBook().getId() == id) {
                this.items.remove(i);
            }
        }
        return this.items;
    }

    public int exists(int bookId) {
        for (int i = 0; i < items.size(); i++) {
            if (items.get(i).getBook().getId() == bookId) {
                return i;
            }
        }
        return -1;
    }
}
