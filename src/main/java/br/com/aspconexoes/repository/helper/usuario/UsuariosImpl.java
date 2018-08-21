package br.com.aspconexoes.repository.helper.usuario;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;

import br.com.aspconexoes.models.Usuario;
import br.com.aspconexoes.repository.paginacao.PaginacaoUtil;

public class UsuariosImpl implements UsuariosQueries {
	
	@PersistenceContext
	private EntityManager manager;
	
	@Autowired
	private PaginacaoUtil paginacao;

	@SuppressWarnings("unchecked")
	@Override
	public Page<Usuario> listarTodosOrdenadoPorNome(Pageable pageable) {
		Query query = manager.createQuery("select u from Usuario u order by u.nome", Usuario.class);
		
		int qtdItens = query.getResultList().size();
		
		paginacao.preparar(query, pageable);
		List<Usuario> listUsuarios = query.getResultList();
		
		return new PageImpl<>(listUsuarios, pageable, qtdItens);	
	}

	@SuppressWarnings("unchecked")
	@Override
	public Page<Usuario> buscaPorNomeOrdenado(Usuario usuario, Pageable pageable) {
		Query query = manager.createQuery("select u from Usuario u where u.nome like :pNome order by u.nome", Usuario.class);
		
		int qtdItens = query.setParameter("pNome", usuario.getNome()).getResultList().size();
		
		paginacao.preparar(query, pageable);
		List<Usuario> listUsuarios = query.setParameter("pNome", "%"+usuario.getNome()+"%").getResultList();
		
		return new PageImpl<>(listUsuarios, pageable, qtdItens);
	}

	@Override
	public List<Usuario> findByEmailIgnoreCase(String email) {
		List<Usuario> opUsuarios = manager.createQuery(
				"select u from Usuario u where u.email = :pEmail", Usuario.class)
				.setParameter("pEmail", email).getResultList();
		return opUsuarios;
	}

	@Override
	public List<String> permissoes(Usuario usuario) {
		return manager.createQuery("select p.nome from Permissao p where grupo_codigo = :pGrupoUsuario", String.class)
				.setParameter("pGrupoUsuario", usuario.getGrupo())
				.getResultList();
	}
}
