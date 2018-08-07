package br.com.aspconexoes.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.aspconexoes.daos.MunicipioDAO;
import br.com.aspconexoes.models.Municipio;

@Controller
@RequestMapping("/municipios")
public class MunicipiosController {
	
	@Autowired
	private MunicipioDAO municipioDao;
	
	@RequestMapping("/cadastro")
	public ModelAndView form(Municipio municipio) {
		ModelAndView modelAndView = new ModelAndView("municipios/inserirMunicipio");
		//modelAndView.addObject("tipos", TipoConexao.values());
		return modelAndView;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	@CacheEvict(value = "conexoesHome", allEntries = true) 
	public ModelAndView gravar(Municipio municipio, BindingResult result, RedirectAttributes attributes) {
		
		municipioDao.salvar(municipio);
		
		return new ModelAndView("redirect:/");
	}	
	
	@RequestMapping(value="/buscaPorNome" ,method=RequestMethod.POST)
	public ModelAndView buscaPorNome(Municipio municipio) {
		ModelAndView modelAndView = new ModelAndView("/home");
		
		List<Municipio> municipiosPorNome =  municipioDao.buscaPorNome(municipio);
		modelAndView.addObject("municipios", municipiosPorNome);
		
		return modelAndView;
	}
}
