package br.com.aspconexoes.service;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.aspconexoes.models.Usuario;
import br.com.aspconexoes.repository.Usuarios;
import br.com.aspconexoes.service.exception.UsuarioJaCadastradoException;

@Service
public class UsuarioService {
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Autowired
	private Usuarios usuarios;
	
	@PersistenceContext
	private EntityManager manager;
	
	@Transactional
	public Boolean salvar(Usuario usuario) {
		//Busco usuário para ver se já existe
		List<Usuario> listlUsuario = usuarios.findByEmailIgnoreCase(usuario.getEmail());
		
		//Caso não existir, salve
		if(listlUsuario.isEmpty()) {
			usuario.setSenha(this.passwordEncoder.encode(usuario.getSenha()));
			usuarios.save(usuario);
			return false;
		}
		
		//Caso existir capturo o usuario da lista
		Usuario usu = listlUsuario.get(0);
		
		//Verifico se os dados recebidos são iguais os cadastrados
		if(verificaUsuariosIguais(usuario, usu) ) {
			throw new UsuarioJaCadastradoException("Usuário já existe");
		}
		
		usuarios.save(usu);
		return true;
		
	}
	
	@Transactional
	public void excluir(Usuario usuario) {
		manager.remove(usuario);
	}

	private boolean verificaUsuariosIguais(Usuario usuario, Usuario usu) {
		if(usu.getEmail() == usuario.getEmail() &&
		   usu.getNome()  == usuario.getNome()  &&
		   usu.getSetor() == usuario.getSetor() &&
		   usu.getAtivo() == usuario.getAtivo() &&
		   usu.getGrupo() == usuario.getGrupo() &&
		   usu.getSenha() == usuario.getSenha()) {
			return true;
		} 
		return false;
	}
	
}
