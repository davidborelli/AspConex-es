package br.com.aspconexoes.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;

import br.com.aspconexoes.models.Conexao;
import br.com.aspconexoes.models.Municipio;
import br.com.aspconexoes.models.TipoConexao;
import br.com.aspconexoes.repository.Conexoes;
import br.com.aspconexoes.repository.Municipios;
import br.com.aspconexoes.ressources.ConexoesRessource;
import br.com.aspconexoes.service.ConexaoService;
import br.com.aspconexoes.service.exception.ConexaoComMesmoIdIpCadastradoException;

@ComponentScan(basePackageClasses = ConexoesRessource.class)
@Controller
@RequestMapping("/conexoes")
public class ConexoesController {
	
	@Autowired
	private ConexoesRessource conexoesRessource;
	
	@Autowired
	private ConexaoService conexaoService;
	
	@Autowired
	private Municipios municipios;
	
	@Autowired
	private Conexoes conexoes;
	
	/*@InitBinder
	public void InitBinder(WebDataBinder binder) {
		binder.addValidators(new ConexaoValidator());
	}*/
	
	@RequestMapping("/cadastro")
	public ModelAndView form(Conexao conexao) {		
		ModelAndView modelAndView = new ModelAndView("conexoes/inserirConexoes");
		
		List<Municipio> listMunicipios = municipios.listaTodosOrdenadoPorNomeEAtivo();
		
		modelAndView.addObject("conexao", conexao);
		modelAndView.addObject("municipios", listMunicipios);
		modelAndView.addObject("tipos", TipoConexao.values());		
		
		return modelAndView; 
	}
	
	@RequestMapping(method=RequestMethod.POST)
	@CacheEvict(value = "conexoesHome", allEntries = true)
	public ModelAndView gravar(@Valid Conexao conexao, BindingResult result, RedirectAttributes attributes) {
		
		Boolean jaCadastrado;
		
		if(result.hasErrors()) {
			return form(conexao);
		}
		
		try {
			jaCadastrado = conexaoService.salvar(conexao);
		} catch (ConexaoComMesmoIdIpCadastradoException e) {
			result.rejectValue("id_ip", e.getMessage(), e.getMessage());
			return form(conexao);
		}	
		
		if(jaCadastrado == true) {
			attributes.addFlashAttribute("mensagem", "Conexão alterada com sucesso");
			return new ModelAndView("redirect:/conexoes/cadastro");
		}
		
		attributes.addFlashAttribute("mensagem", "Conexão cadastrada com sucesso");
		return new ModelAndView("redirect:/conexoes/cadastro");
	}
	
	@RequestMapping("/listar")
	public ModelAndView listar(Conexao conexao) {
		return new ModelAndView("/conexoes/listarConexoes");
	}
	
	@RequestMapping("/editar/{id}")
	public ModelAndView editarConexao(@PathVariable("id") Long id) {
		//ModelAndView modelAndView = new ModelAndView("/conexoes/editarConexoes");
		
		Conexao conexao = conexoes.findById(id);
		//List<Municipio> listMunicipios = municipios.listaTodosOrdenadoPorNomeEAtivo();
		
		/*modelAndView.addObject("conexao", conexao);
		modelAndView.addObject("municipios", listMunicipios);
		modelAndView.addObject("tipos", TipoConexao.values());*/
		
		return form(conexao);
	}
	
	@RequestMapping("/excluir")
	@CacheEvict(value = "conexoesHome", allEntries = true)
	public ModelAndView exclusao(Long id) {
		ModelAndView modelAndView = new ModelAndView("redirect:/");
		
		Conexao conexao = conexoes.findById(id);
		conexaoService.excluir(conexao);
			
		return modelAndView;
	}	
	
	@RequestMapping(value="/pesquisa", method = RequestMethod.POST, consumes = { MediaType.APPLICATION_JSON_VALUE })
	public @ResponseBody ResponseEntity<?> pesquisar(@RequestBody Municipio municipio) throws JsonProcessingException{
		
		String JSONconexoes = conexoesRessource.conexoesToJSON(municipio);
		
		return ResponseEntity.badRequest().body(JSONconexoes);
		//return ResponseEntity.ok(listaConexaoesJSON);
	}
}
