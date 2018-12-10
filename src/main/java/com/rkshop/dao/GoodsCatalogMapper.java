package com.rkshop.dao;

import java.util.List;

import com.rkshop.entity.GoodsCatalog;

public interface GoodsCatalogMapper {
	
	/**
	 * 	��ѯ����
	 * @param record
	 * @return
	 */
	List<GoodsCatalog> select(GoodsCatalog record);

    /**
     * 	��ӷ���
     * @param record
     * @return
     */
    int insert(GoodsCatalog record);

    /**
     * 	�޸ķ���
     * @param record
     * @return
     */
    int update(GoodsCatalog record);
    
    /**
	 * 	ɾ������
	 * @param id
	 * @return
	 */
    int delete(Integer id);
    
}