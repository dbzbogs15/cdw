package com.book.controller;

import com.book.service.BookService;
import com.book.service.ParentCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
    @Autowired
    BookService bookService;

    @Autowired
    ParentCategoryService parentCategoryService;
    @RequestMapping("/")
    public String index(ModelMap mm) {
//        List<ParentCategory> parentCategory = parentCategoryService.getAll();
//        ObjectMapper mapper = new ObjectMapper();
//        try {
//            String arr = mapper.writeValueAsString(parentCategory);
//            System.out.println(arr);
//        } catch (JsonProcessingException e) {
//            e.printStackTrace();
//        }
        mm.addAttribute("parent", parentCategoryService.getAll());
        mm.addAttribute("newBook", bookService.getNewBook(0).getContent());
        return "index";
    }
}
