package org.md100.framework.generator.service;

import org.md100.framework.generator.service.impl.DubboCodeGenerateServiceImpl;
import org.md100.framework.generator.service.impl.NormalCodeGenerateServiceImpl;


public class CodeGenerateServiceFactory {

	private static final String codeStyle = "dubbo";
	
	//private static final String codeStyle = "normal";
	
	public static ICodeGenerateService getCodeGenerateService(){
		if("dubbo".equals(codeStyle)){
			return new DubboCodeGenerateServiceImpl();
		}else{
			return new NormalCodeGenerateServiceImpl();
		}
	}
	
}
