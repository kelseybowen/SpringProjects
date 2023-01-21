package com.kelseybowen.authentication.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.kelseybowen.authentication.models.LoginUser;
import com.kelseybowen.authentication.models.User;
import com.kelseybowen.authentication.repositories.UserRepository;

@Service
public class UserService {
	
	@Autowired 
	private UserRepository userRepo;
	
	public User createUser(User u) {
		return userRepo.save(u);
	}
	
	public User getOneById(Long id) {
		Optional<User> user = userRepo.findById(id);
    	if (user.isPresent()) {
    		return user.get();
    	}
    	return null;		
	}
	
    public User register(User newUser, BindingResult result) {
    	Optional<User> potentialUser = userRepo.findByEmail(newUser.getEmail());
    	if (potentialUser.isPresent()) {
    		result.rejectValue("email", "Match", "An account already exists using that email.");
    	}
    	if (!newUser.getPassword().equals(newUser.getConfirm())) {
    		result.rejectValue("confirm", "Match", "Passwords must match!"); // field #1 must match the PATH from index.jsp it's related to    		
    	}
    	if (!result.hasErrors()) {
    		newUser.setPassword(BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt()));
    		return this.createUser(newUser);
    	}
    	return null;	
    }
    
    public User login(LoginUser newLoginObject, BindingResult result) {
    	Optional<User> user = userRepo.findByEmail(newLoginObject.getEmail());
    	if (user.isPresent() && BCrypt.checkpw(newLoginObject.getPassword(), user.get().getPassword())) {
    		return user.get();
    	}
    	result.rejectValue("password", "Invalid", "Invalid credentials.");
    	return null;
    }
}
