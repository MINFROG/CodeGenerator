package ${conf.restAPIControllerPackage};

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ${conf.dtoPackage}.${tableMetaInfoDto.clsName}Dto;
import ${conf.servicePackage}.${tableMetaInfoDto.clsName}Service;
import ${conf.paginationList};

@Controller
@RequestMapping("/${tableMetaInfoDto.clsName?uncap_first}/api")
public class ${tableMetaInfoDto.clsName}APIController {
	
	private static final Logger log = LoggerFactory.getLogger(${tableMetaInfoDto.clsName}APIController.class);
	
	@Autowired
	private ${tableMetaInfoDto.clsName}Service ${tableMetaInfoDto.clsName?uncap_first}Service;
	
	/**
	 * 保存${tableMetaInfoDto.clsName}Dto
	 * @param ${tableMetaInfoDto.clsName?uncap_first}Dto
	 * @return
	 */
	@RequestMapping("/insert")
	@ResponseBody
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Object insert(${tableMetaInfoDto.clsName}Dto ${tableMetaInfoDto.clsName?uncap_first}Dto){
		Map data = new HashMap();
		try{
			${tableMetaInfoDto.clsName?uncap_first}Service.insert(${tableMetaInfoDto.clsName?uncap_first}Dto);
			data.put("status", "0");
			data.put("msg", "保存成功！");
		}catch(Exception e){
			data.put("status", "1");
			data.put("msg", "保存失败！");
			log.error("这里填写错误信息。。。。param:{}\n\t{}", ${tableMetaInfoDto.clsName?uncap_first}Dto, e);
		}
		return data;
	}
	
	/**
	 * 根据主键ID删除${tableMetaInfoDto.clsName}Dto
	 * @param ${tableMetaInfoDto.primaryPropertieName}
	 * @return
	 */
	@RequestMapping("/deleteById")
	@ResponseBody
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Object deleteById(@RequestParam(required=true)${tableMetaInfoDto.primaryFieldJavaTypeName} ${tableMetaInfoDto.primaryPropertieName}){
		Map data = new HashMap();
		try{
			${tableMetaInfoDto.clsName?uncap_first}Service.deleteById(${tableMetaInfoDto.primaryPropertieName});
			data.put("status", "0");
			data.put("msg", "删除成功！");
		}catch(Exception e){
			data.put("status", "1");
			data.put("msg", "删除失败！");
			log.error("这里填写错误信息。。。。${tableMetaInfoDto.primaryPropertieName}:{}\n\t{}", ${tableMetaInfoDto.primaryPropertieName}, e);
		}
		return data;
	}
	
	/**
	 * 修改${tableMetaInfoDto.clsName}Dto
	 * @param ${tableMetaInfoDto.clsName?uncap_first}Dto
	 * @return
	 */
	@RequestMapping("/update")
	@ResponseBody
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Object update(${tableMetaInfoDto.clsName}Dto ${tableMetaInfoDto.clsName?uncap_first}Dto){
		Map data = new HashMap();
		try{
			${tableMetaInfoDto.clsName?uncap_first}Service.update(${tableMetaInfoDto.clsName?uncap_first}Dto);
			data.put("${tableMetaInfoDto.clsName?uncap_first}Dto", ${tableMetaInfoDto.clsName?uncap_first}Dto);
			data.put("status", "0");
			data.put("msg", "修改成功！");
		}catch(Exception e){
			data.put("status", "1");
			data.put("msg", "修改失败！");
			log.error("这里填写错误信息。。。。param:{}\n\t{}", ${tableMetaInfoDto.clsName?uncap_first}Dto, e);
		}
		return data;
	}
	
	/**
	 * 根据主键ID查询${tableMetaInfoDto.clsName}Dto
	 * @param ${tableMetaInfoDto.primaryPropertieName}
	 * @return
	 */
	@RequestMapping("/queryById")
	@ResponseBody
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Object queryById(@RequestParam(required=true)${tableMetaInfoDto.primaryFieldJavaTypeName} ${tableMetaInfoDto.primaryPropertieName}){
		Map data = new HashMap();
		try{
			${tableMetaInfoDto.clsName}Dto ${tableMetaInfoDto.clsName?uncap_first}Dto = ${tableMetaInfoDto.clsName?uncap_first}Service.queryById(${tableMetaInfoDto.primaryPropertieName});
			if(${tableMetaInfoDto.clsName?uncap_first}Dto == null){
				data.put("status", "2");
				data.put("msg", "查询失败:找不到对应的数据！");
			}else{
				data.put("${tableMetaInfoDto.clsName?uncap_first}Dto", dataWrapper(${tableMetaInfoDto.clsName?uncap_first}Dto));
				data.put("status", "0");
				data.put("msg", "查询成功！");
			}
		}catch(Exception e){
			data.put("status", "1");
			data.put("msg", "查询失败！");
			log.error("这里填写错误信息。。。。${tableMetaInfoDto.primaryPropertieName}:{}\n\t{}", ${tableMetaInfoDto.primaryPropertieName}, e);
		}
		return data;
	}
	
	/**
	 * 根据查询条件分页查询${tableMetaInfoDto.clsName}Dto
	 * @param ${tableMetaInfoDto.clsName?uncap_first}Dto		查询参数对象
	 * @param pageNum		页号：表示查询第几页的数据，页号从1开始计数
	 * @param pageSize		页大小：即每页返回的记录数
	 * @return
	 */
	@RequestMapping("/queryList")
	@ResponseBody
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Object queryList(${tableMetaInfoDto.clsName}Dto ${tableMetaInfoDto.clsName?uncap_first}Dto, 
			@RequestParam(defaultValue="1") Integer pageNum, 
			@RequestParam(defaultValue="20") Integer pageSize){
		Map data = new HashMap();
		try{
			PaginationList<${tableMetaInfoDto.clsName}Dto>  pageList = ${tableMetaInfoDto.clsName?uncap_first}Service.queryByExampleForPage(${tableMetaInfoDto.clsName?uncap_first}Dto, pageNum, pageSize);
			data.put("totalRecords", pageList == null ? 0 : pageList.getTotalRecords());
			data.put("totalPages", pageList == null ? 0 : pageList.getTotalPages());
			data.put("data", dataListWrapper(pageList));
			data.put("status", "0");
			data.put("msg", "查询成功！");
		}catch(Exception e){
			data.put("status", "1");
			data.put("msg", "查询失败！");
			log.error("这里填写错误信息。。。。${tableMetaInfoDto.clsName?uncap_first}Dto:{};pageNum:{};pageSize:{}\n\t{}", ${tableMetaInfoDto.clsName?uncap_first}Dto, pageNum, pageSize, e);
		}
		return data;
	}
	
	/**
	 * 通常JSON接口不需要返回全部的数据，所以通过该方法将DTO中需要返回属性复制到Map中，最终返回的是经过筛选后的Map中的数据
	 * @param ${tableMetaInfoDto.clsName?uncap_first}Dto
	 * @return
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private Map dataWrapper(${tableMetaInfoDto.clsName}Dto ${tableMetaInfoDto.clsName?uncap_first}Dto){
		if(${tableMetaInfoDto.clsName?uncap_first}Dto == null){
			return null;
		}
		Map dataMap = new HashMap();
		
		<#if tableMetaInfoDto.fields?exists>
		<#list tableMetaInfoDto.fields as field>
		dataMap.put("${field.propertieName}", ${tableMetaInfoDto.clsName?uncap_first}Dto.get${field.proName}());
		</#list>
		</#if>
		
		return dataMap;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private List<Map> dataListWrapper(List<${tableMetaInfoDto.clsName}Dto> ${tableMetaInfoDto.clsName?uncap_first}DtoList){
		if(${tableMetaInfoDto.clsName?uncap_first}DtoList == null){
			return null;
		}
		List<Map> tmpList = new ArrayList();
		for(${tableMetaInfoDto.clsName}Dto ${tableMetaInfoDto.clsName?uncap_first}Dto: ${tableMetaInfoDto.clsName?uncap_first}DtoList){
			tmpList.add(dataWrapper(${tableMetaInfoDto.clsName?uncap_first}Dto));
		}
		return tmpList;
	}
}
