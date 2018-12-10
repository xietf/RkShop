package com.rkshop.dao;

import java.util.List;

import com.rkshop.entity.ShopOrder;

public interface ShopOrderMapper {
	
	/**
	 * 	查询方法
	 * @param record
	 * @return
	 */
	List<ShopOrder> select(ShopOrder record);
	
	/**
	 * 	两表查询
	 * @param record
	 * @return
	 */
	List<ShopOrder> selectbytowtable(ShopOrder record);

    /**
     * 	添加方法
     * @param record
     * @return
     */
    int insert(ShopOrder record);

    /**
     * 	修改方法
     * @param record
     * @return
     */
    int update(ShopOrder record);
    
    /**
	 * 	删除方法
	 * @param id
	 * @return
	 */
    int delete(Integer id);
   
}