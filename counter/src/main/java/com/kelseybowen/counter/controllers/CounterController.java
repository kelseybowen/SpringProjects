package com.kelseybowen.counter.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CounterController { 
	
	@GetMapping("/") 
	public String index(HttpSession session) {
		if (session.getAttribute("count") == null) {
			session.setAttribute("count", 1);
		}
		else {
			session.setAttribute("count", (Integer) session.getAttribute("count")+1);
		}
		return "index.jsp";
	}
	
	@GetMapping("/counter")
	public String counter(HttpSession session) {
		return "show.jsp"; 
	}
	
	@GetMapping("/reset")
	public String reset(HttpSession session) {
		session.setAttribute("count", 0);
		return "index.jsp";
	}
}
