package org.md100.framework.generator.service;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;

/**
 * 内容生成类：根据数据和模板文件生成内容（即代码）
 * @author yhp
 *
 */
public class ContentGenerator {

	private static final Logger log = LoggerFactory.getLogger(ContentGenerator.class);
	
	private static final String encoding = "utf-8";
	
	private static ContentGenerator instance = new ContentGenerator();
	
	private Configuration cfg = null; 
	
	private ContentGenerator(){
		init();
	}
	
	private void init(){
		try {
			cfg = new Configuration();
			cfg.setDefaultEncoding(encoding);
			cfg.setClassForTemplateLoading(ContentGenerator.class, "/template");
			cfg.setObjectWrapper(new DefaultObjectWrapper());
		} catch (Exception e) {
			log.error("加载模板失败！", e);
		}
	}
	
	public static ContentGenerator getInstance(){return instance;}
	
	/**
	 * 根据模板（templateName）和数据（dataModel）生成内容并返回
	 * @param templateName
	 * @param dataModel
	 * @return
	 */
	public String generate(String templateName, Map dataModel){
		String content = null;
		StringWriter writer = null;
		try {
			Template template = cfg.getTemplate(templateName);
			writer = new StringWriter();
			template.process(dataModel, writer);
			return writer.toString();
		} catch (Exception e) {
			log.error("生成失败！templateName：{}；\ndataModel：{}; {}", templateName, dataModel, e);
		}finally{
			if(writer != null){
				try {
					writer.close();
					writer = null;
				} catch (IOException e) {
					log.error("writer.close() error!", e); 
				}
			}
		}
		return content;
	}
	
	/**
	 * 根据模板（templateName）和数据（dataModel）生成指定文件（fileName）
	 * @param templateName
	 * @param fileName
	 * @param dataModel
	 * @return
	 */
	public String generate(String templateName, Map dataModel, String fileName){
		String content = null;
		BufferedWriter writer = null; 
		try {
			Template template = cfg.getTemplate(templateName);
			File f = new File(fileName);
			if(f.exists()){
				f.delete();
			}
			writer = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(f), encoding));
			template.process(dataModel, writer);
	        writer.close();
		} catch (Exception e) {
			log.error("生成失败！templateName：{}；fileName：{}；\ndataModel：{}", templateName, fileName, dataModel, e);
		}finally{
			if(writer != null){
				try {
					writer.close();
					writer = null;
				} catch (IOException e) {
					log.error("writer.close() error!", e); 
				}
			}
		}
		return content;
	}
	
}
