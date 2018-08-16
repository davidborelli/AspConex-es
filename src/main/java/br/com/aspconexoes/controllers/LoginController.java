package br.com.aspconexoes.controllers;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class LoginController {

	@RequestMapping(value="/login")
	public ModelAndView loginForm(@AuthenticationPrincipal User user, RedirectAttributes attributes) {
		
		if(user != null) {
			return new ModelAndView("redirect:/");
		}
		
		return new ModelAndView("login");
	}
	
	@GetMapping(value="/403")
	public String acessoNegado() {
		return "403";
	}
	
	
	
}
