package ${conf.daoPackage};

import ${conf.daoSuperInterface};
import ${conf.entityPackage}.${tableMetaInfoDto.clsName};
/**
 *  ${tableMetaInfoDto.clsName}Dao：定义对${tableMetaInfoDto.tableName}表的增、删、改、查接口
 * 
 * @author ${conf.author}
 * @version 1.0
 * @since ${conf.commentSince}
 *
 */
public interface ${tableMetaInfoDto.clsName}Dao extends ${conf.daoSuperInterfaceSimpleName}<${tableMetaInfoDto.clsName}, ${tableMetaInfoDto.primaryFieldJavaTypeName}> {

}