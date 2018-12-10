package com.rkshop.service.imple;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rkshop.dao.ShopOrderGoodsMapper;
import com.rkshop.entity.ShopOrderGoods;
import com.rkshop.service.ShopOrderGoodsService;

@Service
public class ShopOrderGoodsServiceImple implements ShopOrderGoodsService {
	
	@Autowired
	private ShopOrderGoodsMapper shopOrderGoodsMapper;

	@Override
	public List<ShopOrderGoods> select(ShopOrderGoods record) {
		return shopOrderGoodsMapper.select(record);
	}

	@Override
	public int insert(ShopOrderGoods record) {
		return shopOrderGoodsMapper.insert(record);
	}

	@Override
	public int update(ShopOrderGoods record) {
		return shopOrderGoodsMapper.update(record);
	}

	@Override
	public int delete(Integer id) {
		return shopOrderGoodsMapper.delete(id);
	}

}
