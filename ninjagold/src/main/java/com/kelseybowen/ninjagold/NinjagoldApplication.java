package com.kelseybowen.ninjagold;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class})
public class NinjagoldApplication {

	public static void main(String[] args) {
		SpringApplication.run(NinjagoldApplication.class, args);
	}

}
