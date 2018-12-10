package com.rkshop.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.json.JsonArray;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rkshop.entity.ShopOrder;
import com.rkshop.entity.ShopOrderGoods;
import com.rkshop.entity.UserAddress;
import com.rkshop.entity.UserCartLog;
import com.rkshop.entity.VipUser;
import com.rkshop.service.ShopOrderGoodsService;
import com.rkshop.service.ShopOrderService;
import com.rkshop.service.UserAddressService;
import com.rkshop.service.UserCartLogService;

@Controller
@RequestMapping("/usercartlog")
public class UserCartLogController{
	
	@Autowired
	private UserCartLogService userCartLogService;
	@Autowired
	private ShopOrderGoodsService shopOrderGoodsService;
	@Autowired
	private UserAddressService userAddressService;
	@Autowired
	private ShopOrderService shopOrderService;
	
	@RequestMapping("/towTableList")
	public String towTableList(HttpSession session, UserCartLog record, ModelMap modelmap) {
		System.out.println("购物车数据删除2");
		try {
			VipUser vipuser = (VipUser) session.getAttribute("vipuser");
			record.setUserId(vipuser.getId());
	    	List<UserCartLog> list = userCartLogService.towTableList(record);
			modelmap.put("list", list);
		} catch (Exception e) {
			System.out.println("没有值");
		}finally {
			return "/page/cart";
		}
	};
	
	@RequestMapping("/towTableList2")
	public String towTableList2(HttpSession session, UserCartLog record, String check, ModelMap modelmap) {
		if(check!=null && !check.equals("")) {
			
			int goodsNum=0;
			BigDecimal allPrice= new BigDecimal(0);
			SimpleDateFormat sim = new SimpleDateFormat("MMddHHmmss");
			String orderSn = sim.format(new Date());
			List<UserCartLog> list = new ArrayList<>();
			
			VipUser vipuser = (VipUser) session.getAttribute("vipuser");
			UserAddress userAddress = new UserAddress();
			userAddress.setUserId(vipuser.getId());
			userAddress.setIsDefault(1);
			List<UserAddress> listAddress = userAddressService.select(userAddress);
			
			String[] cartids = check.split(",");
			for (String cartid : cartids) {
				
				record.setId(Integer.parseInt(cartid));
				UserCartLog userCartLog = userCartLogService.towTableList2(record);
				
				goodsNum += userCartLog.getGoNum();
				allPrice = allPrice.add(userCartLog.getGoods().getSellPrice().multiply(new BigDecimal(userCartLog.getGoNum())));
				list.add(userCartLog);
				
				ShopOrderGoods shopOrderGoods = new ShopOrderGoods();
				shopOrderGoods.setGoodsId(userCartLog.getGoodsId());
				shopOrderGoods.setUserId(userCartLog.getUserId());
				shopOrderGoods.setGoodsName(userCartLog.getGoods().getGoodsName());
				shopOrderGoods.setGoodsImg(userCartLog.getGoods().getGoodsImg());
				shopOrderGoods.setPrice(userCartLog.getGoods().getSellPrice());
				shopOrderGoods.setGoNum(userCartLog.getGoNum());
				shopOrderGoods.setTotalPrice(userCartLog.getGoods().getSellPrice().multiply(new BigDecimal(userCartLog.getGoNum())));
				shopOrderGoods.setGoodsSn(userCartLog.getGoods().getGoodsSn());
				shopOrderGoods.setCatalogId(userCartLog.getGoods().getCatalogId());
				shopOrderGoods.setAddTime(new Date());
				shopOrderGoods.setOrderId(Integer.parseInt(orderSn));
				shopOrderGoodsService.insert(shopOrderGoods);
				userCartLogService.delete(record.getId());
			}
			
			ShopOrder shopOrder = new ShopOrder();
			shopOrder.setOrderSn(orderSn);
			shopOrder.setAddTime(new Date());
			shopOrder.setAddress(listAddress.get(0).getAddress());
			shopOrder.setUserName(listAddress.get(0).getUserName());
			shopOrder.setCity(listAddress.get(0).getCity());
			shopOrder.setProvince(listAddress.get(0).getProvince());
			shopOrder.setArea(listAddress.get(0).getArea());
			shopOrder.setPhone(listAddress.get(0).getPhone());
			shopOrder.setEmail(listAddress.get(0).getEmail());
			shopOrder.setCode(listAddress.get(0).getCode());
			shopOrder.setShopState(0);
			shopOrder.setRemark("");
			shopOrder.setUserId(vipuser.getId());
			shopOrder.setTotalMoney(allPrice);
			shopOrderService.insert(shopOrder);
			
			ShopOrder shopOrder1 = new ShopOrder();
			shopOrder1.setOrderSn(orderSn);
			List<ShopOrder> listshopOrder = shopOrderService.select(shopOrder1);
			int orderId = listshopOrder.get(0).getId();
			
			modelmap.put("orderId", orderId);
			modelmap.put("goodsNum", goodsNum);
			modelmap.put("allPrice", allPrice);
			modelmap.put("list", list);
			return "/WEB-INF/page/vip/writeorder";	
		}else {
			System.out.println("未选择商品");
			return null;
		}
	}
	
	@RequestMapping("/towriteorder")
	public String towriteorder() {
		return "/WEB-INF/page/vip/writeorder";
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public int insert(UserCartLog record) {
		
		UserCartLog userCartLog = new UserCartLog();
		userCartLog.setGoodsId(record.getGoodsId());
		userCartLog.setUserId(record.getUserId());
		List<UserCartLog> list = userCartLogService.select(userCartLog);
		System.out.println("购物车查询数量："+list.size());
		if(list.size()>0) {
			int goNum = list.get(0).getGoNum()+record.getGoNum();
			UserCartLog userCartLog2 = new UserCartLog();
			userCartLog2.setId(list.get(0).getId());
			userCartLog2.setAddTime(new Date());
			userCartLog2.setGoNum(goNum);
			System.out.println("购物车中商品数量："+list.get(0).getGoNum());
			System.out.println("网页输入商品数量："+record.getGoNum());
			int rowcount = userCartLogService.update(userCartLog2);
			System.out.println("购物车修改影响条数："+rowcount);
			if(rowcount==1) {
				return 1;
			}else {
				return 2;
			}
		}else {
			int rowcount = userCartLogService.insert(record);
			System.out.println("购物车添加影响条数："+rowcount);
			if(rowcount==1) {
				return 1;
			}else {
				return 2;
			}
		}
	}
	
	
	@RequestMapping("/update")
	public String update(UserCartLog record, HttpSession session) {
		userCartLogService.update(record);
		VipUser vipuser = (VipUser) session.getAttribute("vipuser");
		int userId = vipuser.getId();
		System.out.println("userId:"+userId);
		return "redirect:/usercartlog/towTableList";
	}
	
	
	@RequestMapping("/delete")
	@ResponseBody
	public int delete(int id) {
		System.out.println("购物车数据删除1");
		return userCartLogService.delete(id);
		//return "redirect:/usercartlog/towTableList";
	}
	
}
