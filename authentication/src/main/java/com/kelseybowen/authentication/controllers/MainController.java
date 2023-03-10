package com.kelseybowen.authentication.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.kelseybowen.authentication.models.LoginUser;
import com.kelseybowen.authentication.models.User;
import com.kelseybowen.authentication.services.UserService;

@Controller
public class MainController {
	
	@Autowired
	private UserService userServ;

	@GetMapping("/")
    public String index(Model model, HttpSession session) {
		if (session.getAttribute("userId") != null) {
    		return "redirect:/books/dashboard";
    	}
        model.addAttribute("newUser", new User());
        model.addAttribute("loginUser", new LoginUser());
        return "index.jsp";
    }
	
	@PostMapping("/register")
	public String register(
			@Valid @ModelAttribute("newUser") User newUser, 
			BindingResult result, 
			Model model, 
			HttpSession session) {
		
		User createdUser = userServ.register(newUser, result);
		if (createdUser == null) {
			model.addAttribute("loginUser", new LoginUser());
			return "index.jsp";
		}
		session.setAttribute("userId", createdUser.getId());
		return "redirect:/books/dashboard";
	}
		
    @GetMapping("/login")
    public String login(
    		@Valid @ModelAttribute("loginUser") LoginUser loginUser, 
            BindingResult result, 
            Model model, 
            HttpSession session) {
    	
    	User loggedUser = userServ.login(loginUser, result);
    	
    	if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "index.jsp";
        }
    	
    	if (loggedUser == null) {
    		model.addAttribute("user", new User());
    		return "index.jsp";
    	}
    	session.setAttribute("userId", loggedUser.getId());
    	return "redirect:/books/dashboard"; 
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.removeAttribute("userId");
    	return "redirect:/";
    }
}
