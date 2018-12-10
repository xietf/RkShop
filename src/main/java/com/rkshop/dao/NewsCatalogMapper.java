package com.rkshop.dao;

import java.util.List;

import com.rkshop.entity.NewsCatalog;

public interface NewsCatalogMapper {
	
	/**
	 * 	��ѯ����
	 * @param record
	 * @return
	 */
	List<NewsCatalog> select(NewsCatalog record);

    /**
     * 	��ӷ���
     * @param record
     * @return
     */
    int insert(NewsCatalog record);

    /**
     * 	�޸ķ���
     * @param record
     * @return
     */
    int update(NewsCatalog record);
    
    /**
	 * 	ɾ������
	 * @param id
	 * @return
	 */
    int delete(Integer id);
    
}