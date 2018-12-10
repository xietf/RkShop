package com.rkshop.dao;

import java.util.List;

import com.rkshop.entity.ShopAd;

public interface ShopAdMapper {
	
	/**
	 * 	查询方法
	 * @param record
	 * @return
	 */
	List<ShopAd> select(ShopAd record);

    /**
     * 	添加方法
     * @param record
     * @return
     */
    int insert(ShopAd record);

    /**
     * 	修改方法
     * @param record
     * @return
     */
    int update(ShopAd record);
    
    /**
	 * 	删除方法
	 * @param id
	 * @return
	 */
    int delete(Integer id);
   
}