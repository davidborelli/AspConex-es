package br.com.aspconexoes.daos;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.aspconexoes.models.Conexao;

@Repository
@Transactional
public class ConexaoDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void salvar(Conexao conexao) {
		if(conexao.getId() == null) {
			manager.persist(conexao);
		} else {
			manager.merge(conexao);
		}
	}
	
	public Conexao find(Long id) {
		Conexao conexao = manager.find(Conexao.class, id);
		return conexao;
	}
	
	public void excluir(Conexao conexao) {
		manager.remove(conexao);
	}
	
}
