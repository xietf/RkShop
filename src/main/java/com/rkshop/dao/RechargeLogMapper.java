package com.rkshop.dao;

import java.util.List;

import com.rkshop.entity.RechargeLog;

public interface RechargeLogMapper {
	
	/**
	 * 	查询方法
	 * @param record
	 * @return
	 */
	List<RechargeLog> select(RechargeLog record);

    /**
     * 	添加方法
     * @param record
     * @return
     */
    int insert(RechargeLog record);

    /**
     * 	修改方法
     * @param record
     * @return
     */
    int update(RechargeLog record);
    
    /**
	 * 	删除方法
	 * @param id
	 * @return
	 */
    int delete(Integer id);
   
}