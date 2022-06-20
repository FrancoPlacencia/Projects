package com.iba.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

/**
 * 
 * @author francisco.placencia
 *
 */
@EnableWebMvc
@Configuration
@ComponentScan({
		"com.iba.controller",
		"com.iba.dao",
		"com.iba.service",
		"com.iba.validator"
		})
public class SpringWebConfig extends WebMvcConfigurerAdapter {
	
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/resources/**").addResourceLocations("/WEB-INF/resources/");
	}

	/**
	 * This method is the equivalent of the following spring bean configuration:<br>
<code>
&lt;bean class="org.springframework.web.servlet.view.InternalResourceViewResolver"&gt; <br>
    &lt;property name="prefix"&gt;&lt;value&gt;/WEB-INF/&lt;/value&gt;&lt;/property&gt;<br>
    &lt;property name="suffix"&gt;&lt;value&gt;.jsp&lt;/value&gt;&lt;/property&gt;<br>
&lt;/bean&gt;
</code>
	 */
	@Bean
	public InternalResourceViewResolver viewResolver(){
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/WEB-INF/views/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}
	
	@Bean
	public ResourceBundleMessageSource messageSource() {
		ResourceBundleMessageSource rb = new ResourceBundleMessageSource();
		rb.setBasenames(new String[] {"messages/messages", "messages/validation"});
		return rb;
	}

}
