package br.com.aspconexoes.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.aspconexoes.models.Municipio;
import br.com.aspconexoes.repository.Municipios;

@Controller
public class HomeController {
	
	@Autowired
	private Municipios municipios;
	
	@RequestMapping("/")
	@Cacheable(value = "conexoesHome")
	public ModelAndView index(Municipio municipio, BindingResult result, @PageableDefault(size=5) Pageable pageable) {
		ModelAndView modelAndView = new ModelAndView("/home");
		
		Page<Municipio> pagina = municipios.listaTodosOrdenadoPorNome(pageable);
		
		modelAndView.addObject("pagina", pagina);
		return modelAndView;
	}	
}
