package com.kelseybowen.savetravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kelseybowen.savetravels.models.Expense;
import com.kelseybowen.savetravels.repositories.ExpenseRepository;

@Service
public class ExpenseService {
	
	@Autowired private ExpenseRepository expenseRepo;
	
	public List<Expense> allExpenses(){
		return expenseRepo.findAll();
	}
	
	public Expense createExpense(Expense e) {
		return expenseRepo.save(e);
	}
	
	public Expense findExpense(Long id) {
		Optional<Expense> optionalExpense = expenseRepo.findById(id);
		if(optionalExpense.isPresent()) {
			return optionalExpense.get();
		}
		else {
			return null;
		}
	}
	
	public void deleteExpense(Long id) {
		expenseRepo.deleteById(id);
	}
	
}
