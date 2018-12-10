package com.rkshop.service;

import java.util.List;

import com.rkshop.entity.UserCartLog;

public interface UserCartLogService extends BaseService<UserCartLog> {
	
	/**
	 * 	两表查询
	 * @param record
	 * @return
	 */
	List<UserCartLog> towTableList(UserCartLog record);
	
	/**
	 * 	两表查询2
	 * @param userId
	 * @return
	 */
	UserCartLog towTableList2(UserCartLog record);
	
}
