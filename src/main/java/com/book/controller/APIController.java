package com.book.controller;

import com.book.model.Book;
import com.book.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class APIController {

    @Autowired
    BookService bookService;

    @RequestMapping("/api/newbook")
    public ResponseEntity<List<Book>> getNewBook(@RequestParam int page) {
        List<Book> list = bookService.getNewBook(page-1).getContent();
        return new ResponseEntity<>(list, HttpStatus.OK);
    }
    @RequestMapping("/search/autocomplete")
    public ResponseEntity<List<Book>> searchBook(@RequestParam String keywords) {
        List<Book> list = bookService.getBookByName(keywords);
        if(keywords.length() == 0) {
            return new ResponseEntity<>(null, HttpStatus.OK);
        }
        return new ResponseEntity<>(list, HttpStatus.OK);
    }

//    @RequestMapping("/api/newbook")
//    public StringBuilder getNewBook(@RequestParam int page) {
//        System.out.println(page-1);
//        StringBuilder str = new StringBuilder();
//        List<Book> list = bookService.getNewBook(page-1).getContent();
//
//        renderBook(str, list);
//        return str;
//    }

    private void renderBook(StringBuilder str, List<Book> list) {
        for(Book book : list) {
            str.append("<div class=\"product_contener\">");
            str.append("<div class=\"products hide\">");
            str.append("<div class=\"image\">");
            str.append("<a href=\"product?bookid="+book.getId()+"\" title=\""+book.getName()+"\">");
            str.append("<img src=\"/resources/"+book.getImage()+"\" alt=\""+book.getName()+"\" title=\""+book.getName()+"\" />");
            str.append("</a>");
            str.append("<span class=\"saleprice\">"+book.getSaleoff()+"%</span>");
            str.append("</div>");
            str.append("<div class=\"productname\">");
            str.append("<a href=\"product?bookid="+book.getId()+"\" title=\""+book.getName()+"\">"+book.getName()+"</a>");
            str.append("</div>");
            str.append("<div class=\"fields\">");
            str.append("<span><a href=\"product?bookid="+book.getId()+"\" title=\""+book.getAuthor()+"\">"+book.getAuthor()+"</a></span>");
            str.append("</div>");
            str.append("<div class=\"prices\">67.150 ₫</div>");
            str.append("<span class=\"rootprice\">79.000 ₫</span>");
            str.append("</div></div>");
        }
    }
}
