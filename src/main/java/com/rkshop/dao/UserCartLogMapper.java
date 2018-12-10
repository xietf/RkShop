package com.rkshop.dao;

import java.util.List;

import com.rkshop.entity.UserCartLog;

public interface UserCartLogMapper {
	
	/**
	 * 	�����ѯ
	 * @param record
	 * @return
	 */
	List<UserCartLog> select(UserCartLog record);
	
	/**
	 * 	�����ѯ2
	 * @param userId
	 * @return
	 */
	UserCartLog towTableList2(UserCartLog record);
	
	/**
	 * 	�����ѯ
	 * @param userId
	 * @return
	 */
	List<UserCartLog> towTableList(UserCartLog record);

    /**
     * 	��ӷ���
     * @param record
     * @return
     */
    int insert(UserCartLog record);

    /**
     * 	�޸ķ���
     * @param record
     * @return
     */
    int update(UserCartLog record);
    
    /**
	 * 	ɾ������
	 * @param id
	 * @return
	 */
    int delete(Integer id);
   
}