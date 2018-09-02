package br.com.aspconexoes.service;

import java.util.List;
>>>>>>> Início implementação AJAX na página principal

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.aspconexoes.models.Municipio;
import br.com.aspconexoes.repository.Municipios;
import br.com.aspconexoes.service.exception.NomeMunicipioCadastradoException;

@Transactional
@Service
public class MunicipioService {
	
	@PersistenceContext
	private EntityManager manager;

	@Autowired
	private Municipios municipios;
	
	public Boolean salvar(Municipio municipio) {
		List<Municipio> listMunicipio = municipios.buscaMunicipioEdicao(municipio);
		
		if(!listMunicipio.isEmpty()) {
			throw new NomeMunicipioCadastradoException("Município já existe");
		}
		
		//Se não existir id cadastra
		if(municipio.getId() == null) {
			municipios.save(municipio);
			return false;
		}
		
		//Se existir e estiver diferente, salva edição
		municipios.save(municipio);
		return true;
	}
	

	public void excluir(Municipio municipio) {
		manager.remove(municipio);
	}
	
}
