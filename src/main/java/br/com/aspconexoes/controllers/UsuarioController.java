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
import br.com.aspconexoes.models.Setor;
import br.com.aspconexoes.models.Usuario;
import br.com.aspconexoes.repository.Grupos;
import br.com.aspconexoes.repository.Usuarios;
import br.com.aspconexoes.service.UsuarioService;
import br.com.aspconexoes.service.exception.UsuarioJaCadastradoException;
import br.com.aspconexoes.validation.UsuarioValidator;

@Controller
@RequestMapping("/usuarios")
public class UsuarioController {
	
	@Autowired
	private Grupos grupos;
	
	@Autowired
	private Usuarios usuarios;
	
	@Autowired
	private UsuarioService usuarioService;
	
	@InitBinder("usuario")
	public void InitBinder(WebDataBinder binder) {
		binder.addValidators(new UsuarioValidator());
	}
	
	@RequestMapping("/cadastro")
	public ModelAndView cadastrar(Usuario usuario) {
		ModelAndView modelAndView = new ModelAndView("/usuarios/inserirUsuarios");
		
		modelAndView.addObject("usuario", usuario);
		modelAndView.addObject("setores", Setor.values());
		modelAndView.addObject("pgrupos", grupos.findAll());
		
		return modelAndView;
	}
	
	@RequestMapping(method=RequestMethod.POST)
	public ModelAndView gravar(@Valid Usuario usuario, BindingResult result, RedirectAttributes attributes) {	
		ModelAndView modelAndView = new ModelAndView("redirect:/usuarios/listar");
		Boolean jaCadastrado;
		
		System.out.println("Usuario recebido >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> " + usuario);
		
		if(result.hasErrors()) {
			return cadastrar(usuario);
		}
		
		try {
			jaCadastrado = usuarioService.salvar(usuario);
		} catch (UsuarioJaCadastradoException e) {
			result.rejectValue("nome", e.getMessage(), e.getMessage());
			return cadastrar(usuario);
		}
		
		if(jaCadastrado == true) {
			attributes.addFlashAttribute("mensagem", "Usuário alterado com sucesso");
			return modelAndView;
		}
		
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
	
	@RequestMapping(value="/editar/{codigo}")
	public ModelAndView formEditar(@PathVariable("codigo") Long codigo) {
		ModelAndView modelAndView = new ModelAndView("/usuarios/editarUsuarios");
		
		Usuario usuario = usuarios.findByCodigo(codigo);
		modelAndView.addObject("usuario", usuario);
		modelAndView.addObject("setores", Setor.values());
		modelAndView.addObject("pgrupos", grupos.findAll());
		
		return modelAndView;
	}
	
	@RequestMapping(value="/excluir/{codigo}")
	public ModelAndView exclusao(@PathVariable("codigo") Long codigo) {
		ModelAndView modelAndView = new ModelAndView("redirect:/usuarios/listar");
		
		Usuario usuario = usuarios.findByCodigo(codigo);
		usuarioService.excluir(usuario);
		
		return modelAndView;
	}
}
