package ${conf.controllerPackage};

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ${conf.dtoPackage}.${tableMetaInfoDto.clsName}Dto;
import ${conf.servicePackage}.${tableMetaInfoDto.clsName}Service;
import ${conf.paginationList};

@Controller
@RequestMapping("/${tableMetaInfoDto.clsName?uncap_first}")
public class ${tableMetaInfoDto.clsName}Controller {
	
	private static final Logger log = LoggerFactory.getLogger(${tableMetaInfoDto.clsName}Controller.class);
	
	@Autowired
	private ${tableMetaInfoDto.clsName}Service ${tableMetaInfoDto.clsName?uncap_first}Service;
	
	/**
	 * 添加${tableMetaInfoDto.clsName}Dto初始化：由于WEB-INF下的jsp页面不能直接访问，所以通过该方法来跳转；
	 * @return
	 */
	@RequestMapping("/newInit")
	public ModelAndView newInit(){
		ModelAndView mv = new ModelAndView(); 
		mv.setViewName("这里填写视图名"); 
		return mv;
	}
	
	/**
	 * 保存${tableMetaInfoDto.clsName}Dto
	 * @param ${tableMetaInfoDto.clsName?uncap_first}Dto
	 * @return
	 */
	@RequestMapping("/insert")
	public ModelAndView insert(${tableMetaInfoDto.clsName}Dto ${tableMetaInfoDto.clsName?uncap_first}Dto){
		ModelAndView mv = new ModelAndView(); 
		try{
			${tableMetaInfoDto.clsName?uncap_first}Service.insert(${tableMetaInfoDto.clsName?uncap_first}Dto);
			mv.addObject("msg", "保存成功！");
			mv.setViewName("这里填写视图名");
		}catch(Exception e){
			mv.setViewName("这里填写视图名");
			mv.addObject("msg", "保存失败！");
			log.error("这里填写错误信息。。。。param:{}\n\t{}", ${tableMetaInfoDto.clsName?uncap_first}Dto, e);
		}
		return mv;
	}
	
	/**
	 * 根据主键ID删除${tableMetaInfoDto.clsName}Dto
	 * @param ${tableMetaInfoDto.primaryPropertieName}
	 * @return
	 */
	@RequestMapping("/deleteById")
	public ModelAndView deleteById(@RequestParam(required=true)${tableMetaInfoDto.primaryFieldJavaTypeName} ${tableMetaInfoDto.primaryPropertieName}){
		ModelAndView mv = new ModelAndView(); 
		try{
			${tableMetaInfoDto.clsName?uncap_first}Service.deleteById(${tableMetaInfoDto.primaryPropertieName});
			mv.addObject("msg", "删除成功！");
		}catch(Exception e){
			mv.addObject("msg", "删除失败！");
			log.error("这里填写错误信息。。。。${tableMetaInfoDto.primaryPropertieName}:{}\n\t{}", ${tableMetaInfoDto.primaryPropertieName}, e);
		}
		mv.setViewName("这里填写视图名");
		return mv;
	}
	
	/**
	 * 修改${tableMetaInfoDto.clsName}Dto
	 * @param ${tableMetaInfoDto.clsName?uncap_first}Dto
	 * @return
	 */
	@RequestMapping("/update")
	public ModelAndView update(${tableMetaInfoDto.clsName}Dto ${tableMetaInfoDto.clsName?uncap_first}Dto){
		ModelAndView mv = new ModelAndView(); 
		try{
			${tableMetaInfoDto.clsName?uncap_first}Service.update(${tableMetaInfoDto.clsName?uncap_first}Dto);
			mv.addObject("${tableMetaInfoDto.clsName?uncap_first}Dto", ${tableMetaInfoDto.clsName?uncap_first}Dto);
			mv.addObject("msg", "修改成功！");
			mv.setViewName("这里填写视图名");
		}catch(Exception e){
			mv.addObject("msg", "修改失败！");
			log.error("这里填写错误信息。。。。param:{}\n\t{}", ${tableMetaInfoDto.clsName?uncap_first}Dto, e);
			mv.setViewName("这里填写视图名");
		}
		return mv;
	}
	
	/**
	 * 根据主键ID查询${tableMetaInfoDto.clsName}Dto
	 * @param ${tableMetaInfoDto.primaryPropertieName}
	 * @return
	 */
	@RequestMapping("/queryById")
	public ModelAndView queryById(@RequestParam(required=true)${tableMetaInfoDto.primaryFieldJavaTypeName} ${tableMetaInfoDto.primaryPropertieName}){
		ModelAndView mv = new ModelAndView(); 
		try{
			${tableMetaInfoDto.clsName}Dto ${tableMetaInfoDto.clsName?uncap_first}Dto = ${tableMetaInfoDto.clsName?uncap_first}Service.queryById(${tableMetaInfoDto.primaryPropertieName});
			mv.addObject("${tableMetaInfoDto.clsName?uncap_first}Dto", ${tableMetaInfoDto.clsName?uncap_first}Dto);
			mv.setViewName("这里填写视图名");
		}catch(Exception e){
			log.error("这里填写错误信息。。。。${tableMetaInfoDto.primaryPropertieName}:{}\n\t{}", ${tableMetaInfoDto.primaryPropertieName}, e);
			mv.setViewName("这里填写视图名");
		}
		return mv;
	}
	
	/**
	 * 根据查询条件分页查询${tableMetaInfoDto.clsName}Dto
	 * @param ${tableMetaInfoDto.clsName?uncap_first}Dto		查询参数对象
	 * @param pageNum		页号：表示查询第几页的数据，页号从1开始计数
	 * @param pageSize		页大小：即每页返回的记录数
	 * @return
	 */
	@RequestMapping("/queryList")
	public ModelAndView queryList(${tableMetaInfoDto.clsName}Dto ${tableMetaInfoDto.clsName?uncap_first}Dto, 
			@RequestParam(defaultValue="1") Integer pageNum, 
			@RequestParam(defaultValue="20") Integer pageSize){
		ModelAndView mv = new ModelAndView(); 
		try{
			PaginationList<${tableMetaInfoDto.clsName}Dto>  pageList = ${tableMetaInfoDto.clsName?uncap_first}Service.queryByExampleForPage(${tableMetaInfoDto.clsName?uncap_first}Dto, pageNum, pageSize);
			mv.addObject("pageList", pageList);
		}catch(Exception e){
			log.error("这里填写错误信息。。。。${tableMetaInfoDto.clsName?uncap_first}Dto:{};pageNum:{};pageSize:{}\n\t{}", ${tableMetaInfoDto.clsName?uncap_first}Dto, pageNum, pageSize, e);
		}
		mv.setViewName("这里填写视图名");
		return mv;
	}
	
}
