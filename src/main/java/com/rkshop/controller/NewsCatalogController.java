package com.rkshop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rkshop.entity.NewsCatalog;
import com.rkshop.service.NewsCatalogService;

@Controller
@RequestMapping("/newscatalog")
public class NewsCatalogController extends BaseController<NewsCatalogService>{
	
	@RequestMapping("/list")
	public String listByPage(NewsCatalog record, ModelMap modelmap) {
		
		List<NewsCatalog> list = baseService.select(record);
		modelmap.put("list", list);
		
		return "/page/news";
	}
	
	@RequestMapping("/list2")
	public String listByPage2(
			@RequestParam(value="pageNum",required=false, defaultValue="1") int pageNum, 
			@RequestParam(value="pageSize",required=false, defaultValue="10") int pageSize, 
			NewsCatalog record, ModelMap modelmap) {
		
		PageHelper.startPage(pageNum, pageSize);
		List<NewsCatalog> list = baseService.select(record);
		PageInfo<NewsCatalog> pageInfo = new PageInfo<>(list);
		modelmap.put("pageInfo", pageInfo);
		
		return "/WEB-INF/page/admin/joint/newscatalog/newscatalogList";
	}
	
	@RequestMapping("/toinsert")
	public String toinsert(NewsCatalog record, ModelMap modelmap) {
		List<NewsCatalog> list = baseService.select(record);
		modelmap.put("list", list);
		return "/WEB-INF/page/admin/joint/newscatalog/newsCatalogAdd";
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public int insert(NewsCatalog record) {
		return baseService.insert(record);
	}
	
	
	@RequestMapping("/update")
	public int update(NewsCatalog record) {
		return baseService.update(record);
	}
	
	
	@RequestMapping("/delete")
	@ResponseBody
	public int delete(int id) {
		return baseService.delete(id);
	}
	
}
