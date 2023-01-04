package com.kelseybowen.renderingbooks.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kelseybowen.renderingbooks.models.Book;
import com.kelseybowen.renderingbooks.repositories.BookRepository;

@Service
public class BookService {

	@Autowired
	private BookRepository bookRepo;
	
	public List<Book> allBooks() {
	    return bookRepo.findAll();
	}
	// creates a book
	public Book createBook(Book b) {
	    return bookRepo.save(b);
	}
	// retrieves a book
	public Book findBook(Long id) {
	    Optional<Book> optionalBook = bookRepo.findById(id);
	    if(optionalBook.isPresent()) {
	        return optionalBook.get();
	    } 
	    else {
	        return null;
	    } 
	}
}


