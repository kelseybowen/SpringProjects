package com.kelseybowen.languages.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.kelseybowen.languages.models.Language;
import com.kelseybowen.languages.repositories.LanguageRepository;

@Service
public class LanguageService {
	private final LanguageRepository languageRepo;
	
	public LanguageService(LanguageRepository languageRepo) {
		this.languageRepo = languageRepo;
	}
		
	public List<Language> allLanguages() {
		return languageRepo.findAll();
	}
	
	public Language createLanguage(Language l) {
		return languageRepo.save(l);
	}
	
	public Language findLanguage(Long id) {
		Optional<Language> optionalLanguage = languageRepo.findById(id);
		if(optionalLanguage.isPresent()) {
			return optionalLanguage.get();
		} else {
			return null;
		}
	}
	
	public void deleteLanguage(Long id) {
		languageRepo.deleteById(id);
	}
}
