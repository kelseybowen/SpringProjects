package com.kelseybowen.authentication.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kelseybowen.authentication.models.Book;
import com.kelseybowen.authentication.services.BookService;
import com.kelseybowen.authentication.services.UserService;

@Controller
@RequestMapping("/books")
public class BookController {
	
	@Autowired
	private BookService bookServ;
	
	@Autowired
	private UserService userServ;
	
    @GetMapping("/dashboard")
    public String dashboard(
    		Model model, 
    		HttpSession session) {
    	if (session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	Long userId = (Long) session.getAttribute("userId");
    	model.addAttribute("user", userServ.getOneById(userId));

    	List<Book> allBooks = bookServ.allBooks();
    	model.addAttribute("allBooks", allBooks);
    	
    	return "dashboard.jsp";
    }
    
    @GetMapping("/{bookId}")
    public String showBook(@PathVariable("bookId") Long bookId, Model model, HttpSession session) {
    	if (session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	Book book = bookServ.findBook(bookId);
    	model.addAttribute("book", book);
    	return "show.jsp";
    }
    
    
    @GetMapping("/new")
    public String addBook(HttpSession session, Model model) {
    	if (session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	model.addAttribute("book", new Book());
    	return "add.jsp";
    }
    
    @PostMapping("/create")
    public String createBook(
    		@Valid @ModelAttribute("book") Book book, 
    		BindingResult result,
    		HttpSession session, 
    		Model model) {
    	if (result.hasErrors()) {
    		return "add.jsp";
    	} 
    	Long userId = (Long) session.getAttribute("userId");
    	book.setUser(userServ.getOneById(userId));
    	bookServ.createBook(book);
    	return "redirect:/books/dashboard";
    }
    
    @GetMapping("/{id}/edit")
    public String edit(
    		@PathVariable("id") Long id, 
    		Model model, 
    		HttpSession session) {
    	if (session.getAttribute("userId") == null) {
    		return "redirect:/";
    	} 
    	Book book = bookServ.findBook(id);
    	model.addAttribute("book", book);
    	return "edit.jsp";
    }
    
    @PutMapping("/{id}/update")
    public String update(
    		@Valid @ModelAttribute("book") Book book, 
    		BindingResult result, 
    		HttpSession session, 
    		Model model,
    		@PathVariable("id") Long id) {
    	if (session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	if (result.hasErrors()) {
    		return "edit.jsp";
    	}
    	book.setId(id);
    	return "redirect:/books/{id}";
    }
    
    @DeleteMapping("/{id}/delete")
    public String delete(@PathVariable("id") Long id) {
    	bookServ.deleteBook(id);
    	return "redirect:/";
    }

}
