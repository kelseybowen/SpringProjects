package com.kelseybowen.omikujiform.controllers;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class OmikujiController {
	
	@GetMapping("/omikuji") 
	public String index(Model model) {
		ArrayList<Integer> numberSelect = new ArrayList<Integer>();
		for (int i=5; i<26; i++) {
			numberSelect.add(i);
		}
		model.addAttribute("numberSelect", numberSelect);
		return "index.jsp"; 
	}
	
	@PostMapping("/submitform")
	public String submit(
			@RequestParam(value="numSelect") String numSelect,
			@RequestParam(value="city") String city,
			@RequestParam(value="person") String person,
			@RequestParam(value="hobby") String hobby,
			@RequestParam(value="living") String living,
			@RequestParam(value="nice") String nice,
			HttpSession session) {
		session.setAttribute("numSelect", numSelect);
		session.setAttribute("city", city);
		session.setAttribute("person", person);
		session.setAttribute("hobby", hobby);
		session.setAttribute("living", living);
		session.setAttribute("nice", nice);
		return "redirect:/show";
	}
	
	@GetMapping("/show")
	public String show() {
		return "show.jsp";
	}
}
