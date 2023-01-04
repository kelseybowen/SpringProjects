package com.kelseybowen.languages.controllers;

import java.util.List;

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

import com.kelseybowen.languages.models.Language;
import com.kelseybowen.languages.services.LanguageService;

@Controller
public class LanguageController {
	
	@Autowired LanguageService languageServ;
	
	@GetMapping("/")
	public String index() {
		return "redirect:/languages";
	}
	
	@GetMapping("/languages")
	public String languages(Model model, @ModelAttribute("language") Language language) {
		List<Language> languages = languageServ.allLanguages();
		model.addAttribute("languages", languages);
		return "index.jsp";
	}
	
	@PostMapping("/languages/create")
	public String create(Model model, @Valid @ModelAttribute("language") Language language, BindingResult result) {
		if (result.hasErrors()) {
        	List<Language> languages = languageServ.allLanguages();
    		model.addAttribute("languages", languages);
            return "index.jsp";
        } else {
        	languageServ.createLanguage(language);
            return "redirect:/languages";
        }
	}
	
	@GetMapping("/languages/{id}")
	public String show(@PathVariable("id") Long id, Model model) {
		Language language = languageServ.findLanguage(id);
		model.addAttribute("language", language);
		return "language/show.jsp";
	}
	
	@GetMapping("/languages/{id}/edit")
	public String edit(@PathVariable("id") Long id, Model model) {
		Language language = languageServ.findLanguage(id);
		model.addAttribute("language", language);
		return "/language/edit.jsp";
	}
	
	@PutMapping("/languages/{id}")
	public String update(Model model, @PathVariable("id") Long id, Language language, BindingResult result) {
		if (result.hasErrors()) {
			return "/language/edit.jsp";
		} else {
			languageServ.createLanguage(language);
			return "redirect:/languages";
		}
	}
	
	@DeleteMapping("/languages/{id}")
	public String destroy(@PathVariable("id") Long id) {
		languageServ.deleteLanguage(id);
		return "redirect:/languages";
	}
	
	
}
