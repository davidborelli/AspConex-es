package br.com.aspconexoes.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.aspconexoes.daos.MunicipioDAO;
import br.com.aspconexoes.models.Municipio;

@Controller
public class HomeController {
	
	@Autowired
	private MunicipioDAO municipioDao;
	
	@RequestMapping("/")
	@Cacheable(value = "conexoesHome")
	public ModelAndView index(Municipio municipio) {
		ModelAndView modelAndView = new ModelAndView("/home");
		
		List<Municipio> municipios = municipioDao.buscaConexoesAtivas();
		
		modelAndView.addObject("municipios", municipios);
		return modelAndView;
	}	
}
