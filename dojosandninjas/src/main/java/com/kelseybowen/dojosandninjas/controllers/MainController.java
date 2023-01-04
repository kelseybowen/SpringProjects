package com.kelseybowen.dojosandninjas.controllers;

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

import com.kelseybowen.dojosandninjas.models.Dojo;
import com.kelseybowen.dojosandninjas.models.Ninja;
import com.kelseybowen.dojosandninjas.services.DojoService;
import com.kelseybowen.dojosandninjas.services.NinjaService;

@Controller
public class MainController {
	
	@Autowired
	private DojoService dojoServ;
	
	@Autowired
	private NinjaService ninjaServ;
	
	@GetMapping("/")
	public String index() {
		return "index.jsp";
	}
	
	
	@GetMapping("/dojos/new")
	public String newDojo(@ModelAttribute("dojo") Dojo dojo) {
		return "/dojo/newDojo.jsp";
	}
	
	@PostMapping("/dojos/new")
	public String createDojo(@Valid @ModelAttribute("dojo") Dojo dojo) {
		dojoServ.createDojo(dojo);
		return "redirect:/";
	}
	
	
	@GetMapping("/ninjas/new")
	public String newNinja(@ModelAttribute("ninja") Ninja ninja, Model model) {
		model.addAttribute("dojos", dojoServ.allDojos());
		return "/ninja/newNinja.jsp";
	}
	
	@PostMapping("/ninjas/new") 
	public String createNinja(
			@Valid @ModelAttribute("ninja") Ninja ninja, 
			BindingResult result, 
			Model model) {
		if (result.hasErrors()) {
			model.addAttribute("dojos", dojoServ.allDojos());
			return "newNinja.jsp";
		}
		else {		
			ninjaServ.createNinja(ninja);
			return "redirect:/";
		}
	}
	
	@GetMapping("/dojos/{id}")
	public String showDojo(@PathVariable("id") Long id, Model model) {
		model.addAttribute("dojo", dojoServ.findDojo(id));
		return "/dojo/showDojo.jsp";
	}
	
}
