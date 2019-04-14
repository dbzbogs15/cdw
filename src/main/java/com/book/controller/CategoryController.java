package com.book.controller;

import com.book.service.BookService;
import com.book.service.ParentCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CategoryController {
    @Autowired
    ParentCategoryService parentCategoryService;

    @Autowired
    BookService bookService;

    @RequestMapping("/category/{id}")
    public String main(ModelMap mm, @PathVariable int id) {
        mm.addAttribute("tendanhmuc", parentCategoryService.getParentById(id).getName());
        mm.addAttribute("listBook", bookService.getBookByParent(id));
        mm.addAttribute("categories", parentCategoryService.getParentById(id).getCategories());
        mm.addAttribute("parent", parentCategoryService.getAll());
        return "category";
    }

    @RequestMapping("category/{id}/sub/{subid}")
    public String filter(ModelMap mm, @PathVariable int id, @PathVariable int subid) {
        mm.addAttribute("listBook", bookService.getBookByCategory(subid));
        mm.addAttribute("categories", parentCategoryService.getParentById(id).getCategories());
        mm.addAttribute("tendanhmuc", parentCategoryService.getParentById(id).getName());
        mm.addAttribute("parent", parentCategoryService.getAll());
        return "category";
    }
}
