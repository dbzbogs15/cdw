package com.book.controller;

import com.book.model.Book;
import com.book.model.OrderDetails;
import com.book.service.BookService;
import com.book.service.OrderDetailService;
import com.book.service.ParentCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

@Controller
public class CategoryController {
    @Autowired
    ParentCategoryService parentCategoryService;
    @Autowired
    BookService bookService;
    @Autowired
    OrderDetailService orderDetailService;
    @Autowired
    ServletContext context;

    @RequestMapping("/category/{id}")
    public String main(ModelMap mm, @PathVariable int id) {
        mm.addAttribute("tendanhmuc", parentCategoryService.getParentById(id).getName());
        mm.addAttribute("listBook", bookService.getBookByParent(id));
        mm.addAttribute("categories", parentCategoryService.getParentById(id).getCategories());
        mm.addAttribute("parent", parentCategoryService.getAll());
        return "category";
    }

    @RequestMapping("/category/{id}/sub/{subid}")
    public String filter(ModelMap mm, @PathVariable int id, @PathVariable int subid) {
        mm.addAttribute("listBook", bookService.getBookByCategory(subid));
        mm.addAttribute("categories", parentCategoryService.getParentById(id).getCategories());
        mm.addAttribute("tendanhmuc", parentCategoryService.getParentById(id).getName());
        mm.addAttribute("parent", parentCategoryService.getAll());
        return "category";
    }

    @GetMapping("/category/bestseller")
    public String bestSeller(ModelMap mm, @RequestParam(required = false, name = "page") Integer currentPage,
                             HttpServletRequest request) {
        mm.addAttribute("path", "Sách bán chạy");
        Integer totalPage = orderDetailService.getBestsellers(0, 10).getTotalPages();
        if (currentPage == null || currentPage <= 0 || currentPage > totalPage) {
            currentPage = 0;
        } else {
            currentPage -= 1;
        }
        List<OrderDetails> list = orderDetailService.getBestsellers(currentPage, 10).getContent();
        List<Book> result = new ArrayList<>();
        for (OrderDetails orderDetails : list) {
            result.add(orderDetails.getBook());
        }
        return getString(mm, currentPage, request, totalPage, result);
    }

    @GetMapping("/category/newbook")
    public String newBook(ModelMap mm, @RequestParam(required = false, name = "page") Integer currentPage,
                          HttpServletRequest request) {
        Integer totalPage = bookService.getNewBook(0, 10).getTotalPages();
        if (currentPage == null || currentPage <= 0 || currentPage > totalPage) {
            currentPage = 0;
        } else {
            currentPage -= 1;
        }
        mm.addAttribute("path", "Sách mới");
        List<Book> list = bookService.getNewBook(currentPage, 10).getContent();
        return getString(mm, currentPage, request, totalPage, list);
    }

    private String getString(ModelMap mm, @RequestParam(required = false, name = "page") Integer currentPage, HttpServletRequest request, Integer totalPage, List<Book> list) {
        mm.addAttribute("currentPage", currentPage + 1);
        mm.addAttribute("currentUrl", request.getRequestURI());
        mm.addAttribute("totalPage", totalPage);
        mm.addAttribute("list_book", list);
        return "list_book";
    }

    @RequestMapping("/getAll")
    @ResponseBody
    @CrossOrigin
    public List<Book> getAll() {
        return bookService.getAllBook();
    }
}
