package com.rkshop.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rkshop.entity.User;
import com.rkshop.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController<UserService> {
	
	@RequestMapping("/tologin")
	public String tologin(HttpSession session) {
		User user = (User) session.getAttribute("user");
		
		if(user!=null) {
			return "/WEB-INF/page/admin/index";
		}else {
			return "/WEB-INF/page/admin/login";	
		}
	}
	
	
	@RequestMapping("/login")
	public String login(HttpSession session, User record, String code, ModelMap modelmap) {
		
		String yanzhengma = (String)session.getAttribute("yanzhengma");
		
		if(yanzhengma.equals(code)) {
			List<User> list = baseService.select(record);
			if(list.size()>0) {
				record = list.get(0);
				record.setLastLoginTime(new Date());
				baseService.update(record);
				session.setAttribute("user", record);
				return "/WEB-INF/page/admin/index";
			}else {
				modelmap.put("result", 2);
				return "/WEB-INF/page/admin/login";
			}
		}else {
			modelmap.put("result", 3);
			return "/WEB-INF/page/admin/login";
		}
		
	}
	
	@RequestMapping("/outLogin")
	public String outLogin(HttpSession session) {
		session.removeAttribute("user");
		return "/WEB-INF/page/admin/login";
		
	}
	
	
	@RequestMapping("/list")
	public String listByPage(
			@RequestParam(value="pageNum",required=false, defaultValue="1") int pageNum, 
			@RequestParam(value="pageSize",required=false, defaultValue="10") int pageSize, 
			User record, ModelMap modelmap) {
		
		PageHelper.startPage(pageNum, pageSize);
		List<User> list = baseService.select(record);
		PageInfo<User> pageInfo = new PageInfo<>(list);
		modelmap.put("pageInfo", pageInfo);
		
		if(record.getId()!=null) {
			return "/WEB-INF/page/admin/joint/userInfo";
		}
		
		return null;
	}
	
	
	@RequestMapping("/insert")
	@ResponseBody
	public int insert(User record) {
		int rowcont = baseService.insert(record);
		if(rowcont==1) {
			return 1;
		}else {
			return 2;
		}
		
	}
	
	
	@RequestMapping("/update")
	@ResponseBody
	public int update(User record) {
		int rowcont = baseService.update(record);
		if(rowcont==1) {
			return 1;
		}else {
			return 2;
		}
	}
	
	
	@RequestMapping("/delete")
	public int delete(int id) {
		return baseService.delete(id);
	}
	
}
