package co.com.smartlife.parametercatalog;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;

@EnableConfigServer
@SpringBootApplication
public class ParameterCatalogSmartlifeApplication {

	public static void main(final String[] args) {
		SpringApplication.run(ParameterCatalogSmartlifeApplication.class, args);
	}

}