package br.com.aspconexoes.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.aspconexoes.models.Municipio;
import br.com.aspconexoes.repository.helper.municipio.MunicipiosQueries;

@Repository
public interface Municipios extends JpaRepository<Municipio, Long>, MunicipiosQueries {
	
	/*
	 * Optional = existe ou não, caso não exista não lança excessão, 
	 * disponível no Java8
	 * 
	 * IgnoreCase = tanto faz caixa alta e caixa baixa
	 * */
	public Optional<Municipio> findById(Long id);
	public Optional<Municipio> findByNomeIgnoreCase(String nome);
	
}
