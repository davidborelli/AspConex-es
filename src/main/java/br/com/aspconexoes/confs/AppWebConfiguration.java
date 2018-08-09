package br.com.aspconexoes.confs;

import java.util.concurrent.TimeUnit;

import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.guava.GuavaCacheManager;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import com.google.common.cache.CacheBuilder;

import br.com.aspconexoes.controllers.HomeController;
import br.com.aspconexoes.daos.ConexaoDAO;
import br.com.aspconexoes.models.Conexao;

/* 2º Passo da configuração */

@EnableWebMvc //Habilita uso do Spring WebMVC
@ComponentScan(basePackageClasses= {HomeController.class, Conexao.class, ConexaoDAO.class}) //Falando onde vai estar os controllers
@EnableCaching
public class AppWebConfiguration extends WebMvcConfigurerAdapter {

	@Bean
	/*Resolvedor Interno de Views*/
	public InternalResourceViewResolver internalResourceViewResolver() {
		InternalResourceViewResolver resolver = new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");
		
		return resolver;
	}
	
	/* Spring está pegando toda requisição por isso não abre os .css 
	 * a classe tem que extender de WebMvcConfigurerAdapter e esse método ser implementado
	 * */
	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}
	
	@Bean
	public MessageSource messageSource() {
		ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
		messageSource.setBasename("/WEB-INF/messages");
		messageSource.setDefaultEncoding("UTF-8");
		messageSource.setCacheSeconds(1);
		return messageSource;
	}
	
	@Bean
	public CacheManager cacheManager() {
		CacheBuilder<Object, Object> builder = CacheBuilder.newBuilder()
			.maximumSize(200)
			.expireAfterAccess(1, TimeUnit.DAYS);
		
		GuavaCacheManager cacheManager = new GuavaCacheManager();
		
		cacheManager.setCacheBuilder(builder);
		return cacheManager;
	}
	
}
