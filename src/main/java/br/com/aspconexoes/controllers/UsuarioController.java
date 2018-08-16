package br.com.aspconexoes.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.aspconexoes.controllers.page.PageWrapper;
import br.com.aspconexoes.daos.GrupoDAO;
import br.com.aspconexoes.daos.UsuarioDAO;
import br.com.aspconexoes.models.Setor;
import br.com.aspconexoes.models.Usuario;
import br.com.aspconexoes.repository.Usuarios;
import br.com.aspconexoes.validation.UsuarioValidator;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {
	
	@Autowired
	private UsuarioDAO usuarioDAO;
	
	@Autowired
	private GrupoDAO grupoDao;
	
	@Autowired
	private Usuarios usuarios;
	
	@InitBinder("usuario")
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
		ModelAndView modelAndView = new ModelAndView("redirect:/usuarios/listar");
		
		if(result.hasErrors()) {
			return cadastrar(usuario);
		}
		
		usuarioDAO.salvar(usuario);	
		attributes.addFlashAttribute("mensagem", "Usuário cadastrado com sucesso");
		
		return modelAndView;
	}
	
	@Cacheable(value = "conexoesHome")
	@RequestMapping(value="/listar")
	public ModelAndView listarTodosUsuarios(Usuario usuario, BindingResult result
			, @PageableDefault(size=10) Pageable pageable, HttpServletRequest httpServletRequest) {
		ModelAndView modelAndView = new ModelAndView("usuarios/listarUsuarios");
		
		PageWrapper<Usuario> paginaWrapper = new PageWrapper<>(usuarios.listarTodosOrdenadoPorNome(pageable) , httpServletRequest);
				
		modelAndView.addObject("todosUsuarios", paginaWrapper);		
		
		return modelAndView;
	}
	
	@Cacheable(value = "conexoesHome")
	@GetMapping(value="/buscarPorNome")
	public ModelAndView buscarPorNome(Usuario usuario, BindingResult result
			, @PageableDefault(size=10) Pageable pageable, HttpServletRequest httpServletRequest) {
		
		ModelAndView modelAndView = new ModelAndView("usuarios/listarUsuarios");
		
		PageWrapper<Usuario> pageWrapper = new PageWrapper<>(usuarios.buscaPorNomeOrdenado(usuario, pageable), httpServletRequest);
		modelAndView.addObject("todosUsuarios", pageWrapper);
		
		return modelAndView;
	}
	
	@RequestMapping(value="/editar/{id}")
	public ModelAndView formEditar(@PathVariable("id") Long codigo) {
		ModelAndView modelAndView = new ModelAndView("/usuarios/editarUsuarios");
		
		Usuario usuario = usuarioDAO.buscaPorId(codigo);
		modelAndView.addObject("usuario", usuario);
		modelAndView.addObject("setores", Setor.values());
		modelAndView.addObject("pgrupos", grupoDao.buscarTodos());
		
		return modelAndView;
	}
	
	@RequestMapping(value="/excluir/{id}")
	public ModelAndView exclusao(@PathVariable("id") Long codigo) {
		ModelAndView modelAndView = new ModelAndView("redirect:/usuarios/listar");
		
		Usuario usuario = usuarioDAO.buscaPorId(codigo);
		usuarioDAO.excluir(usuario);
		
		return modelAndView;
	}
}
