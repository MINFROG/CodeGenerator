package org.md100.framework.generator.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.md100.framework.generator.dto.TableMetaInfoDto;
import org.md100.framework.generator.service.DatabaseMetaService;

/**
 * dubbo代码生成核心类
 * @author yhp
 *
 */
public class DubboCodeGenerateServiceImpl extends BaseCodeGenerateService{

	private static final String CODE_STYLE = "/dubboCode";
	/**
	 * 生成指定数据库表的相关代码
	 */
	public void generate(String[] tableNames, Map<String, String> params){
		init();
		TableMetaInfoDto tableMetaInfoDto = null;
		Map dataModel = null;
		for(String tableName : tableNames){
			tableMetaInfoDto = DatabaseMetaService.getInstance().getTableInfo(tableName);
			
			dataModel = new HashMap();
			dataModel.put("conf", conf);
			dataModel.put("tableMetaInfoDto", tableMetaInfoDto);
			
			if(StringUtils.isNotBlank(params.get(tableName + "GenerateEntity"))){
				generateObject(outputDir, entityPackage, ".java", CODE_STYLE +"/entity.ftl", dataModel, tableMetaInfoDto);
			}
			
			if(StringUtils.isNotBlank(params.get(tableName + "GenerateDTO"))){
				generateObject(outputDir, dtoPackage, "Dto.java", CODE_STYLE +"/dto.ftl", dataModel, tableMetaInfoDto);
			}
			
			if(StringUtils.isNotBlank(params.get(tableName + "GenerateDAO"))){
				generateII(outputDir, daoPackage, "Dao.java", CODE_STYLE +"/dao.ftl", "DaoImpl.java", CODE_STYLE +"/daoImpl.ftl", dataModel, tableMetaInfoDto);
				generateObject(outputDir, daoPackage+".impl", "Mapper.xml", CODE_STYLE +"/sqlMap.ftl", dataModel, tableMetaInfoDto);
			}
			
			if(StringUtils.isNotBlank(params.get(tableName + "GenerateBo"))){
				generateII(outputDir, boPackage, "Bo.java", CODE_STYLE +"/bo.ftl", "BoImpl.java", CODE_STYLE +"/boImpl.ftl", dataModel, tableMetaInfoDto);
			}
			
			if(StringUtils.isNotBlank(params.get(tableName + "GenerateService"))){
				generateII(outputDir, servicePackage, "Service.java", CODE_STYLE +"/service.ftl", "ServiceImpl.java", CODE_STYLE +"/serviceImpl.ftl", dataModel, tableMetaInfoDto);
			}
			
		}
	}
	
}
