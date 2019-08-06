package com.mostafa.sna.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.User.UserBuilder;

@Configuration
@EnableWebSecurity
public class DemoAppSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		
		UserBuilder builder = User.withDefaultPasswordEncoder();
		
		auth.inMemoryAuthentication().withUser(
				builder.username("golam").password("123").roles("Employee")
			);
		auth.inMemoryAuthentication().withUser(
				builder.username("Mostafa").password("123").roles("Employee", "Manager")
			);
		auth.inMemoryAuthentication().withUser(
				builder.username("rahman").password("123").roles("Employee", "Admin")
			);
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		
		http.authorizeRequests()
		.antMatchers("/").hasRole("Employee")
		.antMatchers("/leaders/**").hasRole("Manager")
		.antMatchers("/systems/**").hasRole("Admin")
		.and().formLogin()
			.loginPage("/showLoginPage")
			.loginProcessingUrl("/authenticateUser")
			.permitAll()
		.and().logout()
			.permitAll()
		.and().exceptionHandling()
			.accessDeniedPage("/access-denied");
	}
}
