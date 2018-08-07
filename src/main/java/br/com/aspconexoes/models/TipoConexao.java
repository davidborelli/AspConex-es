package br.com.aspconexoes.models;

public enum TipoConexao {

	TS("TS"),
	TEAMVIEWER("Team Viewer"), 
	AA("Ammy Admin"), 
	ANYDESK("AnyDesk"),
	LINUX("Linux"),
	VNC("VNC");
	
	private String descricao;
	
	TipoConexao(String descricao){
		this.descricao = descricao;
	}

	public String getDescricao() {
		return descricao;
	}	
}
