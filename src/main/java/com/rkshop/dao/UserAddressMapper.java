package com.rkshop.dao;

import java.util.List;

import com.rkshop.entity.UserAddress;

public interface UserAddressMapper {
	
	/**
	 * 	��ѯ����
	 * @param record
	 * @return
	 */
	List<UserAddress> select(UserAddress record);

    /**
     * 	��ӷ���
     * @param record
     * @return
     */
    int insert(UserAddress record);

    /**
     * 	�޸ķ���
     * @param record
     * @return
     */
    int update(UserAddress record);
    
    /**
	 * 	ɾ������
	 * @param id
	 * @return
	 */
    int delete(Integer id);
   
}