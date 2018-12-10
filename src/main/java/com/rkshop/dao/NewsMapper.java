package com.rkshop.dao;

import java.util.List;

import com.rkshop.entity.News;

public interface NewsMapper {
	
	/**
	 * 	��ѯ����
	 * @param record
	 * @return
	 */
	List<News> select(News record);

    /**
     * 	��ӷ���
     * @param record
     * @return
     */
    int insert(News record);

    /**
     * 	�޸ķ���
     * @param record
     * @return
     */
    int update(News record);
    
    /**
	 * 	ɾ������
	 * @param id
	 * @return
	 */
    int delete(Integer id);
   
}