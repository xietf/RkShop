package com.rkshop.service;

import java.util.List;

public interface BaseService<T> {
	
	/**
	 * 	查询方法
	 * @param record
	 * @return
	 */
	List<T> select(T record);

    /**
     * 	添加方法
     * @param record
     * @return
     */
    int insert(T record);

    /**
     * 	修改方法
     * @param record
     * @return
     */
    int update(T record);
    
    /**
	 * 	删除方法
	 * @param id
	 * @return
	 */
    int delete(Integer id);
	
}
