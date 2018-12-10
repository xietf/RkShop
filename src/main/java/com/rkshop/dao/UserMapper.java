package com.rkshop.dao;

import java.util.List;

import com.rkshop.entity.User;

public interface UserMapper {
	
	/**
	 * 	��ѯ����
	 * @param record
	 * @return
	 */
	List<User> select(User record);

    /**
     * 	��ӷ���
     * @param record
     * @return
     */
    int insert(User record);

    /**
     * 	�޸ķ���
     * @param record
     * @return
     */
    int update(User record);
    
    /**
	 * 	ɾ������
	 * @param id
	 * @return
	 */
    int delete(Integer id);
   
}