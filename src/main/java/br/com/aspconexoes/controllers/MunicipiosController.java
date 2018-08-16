package br.com.aspconexoes.controllers;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
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
import br.com.aspconexoes.daos.MunicipioDAO;
import br.com.aspconexoes.models.Municipio;
import br.com.aspconexoes.repository.Municipios;
import br.com.aspconexoes.service.CadastroMunicipioService;
import br.com.aspconexoes.service.exception.NomeMunicipioCadastradoException;
import br.com.aspconexoes.validation.MunicipioValidator;

@Controller
@RequestMapping("/municipios")
public class MunicipiosController {
	
	@Autowired
	private MunicipioDAO municipioDao;
	
	@Autowired
	private CadastroMunicipioService cadastroMunicipioService;
	
	@Autowired
	private Municipios municipios;

	@InitBinder("municipio")
	public void InitBinder(WebDataBinder binder) {
		binder.addValidators(new MunicipioValidator());
	}
	
	@RequestMapping("/")
	@Cacheable(value = "conexoesHome")
	public ModelAndView listarTodosMunicipios(Municipio municipio, BindingResult result
			, @PageableDefault(size=10) Pageable pageable, HttpServletRequest httpServletRequest) {
		ModelAndView modelAndView = new ModelAndView("municipios/listarMunicipio");
		
		PageWrapper<Municipio> paginaWrapper = new PageWrapper<>(municipios.listaTodosOrdenadoPorNome(pageable), httpServletRequest);
		modelAndView.addObject("pagina", paginaWrapper);
		
		return modelAndView;
	}
	
	@RequestMapping("/cadastro")
	public ModelAndView form(Municipio municipio) {
		ModelAndView modelAndView = new ModelAndView("municipios/inserirMunicipio");
		
		modelAndView.addObject(municipio);
		
		return modelAndView;
	}
	
	@RequestMapping(value="/", method=RequestMethod.POST)
	@CacheEvict(value = "conexoesHome", allEntries = true) 
	public ModelAndView gravar(@Valid Municipio municipio, BindingResult result, RedirectAttributes attributes, HttpServletRequest httpServletRequest) {
		
		Boolean jaCadastrado;
		
		if(result.hasErrors()) {
			return form(municipio);
		}
		
		try {
			jaCadastrado = cadastroMunicipioService.salvar(municipio);
		} catch (NomeMunicipioCadastradoException e) {
			result.rejectValue("nome", e.getMessage(), e.getMessage());
			return form(municipio);
		}	
		
		if(jaCadastrado == true) {
			attributes.addFlashAttribute("mensagem", "Município alterado com sucesso");
			return new ModelAndView("redirect:/municipios/cadastro");
		}
		
		attributes.addFlashAttribute("mensagem", "Município cadastrado com sucesso");
		return new ModelAndView("redirect:/municipios/cadastro");
		
	}	
	
	@GetMapping(value="/buscarMunicipio")
	public ModelAndView buscaPorNome(Municipio municipio, BindingResult result
			, @PageableDefault(size=10) Pageable pageable, HttpServletRequest httpServletRequest) {
		ModelAndView modelAndView = new ModelAndView("municipios/listarMunicipio");
		
		PageWrapper<Municipio> paginaWrapper =  new PageWrapper<>(municipios.filtrarPorNomeOrdenado(municipio, pageable), httpServletRequest);
		modelAndView.addObject("pagina", paginaWrapper);
		
		return modelAndView;
	}
	
	@GetMapping(value="/hbuscarMunicipio") //h = home
	public ModelAndView hbuscaPorNome(Municipio municipio, BindingResult result
			, @PageableDefault(size=10) Pageable pageable, HttpServletRequest httpServletRequest) {
		ModelAndView modelAndView = new ModelAndView("/home");
		
		PageWrapper<Municipio> paginaWrapper =  new PageWrapper<>(municipios.filtrarPorNomeOrdenadoEAtivo(municipio, pageable), httpServletRequest);
		modelAndView.addObject("pagina", paginaWrapper);
		
		return modelAndView;
	}
	
	@RequestMapping("/editar/{id}")
	public ModelAndView formEditar(@PathVariable("id") Long id, HttpServletRequest httpServletRequest) {
		ModelAndView modelAndView = new ModelAndView("municipios/inserirMunicipio");
		
		Municipio municipio = municipioDao.buscarPorId(id);
		modelAndView.addObject("municipio", municipio);
		return modelAndView;
	}
	
	@RequestMapping("/excluir/{id}")
	@CacheEvict(value = "conexoesHome", allEntries = true) 
	public ModelAndView exclusao(@PathVariable("id") Long id) {
		ModelAndView modelAndView = new ModelAndView("redirect:/municipios/");
		
		Municipio municipio = municipioDao.buscarPorId(id);	
		municipioDao.excluir(municipio);		
		
		return modelAndView;
	}
}
