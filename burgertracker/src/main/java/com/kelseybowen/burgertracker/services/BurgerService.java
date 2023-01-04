package com.kelseybowen.burgertracker.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kelseybowen.burgertracker.models.Burger;
import com.kelseybowen.burgertracker.repositories.BurgerRepository;

@Service
public class BurgerService {
	
	@Autowired 
	private BurgerRepository burgerRepo;
	
	public List<Burger> allBurgers(){
		return burgerRepo.findAll();
	}
	
	public Burger createBurger(Burger b) {
		return burgerRepo.save(b);
	}
	
	public Burger findBurger(Long id) {
		Optional<Burger> optionalBurger = burgerRepo.findById(id);
		if(optionalBurger.isPresent()) {
			return optionalBurger.get();
		}
		else {
			return null;
		}
	}
	
	public void deleteBurger(Long id) {
		burgerRepo.deleteById(id);
	}
	
}
