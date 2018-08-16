package br.com.aspconexoes.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.aspconexoes.models.Municipio;
import br.com.aspconexoes.repository.Municipios;
import br.com.aspconexoes.service.exception.NomeMunicipioCadastradoException;

@Service
public class CadastroMunicipioService {

	@Autowired
	private Municipios municipios;
	
	@Transactional
	public Boolean salvar(Municipio municipio) {
		List<Municipio> muni = municipios.pesquisaPorNomeEAtivo(municipio);
		
		if(!muni.isEmpty()) {
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
	
}
