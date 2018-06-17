package net.bookmanager.controllers;

import net.bookmanager.model.Book;
import net.bookmanager.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class BookController {
    @Autowired
    private BookService bookService;

    @GetMapping(value = "/")
    public String main() {
        return "main";
    }

    @GetMapping(value = "/books")
    public String listBooks(Model model) {
        model.addAttribute("book", new Book());
        model.addAttribute("listBooks", bookService.listBooks());
        return "books";
    }

    @PostMapping(value = "/books/add")
    public String addBook(@ModelAttribute("book") Book book) {
        if (book.getId() == 0) {
            bookService.addBook(book);
        } else {
            bookService.updateBook(book);
        }
        return "redirect:/books";
    }

    @GetMapping(value = "/remove/{id}")
    public String removeBook(@PathVariable("id") int id) {
        bookService.removeBook(id);
        return "redirect:/books";
    }

    @GetMapping(value = "/edit/{id}")
    public String editBook(@PathVariable("id") int id, Model model) {
        model.addAttribute("book",bookService.getBookById(id));
        model.addAttribute("listBooks", bookService.listBooks());
        return "books";
    }

    @GetMapping(value = "/bookdata/{id}")
    public String bookData(@PathVariable("id") int id, Model model) {
        model.addAttribute("book",bookService.getBookById(id));
        return "bookdata";
    }



}
