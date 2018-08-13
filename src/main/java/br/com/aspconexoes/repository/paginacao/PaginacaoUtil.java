package br.com.aspconexoes.repository.paginacao;

import javax.persistence.Query;

import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

@Component
public class PaginacaoUtil {
	
	public void preparar(Query query, Pageable pageable) {
		int totalRegistrosPorPagina = pageable.getPageSize();
		int paginaAtual = pageable.getPageNumber();
		
		int primeiroRegistro = totalRegistrosPorPagina * paginaAtual;
		
		query.setFirstResult(primeiroRegistro);
		query.setMaxResults(totalRegistrosPorPagina);
	}

}
