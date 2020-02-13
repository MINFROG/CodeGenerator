package org.md100.framework.generator.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.md100.framework.generator.dto.FieldMetaInfoDto;
import org.md100.framework.generator.dto.IConstant;
import org.md100.framework.generator.dto.TableMetaInfoDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 元数据读取：读取数据库表、字段的元数据，用以代码生成
 * @author yhp
 *
 */
public class DatabaseMetaService {
	
	private static final Logger log = LoggerFactory.getLogger(DatabaseMetaService.class);
	
	private static final DatabaseMetaService instance = new DatabaseMetaService();
	
	private DatabaseMetaService(){}	
	
	public static DatabaseMetaService getInstance(){return instance;}
	
	public Connection getCon(){
		try {
			String driverClassName = GeneratorConf.getInstance().getConf(IConstant.JDBC_DRIVERCLASSNAME); 
			String jdbcURL = GeneratorConf.getInstance().getConf(IConstant.JDBC_URL); 
			String userName = GeneratorConf.getInstance().getConf(IConstant.JDBC_USERNAME); 
			String password = GeneratorConf.getInstance().getConf(IConstant.JDBC_PASSWORD); 
			Class.forName(driverClassName);   
			return DriverManager.getConnection(jdbcURL, userName, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public List<String> queryTables(){
		List<String> tableList = new ArrayList();
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet resultSet = null;
		String sql = "SHOW TABLES";
		try {
			connection = getCon();
			ps = connection.prepareStatement(sql);
			ps.execute();
			resultSet = ps.getResultSet();
			while(resultSet.next()){
				tableList.add(resultSet.getString(1));
			}
		} catch (SQLException e){
			e.printStackTrace();
		}finally{
			if(resultSet != null){
				try {
					resultSet.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				resultSet = null;
			}
			if(ps != null){
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				ps = null;
			}
			if(connection != null){
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				connection = null;
			}
		}
		return tableList;
	}
		
	public TableMetaInfoDto getTableInfo(String tableName){
		TableMetaInfoDto tableInfo = new TableMetaInfoDto();
		tableInfo.setTableName(tableName);
		String clsName = getPropertieName(tableName);
		tableInfo.setClsName(Character.toUpperCase(clsName.charAt(0)) + clsName.substring(1, clsName.length()));
		tableInfo.setFields(getFiledMetaData(tableName));
		for(FieldMetaInfoDto f : tableInfo.getFields()){
			if(f.isPrimary()){
				tableInfo.setPrimaryFieldName(f.getFieldName());
				tableInfo.setPrimaryPropertieName(f.getPropertieName());
				tableInfo.setPrimaryFieldJavaTypeName(f.getJavaTypeName());
			}
		}
		return tableInfo;
	}
	
	private List<FieldMetaInfoDto> getFiledMetaData(String tableName){
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet resultSet = null;
		String sql = "select * from " + tableName + " limit 1";
		List<FieldMetaInfoDto> metaDataList = new ArrayList();
		try {
			Map<String, String> indexInfoMap = queryIndexInfo(tableName);
			connection = getCon();
			ps = connection.prepareStatement(sql);
			ps.execute();
			ResultSetMetaData metaData = ps.getMetaData();
			int size = metaData.getColumnCount();
			String fieldName = null;
			String propertieName = null;
			String columnClassName;
			String columnTypeName;
			String tmpStr = null;
			FieldMetaInfoDto fieldInfoDto;
			List<FieldMetaInfoDto> tmpMetaDataList = new ArrayList();
			for(int i=0; i<size; i++){
				fieldInfoDto = new FieldMetaInfoDto();
				fieldName = metaData.getColumnName(i+1);
				propertieName = getPropertieName(fieldName);
				fieldInfoDto.setFieldName(fieldName);
				fieldInfoDto.setPropertieName(propertieName);
				propertieName = Character.toUpperCase(propertieName.charAt(0)) + propertieName.substring(1, propertieName.length());
				fieldInfoDto.setProName(propertieName);
				
				columnClassName = metaData.getColumnClassName(i+1);
				columnTypeName = metaData.getColumnTypeName(i+1);
				int cType = metaData.getColumnType(i+1);
				switch(cType){
					case java.sql.Types.TINYINT:
					case java.sql.Types.BIT:
						columnClassName = "java.lang.Integer";
						break;
					case java.sql.Types.BOOLEAN:
						columnClassName = "java.lang.Boolean";
						break;
					case java.sql.Types.INTEGER:
					case java.sql.Types.SMALLINT:
						columnClassName = "java.lang.Integer";
						break;
					case java.sql.Types.BIGINT:
						columnClassName = "java.lang.Long";
						break;
					case java.sql.Types.DECIMAL:
					case java.sql.Types.DOUBLE:
						columnClassName = "java.lang.Double";
						break;
					case java.sql.Types.FLOAT:
						columnClassName = "java.lang.Float";
						break;
					case java.sql.Types.DATE:
					case java.sql.Types.TIMESTAMP:
					case java.sql.Types.TIME:
						columnClassName = "java.util.Date";
						break;
					case java.sql.Types.CLOB:
					case java.sql.Types.CHAR:
					case java.sql.Types.LONGNVARCHAR:
					case java.sql.Types.LONGVARCHAR:
					case java.sql.Types.NCHAR:
					case java.sql.Types.NCLOB:
					case java.sql.Types.NVARCHAR:
					case java.sql.Types.VARCHAR:
						columnClassName = "java.lang.String";
						break;
					case java.sql.Types.BLOB:
					case java.sql.Types.VARBINARY:
					case java.sql.Types.LONGVARBINARY:
						columnClassName = "byte[]";
						break;
				}
				fieldInfoDto.setJdbcTypeName(columnTypeName);
				fieldInfoDto.setJavaTypeName(columnClassName.substring(columnClassName.lastIndexOf('.') + 1, columnClassName.length()));
				log.info(ToStringBuilder.reflectionToString(fieldInfoDto));
				
				tmpStr = indexInfoMap.get(fieldName);
				if("PRIMARY".equals(tmpStr)){
					fieldInfoDto.setPrimary(true);
					fieldInfoDto.setIndex(true);
					metaDataList.add(fieldInfoDto);
				}else if(StringUtils.isNotBlank(tmpStr)){
					fieldInfoDto.setIndex(true);
					metaDataList.add(fieldInfoDto);
				}else{
					tmpMetaDataList.add(fieldInfoDto);
				}
			}
			metaDataList.addAll(tmpMetaDataList);
		} catch (SQLException e){
			log.error("读取表字段的元数据出错！", e);
		}finally{
			if(resultSet != null){
				try {
					resultSet.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				resultSet = null;
			}
			if(ps != null){
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				ps = null;
			}
			if(connection != null){
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				connection = null;
			}
		}
		return metaDataList;
	}

	/**
	 * 获取指定表上的索引字段
	 * @param tableName
	 * @return
	 */
	private Map<String, String> queryIndexInfo(String tableName){
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet resultSet = null;
		String sql = "SHOW INDEX FROM " + tableName;
		Map<String, String> indexInfo = new HashMap();
		try {
			connection = getCon();
			ps = connection.prepareStatement(sql);
			ps.execute();
			resultSet = ps.getResultSet();
			while(resultSet.next()){
				indexInfo.put(resultSet.getString("Column_name"), resultSet.getString("Key_name"));
			}
			return indexInfo;
		} catch (SQLException e){
			e.printStackTrace();
		}finally{
			if(resultSet != null){
				try {
					resultSet.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				resultSet = null;
			}
			if(ps != null){
				try {
					ps.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				ps = null;
			}
			if(connection != null){
				try {
					connection.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
				connection = null;
			}
		}
		return null;
	}
	
	/**
	 * 根据字段计算对应的JAVA属性名称
	 * @param tableFieldName
	 * @return
	 */
	private String getPropertieName(String tableFieldName){
		StringBuffer tmpStr = new StringBuffer();
		char[] charArray = tableFieldName.toLowerCase().toCharArray();
		char c;
		for(int i=0; i<charArray.length; i++){
			c = charArray[i];
			if(c == '_' || c =='-'){
				i++;
				if(i >= charArray.length){
					continue;
				}
				c = charArray[i];
				tmpStr.append(Character.toUpperCase(c));
			}else{
				tmpStr.append(c);
			}
		}
		return tmpStr.toString();
	}
}
