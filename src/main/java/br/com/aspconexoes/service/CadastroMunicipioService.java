package br.com.aspconexoes.service;

import java.util.Optional;

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
	public void salvar(Municipio municipio) {
		Optional<Municipio> municipioOptional = municipios.findByNomeIgnoreCase(municipio.getNome());
		
		if(municipioOptional.isPresent()) {
			throw new NomeMunicipioCadastradoException("Município já existe");
		}
		
		municipios.save(municipio);
	}
	
}
