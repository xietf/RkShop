package com.rkshop.service.imple;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rkshop.dao.NewsCatalogMapper;
import com.rkshop.entity.NewsCatalog;
import com.rkshop.service.NewsCatalogService;

@Service
public class NewsCatalogServiceImple implements NewsCatalogService {
	
	@Autowired
	private NewsCatalogMapper newsCatalogMapper;

	@Override
	public List<NewsCatalog> select(NewsCatalog record) {
		return newsCatalogMapper.select(record);
	}

	@Override
	public int insert(NewsCatalog record) {
		return newsCatalogMapper.insert(record);
	}

	@Override
	public int update(NewsCatalog record) {
		return newsCatalogMapper.update(record);
	}

	@Override
	public int delete(Integer id) {
		return newsCatalogMapper.delete(id);
	}

}
