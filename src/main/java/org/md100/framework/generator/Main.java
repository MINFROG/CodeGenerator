package org.md100.framework.generator;

import java.io.BufferedInputStream;

import org.mortbay.jetty.Server;
import org.mortbay.xml.XmlConfiguration;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 代码生成服务启动类
 * @author jack_wu
 *
 */
public class Main {

	private static final Logger log = LoggerFactory.getLogger(Main.class);
			
	public static void main(String[] args) {
		try {
			XmlConfiguration configuration;
			Server server = new Server();
			configuration = new XmlConfiguration(new BufferedInputStream(Main.class.getResourceAsStream("/jetty.xml")));
			configuration.configure(server);
			server.start();

	        log.info("代码生成服务启动成功。。。。");
	        server.join();  
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
