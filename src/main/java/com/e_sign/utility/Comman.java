package com.e_sign.utility;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import com.e_sign.model.User;
import com.e_sign.repository.UserRepository;

@Component
public class Comman {
	
	@Autowired
	UserRepository userRepository;
	
	public User getLoggedUser() {
		SecurityContextHolder.getContext().getAuthentication().getDetails();
		String name = SecurityContextHolder.getContext().getAuthentication()
				.getName();

		String username = (!name.equals("anonymousUser")) ? name : null;
		User user = userRepository.findByUsername(username);
		return user != null ? user : null;
	}

}
