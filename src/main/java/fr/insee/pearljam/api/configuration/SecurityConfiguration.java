package fr.insee.pearljam.api.configuration;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.ArrayUtils;
import org.keycloak.adapters.springsecurity.management.HttpSessionManager;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.authentication.session.RegisterSessionAuthenticationStrategy;
import org.springframework.security.web.authentication.session.SessionAuthenticationStrategy;

import fr.insee.pearljam.api.configuration.ApplicationProperties.Mode;

/**
 * SecurityConfiguration is the class using to configure security.<br>
 * 2 ways to authenticated : <br>
 * 0 - without authentication,<br>
 * 1 - basic authentication <br>
 * 
 * @author Claudel Benjamin
 * 
 */
@ConditionalOnExpression("'${fr.insee.pearljam.application.mode}'=='Basic' or '${fr.insee.pearljam.application.mode}'=='NoAuth'")
@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
	/**
	 * The environment define in Spring application Generate with the application
	 * property environment
	 */
	@Autowired
	private Environment environment;

	@Autowired
	private ApplicationProperties applicationProperties;

	@Value("${fr.insee.pearljam.interviewer.role:#{null}}")
	private String role;

	/**
	 * This method check if environment is development or test
	 * 
	 * @return true if environment matchs
	 */
	protected boolean isDevelopment() {
		return ArrayUtils.contains(environment.getActiveProfiles(), "dev")
				|| ArrayUtils.contains(environment.getActiveProfiles(), "test");
	}

	/**
	 * This method configure the HTTP security access
	 */
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		System.setProperty("keycloak.enabled", applicationProperties.getMode() != Mode.Keycloak ? "false" : "true");
		http
			// disable csrf because of API mode
			.csrf().disable().sessionManagement()
			// use previously declared bean
			.sessionAuthenticationStrategy(sessionAuthenticationStrategy())
			.sessionCreationPolicy(SessionCreationPolicy.STATELESS);
		if (this.applicationProperties.getMode() == Mode.Basic) {
			http.httpBasic().authenticationEntryPoint(unauthorizedEntryPoint());
			http.authorizeRequests()
				// manage routes securisation
				.antMatchers(HttpMethod.OPTIONS).permitAll()
				// configuration for Swagger
				.antMatchers("/swagger-ui.html/**", "/v2/api-docs", "/csrf", "/", "/webjars/**", "/swagger-resources/**").permitAll()
				.antMatchers("/environnement", "/healthcheck").permitAll()
				// configuration for endpoints
				.antMatchers("/api/survey-unit/{id}").hasRole(role)
				.antMatchers("/api/survey-units").hasRole(role)
				.anyRequest().denyAll();
		} else {
			http.httpBasic().disable();
			http.authorizeRequests()
				// manage routes securisation
				.antMatchers(HttpMethod.OPTIONS).permitAll()
				// configuration for Swagger
				.antMatchers("/swagger-ui.html/**", "/v2/api-docs", "/csrf", "/", "/webjars/**", "/swagger-resources/**") .permitAll()
				.antMatchers("/environnement", "/healthcheck").permitAll()
				.antMatchers("/api/survey-units", "/api/survey-unit/{id}").permitAll();
		}
	}

	/**
	 * This method configure the authentication manager for DEV and TEST accesses
	 */
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		if (isDevelopment()) {
			switch (this.applicationProperties.getMode()) {
			case Basic:
				auth.inMemoryAuthentication().withUser("INTW1").password("{noop}a").roles(role).and()
						.withUser("noWrite").password("{noop}a").roles();
				break;
			case NoAuth:
				break;
			default:
				break;
			}
		}
	}

	@Bean
	protected SessionAuthenticationStrategy sessionAuthenticationStrategy() {
		return new RegisterSessionAuthenticationStrategy(new SessionRegistryImpl());
	}

	@Bean
	@ConditionalOnMissingBean(HttpSessionManager.class)
	protected HttpSessionManager httpSessionManager() {
		return new HttpSessionManager();
	}

	/**
	 * This method configure the unauthorized accesses
	 */
	public AuthenticationEntryPoint unauthorizedEntryPoint() {
		return (request, response, authException) -> {
			response.addHeader("WWW-Authenticate", "BasicCustom realm=\"MicroService\"");
			response.sendError(HttpServletResponse.SC_UNAUTHORIZED, authException.getMessage());
		};
	}

}
