package br.com.aspconexoes.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.aspconexoes.daos.GrupoDAO;
import br.com.aspconexoes.daos.UsuarioDAO;
import br.com.aspconexoes.models.Setor;
import br.com.aspconexoes.models.Usuario;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {
	
	@Autowired
	private UsuarioDAO usuarioDAO;
	
	@Autowired
	private GrupoDAO grupoDao;
	
	@RequestMapping("/cadastro")
	public ModelAndView cadastrar(Usuario usuario) {
		ModelAndView modelAndView = new ModelAndView("/usuarios/inserirUsuarios");
		
		modelAndView.addObject("setores", Setor.values());
		modelAndView.addObject("pgrupos", grupoDao.buscarTodos());
		
		return modelAndView;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView gravar(Usuario usuario, BindingResult result, RedirectAttributes attributes) {	
		
		if(result.hasErrors()) {
			return cadastrar(usuario);
		}
		
		usuarioDAO.salvar(usuario);			
		
		return new ModelAndView("redirect:/usuarios/cadastro");
	}
}
