package com.rkshop.dao;

import java.util.List;

import com.rkshop.entity.ShopOrder;

public interface ShopOrderMapper {
	
	/**
	 * 	��ѯ����
	 * @param record
	 * @return
	 */
	List<ShopOrder> select(ShopOrder record);
	
	/**
	 * 	�����ѯ
	 * @param record
	 * @return
	 */
	List<ShopOrder> selectbytowtable(ShopOrder record);

    /**
     * 	��ӷ���
     * @param record
     * @return
     */
    int insert(ShopOrder record);

    /**
     * 	�޸ķ���
     * @param record
     * @return
     */
    int update(ShopOrder record);
    
    /**
	 * 	ɾ������
	 * @param id
	 * @return
	 */
    int delete(Integer id);
   
}