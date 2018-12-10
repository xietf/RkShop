package com.rkshop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rkshop.entity.ShopAd;
import com.rkshop.service.ShopAdService;

@Controller
@RequestMapping("/shopad")
public class ShopAdController extends BaseController<ShopAdService>{
	
	@RequestMapping("/list")
	public PageInfo<ShopAd> listByPage(int pageNum, int pageSize, ShopAd record) {
		
		PageHelper.startPage(pageNum, pageSize);
		List<ShopAd> list = baseService.select(record);
		PageInfo<ShopAd> pageInfo = new PageInfo<>(list);
		return pageInfo;
	}
	
	
	@RequestMapping("/insert")
	public int insert(ShopAd record) {
		return baseService.insert(record);
	}
	
	
	@RequestMapping("/update")
	public int update(ShopAd record) {
		return baseService.update(record);
	}
	
	
	@RequestMapping("/delete")
	public int delete(int id) {
		return baseService.delete(id);
	}
	
}
