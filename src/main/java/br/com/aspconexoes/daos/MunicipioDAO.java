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
		manager.persist(municipio);
	}
	
	public Municipio buscarPorId(int id) {
		return manager.createQuery("select distinct(m) from Municipio m join fetch m.conexoes conexoes where m.id = :id",
				Municipio.class).setParameter("id", id).getSingleResult();
	}
	
	public List<Municipio> listarTodos(){
		//String jpql = "select m from Municipio m";
		return manager.createQuery("select m from Municipio m order by m.nome", Municipio.class).getResultList();
		//Query query = manager.createQuery(jpql); 
		//return query.getResultList();
	}

	public List<Municipio> buscaPorNome(Municipio municipio) {
		return manager.createQuery("select m from Municipio m where m.nome like :pNome order by m.nome", Municipio.class).setParameter("pNome", "%" + municipio.getNome() + "%").getResultList();
	}
	
	public List<Municipio> buscaConexoesAtivas(){
		return manager.createQuery("select m from Municipio m where m.ativo = :pAtivo", Municipio.class).setParameter("pAtivo", true).getResultList();
	}
}
