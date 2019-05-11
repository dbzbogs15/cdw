package com.book.controller;

import com.book.model.Book;
import com.book.model.Category;
import com.book.model.OrderDetails;
import com.book.model.ParentCategory;
import com.book.service.BookService;
import com.book.service.CategoryService;
import com.book.service.OrderDetailService;
import com.book.service.ParentCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {
    @Autowired
    BookService bookService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    ParentCategoryService parentCategoryService;

    @Autowired
    OrderDetailService orderDetailService;

    @RequestMapping("/")
    public String index(ModelMap mm) {
        List<OrderDetails> list = orderDetailService.getBestsellers(0).getContent();
        List<Book> result = new ArrayList<>();
        for(OrderDetails orderDetails : list) {
            result.add(orderDetails.getBook());
        }
        mm.addAttribute("bestSeller", result);
        mm.addAttribute("parent", parentCategoryService.getAll());
        mm.addAttribute("newBook", bookService.getNewBook(0).getContent());
        return "index";
    }

    @GetMapping("/loadCategory")
    @ResponseBody
    public List<ParentCategory> allCategory() {
        return parentCategoryService.getAll();
    }

    @GetMapping("/loadChild/{id}")
    @ResponseBody
    public List<Category> getAllCategory(@PathVariable Integer id) {
        return categoryService.getAllByParentId(id);
    }
}
