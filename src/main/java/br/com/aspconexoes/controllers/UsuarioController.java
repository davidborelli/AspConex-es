package br.com.aspconexoes.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.aspconexoes.daos.GrupoDAO;
import br.com.aspconexoes.daos.UsuarioDAO;
import br.com.aspconexoes.models.Setor;
import br.com.aspconexoes.models.Usuario;
import br.com.aspconexoes.validation.UsuarioValidator;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {
	
	@Autowired
	private UsuarioDAO usuarioDAO;
	
	@Autowired
	private GrupoDAO grupoDao;
	
	@InitBinder
	public void InitBinder(WebDataBinder binder) {
		binder.addValidators(new UsuarioValidator());
	}
	
	@RequestMapping("/cadastro")
	public ModelAndView cadastrar(Usuario usuario) {
		ModelAndView modelAndView = new ModelAndView("/usuarios/inserirUsuarios");
		
		modelAndView.addObject("setores", Setor.values());
		modelAndView.addObject("pgrupos", grupoDao.buscarTodos());
		
		return modelAndView;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView gravar(@Valid Usuario usuario, BindingResult result, RedirectAttributes attributes) {	
		
		if(result.hasErrors()) {
			return cadastrar(usuario);
		}
		
		usuarioDAO.salvar(usuario);			
		
		return new ModelAndView("redirect:/usuarios/cadastro");
	}
	
	@RequestMapping(value="/listar")
	public ModelAndView listarTodosUsuarios(Usuario usuario) {
		ModelAndView modelAndView = new ModelAndView("usuarios/listarUsuarios");
		
		return modelAndView;
	}
	
	@RequestMapping("buscarPorNome")
	public ModelAndView buscarPorNome(Usuario usuario) {
		ModelAndView modelAndView = new ModelAndView();
		
		usuarioDAO.buscarPorNome(usuario);
		
		return modelAndView;
	}
}
