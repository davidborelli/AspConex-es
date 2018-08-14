package br.com.aspconexoes.controllers.page;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.data.domain.Page;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;
import org.springframework.web.util.UriComponentsBuilder;

/*Wrapper = Envelopar/Desembrulhar
 * vai emvelopar Page
 * */
public class PageWrapper<T> {
	
	private Page<T> page;
	private UriComponentsBuilder uriBuilder; //Montar URI's

	public PageWrapper(Page<T> page, HttpServletRequest httpServletRequest) {
		this.page = page;
		this.uriBuilder = ServletUriComponentsBuilder.fromRequest(httpServletRequest);
	}
	
	public List<T> getConteudo(){
		return page.getContent();
	}
	
	public int getTamanho() {
		return page.getSize();
	}
	
	public Boolean isPrimeira() {
		return page.isFirst();
	}
	
	public int getAtual() {
		return page.getNumber();
	}
	
	public int getTotalPaginas() {
		return page.getTotalPages();
	}
	
	public Boolean isUltima() {
		return page.isLast();
	}
	
	public String urlParaPagina(int pagina) {
		//Se tiver o parâmetro page na URL(requisição) substitui com o número da página que será passado
		return uriBuilder.replaceQueryParam("page", pagina).toUriString();
	}
}
