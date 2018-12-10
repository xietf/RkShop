package com.rkshop.service.imple;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rkshop.dao.ShopAdMapper;
import com.rkshop.entity.ShopAd;
import com.rkshop.service.ShopAdService;

@Service
public class ShopAdServiceImple implements ShopAdService {
	
	@Autowired
	private ShopAdMapper shopAdMapper;

	@Override
	public List<ShopAd> select(ShopAd record) {
		return shopAdMapper.select(record);
	}

	@Override
	public int insert(ShopAd record) {
		return shopAdMapper.insert(record);
	}

	@Override
	public int update(ShopAd record) {
		return shopAdMapper.update(record);
	}

	@Override
	public int delete(Integer id) {
		return shopAdMapper.delete(id);
	}

}
