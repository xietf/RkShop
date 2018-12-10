package com.rkshop.service.imple;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rkshop.dao.ShopOrderMapper;
import com.rkshop.entity.ShopOrder;
import com.rkshop.service.ShopOrderService;

@Service
public class ShopOrderServiceImple implements ShopOrderService {
	
	@Autowired
	private ShopOrderMapper shopOrderMapper;

	@Override
	public List<ShopOrder> select(ShopOrder record) {
		return shopOrderMapper.select(record);
	}

	@Override
	public int insert(ShopOrder record) {
		return shopOrderMapper.insert(record);
	}

	@Override
	public int update(ShopOrder record) {
		return shopOrderMapper.update(record);
	}

	@Override
	public int delete(Integer id) {
		return shopOrderMapper.delete(id);
	}

	@Override
	public List<ShopOrder> selectbytowtable(ShopOrder record) {
		return shopOrderMapper.selectbytowtable(record);
	}

}
