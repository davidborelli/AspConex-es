package br.com.aspconexoes.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.aspconexoes.models.Municipio;

@Repository
@Transactional
public class MunicipioDAO {

	@PersistenceContext
	private EntityManager manager;
	
	public void salvar(Municipio municipio) {
		
		if(municipio.getId() == null) {
			manager.persist(municipio);
		} else {
			manager.merge(municipio);
		}		
	}
	
	public Municipio buscarPorId(Long id) {
		return manager.createQuery("select m from Municipio m where m.id = :id",
				Municipio.class).setParameter("id", id).getSingleResult();
	}
	
	public List<Municipio> listarTodos(){
		return manager.createQuery("select m from Municipio m order by m.nome", Municipio.class).getResultList();
	}

	public List<Municipio> buscaPorNome(Municipio municipio) {
		return manager.createQuery("select m from Municipio m where m.nome like :pNome order by m.nome", Municipio.class).setParameter("pNome", "%" + municipio.getNome() + "%").getResultList();
	}
	
	public List<Municipio> buscaConexoesAtivas(){
		return manager.createQuery("select m from Municipio m where m.ativo = :pAtivo order by m.nome", Municipio.class).setParameter("pAtivo", true).getResultList();
	}
	
	public void excluir(Municipio municipio) {
		manager.remove(municipio);
	}
	
}
