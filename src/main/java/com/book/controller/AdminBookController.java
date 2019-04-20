package com.book.controller;

import com.book.model.Book;
import com.book.service.BookService;
import com.book.service.ParentCategoryService;
import com.book.service.PublisherService;
import org.apache.commons.lang.math.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@CrossOrigin
@RequestMapping("/admin/book-manager")
public class AdminBookController {
    @Autowired
    BookService bookService;
    @Autowired
    ParentCategoryService parentCategoryService;
    @Autowired
    PublisherService publisherService;
    @Autowired
    ServletContext context;

    @GetMapping("/add-book")
    public String addBook(ModelMap mm) {
        mm.addAttribute("publisher", publisherService.getAll());
        mm.addAttribute("parent", parentCategoryService.getAll());
        return "/admin/book_add";
    }

    @PostMapping(value = "/add-book")
    @ResponseBody
    public ResponseEntity<Map<String, String>> addBookProc(WebRequest wr,
                                                           MultipartHttpServletRequest req
    ) throws ParseException {
        MultipartFile mpf = req.getFile("image");
        System.out.println(mpf.getOriginalFilename());
        Map<String, String> errors = new HashMap<>();
        String name = wr.getParameter("name");
        String author = wr.getParameter("author");
        String description = wr.getParameter("description");
        String size = wr.getParameter("size");
        Integer saleoff = NumberUtils.toInt(wr.getParameter("saleoff"));
        Integer priceNew = NumberUtils.toInt(wr.getParameter("priceNew"));
        Integer priceOld = NumberUtils.toInt(wr.getParameter("priceOld"));
        Integer category = NumberUtils.toInt(wr.getParameter("category_id"));
        Integer quantity = NumberUtils.toInt(wr.getParameter("quantity"));
        Integer numberPage = NumberUtils.toInt(wr.getParameter("number_page"));
        Integer weight = NumberUtils.toInt(wr.getParameter("weight"));
        String publishedDate = wr.getParameter("published_date");
        Integer publishiedId = NumberUtils.toInt(wr.getParameter("publisher_id"));
        if (name.length() == 0) {
            errors.put("name", "Trường này không được để trống!");
        }
        if (author.length() == 0) {
            errors.put("author", "Trường này không được để trống!");
        }
        if (description.length() == 0) {
            errors.put("description", "Trường này không được để trống!");
        }
        if (size.length() == 0) {
            errors.put("size", "Trường này không được để trống!");
        }
        if (saleoff <= 0) {
            errors.put("saleoff", "Dữ liệu không hợp lệ, phải là số!");
        }
        if (priceNew <= 0) {
            errors.put("priceNew", "Dữ liệu không hợp lệ, phải là số!");
        }
        if (priceOld <= 0) {
            errors.put("priceOld", "Dữ liệu không hợp lệ, phải là số!");
        }
        if (quantity <= 0) {
            errors.put("quantity", "Dữ liệu không hợp lệ, phải là số!");
        }
        if (numberPage <= 0) {
            errors.put("number_page", "Dữ liệu không hợp lệ, phải là số!");
        }
        if (weight <= 0) {
            errors.put("weight", "Dữ liệu không hợp lệ, phải là số!");
        }
        if (publishedDate.length() <= 0) {
            errors.put("published_date", "Trường này không được để trống!");
        }
        if (category <= 0) {
            errors.put("category_id", "Dữ liệu không hợp lệ!");
        }
        if (!errors.isEmpty()) {
            return new ResponseEntity<>(errors, HttpStatus.OK);
        }
        Book book = new Book();
        book.setAuthor(author);
        book.setCategoryId(category);
        book.setCreated(new Date());
        book.setDescription(description);
        book.setNumberPage(numberPage);
        book.setPriceNew(priceNew);
        book.setPriceOld(priceOld);
        book.setSaleoff(saleoff);
        System.out.println(publishedDate);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date d1 = formatter.parse(publishedDate);
        book.setPublishedDate(d1);
        book.setQuantity(quantity);
        book.setWeight(weight);
        book.setPublisherId(publishiedId);
        book.setName(name);
        book.setSize(size);
        bookService.addBook(book);

        //Upload
        String folder_save_file = context.getRealPath("/resources/image/book");
        try {
            mpf.transferTo(new File(folder_save_file + File.separator + book.getId() + mpf.getOriginalFilename()));
            book.setImage("resources/image/book/" + book.getId() + mpf.getOriginalFilename());
            bookService.addBook(book);
        } catch (Exception e) {
            e.printStackTrace();
        }
        errors.put("none", "Thêm thành công");
        return new ResponseEntity<>(errors, HttpStatus.OK);
    }

    @RequestMapping("/success")
    public String success(RedirectAttributes rd) {
        rd.addFlashAttribute("message", "Thêm sản phẩm thành công!");
        return "redirect:/admin/book-manager";
    }
}
