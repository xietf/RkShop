package com.rkshop.service;

import java.util.List;

import com.rkshop.entity.ShopOrder;

public interface ShopOrderService extends BaseService<ShopOrder> {

	/**
	 * 	�����ѯ
	 * @param record
	 * @return
	 */
	List<ShopOrder> selectbytowtable(ShopOrder record);
}
