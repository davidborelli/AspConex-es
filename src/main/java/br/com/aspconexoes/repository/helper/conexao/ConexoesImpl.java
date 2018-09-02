package br.com.aspconexoes.repository.helper.conexao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import br.com.aspconexoes.models.Conexao;
import br.com.aspconexoes.models.Municipio;

public class ConexoesImpl implements ConexoesQueries {

	@PersistenceContext
	private EntityManager manager;
	
	@Override
	public List<Municipio> buscaConexoesAtivas() {
		return manager.createQuery("select m from Municipio m where m.ativo = :pAtivo order by m.nome", Municipio.class).setParameter("pAtivo", true).getResultList();
	}

	@Override
	public List<Conexao> findById_ip(Conexao conexao) {
		if(conexao.getId() == null) {
			conexao.setId(new Long(0));
		}
		return manager.createQuery(
				"select c from Conexao c"
				+ " where c.id          <> :pId and "
				+ "		  c.id_ip        = :pId_ip and "
				+ "		  c.municipio.id = :pMuni ", Conexao.class)
				.setParameter("pId", conexao.getId())
				.setParameter("pId_ip", conexao.getId_ip())
				.setParameter("pMuni", conexao.getMunicipio().getId())
				.getResultList();
	}

	@Override
	public List<Conexao> findByMunicipio(Long id) {
		return manager.createQuery("select c from Conexao c where c.municipio_id = :pMuni", Conexao.class)
				.setParameter("pMuni", id)
				.getResultList();
	}
}
