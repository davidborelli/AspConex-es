package br.com.aspconexoes.repository.helper.municipio;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import br.com.aspconexoes.models.Municipio;

public interface MunicipiosQueries {
	
	public Page<Municipio> filtrarPorNomeOrdenado(Municipio municipio, Pageable pageable);
	public Page<Municipio> listaTodosOrdenadoPorNome(Pageable pageable);

}
