package br.com.aspconexoes.models;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Conexao implements Serializable {

	private static final long serialVersionUID = 1L;
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	private String senha;	
	private Integer porta;	
	private String id_ip;
	private String usuario;
	
	@Enumerated(EnumType.STRING)
	private TipoConexao tipo;
	
	//@JoinColumn(name="municipio")
	@ManyToOne
	private Municipio municipio;	

	public Conexao() {
		
	}	

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public Integer getPorta() {
		return porta;
	}

	public void setPorta(Integer porta) {
		this.porta = porta;
	}

	public String getId_ip() {
		return id_ip;
	}

	public void setId_ip(String id_ip) {
		this.id_ip = id_ip;
	}

	public TipoConexao getTipo() {
		return tipo;
	}

	public void setTipo(TipoConexao tipo) {
		this.tipo = tipo;
	}

	public Municipio getMunicipio() {
		return municipio;
	}

	public void setMunicipio(Municipio municipio) {
		this.municipio = municipio;
	}	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Conexao other = (Conexao) obj;
		if (id == null) {
			if (other.id != null)
				return false;
		} else if (!id.equals(other.id))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Conexao [id=" + id + ", senha=" + senha + ", porta=" + porta + ", id_ip=" + id_ip + ", usuario="
				+ usuario + ", tipo=" + tipo + ", municipio=" + municipio + "]";
	}		
}
