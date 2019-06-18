package com.book.controller;

import com.book.model.Book;
import com.book.service.*;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletContext;
import javax.validation.Valid;
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
    CategoryService categoryService;
    @Autowired
    ServletContext context;

    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
    }

    @GetMapping("/add-book")
    public String add(ModelMap mm) {
        if (!mm.containsAttribute("book")) {
            mm.addAttribute("book", new Book());
        }
        mm.addAttribute("publisher", publisherService.getAll());
        mm.addAttribute("parent", parentCategoryService.getAll());
        return "/admin/book_add";
    }

    @PostMapping("/addBook")
    public String add(@Valid @ModelAttribute("book") Book book, BindingResult bindingResult,
                      @RequestParam MultipartFile customFile,
                      RedirectAttributes rd) {
        bindingResult.getFieldErrors().forEach(fieldError -> System.out.println(fieldError));
        book.setCreated(new Date());
        bookService.addBook(book);

        //Upload file
        String folder_save_file = context.getRealPath("/resources/image/book");
        try {
            customFile.transferTo(new File(folder_save_file + File.separator + book.getId() + customFile.getOriginalFilename()));
            book.setImage("resources/image/book/" + book.getId() + customFile.getOriginalFilename());
            bookService.addBook(book);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (bindingResult.hasErrors()) {
            rd.addFlashAttribute("org.springframework.validation.BindingResult.book", bindingResult);
            rd.addFlashAttribute("book", book);
            return "redirect:/admin/book-manager/add-book";
        }
        return "redirect:/admin/book-manager";
    }

    @RequestMapping("/success")
    public String success(RedirectAttributes rd) {
        rd.addFlashAttribute("message", "Thêm sản phẩm thành công!");
        return "redirect:/admin/book-manager";
    }

    @GetMapping("/delete-book")
    public String deleteBook(@RequestParam Integer id,
                             RedirectAttributes rd
    ) {
        try {
            bookService.deleteBook(id);
            rd.addFlashAttribute("message", "Xóa sản phẩm thành công!");
        } catch (Exception e) {
            e.printStackTrace();
            rd.addFlashAttribute("message", "Đã có lỗi xãy ra");
        }
        return "redirect:/admin/book-manager";
    }

    @GetMapping("/edit-book")
    public String edit(ModelMap mm, @RequestParam(required = false) Integer bookid) {
        Book book = bookService.getBookById(bookid);
        if (!mm.containsAttribute("book")) {

            mm.addAttribute("book", book);
        }
//        mm.addAttribute("book", book);
        mm.addAttribute("publisher", publisherService.getAll());
        mm.addAttribute("parent", parentCategoryService.getAll());
        mm.addAttribute("categories",
                categoryService.getAllByParentId(book.getCategory().getParentCategory().getId()));
        return "admin/book_edit";
    }

    @PostMapping("/edit-book")
    public String edit(@Valid @ModelAttribute("book") Book book, BindingResult bindingResult,
                       @RequestParam(required = false) MultipartFile customFile, RedirectAttributes rd) {
        Book book1 = bookService.getBookById(book.getId());
        String image = book1.getImage();
        book.setImage(image);
        if (bindingResult.hasErrors()) {
            rd.addFlashAttribute("org.springframework.validation.BindingResult.book", bindingResult);
            rd.addFlashAttribute("book", book);
            return "redirect:/admin/book-manager/edit-book?bookid=" + book.getId();
        }
        if (customFile.getSize() == 0) {
            rd.addFlashAttribute("message", "Cập nhật sản phẩm thành công");
            bookService.addBook(book);
        } else {
            String oldFile = context.getRealPath(book.getImage());
            System.out.println(new File(oldFile).delete());
            String link = "resources/image/book/" + book.getId() + customFile.getOriginalFilename();
            String newFile = context.getRealPath(link);
            try {
                customFile.transferTo(new File(newFile));
                book.setImage(link);
                bookService.addBook(book);
                rd.addFlashAttribute("message", "Cập nhật sản phẩm thành công");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "redirect:/admin/book-manager";
    }

    @GetMapping("/getbook")
    @ResponseBody
    public Book book(@RequestParam Integer id) {
        return bookService.getBookById(id);
    }
}
