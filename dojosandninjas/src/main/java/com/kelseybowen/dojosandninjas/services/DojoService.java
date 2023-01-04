package com.kelseybowen.dojosandninjas.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kelseybowen.dojosandninjas.models.Dojo;
import com.kelseybowen.dojosandninjas.repositories.DojoRepository;

@Service
public class DojoService {
	
	@Autowired
	private DojoRepository dojoRepo;
	
	public List<Dojo> allDojos() {
		return dojoRepo.findAll();
	}
	
	public Dojo createDojo(Dojo d) {
		return dojoRepo.save(d);
	}
	
	public Dojo findDojo(Long id) {
		Optional<Dojo> optionalDojo = dojoRepo.findById(id);
		if (optionalDojo.isPresent()) {
			System.out.println(optionalDojo.get());
			return optionalDojo.get();
		}
		else {
			return null;
		}
	}
	
	public void deleteDojo(Long id) {
		dojoRepo.deleteById(id);
	}
}
