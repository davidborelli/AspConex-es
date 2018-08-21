package br.com.aspconexoes.confs;

import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import br.com.aspconexoes.service.UsuarioService;

@Configuration
@ComponentScan(basePackageClasses = UsuarioService.class)
public class ServiceConfig {

}
