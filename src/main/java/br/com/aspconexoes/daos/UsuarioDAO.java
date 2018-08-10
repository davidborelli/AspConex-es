package br.com.aspconexoes.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.aspconexoes.models.Usuario;

@Repository
@Transactional
public class UsuarioDAO {

	@PersistenceContext
	private EntityManager manager;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public void salvar(Usuario usuario) {
		
		List<Usuario> usuarioExistente = buscarPorEmail(usuario.getEmail());
		
		
		if(!usuarioExistente.isEmpty()) {
			throw new RuntimeException("Já existe um usuário cadastrado com esse e-mail");
		}
		
		usuario.setSenha(this.passwordEncoder.encode(usuario.getSenha()));
		
		manager.persist(usuario);
	}
	
	public List<Usuario> buscarPorEmail(String email) {
		List<Usuario> usuarios = manager.createQuery("select u from Usuario u where email = :pEmail", Usuario.class).setParameter("pEmail", email).getResultList();
		return usuarios;
	}

	public List<Usuario> buscarPorNome(Usuario usuario) {
		List<Usuario> usuarios = manager.createQuery("select u from Usuario u where nome like :pNome", Usuario.class).setParameter("pNome", "%"+usuario.getNome()+"%").getResultList();
		return usuarios;
	}
	
}