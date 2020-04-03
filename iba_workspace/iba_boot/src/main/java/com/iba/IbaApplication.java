package com.iba;

import org.springframework.boot.Banner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@SpringBootApplication
public class IbaApplication {

	public static void main(String[] args) {
		/*SpringApplication app = new SpringApplication(IbaApplication.class);
		//app.setBannerMode(Banner.Mode.OFF);
		app.run(args);
*/
		SpringApplication.run(IbaApplication.class, args);
	}


}
