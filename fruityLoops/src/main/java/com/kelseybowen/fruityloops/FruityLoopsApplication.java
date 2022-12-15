package com.kelseybowen.fruityloops;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })
public class FruityLoopsApplication {

	public static void main(String[] args) {
		SpringApplication.run(FruityLoopsApplication.class, args);
	}

}
