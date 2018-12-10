package com.rkshop.service.imple;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rkshop.dao.GoodsCatalogMapper;
import com.rkshop.entity.GoodsCatalog;
import com.rkshop.service.GoodsCatalogService;

@Service
public class GoodsCatalogServiceImple implements GoodsCatalogService {
	
	@Autowired
	private GoodsCatalogMapper goodsCatalogMapper;

	@Override
	public List<GoodsCatalog> select(GoodsCatalog record) {
		return goodsCatalogMapper.select(record);
	}
	
	@Override
	public int insert(GoodsCatalog record) {
		return goodsCatalogMapper.insert(record);
	}

	@Override
	public int update(GoodsCatalog record) {
		return goodsCatalogMapper.update(record);
	}

	@Override
	public int delete(Integer id) {
		return goodsCatalogMapper.delete(id);
	}

}
