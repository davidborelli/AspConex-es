package br.com.aspconexoes.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import br.com.aspconexoes.models.Conexao;
import br.com.aspconexoes.repository.helper.conexao.ConexoesQueries;

@Repository
public interface Conexoes extends JpaRepository<Conexao, Long>, ConexoesQueries {
	
	public Conexao findById(Long id);

}
