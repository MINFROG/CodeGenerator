package org.md100.framework.generator.dto;

/**
 * 该类代表的意思为一个数据库表的字段元数据
 * @author jack_wu
 *
 */
public class FieldMetaInfoDto {
	
	private String fieldName = null;		//数据库字段名
	
	private String propertieName = null;	//数据库字段对应的JAVA对象的属性名
	
	private String jdbcTypeName = null;		//数据库字段的类型名称
	
	private String javaTypeName = null;		//JAVA类型名称
	
	private String proName = null;
	
	private boolean isIndex = false;		//字段是否为索引字段
	
	private boolean isPrimary = false;		//字段是否为主键

	public String getFieldName() {
		return fieldName;
	}

	public void setFieldName(String fieldName) {
		this.fieldName = fieldName;
	}

	public String getPropertieName() {
		return propertieName;
	}

	public void setPropertieName(String propertieName) {
		this.propertieName = propertieName;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getJavaTypeName() {
		return javaTypeName;
	}

	public void setJavaTypeName(String javaTypeName) {
		this.javaTypeName = javaTypeName;
	}

	public String getJdbcTypeName() {
		return jdbcTypeName;
	}

	public void setJdbcTypeName(String jdbcTypeName) {
		this.jdbcTypeName = jdbcTypeName;
	}

	public boolean isIndex() {
		return isIndex;
	}

	public void setIndex(boolean isIndex) {
		this.isIndex = isIndex;
	}

	public boolean isPrimary() {
		return isPrimary;
	}

	public void setPrimary(boolean isPrimary) {
		this.isPrimary = isPrimary;
	}
}
