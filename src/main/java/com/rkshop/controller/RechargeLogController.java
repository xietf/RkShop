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
import com.rkshop.entity.RechargeLog;
import com.rkshop.service.RechargeLogService;

@Controller
@RequestMapping("/rechargelog")
public class RechargeLogController extends BaseController<RechargeLogService>{
	
	@RequestMapping("/list")
	public String listByPage(
			@RequestParam(value="pageNum",required=false, defaultValue="1") int pageNum, 
			@RequestParam(value="pageSize",required=false, defaultValue="10") int pageSize, 
			RechargeLog record, String admin, ModelMap modelmap) {
		PageHelper.startPage(pageNum, pageSize);
		List<RechargeLog> list = baseService.select(record);
		PageInfo<RechargeLog> pageInfo = new PageInfo<>(list);
		modelmap.put("pageInfo", pageInfo);
		if(admin!=null) {
			return "/WEB-INF/page/admin/joint/chongzhiRecord";
		}else {
			return "/WEB-INF/page/vip/chongzhiRecord";
		}
	}
	
	
	@RequestMapping("/insert")
	public int insert(RechargeLog record) {
		return baseService.insert(record);
	}
	
	
	@RequestMapping("/update")
	public int update(RechargeLog record) {
		return baseService.update(record);
	}
	
	
	@RequestMapping("/delete")
	@ResponseBody
	public int delete(int id) {
		return baseService.delete(id);
	}
	
}
