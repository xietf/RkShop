package com.rkshop.dao;

import java.util.List;

import com.rkshop.entity.NewsCatalog;

public interface NewsCatalogMapper {
	
	/**
	 * 	查询方法
	 * @param record
	 * @return
	 */
	List<NewsCatalog> select(NewsCatalog record);

    /**
     * 	添加方法
     * @param record
     * @return
     */
    int insert(NewsCatalog record);

    /**
     * 	修改方法
     * @param record
     * @return
     */
    int update(NewsCatalog record);
    
    /**
	 * 	删除方法
	 * @param id
	 * @return
	 */
    int delete(Integer id);
    
}