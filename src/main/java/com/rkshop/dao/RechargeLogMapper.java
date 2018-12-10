package com.rkshop.dao;

import java.util.List;

import com.rkshop.entity.RechargeLog;

public interface RechargeLogMapper {
	
	/**
	 * 	��ѯ����
	 * @param record
	 * @return
	 */
	List<RechargeLog> select(RechargeLog record);

    /**
     * 	��ӷ���
     * @param record
     * @return
     */
    int insert(RechargeLog record);

    /**
     * 	�޸ķ���
     * @param record
     * @return
     */
    int update(RechargeLog record);
    
    /**
	 * 	ɾ������
	 * @param id
	 * @return
	 */
    int delete(Integer id);
   
}