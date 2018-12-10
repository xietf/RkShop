package com.rkshop.dao;

import java.util.List;

import com.rkshop.entity.ShopOrderGoods;

public interface ShopOrderGoodsMapper {
	
	/**
	 * 	查询方法
	 * @param record
	 * @return
	 */
	List<ShopOrderGoods> select(ShopOrderGoods record);

    /**
     * 	添加方法
     * @param record
     * @return
     */
    int insert(ShopOrderGoods record);

    /**
     * 	修改方法
     * @param record
     * @return
     */
    int update(ShopOrderGoods record);
    
    /**
	 * 	删除方法
	 * @param id
	 * @return
	 */
    int delete(Integer id);
   
}