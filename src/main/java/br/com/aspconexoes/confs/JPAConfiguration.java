package br.com.aspconexoes.confs;

import java.util.Properties;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import br.com.aspconexoes.repository.Conexoes;

/* Habilitando para o Spring tomar conta das transações */
@Configuration
@ComponentScan(basePackageClasses = {Conexoes.class}) //Mesmo mostrando onde vai estar os repositórios precisa mostrar onde estão os componentes
@EnableJpaRepositories(basePackageClasses = Conexoes.class, enableDefaultTransactions = false)
@EnableTransactionManagement
public class JPAConfiguration {

	@Bean
	/* Criando a Fabrica de Conexões para utilizar o Gerenciador de Entidades */
	public LocalContainerEntityManagerFactoryBean entityManagerFactory(DataSource dataSource, Properties additionalProperties) {
		LocalContainerEntityManagerFactoryBean factoryBean = new LocalContainerEntityManagerFactoryBean();
		
		                              /*Usando o adaptador do Hibernate(Vendor)*/
		JpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();
		
		factoryBean.setJpaVendorAdapter(vendorAdapter);
		
		/* Setar onde estão as entidades para que seja scaneado */
		factoryBean.setPackagesToScan("br.com.aspconexoes.models");
		
		factoryBean.setDataSource(dataSource);
		factoryBean.setJpaProperties(additionalProperties);
		
		return factoryBean;
	}
	
	@Bean
	public Properties additionalProperties() {
		/* Configurando algumas propriedades do Hibernate */
		Properties props = new Properties();
		props.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL5Dialect");
		props.setProperty("hibernate.show_sql", "false");
		props.setProperty("hibernate.hbm2ddl.auto", "update"); /*hbm = Hibernate Mapping to Data Definition Language*/
		props.setProperty("hibernate.format_sql", "true"); //Formatar a SQL
		
		return props;
	}	
		
	@Bean
	public DriverManagerDataSource dataSource() {
		
		/*Componente responsável pela conexão no BD*/
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setUsername("root");
		dataSource.setPassword("roma12");
		dataSource.setUrl("jdbc:mysql://localhost:3306/aspconexoes?useSSL=false");
		dataSource.setDriverClassName("com.mysql.jdbc.Driver");
		
		return dataSource;
	}	
	
	
	/* Tem que ser associado ao EntityManager, por isso recebe ele como parametro */
	@Bean
	public JpaTransactionManager transactionManager(EntityManagerFactory emf) {
		JpaTransactionManager transactionManager = new JpaTransactionManager(emf);
		return transactionManager;
	}
	
}
