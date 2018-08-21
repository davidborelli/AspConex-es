package br.com.aspconexoes.repository.helper.usuario;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import br.com.aspconexoes.models.Usuario;

public interface UsuariosQueries {

	public Page<Usuario> listarTodosOrdenadoPorNome(Pageable pageable);
	public Page<Usuario> buscaPorNomeOrdenado(Usuario usuario, Pageable pageable);
	public List<Usuario> findByEmailIgnoreCase(String email);
	public List<String> permissoes(Usuario usuario);
	
}
