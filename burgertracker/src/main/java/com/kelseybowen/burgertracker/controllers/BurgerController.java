package com.kelseybowen.burgertracker.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.kelseybowen.burgertracker.models.Burger;
import com.kelseybowen.burgertracker.services.BurgerService;

@Controller
//@RequestMapping("/burger")
public class BurgerController {
	
	@Autowired BurgerService burgerServ;
	
	@GetMapping("/")
	public String index(Model model, @ModelAttribute("burger") Burger burger) {
		List<Burger> burgers = burgerServ.allBurgers();
		model.addAttribute("burgers", burgers);
		return "index.jsp";
	}
	
	@PostMapping("/burger/create")
    public String create(Model model, @Valid @ModelAttribute("burger") Burger burger, BindingResult result) {
        if (result.hasErrors()) {
        	List<Burger> burgers = burgerServ.allBurgers();
    		model.addAttribute("burgers", burgers);
            return "index.jsp";
        } else {
            burgerServ.createBurger(burger);
            return "redirect:/";
        }
    }
	
   @GetMapping("/burger/{id}/edit")
    public String edit(@PathVariable("id") Long id, Model model) {
        Burger burger = burgerServ.findBurger(id);
        model.addAttribute("burger", burger);
        return "/burger/edit.jsp";
    }
	
	@PutMapping("/burger/{id}/update")
    public String update(@Valid @ModelAttribute("burger") Burger burger, BindingResult result) {
        if (result.hasErrors()) {
            return "/burger/edit.jsp";
        } else {
            burgerServ.createBurger(burger);
            return "redirect:/";
        }
    }
	
	@GetMapping("/burger/{id}/delete")
	public String delete(@PathVariable("id") Long id) {
		burgerServ.deleteBurger(id);
		return "redirect:/";
	}
	
}
