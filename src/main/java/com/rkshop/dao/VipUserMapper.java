package com.rkshop.dao;

import java.util.List;

import com.rkshop.entity.VipUser;

public interface VipUserMapper {
	
	/**
	 * 	��ѯ����
	 * @param record
	 * @return
	 */
	List<VipUser> select(VipUser record);

    /**
     * 	��ӷ���
     * @param record
     * @return
     */
    int insert(VipUser record);

    /**
     * 	�޸ķ���
     * @param record
     * @return
     */
    int update(VipUser record);
    
    /**
	 * 	ɾ������
	 * @param id
	 * @return
	 */
    int delete(Integer id);
   
}