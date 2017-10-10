package org.md100.framework.generator.service.impl;

import java.io.File;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.md100.framework.generator.dto.IConstant;
import org.md100.framework.generator.dto.TableMetaInfoDto;
import org.md100.framework.generator.service.ContentGenerator;
import org.md100.framework.generator.service.DatabaseMetaService;
import org.md100.framework.generator.service.GeneratorConf;
import org.md100.framework.generator.service.ICodeGenerateService;

/**
 * 代码生成核心类
 * @author jack_wu
 *
 */
public class NormalCodeGenerateServiceImpl implements ICodeGenerateService{
	
	private static final DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
	private Map conf = new HashMap();	
	private String outputDir = null;
	private String daoPackage = null;
	private String daoSuperInterface = null;
	private String daoSuperInterfaceSimpleName = null;
	private String daoSuperClass = null;
	private String daoSuperClassSimpleName = null;
	private String entityPackage = null;
	private String entitySuperClass = null;
	private String entitySuperClassSimpleName = null;
	private String dtoPackage = null;
	private String daoSuperclassSimpleName = null;
	
	private String paginationList = null;
	private String paginationListSimpleName = null;
	private String serviceException = null;
	private String serviceExceptionSimpleName = null;
	
	private String servicePackage = null;
	private String controllerPackage = null;
	private String restAPIControllerPackage = null;
	
	public NormalCodeGenerateServiceImpl(){
		init();
	} 
	
	private void init(){
		Map<String, String> confMap = GeneratorConf.getInstance().getAllConf();
		outputDir = confMap.get(IConstant.CODE_OUTPUT_DIR);
		daoPackage = confMap.get(IConstant.CODE_DAO_PACKAGE);
		daoSuperInterface = confMap.get(IConstant.CODE_DAO_SUPER_INTERFACE);
		daoSuperClass = confMap.get(IConstant.CODE_DAO_SUPER_CLASS);
		entityPackage = confMap.get(IConstant.CODE_ENTITY_PACKAGE);
		entitySuperClass = confMap.get(IConstant.CODE_ENTITY_SUPER);
		dtoPackage = confMap.get(IConstant.CODE_DTO_PACKAGE);
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
		
		conf.put("daoPackage", daoPackage);
		conf.put("daoSuperInterface", daoSuperInterface);
		conf.put("daoSuperClass", daoSuperClass);
		conf.put("entityPackage", entityPackage);
		conf.put("entitySuperClass", entitySuperClass);
		conf.put("dtoPackage", dtoPackage);
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
	
	public void generate(String[] tableNames, Map<String, String> params){
		TableMetaInfoDto tableMetaInfoDto = null;
		Map dataModel = null;
		for(String tableName : tableNames){
			tableMetaInfoDto = DatabaseMetaService.getInstance().getTableInfo(tableName);
			
			dataModel = new HashMap();
			dataModel.put("conf", conf);
			dataModel.put("tableMetaInfoDto", tableMetaInfoDto);
			
			if(StringUtils.isNotBlank(params.get(tableName + "GenerateEntity"))){
				generateEntity(dataModel, tableMetaInfoDto);
			}
			
			if(StringUtils.isNotBlank(params.get(tableName + "GenerateDTO"))){
				generateDto(dataModel, tableMetaInfoDto);
			}
			
			if(StringUtils.isNotBlank(params.get(tableName + "GenerateDAO"))){
				generateDao(dataModel, tableMetaInfoDto);
			}
			
			if(StringUtils.isNotBlank(params.get(tableName + "GenerateService"))){
				generateService(dataModel, tableMetaInfoDto);
			}
			
			if(StringUtils.isNotBlank(params.get(tableName + "GenerateController"))){
				generateController(dataModel, tableMetaInfoDto);
			}
			
			if(StringUtils.isNotBlank(params.get(tableName + "GenerateRestAPIController"))){
				generateRestAPIController(dataModel, tableMetaInfoDto);
			}
			
		}
	}
	
	/**
	 * 生成实体类（entity）
	 * @param dataModel
	 * @param tableMetaInfoDto
	 */
	private void generateEntity(Map dataModel, TableMetaInfoDto tableMetaInfoDto){
		char[] ca = entityPackage.toCharArray();
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
		String fileName = dir  + "\\" + tableMetaInfoDto.getClsName() + ".java";
		ContentGenerator.getInstance().generate("/code/entity.ftl", dataModel, fileName);
	}

	/**
	 * 生成数据传输对象（DTO）
	 * @param dataModel
	 * @param tableMetaInfoDto
	 */
	private void generateDto(Map dataModel, TableMetaInfoDto tableMetaInfoDto){
		char[] ca = dtoPackage.toCharArray();
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
		String fileName = dir  + "\\" + tableMetaInfoDto.getClsName() + "Dto.java";
		ContentGenerator.getInstance().generate("/code/dto.ftl", dataModel, fileName);
	}
	
	/**
	 * 生成DAO接口和实现类，以及SQLMap文件
	 * @param dataModel
	 * @param tableMetaInfoDto
	 */
	private void generateDao(Map dataModel, TableMetaInfoDto tableMetaInfoDto){
		char[] ca = null;
		String dir = null;
		StringBuffer str = null;
		File f = null;
		String fileName = null;
		/****************************************
		 * 以下代码段是为了生成DAO接口
		 ****************************************/
		ca = daoPackage.toCharArray();
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
		fileName = dir  + "\\" + tableMetaInfoDto.getClsName() + "Dao.java";
		ContentGenerator.getInstance().generate("/code/dao.ftl", dataModel, fileName);
		
		/****************************************
		 * 以下代码段是为了生成DAO实现类  以及对应的SQLMapper文件
		 ****************************************/
		dir = dir + "\\impl";
		f = new File(dir);
		if(!f.exists()){
			f.mkdirs();
		}
		fileName = dir  + "\\" + tableMetaInfoDto.getClsName() + "DaoImpl.java";
		ContentGenerator.getInstance().generate("/code/daoImpl.ftl", dataModel, fileName);
		
		fileName = dir  + "\\" + tableMetaInfoDto.getClsName() + "Mapper.xml";
		ContentGenerator.getInstance().generate("/code/sqlMap.ftl", dataModel, fileName);
	}
	
	/**
	 * 基于数据库表生成基本的对数据表进行增、删、改、查的Service接口和实现类
	 * @param dataModel
	 * @param tableMetaInfoDto
	 */
	private void generateService(Map dataModel, TableMetaInfoDto tableMetaInfoDto){
		char[] ca = null;
		String dir = null;
		StringBuffer str = null;
		File f = null;
		String fileName = null;
		/****************************************
		 * 以下代码段是为了生成Service接口
		 ****************************************/
		ca = servicePackage.toCharArray();
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
		fileName = dir  + "\\" + tableMetaInfoDto.getClsName() + "Service.java";
		ContentGenerator.getInstance().generate("/code/service.ftl", dataModel, fileName);
		
		/****************************************
		 * 以下代码段是为了生成Service实现类
		 ****************************************/
		dir = dir + "\\impl";
		f = new File(dir);
		if(!f.exists()){
			f.mkdirs();
		}
		fileName = dir  + "\\" + tableMetaInfoDto.getClsName() + "ServiceImpl.java";
		ContentGenerator.getInstance().generate("/code/serviceImpl.ftl", dataModel, fileName);
	}
	
	/**
	 * 基于数据库表生成基本的对数据表进行增、删、改、查的controller
	 * @param dataModel
	 * @param tableMetaInfoDto
	 */
	private void generateController(Map dataModel, TableMetaInfoDto tableMetaInfoDto){
		char[] ca = null;
		String dir = null;
		StringBuffer str = null;
		File f = null;
		String fileName = null;
		ca = controllerPackage.toCharArray();
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
		fileName = dir  + "\\" + tableMetaInfoDto.getClsName() + "Controller.java";
		ContentGenerator.getInstance().generate("/code/controller.ftl", dataModel, fileName);
	}
	
	/**
	 * 基于数据库表生成基本的对数据表进行增、删、改、查的RESTful api controller
	 * @param dataModel
	 * @param tableMetaInfoDto
	 */
	private void generateRestAPIController(Map dataModel, TableMetaInfoDto tableMetaInfoDto){
		char[] ca = null;
		String dir = null;
		StringBuffer str = null;
		File f = null;
		String fileName = null;
		ca = restAPIControllerPackage.toCharArray();
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
		fileName = dir  + "\\" + tableMetaInfoDto.getClsName() + "APIController.java";
		ContentGenerator.getInstance().generate("/code/restAPIController.ftl", dataModel, fileName);
	}
	
}
