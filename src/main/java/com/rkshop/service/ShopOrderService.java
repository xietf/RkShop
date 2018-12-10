package com.rkshop.service;

import java.util.List;

import com.rkshop.entity.ShopOrder;

public interface ShopOrderService extends BaseService<ShopOrder> {

	/**
	 * 	¡Ω±Ì≤È—Ø
	 * @param record
	 * @return
	 */
	List<ShopOrder> selectbytowtable(ShopOrder record);
}
