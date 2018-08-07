package br.com.aspconexoes.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.aspconexoes.models.Grupo;

@Repository
public class GrupoDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public List<Grupo> buscarTodos(){
		return manager.createQuery("select g from Grupo g", Grupo.class).getResultList();
	}

}
