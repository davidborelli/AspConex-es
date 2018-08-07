package br.com.aspconexoes.controllers;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LoginController {

	@RequestMapping(value="/login")
	public String loginForm(@AuthenticationPrincipal User user) {
		if(user != null) {
			return "redirect:/";
		}
		
		return "login";
	}
	
	@GetMapping(value="/403")
	public String acessoNegado() {
		return "403";
	}
	
	
	
}
