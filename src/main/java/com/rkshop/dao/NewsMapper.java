package com.rkshop.dao;

import java.util.List;

import com.rkshop.entity.News;

public interface NewsMapper {
	
	/**
	 * 	查询方法
	 * @param record
	 * @return
	 */
	List<News> select(News record);

    /**
     * 	添加方法
     * @param record
     * @return
     */
    int insert(News record);

    /**
     * 	修改方法
     * @param record
     * @return
     */
    int update(News record);
    
    /**
	 * 	删除方法
	 * @param id
	 * @return
	 */
    int delete(Integer id);
   
}