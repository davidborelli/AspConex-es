package br.com.aspconexoes.ressources;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

import br.com.aspconexoes.models.Conexao;
import br.com.aspconexoes.models.Municipio;
import br.com.aspconexoes.repository.Conexoes;

@Service
public class ConexoesRessource {

	@Autowired
	private Conexoes conexoes;
	
	public String conexoesToJSON(Municipio municipio) throws JsonProcessingException{
		List<Conexao> listConexao = conexoes.findByMunicipio(municipio);
		
		ObjectMapper mapper = new ObjectMapper(); 
		ArrayNode arrayNode = mapper.createArrayNode();
		
		for (Conexao item : listConexao) {
			ObjectNode node = mapper.createObjectNode();
			node.put("senha",   item.getSenha());
			node.put("porta",   item.getPorta());
			node.put("id_ip",   item.getId_ip());
			node.put("usuario", item.getUsuario());
			node.put("tipo",    item.getTipo().getDescricao());
			
			arrayNode.add(node);
		}
		
		String conexoesJSON = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(arrayNode);
		
		return conexoesJSON;
	}
}
