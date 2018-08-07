package br.com.aspconexoes.security;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import br.com.aspconexoes.models.Usuario;

public class UsuarioSistema extends User {

	private static final long serialVersionUID = 1L;
	
	Usuario usuario;

	public UsuarioSistema(Usuario usuario
			, Collection<? extends GrantedAuthority> authorities) {
		super(usuario.getEmail(), usuario.getSenha(), authorities);
		this.usuario = usuario;
	}

	public Usuario getUsuario() {
		return usuario;
	}	
}
