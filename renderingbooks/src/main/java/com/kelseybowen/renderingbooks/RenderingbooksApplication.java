package com.kelseybowen.renderingbooks;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
//import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
//(exclude = {DataSourceAutoConfiguration.class}, scanBasePackages= {"com.kelseybowen.renderingbooks.repositories"})
//@ComponentScan({"com.kelseybowen.renderingbooks.services","com.kelseybowen.renderingbooks.repositories"})
public class RenderingbooksApplication {

	public static void main(String[] args) {
		SpringApplication.run(RenderingbooksApplication.class, args);
	}

}
