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
import com.rkshop.entity.Goods;
import com.rkshop.entity.GoodsCatalog;
import com.rkshop.service.GoodsCatalogService;

@Controller
@RequestMapping("/goodscatalog")
public class GoodsCatalogController extends BaseController<GoodsCatalogService>{
	
	@RequestMapping("/list")
	public String listByPage(
			@RequestParam(value="pageNum",required=false, defaultValue="1") int pageNum, 
			@RequestParam(value="pageSize",required=false, defaultValue="10") int pageSize, 
			GoodsCatalog record, String admin, ModelMap modelmap) {
		
		PageHelper.startPage(pageNum, pageSize);
		List<GoodsCatalog> list = baseService.select(record);
		PageInfo<GoodsCatalog> pageInfo = new PageInfo<>(list);
		modelmap.put("pageInfo1", pageInfo);
		
		if(admin!=null) {
			return "/WEB-INF/page/admin/joint/goodscatalog/goodscatalogList";
		}else {
			return "/page/goodsList";
		}
	}
	
	@RequestMapping("/toinsert")
	public String toinsert() {
		return "/WEB-INF/page/admin/joint/goodscatalog/goodscatalogAdd";
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public int insert(GoodsCatalog record) {
		return baseService.insert(record);
	}
	
	@RequestMapping("/toupdate")
	public String toupdate(GoodsCatalog record, ModelMap modelmap) {
		List<GoodsCatalog> listgoodsCatalog = baseService.select(record);
		modelmap.put("goodsCatalog", listgoodsCatalog.get(0));
		return "/WEB-INF/page/admin/joint/goodscatalog/goodsCatalogUpdate";
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public int update(GoodsCatalog record) {
		return baseService.update(record);
	}
	
	
	@RequestMapping("/delete")
	@ResponseBody
	public int delete(int id) {
		return baseService.delete(id);
	}
	
}
