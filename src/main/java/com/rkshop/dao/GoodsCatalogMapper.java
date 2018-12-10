package com.rkshop.dao;

import java.util.List;

import com.rkshop.entity.GoodsCatalog;

public interface GoodsCatalogMapper {
	
	/**
	 * 	查询方法
	 * @param record
	 * @return
	 */
	List<GoodsCatalog> select(GoodsCatalog record);

    /**
     * 	添加方法
     * @param record
     * @return
     */
    int insert(GoodsCatalog record);

    /**
     * 	修改方法
     * @param record
     * @return
     */
    int update(GoodsCatalog record);
    
    /**
	 * 	删除方法
	 * @param id
	 * @return
	 */
    int delete(Integer id);
    
}