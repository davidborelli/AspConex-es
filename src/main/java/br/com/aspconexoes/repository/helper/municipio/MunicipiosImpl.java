package br.com.aspconexoes.repository.helper.municipio;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;

import br.com.aspconexoes.models.Municipio;
import br.com.aspconexoes.repository.paginacao.PaginacaoUtil;

public class MunicipiosImpl implements MunicipiosQueries {
	
	@PersistenceContext
	private EntityManager manager;
	
	@Autowired
	private PaginacaoUtil paginacao;
	
	@SuppressWarnings("unchecked")
	@Override
	public Page<Municipio> filtrarPorNomeOrdenado(Municipio municipio, Pageable pageable) {
		Query query = manager.createQuery("select m from Municipio m where m.nome like :pNome order by nome", Municipio.class);
		query.setParameter("pNome", "%"+municipio.getNome()+"%");
		int qtdTotalDeItens = query.getResultList().size();
		
		paginacao.preparar(query, pageable);
		List<Municipio> listaMunicipios = query.getResultList();
	
		return new PageImpl<Municipio>(listaMunicipios, pageable, qtdTotalDeItens);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Page<Municipio> listaTodosOrdenadoPorNome(Pageable pageable) {		
		Query query = manager.createQuery("select m from Municipio m order by m.nome", Municipio.class);
		int qtdTotalDeItens = query.getResultList().size();
		
		paginacao.preparar(query, pageable);		
		List<Municipio> listaMunicipios = query.getResultList();	
	
		return new PageImpl<Municipio>(listaMunicipios, pageable, qtdTotalDeItens);
		
	}

}
