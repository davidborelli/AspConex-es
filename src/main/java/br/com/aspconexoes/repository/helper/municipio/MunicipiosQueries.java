package br.com.aspconexoes.repository.helper.municipio;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import br.com.aspconexoes.models.Municipio;

public interface MunicipiosQueries {
	
	public Page<Municipio> filtrarPorNomeOrdenado(Municipio municipio, Pageable pageable);
	public Page<Municipio> filtrarPorNomeOrdenadoEAtivo(Municipio municipio, Pageable pageable);
	public Page<Municipio> listaTodosOrdenadoPorNome(Pageable pageable);
	public Page<Municipio> listaTodosOrdenadoPorNomeEAtivo(Pageable pageable);
	public List<Municipio> pesquisaPorNomeEAtivo(Municipio municipio);
	public List<Municipio> listaTodosOrdenadoPorNomeEAtivo();
	public List<Municipio> buscaMunicipioEdicao(Municipio municipio);
}
