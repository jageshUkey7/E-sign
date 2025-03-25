package com.e_sign.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.e_sign.model.User;
import com.e_sign.repository.UserRepository;

@Service
public class UserDetailsServiceImpl implements UserDetailsService{

	
	  @Autowired
	    private UserRepository userRepository;

	    @Override
	    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
	    	
	    	
	    	User users = userRepository.findByUsername(username);
	    	
	    	
	    	User user = userRepository.findByUsername(username);

	    	if (user == null) {
	    	    throw new UsernameNotFoundException("User not found: " + username);
	    	}
	        
	        UserBuilder builder = org.springframework.security.core.userdetails.User.withUsername(username);
	        builder.password(user.getPassword());
	        builder.roles("USER"); // Set role (customize as needed)
	        
	        return builder.build();
	    }
}
