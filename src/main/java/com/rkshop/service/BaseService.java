package com.rkshop.service;

import java.util.List;

public interface BaseService<T> {
	
	/**
	 * 	��ѯ����
	 * @param record
	 * @return
	 */
	List<T> select(T record);

    /**
     * 	��ӷ���
     * @param record
     * @return
     */
    int insert(T record);

    /**
     * 	�޸ķ���
     * @param record
     * @return
     */
    int update(T record);
    
    /**
	 * 	ɾ������
	 * @param id
	 * @return
	 */
    int delete(Integer id);
	
}
