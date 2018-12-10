package com.rkshop.service.imple;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rkshop.dao.GoodsMapper;
import com.rkshop.entity.Goods;
import com.rkshop.service.GoodsService;

@Service
public class GoodsServiceImple implements GoodsService {
	
	@Autowired
	private GoodsMapper goodsMapper;
	
	@Override
	public List<Goods> select(Goods record) {
		return goodsMapper.select(record);
	}
	
	@Override
	public int insert(Goods record) {
		return goodsMapper.insert(record);
	}

	@Override
	public int update(Goods record) {
		return goodsMapper.update(record);
	}

	@Override
	public int delete(Integer id) {
		return goodsMapper.delete(id);
	}
	
}
