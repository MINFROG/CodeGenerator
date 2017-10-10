package org.md100.framework.generator.web;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.md100.framework.generator.dto.IConstant;
import org.md100.framework.generator.dto.TableMetaInfoDto;
import org.md100.framework.generator.service.CodeGenerateServiceFactory;
import org.md100.framework.generator.service.ContentGenerator;
import org.md100.framework.generator.service.DatabaseMetaService;
import org.md100.framework.generator.service.GeneratorConf;
import org.md100.framework.generator.service.impl.NormalCodeGenerateServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 代码生成器的WEB入口
 * @author jack_wu
 *
 */
public class PortalServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	
	private static final Logger log = LoggerFactory.getLogger(PortalServlet.class);

	private static final String encoding = "utf-8";
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding(encoding);
		String requestURI = req.getRequestURI();
		String queryString = req.getQueryString();
		log.info("requestUrl:{}; queryString:{}", new Object[]{requestURI, queryString});
		String html = null;
		try{
			String[] urlStrArray = requestURI.split("/");
			String method = "index";
			if(urlStrArray.length > 2){
				method = urlStrArray[2];
			}
			if("dbSetting".equals(method)){
				html = doDBSetting(req, resp);
			}else if("codeGeneratorSetting".equals(method)){
				html = doCodeGeneratorSetting(req, resp);
			}else if("queryTables".equals(method)){
				html = queryTables(req, resp);
			}else if("generate".equals(method)){
				html = generate(req, resp);
			}else{
				Map data = new HashMap();
				html = showPage(req, resp, data);
			}
			
		}catch(Throwable e){
			log.error("服务出错！", e);
		}
		resp.setCharacterEncoding(encoding);
		resp.setContentType("text/html");
		resp.setHeader("Cache-Control","no-cache"); 
		resp.setDateHeader("Expires", -10); 
		resp.getWriter().write(html);
		resp.getWriter().flush();
	}
	
	private String doDBSetting(HttpServletRequest req, HttpServletResponse resp){
		Map data = new HashMap();
		try{
			Map<String, String> tempConfMap = new HashMap();
			if(StringUtils.isNotBlank(req.getParameter(IConstant.JDBC_DRIVERCLASSNAME))){
				tempConfMap.put(IConstant.JDBC_DRIVERCLASSNAME, trimString(req.getParameter(IConstant.JDBC_DRIVERCLASSNAME)));
			}
			if(StringUtils.isNotBlank(req.getParameter(IConstant.JDBC_URL))){
				tempConfMap.put(IConstant.JDBC_URL, 			trimString(req.getParameter(IConstant.JDBC_URL)));
			}
			if(StringUtils.isNotBlank(req.getParameter(IConstant.JDBC_USERNAME))){
				tempConfMap.put(IConstant.JDBC_USERNAME, 		trimString(req.getParameter(IConstant.JDBC_USERNAME)));
			}
			if(StringUtils.isNotBlank(req.getParameter(IConstant.JDBC_PASSWORD))){
				tempConfMap.put(IConstant.JDBC_PASSWORD, 		trimString(req.getParameter(IConstant.JDBC_PASSWORD)));
			}
			GeneratorConf.getInstance().putConf(tempConfMap);
			return showPage(req, resp, data);
		}catch(Exception e){
			log.error("设置数据库配置项出错！", e);
		}
		return "";
	}
	
	private String doCodeGeneratorSetting(HttpServletRequest req, HttpServletResponse resp){
		Map data = new HashMap();
		try{
			Map<String, String> tempConfMap = new HashMap();
			if(req.getParameter(IConstant.CODE_AUTHOR) != null){
				tempConfMap.put(IConstant.CODE_AUTHOR, 			trimString(req.getParameter(IConstant.CODE_AUTHOR)));
			}
			if(req.getParameter(IConstant.CODE_OUTPUT_DIR) != null){
				tempConfMap.put(IConstant.CODE_OUTPUT_DIR, 			trimString(req.getParameter(IConstant.CODE_OUTPUT_DIR)));
			}
			if(req.getParameter(IConstant.CODE_DAO_PACKAGE) != null){
				tempConfMap.put(IConstant.CODE_DAO_PACKAGE, 		trimString(req.getParameter(IConstant.CODE_DAO_PACKAGE)));
			}
			if(req.getParameter(IConstant.CODE_DAO_SUPER_INTERFACE) != null){
				tempConfMap.put(IConstant.CODE_DAO_SUPER_INTERFACE, trimString(req.getParameter(IConstant.CODE_DAO_SUPER_INTERFACE)));
			}
			if(req.getParameter(IConstant.CODE_DAO_SUPER_CLASS) != null){
				tempConfMap.put(IConstant.CODE_DAO_SUPER_CLASS, 	trimString(req.getParameter(IConstant.CODE_DAO_SUPER_CLASS)));
			}
			if(req.getParameter(IConstant.CODE_ENTITY_PACKAGE) != null){
				tempConfMap.put(IConstant.CODE_ENTITY_PACKAGE, 		trimString(req.getParameter(IConstant.CODE_ENTITY_PACKAGE)));
			}
			if(req.getParameter(IConstant.CODE_ENTITY_SUPER) != null){
				tempConfMap.put(IConstant.CODE_ENTITY_SUPER, 		trimString(req.getParameter(IConstant.CODE_ENTITY_SUPER)));
			}
			if(req.getParameter(IConstant.CODE_DTO_PACKAGE) != null){
				tempConfMap.put(IConstant.CODE_DTO_PACKAGE, 		trimString(req.getParameter(IConstant.CODE_DTO_PACKAGE)));
			}
			if(req.getParameter(IConstant.CODE_BO_PACKAGE) != null){
				tempConfMap.put(IConstant.CODE_BO_PACKAGE, 	trimString(req.getParameter(IConstant.CODE_BO_PACKAGE)));
			}
			if(req.getParameter(IConstant.CODE_SERVICE_PACKAGE) != null){
				tempConfMap.put(IConstant.CODE_SERVICE_PACKAGE, 	trimString(req.getParameter(IConstant.CODE_SERVICE_PACKAGE)));
			}
			if(req.getParameter(IConstant.CODE_PAGINATIONLIST) != null){
				tempConfMap.put(IConstant.CODE_PAGINATIONLIST, 	trimString(req.getParameter(IConstant.CODE_PAGINATIONLIST)));
			}
			if(req.getParameter(IConstant.CODE_SERVICE_EXCEPTION) != null){
				tempConfMap.put(IConstant.CODE_SERVICE_EXCEPTION, 	trimString(req.getParameter(IConstant.CODE_SERVICE_EXCEPTION)));
			}
			if(req.getParameter(IConstant.CODE_CONTROLLER_PACKAGE) != null){
				tempConfMap.put(IConstant.CODE_CONTROLLER_PACKAGE, 	trimString(req.getParameter(IConstant.CODE_CONTROLLER_PACKAGE)));
			}
			if(req.getParameter(IConstant.CODE_REST_API_CONTROLLER_PACKAGE) != null){
				tempConfMap.put(IConstant.CODE_REST_API_CONTROLLER_PACKAGE, trimString(req.getParameter(IConstant.CODE_REST_API_CONTROLLER_PACKAGE)));
			}
			
			GeneratorConf.getInstance().putConf(tempConfMap);
			return showPage(req, resp, data);
		}catch(Exception e){
			log.error("设置代码生成配置项出错！", e);
		}
		return "";
	}
	
	private String queryTables(HttpServletRequest req, HttpServletResponse resp){
		Map data = new HashMap();
		try{
			if(DatabaseMetaService.getInstance().getCon() == null){
				resp.sendRedirect("/generator/dbSetting?method=dbSetting");
				return null;
			}
			List<String>  list = DatabaseMetaService.getInstance().queryTables();
			data.put("tables", list);
			return showPage(req, resp, data);
		}catch(Exception e){
			log.error("设置代码生成配置项出错！", e);
		}
		return "";
	}
	
	private String generate(HttpServletRequest req, HttpServletResponse resp){
		Map data = new HashMap();
		try{
			String[] tableNames = req.getParameterValues("tableName");
			Map<String, String> params = fetchParam(req);
			CodeGenerateServiceFactory.getCodeGenerateService().generate(tableNames, params);
			List<String>  list = DatabaseMetaService.getInstance().queryTables();
			data.put("tables", list);
			return showPage(req, resp, data);
		}catch(Exception e){
			log.error("代码生成出错！", e);
		}
		return "";
	}
	
	private String showPage(HttpServletRequest req, HttpServletResponse resp, Map data){
		try{
			if(data == null){
				data = new HashMap();
			}
			data.put("params", fetchParam(req));
			data.put("conf", GeneratorConf.getInstance().getAllConf());
			return ContentGenerator.getInstance().generate(IConstant.TEMPLATE_VIEW_INDEX, data);
		}catch(Exception e){
			log.error("显示控制台首页出错！", e);
		}
		return "显示控制台首页出错！";
	}
	
	private String trimString(String s){
		if(s == null){
			return "";
		}else{
			return s.trim();
		}
	}
	
	private Map<String, String> fetchParam(HttpServletRequest request){
		Map<String, String> paramsMap = new HashMap();
		Enumeration parameterNamesEnum = request.getParameterNames();
		String parameterName;
		String value = null;
		while (parameterNamesEnum.hasMoreElements()) {
			parameterName = (String) parameterNamesEnum.nextElement();
				value = (String)request.getParameter(parameterName);
				paramsMap.put(parameterName, value);
		}
		return paramsMap;
	}
}
