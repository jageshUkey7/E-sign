package com.e_sign.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.e_sign.model.User;
import com.e_sign.utility.Comman;

@Controller
public class LoginController 
{

	Logger log =LoggerFactory.getLogger(getClass());

	@Autowired
	Comman comman;

	@GetMapping("/login")
	public String login() 
	{
		log.info("inside login for e-sign");
		return "login";
	}

	@GetMapping("/home")
	public String home() {

		try {
			log.info("inside home for e-sign");

			User user = comman.getLoggedUser();
			if (user != null) {
				return "home";

			}

		}
		catch(Exception e)
		{
			e.getMessage();
		}
		return "redirect:/login";
	}


	@GetMapping("/esignReport")
	public String esignReport() 
	{
		log.info("inside esignReport for e-sign");
		try {
			User user = comman.getLoggedUser();
			if (user != null) {
				return "esignReport";

			}
		}
		catch(Exception e)
		{
			e.getMessage();
		}
		return "redirect:/login";

	}

	@RequestMapping("/returnUrlResp")
	public String returnUrlResp() 
	{
		log.info("inside returnUrlResp for e-sign");
		return "SignApproved";
	}


}
