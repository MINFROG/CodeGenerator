package org.md100.framework.generator.service.impl;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.md100.framework.generator.dto.IConstant;
import org.md100.framework.generator.dto.TableMetaInfoDto;
import org.md100.framework.generator.service.ContentGenerator;
import org.md100.framework.generator.service.GeneratorConf;
import org.md100.framework.generator.service.ICodeGenerateService;

public abstract class BaseCodeGenerateService implements ICodeGenerateService {
	
	private static final DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
	protected Map conf = new HashMap();
	protected String author = null;
	protected String outputDir = null;
	protected String daoPackage = null;
	protected String daoSuperInterface = null;
	protected String daoSuperInterfaceSimpleName = null;
	protected String daoSuperClass = null;
	protected String daoSuperClassSimpleName = null;
	protected String entityPackage = null;
	protected String entitySuperClass = null;
	protected String entitySuperClassSimpleName = null;
	protected String dtoPackage = null;
	protected String daoSuperclassSimpleName = null;
	
	protected String paginationList = null;
	protected String paginationListSimpleName = null;
	protected String serviceException = null;
	protected String serviceExceptionSimpleName = null;
	
	protected String boPackage = null;
	protected String servicePackage = null;
	protected String controllerPackage = null;
	protected String restAPIControllerPackage = null;
	
	protected void init(){
		Map<String, String> confMap = GeneratorConf.getInstance().getAllConf();
		author = confMap.get(IConstant.CODE_AUTHOR);
		outputDir = confMap.get(IConstant.CODE_OUTPUT_DIR);
		daoPackage = confMap.get(IConstant.CODE_DAO_PACKAGE);
		daoSuperInterface = confMap.get(IConstant.CODE_DAO_SUPER_INTERFACE);
		daoSuperClass = confMap.get(IConstant.CODE_DAO_SUPER_CLASS);
		entityPackage = confMap.get(IConstant.CODE_ENTITY_PACKAGE);
		entitySuperClass = confMap.get(IConstant.CODE_ENTITY_SUPER);
		dtoPackage = confMap.get(IConstant.CODE_DTO_PACKAGE);
		boPackage = confMap.get(IConstant.CODE_BO_PACKAGE);
		servicePackage = confMap.get(IConstant.CODE_SERVICE_PACKAGE);
		controllerPackage = confMap.get(IConstant.CODE_CONTROLLER_PACKAGE);
		restAPIControllerPackage = confMap.get(IConstant.CODE_REST_API_CONTROLLER_PACKAGE);
		daoSuperInterfaceSimpleName = daoSuperInterface.substring(daoSuperInterface.lastIndexOf('.')+1, daoSuperInterface.length());
		daoSuperClassSimpleName 	= daoSuperClass.substring(daoSuperClass.lastIndexOf('.')+1, daoSuperClass.length());
		if(entitySuperClass != null){
			entitySuperClassSimpleName	= entitySuperClass.substring(entitySuperClass.lastIndexOf('.')+1, entitySuperClass.length());
		}
		paginationList = confMap.get(IConstant.CODE_PAGINATIONLIST);
		if(paginationList != null){
			paginationListSimpleName	= paginationList.substring(paginationList.lastIndexOf('.')+1, paginationList.length());
		}
		
		serviceException = confMap.get(IConstant.CODE_SERVICE_EXCEPTION);
		if(serviceException != null){
			serviceExceptionSimpleName	= serviceException.substring(serviceException.lastIndexOf('.')+1, serviceException.length());
		}
		
		conf.put("author", author);
		conf.put("daoPackage", daoPackage);
		conf.put("daoSuperInterface", daoSuperInterface);
		conf.put("daoSuperClass", daoSuperClass);
		conf.put("entityPackage", entityPackage);
		conf.put("entitySuperClass", entitySuperClass);
		conf.put("dtoPackage", dtoPackage);
		conf.put("boPackage", boPackage);
		conf.put("servicePackage", servicePackage);
		conf.put("controllerPackage", controllerPackage);
		conf.put("restAPIControllerPackage", restAPIControllerPackage);
		
		conf.put("daoSuperInterfaceSimpleName", daoSuperInterfaceSimpleName);
		conf.put("daoSuperClassSimpleName", daoSuperClassSimpleName);
		conf.put("entitySuperClassSimpleName", entitySuperClassSimpleName);
		
		conf.put("paginationList", paginationList);
		conf.put("paginationListSimpleName", paginationListSimpleName);
		
		conf.put("serviceException", serviceException);
		conf.put("serviceExceptionSimpleName", serviceExceptionSimpleName);
		
		conf.put("commentSince", format1.format(new Date()));
	}
	
	/**
	 * 生成普通JAVA类，如Dto、VO...
	 * @param outputDir
	 * @param packeageName
	 * @param ObjectName
	 * @param tmpName
	 * @param dataModel
	 * @param tableMetaInfoDto
	 */
	protected void generateObject(String outputDir, String packageName, String objectName, String tmpName, Map dataModel, TableMetaInfoDto tableMetaInfoDto){
		char[] ca = packageName.toCharArray();
		StringBuffer str = new StringBuffer();
		for(char c:ca){
			if(c == '.'){
				str.append('\\');
			}else{
				str.append(c);
			}
		}
		String dir = outputDir + "\\" + str;
		File f = new File(dir);
		if(!f.exists()){
			f.mkdirs();
		}
		String fileName = dir  + "\\" + tableMetaInfoDto.getClsName() + objectName;
		ContentGenerator.getInstance().generate(tmpName, dataModel, fileName);
	}

	/**
	 * 生成接口和实现类，如Dao、DaoImpl、bo、boImpl、Service、ServiceImpl...
	 * @param outputDir
	 * @param packeageName
	 * @param ObjectName
	 * @param tmpName
	 * @param dataModel
	 * @param tableMetaInfoDto
	 */
	protected void generateII(String outputDir, String packageName, String interfaceName, String interfaceTmpName, String implName, String implTmpName, Map dataModel, TableMetaInfoDto tableMetaInfoDto){
		char[] ca = null;
		String dir = null;
		StringBuffer str = null;
		File f = null;
		String fileName = null;
		/****************************************
		 * 以下代码段是为了生成接口
		 ****************************************/
		ca = packageName.toCharArray();
		str = new StringBuffer();
		for(char c:ca){
			if(c == '.'){
				str.append('\\');
			}else{
				str.append(c);
			}
		}
		dir = outputDir + "\\" + str;
		f = new File(dir);
		if(!f.exists()){
			f.mkdirs();
		}
		fileName = dir  + "\\" + tableMetaInfoDto.getClsName() + interfaceName;
		ContentGenerator.getInstance().generate(interfaceTmpName, dataModel, fileName);
		
		/****************************************
		 * 以下代码段是为了生成实现类
		 ****************************************/
		dir = dir + "\\impl";
		f = new File(dir);
		if(!f.exists()){
			f.mkdirs();
		}
		fileName = dir  + "\\" + tableMetaInfoDto.getClsName() + implName;
		ContentGenerator.getInstance().generate(implTmpName, dataModel, fileName);
	}
}
