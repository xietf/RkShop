package com.rkshop.dao;

import java.util.List;

import com.rkshop.entity.ShopAd;

public interface ShopAdMapper {
	
	/**
	 * 	��ѯ����
	 * @param record
	 * @return
	 */
	List<ShopAd> select(ShopAd record);

    /**
     * 	��ӷ���
     * @param record
     * @return
     */
    int insert(ShopAd record);

    /**
     * 	�޸ķ���
     * @param record
     * @return
     */
    int update(ShopAd record);
    
    /**
	 * 	ɾ������
	 * @param id
	 * @return
	 */
    int delete(Integer id);
   
}