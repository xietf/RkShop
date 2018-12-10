package com.rkshop.dao;

import java.util.List;

import com.rkshop.entity.Goods;

public interface GoodsMapper {
	
	/**
	 * 	��ѯ����
	 * @param record
	 * @return
	 */
	List<Goods> select(Goods record);
	
    /**
     * 	��ӷ���
     * @param record
     * @return
     */
    int insert(Goods record);

    /**
     * 	�޸ķ���
     * @param record
     * @return
     */
    int update(Goods record);
    
    /**
	 * 	ɾ������
	 * @param id
	 * @return
	 */
    int delete(Integer id);
    
}