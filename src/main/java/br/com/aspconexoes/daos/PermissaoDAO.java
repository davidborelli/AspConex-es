package br.com.aspconexoes.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;

import br.com.aspconexoes.models.Usuario;

@Repository
public class PermissaoDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public List<String> buscarPermissao(Usuario usuario){
		return manager.createQuery("select p.nome from Permissao p where grupo_codigo = :pGrupoUsuario", String.class)
					.setParameter("pGrupoUsuario", usuario.getGrupo())
					.getResultList();
	}

}
