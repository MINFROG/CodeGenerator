package org.md100.framework.generator.service;

import java.util.HashMap;
import java.util.Map;

/**
 * 记录使用该代码生成器时开发人员在界面上设计的一些配置，记在JVM内存；
 * @author jack_wu
 *
 */
public class GeneratorConf {

	private static final GeneratorConf instance = new GeneratorConf();
	
	private Map<String, String> confMap = new HashMap();
	
	private GeneratorConf(){}
	
	public static GeneratorConf getInstance(){return instance;}
	
	public void putConf(String key, String value){
		confMap.put(key, value);
	}
	
	public void putConf(Map<String, String> tempConfMap){
		confMap.putAll(tempConfMap);
	}
	
	public String getConf(String key){
		return confMap.get(key);
	}
	
	public Map<String, String> getAllConf(){
		return confMap;
	}
	
}
