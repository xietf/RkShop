package com.rkshop.dao;

import java.util.List;

import com.rkshop.entity.User;

public interface UserMapper {
	
	/**
	 * 	查询方法
	 * @param record
	 * @return
	 */
	List<User> select(User record);

    /**
     * 	添加方法
     * @param record
     * @return
     */
    int insert(User record);

    /**
     * 	修改方法
     * @param record
     * @return
     */
    int update(User record);
    
    /**
	 * 	删除方法
	 * @param id
	 * @return
	 */
    int delete(Integer id);
   
}