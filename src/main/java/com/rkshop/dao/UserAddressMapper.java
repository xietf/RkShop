package com.rkshop.dao;

import java.util.List;

import com.rkshop.entity.UserAddress;

public interface UserAddressMapper {
	
	/**
	 * 	查询方法
	 * @param record
	 * @return
	 */
	List<UserAddress> select(UserAddress record);

    /**
     * 	添加方法
     * @param record
     * @return
     */
    int insert(UserAddress record);

    /**
     * 	修改方法
     * @param record
     * @return
     */
    int update(UserAddress record);
    
    /**
	 * 	删除方法
	 * @param id
	 * @return
	 */
    int delete(Integer id);
   
}