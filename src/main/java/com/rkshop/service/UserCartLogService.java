package com.rkshop.service;

import java.util.List;

import com.rkshop.entity.UserCartLog;

public interface UserCartLogService extends BaseService<UserCartLog> {
	
	/**
	 * 	�����ѯ
	 * @param record
	 * @return
	 */
	List<UserCartLog> towTableList(UserCartLog record);
	
	/**
	 * 	�����ѯ2
	 * @param userId
	 * @return
	 */
	UserCartLog towTableList2(UserCartLog record);
	
}
