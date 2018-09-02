package br.com.aspconexoes.security;

import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import br.com.aspconexoes.models.Usuario;
import br.com.aspconexoes.repository.Usuarios;

@Service
public class AppUserDetailsService implements UserDetailsService {
	
	@Autowired
	private Usuarios usuarios;

	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		List<Usuario> listUsuario = usuarios.findByEmailIgnoreCase(email);
		
		if(listUsuario.isEmpty()) {
			throw new RuntimeException("Usuáro e/ou senha incorretos"); 
		}
		
		Usuario usuario = listUsuario.get(0);
		return new UsuarioSistema(usuario, getPermissoes(usuario));
	}

	private Collection<? extends GrantedAuthority> getPermissoes(Usuario usuario) {
		Set<SimpleGrantedAuthority> authorities = new HashSet<>();
		
		List<String> listPermissoes = usuarios.permissoes(usuario);
		
		/* Para cada persmissão da lista adiciona em authorities */

		listPermissoes.forEach(p -> authorities.add(new SimpleGrantedAuthority(p)));
		
		return authorities;
	}

}
