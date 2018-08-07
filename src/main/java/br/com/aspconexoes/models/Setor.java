package br.com.aspconexoes.models;

public enum Setor {
	
	COMPRAS("Compras"),
	CONTABILIDADE("Contabilidade"),
	SAUDE("Saúde"),
	CONSULTORIA("Consultoria"),
	OUTROS("Outros");
	
	private String descricao;
	
	Setor(String descricao){
		this.descricao = descricao;
	}

	public String getDescricao() {
		return descricao;
	}	
}