package com.kelseybowen.authentication.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kelseybowen.authentication.models.Book;
import com.kelseybowen.authentication.repositories.BookRepository;

@Service
public class BookService {
	
	@Autowired 
	private BookRepository bookRepo;
	
	public List<Book> allBooks() {
		return bookRepo.findAll();
	}
	
	public Book createBook(Book b) {			
		return bookRepo.save(b);
	}
	
	public Book findBook(Long id) {
		Optional<Book> book = bookRepo.findById(id);
		if (book.isPresent()) {
			return book.get();
		}
		return null;
	}
	
	public void deleteBook(Long id) {
		bookRepo.deleteById(id);
	}

}
