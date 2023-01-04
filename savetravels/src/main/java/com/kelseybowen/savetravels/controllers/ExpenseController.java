package com.kelseybowen.savetravels.controllers;

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

import com.kelseybowen.savetravels.models.Expense;
import com.kelseybowen.savetravels.services.ExpenseService;

@Controller
public class ExpenseController {
	
	@Autowired ExpenseService expenseServ;
	
	@GetMapping("/expenses") 
	public String index(Model model, @ModelAttribute("expense") Expense expense) {
		List<Expense> expenses = expenseServ.allExpenses();
		model.addAttribute("expenses", expenses);
		return "index.jsp"; 
	}
	
	@PostMapping("/expenses/create")
	public String create(Model model, @Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
		if (result.hasErrors()) {
        	List<Expense> expenses = expenseServ.allExpenses();
    		model.addAttribute("expenses", expenses);
            return "index.jsp";
        } else {
        	expenseServ.createExpense(expense);
            return "redirect:/expenses";
        }
	}
	
	@GetMapping("/expenses/{id}")
	public String show(@PathVariable("id") Long id, Model model) {
		Expense expense = expenseServ.findExpense(id);
		model.addAttribute("expense", expense);
		return "expense/show.jsp";
	}
	
	
	@GetMapping("/expenses/{id}/edit")
    public String edit(@PathVariable("id") Long id, Model model) {
        Expense expense = expenseServ.findExpense(id);
        model.addAttribute("expense", expense);
        return "/expense/edit.jsp";
    }
	
	@PutMapping("/expenses/{id}")
    public String update(Model model, @PathVariable("id") Long id, @Valid @ModelAttribute("expense") Expense expense, BindingResult result) {
        if (result.hasErrors()) {
            return "/expense/edit.jsp";
        } else {
            expenseServ.createExpense(expense);
            return "redirect:/expenses";
        }
    }
	
	@GetMapping("/expenses/{id}/delete")
	public String delete(@PathVariable("id") Long id) {
		expenseServ.deleteExpense(id);
		return "redirect:/expenses";
	}
	
}
