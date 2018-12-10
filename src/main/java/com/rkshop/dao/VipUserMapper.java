package com.rkshop.dao;

import java.util.List;

import com.rkshop.entity.VipUser;

public interface VipUserMapper {
	
	/**
	 * 	查询方法
	 * @param record
	 * @return
	 */
	List<VipUser> select(VipUser record);

    /**
     * 	添加方法
     * @param record
     * @return
     */
    int insert(VipUser record);

    /**
     * 	修改方法
     * @param record
     * @return
     */
    int update(VipUser record);
    
    /**
	 * 	删除方法
	 * @param id
	 * @return
	 */
    int delete(Integer id);
   
}