package com.rkshop.dao;

import java.util.List;

import com.rkshop.entity.Goods;

public interface GoodsMapper {
	
	/**
	 * 	查询方法
	 * @param record
	 * @return
	 */
	List<Goods> select(Goods record);
	
    /**
     * 	添加方法
     * @param record
     * @return
     */
    int insert(Goods record);

    /**
     * 	修改方法
     * @param record
     * @return
     */
    int update(Goods record);
    
    /**
	 * 	删除方法
	 * @param id
	 * @return
	 */
    int delete(Integer id);
    
}