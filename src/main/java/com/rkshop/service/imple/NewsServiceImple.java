package com.rkshop.service.imple;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rkshop.dao.NewsMapper;
import com.rkshop.entity.News;
import com.rkshop.service.NewsService;

@Service
public class NewsServiceImple implements NewsService {
	
	@Autowired
	private NewsMapper newsMapper;

	@Override
	public List<News> select(News record) {
		return newsMapper.select(record);
	}

	@Override
	public int insert(News record) {
		return newsMapper.insert(record);
	}

	@Override
	public int update(News record) {
		return newsMapper.update(record);
	}

	@Override
	public int delete(Integer id) {
		return newsMapper.delete(id);
	}

}
