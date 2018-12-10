package com.rkshop.controller;

import java.util.List;

import javax.mail.Address;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rkshop.entity.UserAddress;
import com.rkshop.service.UserAddressService;

@Controller
@RequestMapping("/useraddress")
public class UserAddressController extends BaseController<UserAddressService>{
	
	@RequestMapping("/list")
	public String listByPage(UserAddress record, String mak, ModelMap modelmap) {
		
		List<UserAddress> list = baseService.select(record);
		modelmap.put("list", list);
		
		if(mak!=null) {
			return "/WEB-INF/page/vip/addressList2";
		}else {
			return "/WEB-INF/page/vip/addressList";
		}
	}
	
	@RequestMapping("/toInsert")
	public String toInsert() {
		return "/WEB-INF/page/vip/insertAddress";
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public int insert(UserAddress record) {
		int rowcount = 0;
		System.out.println(record.getIsDefault());
		if(record.getIsDefault()==1) {
			System.out.println(1112);
			UserAddress  userAddress = new UserAddress();
			userAddress.setUserId(record.getUserId());
			userAddress.setIsDefault(1);
			List<UserAddress> list = baseService.select(userAddress);
			for (UserAddress userAddress2 : list) {
				userAddress2.setIsDefault(0);
				baseService.update(userAddress2);
			}
		}
		rowcount = baseService.insert(record);
		return rowcount;
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public int update(UserAddress record) {
		int rowcount = baseService.update(record);
		return rowcount;
	}
	
	@RequestMapping("/toupdate")
	public String toupdate(UserAddress record, ModelMap modelmap) {
		List<UserAddress> list = baseService.select(record);
		modelmap.put("list", list);
		return "/WEB-INF/page/vip/updateAddress";
	}
	
	@RequestMapping("/moren")
	@ResponseBody
	public int moren(UserAddress record) {
		record.getUserId();
		record.setIsDefault(1);
		
		UserAddress  userAddress = new UserAddress();
		userAddress.setUserId(record.getUserId());
		userAddress.setIsDefault(1);
		List<UserAddress> listAddress = baseService.select(userAddress);
		
		int rwcount1=0;
		int rwcount2=0;
		for (UserAddress userAddress2 : listAddress) {
			userAddress2.setIsDefault(0);
			rwcount1 = baseService.update(userAddress2);
		}
		
		rwcount2 = baseService.update(record);
		
		if(rwcount1==1 && rwcount2==1) {
			return 1;
		}else {
			return 0;
		}
	}
	
	@RequestMapping("/delete")
	public int delete(int id) {
		return baseService.delete(id);
	}
	
}
