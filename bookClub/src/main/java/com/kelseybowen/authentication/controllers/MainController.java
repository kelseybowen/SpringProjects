package com.kelseybowen.authentication.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
    		return "redirect:/dashboard";
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
		return "redirect:/dashboard";
	}
		
    
    @PostMapping("/login")
    public String login(
    		@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, 
            Model model, 
            HttpSession session) {
    	
    	User loggedUser = userServ.login(newLogin, result);
    	if (loggedUser == null) {
    		model.addAttribute("user", new User());
    		return "index.jsp";
    	}
    	session.setAttribute("userId", loggedUser.getId());
    	model.addAttribute("loggedUser", loggedUser);
    	return "redirect:/dashboard";
    }
    
    @GetMapping("/dashboard")
    public String dashboard(
    		Model model, 
    		HttpSession session) {
    	if (session.getAttribute("userId") == null) {
    		return "redirect:/";
    	}
    	Long userId = (Long) session.getAttribute("userId");
    	model.addAttribute("user", userServ.getOneById(userId));
//    	List<Pizza> allPizzas = pizzaServ.getAll();
//    	model.addAttribute("allPizzas", allPizzas);
//    	Long userId = (Long) session.getAttribute("userId");
//    	model.addAttribute("user", userServ.getOneById(userId));
    	return "dashboard.jsp";
    }
    
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.removeAttribute("userId");
    	return "redirect:/";
    }
}
