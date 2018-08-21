package br.com.aspconexoes.repository.helper.conexao;

import java.util.List;

import br.com.aspconexoes.models.Conexao;
import br.com.aspconexoes.models.Municipio;

public interface ConexoesQueries {
	
	public List<Municipio> buscaConexoesAtivas();
	public List<Conexao> findById_ip(Conexao conexao);

}
