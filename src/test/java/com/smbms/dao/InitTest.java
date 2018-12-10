package com.smbms.dao;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.exception.InvalidConfigurationException;
import org.mybatis.generator.internal.DefaultShellCallback;

public class InitTest {
	
	/*@Test
	public void InitTest() throws Exception {
		
		List<String> warnings = new ArrayList<String>();
		boolean overwrite = true;
		File configFile = new File("D:\\eclipseAbout\\eclipse\\workpase\\RkShop\\src\\main\\resources\\mybatis-genernate.xml");
		ConfigurationParser cp = new ConfigurationParser(warnings);
		Configuration config = cp.parseConfiguration(configFile);
		DefaultShellCallback callback = new DefaultShellCallback(overwrite);
		MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
		myBatisGenerator.generate(null);
		
	}*/
	
}
