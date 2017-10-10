package ${conf.boPackage}.impl;

import java.util.List;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import net.sf.cglib.beans.BeanCopier;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ${conf.dtoPackage}.${tableMetaInfoDto.clsName}Dto;
import ${conf.entityPackage}.${tableMetaInfoDto.clsName};
import ${conf.boPackage}.${tableMetaInfoDto.clsName}Bo;
import ${conf.daoPackage}.${tableMetaInfoDto.clsName}Dao;
import ${conf.serviceException};
import ${conf.paginationList};

/**
 *  ${tableMetaInfoDto.clsName}BoImpl：这里增加注释。。。。//TODO
 * 
 * @author ${conf.author}
 * @version 1.0
 * @since ${conf.commentSince}
 *
 */
@Service
public class ${tableMetaInfoDto.clsName}BoImpl implements ${tableMetaInfoDto.clsName}Bo {

	private static final Logger logger = LoggerFactory.getLogger(${tableMetaInfoDto.clsName}BoImpl.class);
			
	@Autowired
	private ${tableMetaInfoDto.clsName}Dao ${tableMetaInfoDto.clsName?uncap_first}Dao;

	private static BeanCopier dto2EntityCopier = BeanCopier.create(${tableMetaInfoDto.clsName}Dto.class, ${tableMetaInfoDto.clsName}.class, false);
	
	private static BeanCopier entity2DtoCopier = BeanCopier.create(${tableMetaInfoDto.clsName}.class, ${tableMetaInfoDto.clsName}Dto.class, false);
	
	/**
	 * 添加${tableMetaInfoDto.clsName}
	 * @param ${tableMetaInfoDto.clsName?uncap_first}Dto
	 * @throws ${conf.serviceExceptionSimpleName}
	 */
	public void insert(${tableMetaInfoDto.clsName}Dto ${tableMetaInfoDto.clsName?uncap_first}Dto) throws ${conf.serviceExceptionSimpleName} {
		try{
			${tableMetaInfoDto.clsName} ${tableMetaInfoDto.clsName?uncap_first} = new ${tableMetaInfoDto.clsName}();
			dto2EntityCopier.copy(${tableMetaInfoDto.clsName?uncap_first}Dto, ${tableMetaInfoDto.clsName?uncap_first}, null);
			${tableMetaInfoDto.clsName?uncap_first} = ${tableMetaInfoDto.clsName?uncap_first}Dao.insert(${tableMetaInfoDto.clsName?uncap_first});
		}catch(Exception e){
			logger.error("param:{}\n\t{}", ${tableMetaInfoDto.clsName?uncap_first}Dto, e);
			throw new ${conf.serviceExceptionSimpleName}("这里填写错误信息。。。。", "这里填写错误代码，错误代码以常量形式定义（如：ItemServiceErrorCode.XXX_XXX_XXX_XXX）");	//TODO
		}
	}

	/**
	 * 根据id删除指定的${tableMetaInfoDto.clsName}
	 * @param ${tableMetaInfoDto.primaryPropertieName}
	 * @return
	 * @throws ${conf.serviceExceptionSimpleName}
	 */
	public void deleteById(${tableMetaInfoDto.primaryFieldJavaTypeName} ${tableMetaInfoDto.primaryPropertieName}) throws ${conf.serviceExceptionSimpleName} {
		try{
			${tableMetaInfoDto.clsName?uncap_first}Dao.deleteByPK(${tableMetaInfoDto.primaryPropertieName});
		}catch(Exception e){
			logger.error("${tableMetaInfoDto.primaryPropertieName}:{}\n\t{}", ${tableMetaInfoDto.primaryPropertieName}, e);
			throw new ${conf.serviceExceptionSimpleName}("这里填写错误信息。。。。", "这里填写错误代码，错误代码以常量形式定义（如：ItemServiceErrorCode.XXX_XXX_XXX_XXX）");	//TODO
		}
	}

	/**
	 * 更新${tableMetaInfoDto.clsName}
	 * @param ${tableMetaInfoDto.clsName?uncap_first}Dto
	 * @return
	 * @throws ${conf.serviceExceptionSimpleName}
	 */
	public void update(${tableMetaInfoDto.clsName}Dto ${tableMetaInfoDto.clsName?uncap_first}Dto) throws ${conf.serviceExceptionSimpleName} {
		try{
			${tableMetaInfoDto.clsName} ${tableMetaInfoDto.clsName?uncap_first} = new ${tableMetaInfoDto.clsName}();
			dto2EntityCopier.copy(${tableMetaInfoDto.clsName?uncap_first}Dto, ${tableMetaInfoDto.clsName?uncap_first}, null);
			${tableMetaInfoDto.clsName?uncap_first}Dao.update(${tableMetaInfoDto.clsName?uncap_first});
		}catch(Exception e){
			logger.error("${tableMetaInfoDto.clsName?uncap_first}Dto:{}\n\t{}", ${tableMetaInfoDto.clsName?uncap_first}Dto, e);
			throw new ${conf.serviceExceptionSimpleName}("这里填写错误信息。。。。", "这里填写错误代码，错误代码以常量形式定义（如：ItemServiceErrorCode.XXX_XXX_XXX_XXX）");	//TODO
		}
	}

	/**
	 * 根据id查询指定的${tableMetaInfoDto.clsName}并返回
	 * @param ${tableMetaInfoDto.primaryPropertieName}
	 * @return
	 * @throws ${conf.serviceExceptionSimpleName}
	 */
	public ${tableMetaInfoDto.clsName}Dto queryById(${tableMetaInfoDto.primaryFieldJavaTypeName} ${tableMetaInfoDto.primaryPropertieName}) throws ${conf.serviceExceptionSimpleName} {
		try{
			${tableMetaInfoDto.clsName} ${tableMetaInfoDto.clsName?uncap_first} = ${tableMetaInfoDto.clsName?uncap_first}Dao.findByPK(${tableMetaInfoDto.primaryPropertieName});
			if(${tableMetaInfoDto.clsName?uncap_first} == null){
				return null;
			}
			${tableMetaInfoDto.clsName}Dto ${tableMetaInfoDto.clsName?uncap_first}Dto = new ${tableMetaInfoDto.clsName}Dto();
			entity2DtoCopier.copy(${tableMetaInfoDto.clsName?uncap_first}, ${tableMetaInfoDto.clsName?uncap_first}Dto, null);
			return ${tableMetaInfoDto.clsName?uncap_first}Dto;
		}catch(Exception e){
			logger.error("${tableMetaInfoDto.primaryPropertieName}:{}\n\t{}", ${tableMetaInfoDto.primaryPropertieName}, e);
			throw new ${conf.serviceExceptionSimpleName}("这里填写错误信息。。。。", "这里填写错误代码，错误代码以常量形式定义（如：ItemServiceErrorCode.XXX_XXX_XXX_XXX）");	//TODO
		}
	}

	/**
	 * 根据参数对象查询${tableMetaInfoDto.clsName}并返回结果
	 * @param ${tableMetaInfoDto.clsName?uncap_first}Dto
	 * @return
	 * @throws ${conf.serviceExceptionSimpleName}
	 */
	public List<${tableMetaInfoDto.clsName}Dto> queryByExampleForList(${tableMetaInfoDto.clsName}Dto ${tableMetaInfoDto.clsName?uncap_first}Dto) throws ${conf.serviceExceptionSimpleName} {
		try{
			${tableMetaInfoDto.clsName} ${tableMetaInfoDto.clsName?uncap_first} = new ${tableMetaInfoDto.clsName}();
			dto2EntityCopier.copy(${tableMetaInfoDto.clsName?uncap_first}Dto, ${tableMetaInfoDto.clsName?uncap_first}, null);
			List<${tableMetaInfoDto.clsName}> ls = ${tableMetaInfoDto.clsName?uncap_first}Dao.findByExample(${tableMetaInfoDto.clsName?uncap_first});
			return entity2DtoCopier(ls);
		}catch(Exception e){
			logger.error("${tableMetaInfoDto.clsName?uncap_first}Dto:{}\n\t{}", ${tableMetaInfoDto.clsName?uncap_first}Dto, e);
			throw new ${conf.serviceExceptionSimpleName}("这里填写错误信息。。。。", "这里填写错误代码，错误代码以常量形式定义（如：ItemServiceErrorCode.XXX_XXX_XXX_XXX）");	//TODO
		}
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
		try{
			${tableMetaInfoDto.clsName} ${tableMetaInfoDto.clsName?uncap_first} = new ${tableMetaInfoDto.clsName}();
			dto2EntityCopier.copy(${tableMetaInfoDto.clsName?uncap_first}Dto, ${tableMetaInfoDto.clsName?uncap_first}, null);
			PaginationList pls = ${tableMetaInfoDto.clsName?uncap_first}Dao.findByExampleForPage(${tableMetaInfoDto.clsName?uncap_first}, ((pageNum-1)*pageSize), pageSize);
			if(pls == null || pls.size() == 0){
				return null;
			}
			List<${tableMetaInfoDto.clsName}Dto> newList = entity2DtoCopier(pls);
			pls.clear();
			pls.addAll(newList);
			return (PaginationList<${tableMetaInfoDto.clsName}Dto>)pls;
		}catch(Exception e){
			logger.error("param:{},pageNum:{},pageSize:{}\n\t{}", ${tableMetaInfoDto.clsName?uncap_first}Dto, pageNum, pageSize, e);
			throw new ${conf.serviceExceptionSimpleName}("这里填写错误信息。。。。", "这里填写错误代码，错误代码以常量形式定义（如：ItemServiceErrorCode.XXX_XXX_XXX_XXX）");	//TODO
		}
	}

	private List<${tableMetaInfoDto.clsName}Dto> entity2DtoCopier(List<${tableMetaInfoDto.clsName}> list){
		if(list == null || list.isEmpty()){
			return null;
		}
		List<${tableMetaInfoDto.clsName}Dto> newList = new ArrayList();
		${tableMetaInfoDto.clsName}Dto tmp${tableMetaInfoDto.clsName}Dto = null;
		for(${tableMetaInfoDto.clsName} o : list){
			tmp${tableMetaInfoDto.clsName}Dto = new ${tableMetaInfoDto.clsName}Dto();
			entity2DtoCopier.copy(o, tmp${tableMetaInfoDto.clsName}Dto, null);
			newList.add(tmp${tableMetaInfoDto.clsName}Dto);
		}
		return newList;
	}
}
