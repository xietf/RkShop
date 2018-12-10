package com.rkshop.dao;

import java.util.List;

import com.rkshop.entity.ShopOrderGoods;

public interface ShopOrderGoodsMapper {
	
	/**
	 * 	��ѯ����
	 * @param record
	 * @return
	 */
	List<ShopOrderGoods> select(ShopOrderGoods record);

    /**
     * 	��ӷ���
     * @param record
     * @return
     */
    int insert(ShopOrderGoods record);

    /**
     * 	�޸ķ���
     * @param record
     * @return
     */
    int update(ShopOrderGoods record);
    
    /**
	 * 	ɾ������
	 * @param id
	 * @return
	 */
    int delete(Integer id);
   
}