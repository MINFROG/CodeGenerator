package ${conf.servicePackage}.impl;

import java.util.List;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import com.alibaba.dubbo.config.annotation.Service;

import ${conf.dtoPackage}.${tableMetaInfoDto.clsName}Dto;
import ${conf.servicePackage}.${tableMetaInfoDto.clsName}Service;
import ${conf.boPackage}.${tableMetaInfoDto.clsName}Bo;
import ${conf.serviceException};
import ${conf.paginationList};

/**
 *  ${tableMetaInfoDto.clsName}ServiceImpl：这里增加注释。。。。//TODO
 * 
 * @author ${conf.author}
 * @version 1.0
 * @since ${conf.commentSince}
 *
 */
@Service
public class ${tableMetaInfoDto.clsName}ServiceImpl implements ${tableMetaInfoDto.clsName}Service {

	private static final Logger logger = LoggerFactory.getLogger(${tableMetaInfoDto.clsName}ServiceImpl.class);
			
	@Autowired
	private ${tableMetaInfoDto.clsName}Bo ${tableMetaInfoDto.clsName?uncap_first}Bo;

	/**
	 * 添加${tableMetaInfoDto.clsName}
	 * @param ${tableMetaInfoDto.clsName?uncap_first}Dto
	 * @throws ${conf.serviceExceptionSimpleName}
	 */
	public void insert(${tableMetaInfoDto.clsName}Dto ${tableMetaInfoDto.clsName?uncap_first}Dto) throws ${conf.serviceExceptionSimpleName} {
		${tableMetaInfoDto.clsName?uncap_first}Bo.insert(${tableMetaInfoDto.clsName?uncap_first}Dto);
	}

	/**
	 * 根据id删除指定的${tableMetaInfoDto.clsName}
	 * @param ${tableMetaInfoDto.primaryPropertieName}
	 * @return
	 * @throws ${conf.serviceExceptionSimpleName}
	 */
	public void deleteById(${tableMetaInfoDto.primaryFieldJavaTypeName} ${tableMetaInfoDto.primaryPropertieName}) throws ${conf.serviceExceptionSimpleName} {
		${tableMetaInfoDto.clsName?uncap_first}Bo.deleteById(${tableMetaInfoDto.primaryPropertieName});
	}

	/**
	 * 更新${tableMetaInfoDto.clsName}
	 * @param ${tableMetaInfoDto.clsName?uncap_first}Dto
	 * @return
	 * @throws ${conf.serviceExceptionSimpleName}
	 */
	public void update(${tableMetaInfoDto.clsName}Dto ${tableMetaInfoDto.clsName?uncap_first}Dto) throws ${conf.serviceExceptionSimpleName} {
		${tableMetaInfoDto.clsName?uncap_first}Bo.update(${tableMetaInfoDto.clsName?uncap_first}Dto);
	}

	/**
	 * 根据id查询指定的${tableMetaInfoDto.clsName}并返回
	 * @param ${tableMetaInfoDto.primaryPropertieName}
	 * @return
	 * @throws ${conf.serviceExceptionSimpleName}
	 */
	public ${tableMetaInfoDto.clsName}Dto queryById(${tableMetaInfoDto.primaryFieldJavaTypeName} ${tableMetaInfoDto.primaryPropertieName}) throws ${conf.serviceExceptionSimpleName} {
		return ${tableMetaInfoDto.clsName?uncap_first}Bo.queryById(${tableMetaInfoDto.primaryPropertieName});
	}

	/**
	 * 根据参数对象查询${tableMetaInfoDto.clsName}并返回结果
	 * @param ${tableMetaInfoDto.clsName?uncap_first}Dto
	 * @return
	 * @throws ${conf.serviceExceptionSimpleName}
	 */
	public List<${tableMetaInfoDto.clsName}Dto> queryByExampleForList(${tableMetaInfoDto.clsName}Dto ${tableMetaInfoDto.clsName?uncap_first}Dto) throws ${conf.serviceExceptionSimpleName} {
		return ${tableMetaInfoDto.clsName?uncap_first}Bo.queryByExampleForList(${tableMetaInfoDto.clsName?uncap_first}Dto);
	}

	/**
	 * 根据参数对象以分页形式查询${tableMetaInfoDto.clsName}并返回结果集，该查询会进行两次数据库查询：一次查询结果集，一次统计满足条件的记录数
	 * @param ${tableMetaInfoDto.clsName?uncap_first}Dto	查询参数对象
	 * @param pageNum	页号：表示查询第几页的数据，页号从1开始计数
	 * @param pageSize	页大小：即每页返回的记录数
	 * @return
	 * @throws ${conf.serviceExceptionSimpleName}
	 */
	public ${conf.paginationListSimpleName}<${tableMetaInfoDto.clsName}Dto> queryByExampleForPage(${tableMetaInfoDto.clsName}Dto ${tableMetaInfoDto.clsName?uncap_first}Dto, int pageNum, int pageSize) throws ${conf.serviceExceptionSimpleName} {
		return ${tableMetaInfoDto.clsName?uncap_first}Bo.queryByExampleForPage(${tableMetaInfoDto.clsName?uncap_first}Dto, ((pageNum-1)*pageSize), pageSize);
	}
}
