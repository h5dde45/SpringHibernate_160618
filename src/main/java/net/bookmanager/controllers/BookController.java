package net.bookmanager.controllers;

import net.bookmanager.model.Book;
import net.bookmanager.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BookController {
    @Autowired
    private BookService bookService;

    @GetMapping(value = "/")
    public String main(){
        return "main";
    }
    @GetMapping(value = "books")
    public String listBooks(Model model){
        model.addAttribute("book", new Book());
        model.addAttribute("books", bookService.listBooks());
        return "books";
    }


}
