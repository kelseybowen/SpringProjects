package com.kelseybowen.ninjagold.controllers;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class GoldController {
	
	@RequestMapping("/") 
	public String index(HttpSession session) {
		if (session.getAttribute("gold") == null) {
			session.setAttribute("gold", 0);
		}
		if (session.getAttribute("ninjaMoves") == null) {
			session.setAttribute("ninjaMoves", "");
		}
		return "index.jsp"; 
	}
	
	@RequestMapping("/find")
	public String find(
			HttpSession session, 
			Model model, 
			RedirectAttributes redirectAttributes,
			@RequestParam(value="farm", required=false) String farm,
			@RequestParam(value="cave", required=false) String cave,
			@RequestParam(value="house", required=false) String house,
			@RequestParam(value="quest", required=false) String quest) {
		int min = 0;
		int max = 0;
		String action = "";
		if (farm != null) {
			min = 10;
			max = 20;
			action = " entered a farm ";
		}
		if (cave != null) {
			min = 5;
			max = 10;
			action = " entered a cave ";
		}
		if (house != null) {
			min = 2;
			max = 5;
			action = " entered a house ";
		}
		if (quest != null) {
			min = -50;
			max = 50;
			action = " completed a quest ";
		}
		int randomInt = (int)(Math.random()*(max-min+1)+min);
		String net = "";
		if (randomInt < 0) {
			net = "lost";
		}
		else {
			net = "earned";
		}
		Date timestamp = new Date();
		String newline = System.getProperty("line.separator");
		session.setAttribute("gold", (int)session.getAttribute("gold") + randomInt);
		String result = String.format("You %s and %s %s gold. (%s)", action, net, randomInt, timestamp);
		session.setAttribute("ninjaMoves", session.getAttribute("ninjaMoves") + result);
		return "redirect:/";
	}
}
