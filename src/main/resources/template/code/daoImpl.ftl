package ${conf.daoPackage}.impl;

import org.springframework.stereotype.Repository;
import  ${conf.daoPackage}.${tableMetaInfoDto.clsName}Dao;
import ${conf.daoSuperClass};
import ${conf.entityPackage}.${tableMetaInfoDto.clsName};

/**
 *  ${tableMetaInfoDto.clsName}DaoImpl：实现对${tableMetaInfoDto.tableName}表的增、删、改、查操作
 * 
 * @author jack_wu
 * @version 1.0
 * @since ${conf.commentSince}
 *
 */
 @Repository
public class ${tableMetaInfoDto.clsName}DaoImpl extends ${conf.daoSuperClassSimpleName}<${tableMetaInfoDto.clsName}, ${tableMetaInfoDto.primaryFieldJavaTypeName}> implements ${tableMetaInfoDto.clsName}Dao {

}
