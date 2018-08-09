package br.com.aspconexoes.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.aspconexoes.daos.ConexaoDAO;
import br.com.aspconexoes.daos.MunicipioDAO;
import br.com.aspconexoes.models.Conexao;
import br.com.aspconexoes.models.Municipio;
import br.com.aspconexoes.models.TipoConexao;
import br.com.aspconexoes.validation.ConexaoValidator;

@Controller
@RequestMapping("/conexoes")
public class ConexoesController {

	@Autowired
	private MunicipioDAO municipioDao;
	
	@Autowired
	private ConexaoDAO conexaoDao;
	
	@InitBinder
	public void InitBinder(WebDataBinder binder) {
		binder.addValidators(new ConexaoValidator());
	}
	
	@RequestMapping("/cadastro")
	public ModelAndView form(Conexao conexao) {		
		ModelAndView modelAndView = new ModelAndView("conexoes/inserirConexoes");
		
		List<Municipio> municipios = municipioDao.buscaConexoesAtivas();
		
		modelAndView.addObject("municipios", municipios);
		modelAndView.addObject("tipos", TipoConexao.values());		
		
		return modelAndView; 
	}
	
	@RequestMapping(method=RequestMethod.POST)
	@CacheEvict(value = "conexoesHome", allEntries = true)
	public ModelAndView gravar(@Valid Conexao conexao, BindingResult result, RedirectAttributes attributes) {
		
		if(result.hasErrors()) {
			return form(conexao);
		}
		
		conexaoDao.salvar(conexao);
		
		return new ModelAndView("redirect:/conexoes/cadastro");
	}
	
	@RequestMapping("/listar")
	public ModelAndView listar(Conexao conexao) {
		return new ModelAndView("/conexoes/listarConexoes");
	}
	
	@RequestMapping("/editar/{id}")
	public ModelAndView editarConexao(@PathVariable("id") Long id) {
		ModelAndView modelAndView = new ModelAndView("/conexoes/editarConexoes");
		
		Conexao conexao = conexaoDao.find(id);
		List<Municipio> municipios = municipioDao.buscaConexoesAtivas();
		
		modelAndView.addObject("conexao", conexao);
		modelAndView.addObject("municipios", municipios);
		modelAndView.addObject("tipos", TipoConexao.values());
		
		return modelAndView;
	}
	
	@RequestMapping(value="/editar", method=RequestMethod.POST)
	@CacheEvict(value = "conexoesHome", allEntries = true)
	public ModelAndView editar(@Valid Conexao conexao, BindingResult result, RedirectAttributes attributes) {
		ModelAndView modelAndView = new ModelAndView("redirect:/");
		
		if(result.hasErrors()) {
			return form(conexao);
		}
		
		conexaoDao.salvar(conexao);
		
		return modelAndView;
	}
	
	@RequestMapping("/excluir")
	@CacheEvict(value = "conexoesHome", allEntries = true)
	public ModelAndView exclusao(Long id) {
		ModelAndView modelAndView = new ModelAndView("redirect:/");
		
		Conexao conexao = conexaoDao.find(id);
		conexaoDao.excluir(conexao);
			
		return modelAndView;
	}	
}
