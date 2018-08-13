package br.com.aspconexoes.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.aspconexoes.daos.MunicipioDAO;
import br.com.aspconexoes.models.Municipio;
import br.com.aspconexoes.repository.Municipios;
import br.com.aspconexoes.service.CadastroMunicipioService;
import br.com.aspconexoes.service.exception.NomeMunicipioCadastradoException;

@Controller
@RequestMapping("/municipios")
public class MunicipiosController {
	
	@Autowired
	private MunicipioDAO municipioDao;
	
	@Autowired
	private CadastroMunicipioService cadastroMunicipioService;
	
	@Autowired
	private Municipios municipios;

	/*@InitBinder
	public void InitBinder(WebDataBinder binder) {
		binder.addValidators(new MunicipioValidator());
	}*/
	
	@RequestMapping("/")
	public ModelAndView listarTodosMunicipios(Municipio municipio) {
		ModelAndView modelAndView = new ModelAndView("municipios/listarMunicipio");
		
		List<Municipio> listMunicipios = municipioDao.listarTodos();
		
		modelAndView.addObject("municipios", listMunicipios);
		
		return modelAndView;
	}
	
	@RequestMapping("/cadastro")
	public ModelAndView form(Municipio municipio) {
		ModelAndView modelAndView = new ModelAndView("municipios/inserirMunicipio");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/", method=RequestMethod.POST)
	@CacheEvict(value = "conexoesHome", allEntries = true) 
	public ModelAndView gravar(@Valid Municipio municipio, BindingResult result, RedirectAttributes attributes) {
		
		if(result.hasErrors()) {
			return form(municipio);
		}
		
		try {
			cadastroMunicipioService.salvar(municipio);
		} catch (NomeMunicipioCadastradoException e) {
			result.rejectValue("nome", e.getMessage(), e.getMessage());
			return form(municipio);
		}	
		
		attributes.addFlashAttribute("mensagem", "Município cadastrado com sucesso");
		
		return new ModelAndView("redirect:/municipios/cadastro");
	}	
	
	@RequestMapping(value="/buscaPorNome" ,method=RequestMethod.POST)
	public ModelAndView buscaPorNome(Municipio municipio, @PageableDefault(size=5) Pageable pageable) {
		ModelAndView modelAndView = new ModelAndView("municipios/listarMunicipio");
		
		List<Municipio> municipiosPorNome =  municipioDao.buscaPorNome(municipio);
		modelAndView.addObject("municipios", municipiosPorNome);
		
		return modelAndView;
	}
	
	@RequestMapping(value="/hbuscaPorNome" ,method=RequestMethod.POST)
	public ModelAndView hbuscaPorNome(Municipio municipio, @PageableDefault(size=5) Pageable pageable) {
		ModelAndView modelAndView = new ModelAndView("/home");
		
		Page<Municipio> pagina = municipios.filtrarPorNomeOrdenado(municipio, pageable);
		
		modelAndView.addObject("pagina", pagina);
		return modelAndView;
	}
	
	@RequestMapping("/editar/{id}")
	public ModelAndView formEditar(@PathVariable("id") Long id ) {
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
