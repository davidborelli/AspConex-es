package br.com.aspconexoes.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.aspconexoes.models.Usuario;
import br.com.aspconexoes.repository.Usuarios;

@Service
public class CadastroUsuarioService {

	@Autowired
	private Usuarios usuarios;
	
	@Transactional
	public void salvar(Usuario usuario) {		
		usuarios.save(usuario);
	}
	
}
