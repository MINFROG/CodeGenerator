package ${conf.entityPackage};

import java.util.Date;
import java.io.Serializable;
<#if conf.entitySuperClass?exists && (conf.entitySuperClass?length>0)> import ${conf.entitySuperClass};</#if>

/**
 * 实体类：对应数据库${tableMetaInfoDto.tableName}表
 * 
 * @author jack_wu
 * @version 1.0
 * @since ${conf.commentSince}
 *
 */
public class ${tableMetaInfoDto.clsName} <#if conf.entitySuperClassSimpleName?exists && (conf.entitySuperClassSimpleName?length>0)> extends ${conf.entitySuperClassSimpleName} </#if> implements Serializable {

	private static final long serialVersionUID = 1L;

	<#if tableMetaInfoDto.fields?exists>
	<#list tableMetaInfoDto.fields as field>
	private ${field.javaTypeName} ${field.propertieName};		//${tableMetaInfoDto.tableName}.${field.fieldName}
	</#list>
	</#if>

	<#if tableMetaInfoDto.fields?exists>
	<#list tableMetaInfoDto.fields as field>

	public ${field.javaTypeName} get${field.proName}() {
		return this.${field.propertieName};
	}

	public void set${field.proName}(${field.javaTypeName} ${field.propertieName}) {
		this.${field.propertieName} = ${field.propertieName};
	}
	</#list>
	</#if>
	
	@Override
	public String toString() {
		StringBuffer str = new StringBuffer();
	<#if tableMetaInfoDto.fields?exists>
	<#list tableMetaInfoDto.fields as field>
		str.append("${field.propertieName}:").append(${field.propertieName}).append(";");
	</#list>
	</#if>
		return str.toString();
	}
}