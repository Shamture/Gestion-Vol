package com.gestion.vols;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;

import com.gestion.vols.filters.AgentFilter;
import com.gestion.vols.filters.ClientFilter;

@SpringBootApplication
public class ProjetLibraireApplication {

	@Bean
	public FilterRegistrationBean agentFilterRegistration() {

	    FilterRegistrationBean registration = new FilterRegistrationBean();
	    registration.setFilter(new AgentFilter());
	    registration.addUrlPatterns("/agent/*");
	    
	    return registration;
	} 
	
	@Bean
	public FilterRegistrationBean clientFilterRegistration() {

	    FilterRegistrationBean registration = new FilterRegistrationBean();
	    registration.setFilter(new ClientFilter());
	    registration.addUrlPatterns("/client/*");
	    
	    return registration;
	} 
	
	public static void main(String[] args) {
		SpringApplication.run(ProjetLibraireApplication.class, args);
	}
}
