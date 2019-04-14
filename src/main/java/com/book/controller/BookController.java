package com.book.controller;

import com.book.model.Book;
import com.book.service.BookService;
import com.book.service.ParentCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class BookController {
    @Autowired
    BookService bookService;
    @Autowired
    ParentCategoryService parentCategoryService;

    @RequestMapping("/product")
    public String book(@RequestParam int bookid, ModelMap mm) {
        Book book = bookService.getBookById(bookid);
//        ObjectMapper mapper = new ObjectMapper();
//        try {
//            String history = mapper.writeValueAsString(book);
//            mm.addAttribute("hos", history);
//        } catch (JsonProcessingException e) {
//            e.printStackTrace();
//        }
        mm.addAttribute("book", book);
        mm.addAttribute("quanTam", bookService.getNewBook(0).getContent());
        mm.addAttribute("parent", parentCategoryService.getAll());
        return "product";
    }
}
