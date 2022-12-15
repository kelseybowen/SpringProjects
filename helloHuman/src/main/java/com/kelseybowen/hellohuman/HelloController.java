package com.kelseybowen.hellohuman;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloController {
	@RequestMapping("/")
	public String index(
			@RequestParam(value="fname", required=false) String fname, 
			@RequestParam(value="lname", required=false) String lname
			) {
		
		if (fname == null) {			
			return "Hello Human";
		}
		else {							
			if (lname == null) {				
				return "Hello " + fname;
			}
			else {
				return "Hello " + fname + " " + lname;
			}
		}
	}
}
