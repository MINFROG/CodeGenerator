<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">

<mapper namespace="${conf.daoPackage}.impl.${tableMetaInfoDto.clsName}DaoImpl">

	<insert id="generator_insert" parameterType="${tableMetaInfoDto.clsName}">
		INSERT INTO ${tableMetaInfoDto.tableName}(<#list tableMetaInfoDto.fields as field>${field.fieldName}<#if field_has_next>, </#if></#list>) 
		VALUES(<#list tableMetaInfoDto.fields as field>#${"{"}${field.propertieName}}<#if field_has_next>, </#if></#list>)
	</insert>

<#list tableMetaInfoDto.fields as field><#if field.primary>
	<delete id="generator_deleteByPK" parameterType="${field.javaTypeName}">
		DELETE FROM ${tableMetaInfoDto.tableName} WHERE ${field.fieldName} = #${"{"}${field.propertieName}}
	</delete>
</#if></#list>

	<delete id="generator_deleteByExample" parameterType="${tableMetaInfoDto.clsName}">
		DELETE FROM ${tableMetaInfoDto.tableName} WHERE
		<trim prefixOverrides="AND">
		<#list tableMetaInfoDto.fields as field><#if field.index>
			<if test="${field.propertieName} != null"> AND ${field.fieldName} = #${"{"}${field.propertieName}}</if>
		</#if></#list>
		<#list tableMetaInfoDto.fields as field><#if field.index==false>
			<if test="${field.propertieName} != null"> AND ${field.fieldName} = #${"{"}${field.propertieName}}</if>
		</#if></#list>
		</trim>
	</delete>
  
<#list tableMetaInfoDto.fields as field><#if field.primary>
	<update id="generator_updateByPK" parameterType="${tableMetaInfoDto.clsName}">
		UPDATE ${tableMetaInfoDto.tableName}
		<set>
		<#list tableMetaInfoDto.fields as field2><#if field2.primary==false>
			<if test="${field2.propertieName} != null"> ${field2.fieldName} = #${"{"}${field2.propertieName}}<#if field2_has_next>, </#if></if>
		</#if></#list>
		</set>
		 WHERE ${field.fieldName} = #${"{"}${field.propertieName}}
	</update>
</#if></#list>

<#list tableMetaInfoDto.fields as field><#if field.primary>
	<select id="generator_findByPK" parameterType="${field.javaTypeName}" resultType="${tableMetaInfoDto.clsName}">
		SELECT <#list tableMetaInfoDto.fields as field>${field.fieldName} ${field.propertieName}<#if field_has_next>, </#if></#list>
		FROM ${tableMetaInfoDto.tableName} WHERE ${field.fieldName} = #${"{"}${field.propertieName}}
	</select>
</#if></#list>

	<select id="generator_findByExample" resultType="${tableMetaInfoDto.clsName}">
		SELECT 
		<#list tableMetaInfoDto.fields as field> 
			${field.fieldName} ${field.propertieName}<#if field_has_next>, </#if>
		</#list>
		FROM ${tableMetaInfoDto.tableName}
		<where>
		<#list tableMetaInfoDto.fields as field><#if field.index>
			<if test="${field.propertieName} != null"> AND ${field.fieldName} = #${"{"}${field.propertieName}}</if>
		</#if></#list>
		<#list tableMetaInfoDto.fields as field><#if field.index==false>
			<if test="${field.propertieName} != null"> AND ${field.fieldName} = #${"{"}${field.propertieName}}</if>
		</#if></#list>
		</where> 
	</select>
</mapper>