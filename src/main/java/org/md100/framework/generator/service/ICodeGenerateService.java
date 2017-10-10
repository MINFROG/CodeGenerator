package org.md100.framework.generator.service;

import java.util.Map;

public interface ICodeGenerateService {

	public void generate(String[] tableNames, Map<String, String> params);
	
}
