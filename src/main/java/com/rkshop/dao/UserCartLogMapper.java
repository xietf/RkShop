package com.rkshop.dao;

import java.util.List;

import com.rkshop.entity.UserCartLog;

public interface UserCartLogMapper {
	
	/**
	 * 	两表查询
	 * @param record
	 * @return
	 */
	List<UserCartLog> select(UserCartLog record);
	
	/**
	 * 	两表查询2
	 * @param userId
	 * @return
	 */
	UserCartLog towTableList2(UserCartLog record);
	
	/**
	 * 	两表查询
	 * @param userId
	 * @return
	 */
	List<UserCartLog> towTableList(UserCartLog record);

    /**
     * 	添加方法
     * @param record
     * @return
     */
    int insert(UserCartLog record);

    /**
     * 	修改方法
     * @param record
     * @return
     */
    int update(UserCartLog record);
    
    /**
	 * 	删除方法
	 * @param id
	 * @return
	 */
    int delete(Integer id);
   
}