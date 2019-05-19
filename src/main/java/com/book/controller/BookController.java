package com.book.controller;

import com.book.model.Book;
import com.book.service.BookService;
import com.book.service.CategoryService;
import com.book.service.ParentCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
public class BookController {
    @Autowired
    BookService bookService;
    @Autowired
    ParentCategoryService parentCategoryService;
    @Autowired
    CategoryService categoryService;

    @RequestMapping("/product")
    public String book(@RequestParam int bookid, ModelMap mm, HttpServletRequest request) {
        Book book = bookService.getBookById(bookid);
        mm.addAttribute("book", book);
        mm.addAttribute("recommend", getRandomElement(bookService.getAllBook(), 5));
        mm.addAttribute("sameCategory", getRandomElement(bookService.getBookByParent(book.getCategory().getParentId()), 5));
        mm.addAttribute("url_like", request.getRequestURL().toString() + "?" + request.getQueryString());
        mm.addAttribute("parent", parentCategoryService.getAll());
        return "product";
    }
    public Set<Book> getRandomElement(List<Book> list,
                                      int totalItems)
    {
        Set<Book> newList = new HashSet<>();
        if(list.size() <= totalItems) {
            newList.addAll(list);
            return newList;
        }
        while (newList.size() < totalItems) {
            newList.add(list.get(new Random().nextInt(list.size())));
        }
        return newList;
    }
}
