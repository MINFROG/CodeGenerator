package org.md100.framework.generator.dto;

import java.util.List;

/**
 * 该类代表的意思为一个数据库表的元数据对象
 * @author jack_wu
 *
 */
public class TableMetaInfoDto {

	private String tableName;	//数据库表名称
	
	private String clsName;		//数据库表对应的JAVA实体名称名称
	
	private List<FieldMetaInfoDto> fields;	//数据库表下面的所有字段
	
	private String primaryFieldName;
	
	private String primaryPropertieName = null;	//数据库字段对应的JAVA对象的属性名
	
	private String primaryFieldJavaTypeName;

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

	public String getClsName() {
		return clsName;
	}

	public void setClsName(String clsName) {
		this.clsName = clsName;
	}

	public List<FieldMetaInfoDto> getFields() {
		return fields;
	}

	public void setFields(List<FieldMetaInfoDto> fields) {
		this.fields = fields;
	}

	public String getPrimaryFieldName() {
		return primaryFieldName;
	}

	public void setPrimaryFieldName(String primaryFieldName) {
		this.primaryFieldName = primaryFieldName;
	}

	public String getPrimaryFieldJavaTypeName() {
		return primaryFieldJavaTypeName;
	}

	public void setPrimaryFieldJavaTypeName(String primaryFieldJavaTypeName) {
		this.primaryFieldJavaTypeName = primaryFieldJavaTypeName;
	}

	public String getPrimaryPropertieName() {
		return primaryPropertieName;
	}

	public void setPrimaryPropertieName(String primaryPropertieName) {
		this.primaryPropertieName = primaryPropertieName;
	}
	
}
