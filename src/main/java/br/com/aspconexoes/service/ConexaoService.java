package br.com.aspconexoes.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import br.com.aspconexoes.models.Conexao;
import br.com.aspconexoes.repository.Conexoes;
import br.com.aspconexoes.service.exception.ConexaoComMesmoIdIpCadastradoException;

@Service
public class ConexaoService {

	@Autowired
	private Conexoes conexoes;
	
	@Transactional
	public Boolean salvar(Conexao conexao) {
		List<Conexao> listConexao = conexoes.findById_ip(conexao);
		
		
		if(!listConexao.isEmpty()) {
			throw new ConexaoComMesmoIdIpCadastradoException("Já existe uma conexão com o mesmo ID/IP");
		}
		
		
		if(conexao.getId().equals(new Long(0))) {
			conexoes.save(conexao);
			return false;
		}
		
		conexoes.save(conexao);
		return true;
	}
	
	/*private boolean verificaConexoesIguais(Conexao conexaoRecebidaParametro, Conexao conexaoCadBanco) {
		if (conexaoRecebidaParametro.getId_ip().equals(conexaoCadBanco.getId_ip())) {
			return true;
		}
		return false;
	}*/

	@Transactional
	public void excluir(Conexao conexao) {
		conexoes.delete(conexao);
	}
}
