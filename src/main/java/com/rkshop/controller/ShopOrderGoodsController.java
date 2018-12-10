package com.rkshop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rkshop.entity.ShopOrderGoods;
import com.rkshop.service.ShopOrderGoodsService;

@Controller
@RequestMapping("/shopordergoods")
public class ShopOrderGoodsController extends BaseController<ShopOrderGoodsService>{
	
	@RequestMapping("/list")
	public PageInfo<ShopOrderGoods> listByPage(int pageNum, int pageSize, ShopOrderGoods record) {
		
		PageHelper.startPage(pageNum, pageSize);
		List<ShopOrderGoods> list = baseService.select(record);
		PageInfo<ShopOrderGoods> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}
	
	
	@RequestMapping("/insert")
	public int insert(ShopOrderGoods record) {
		return baseService.insert(record);
	}
	
	
	@RequestMapping("/update")
	public int update(ShopOrderGoods record) {
		return baseService.update(record);
	}
	
	
	@RequestMapping("/delete")
	public int delete(int id) {
		return baseService.delete(id);
	}
	
}
