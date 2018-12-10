package com.rkshop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rkshop.entity.Goods;
import com.rkshop.entity.ShopOrder;
import com.rkshop.entity.ShopOrderGoods;
import com.rkshop.entity.UserAddress;
import com.rkshop.entity.VipUser;
import com.rkshop.service.GoodsService;
import com.rkshop.service.ShopOrderGoodsService;
import com.rkshop.service.ShopOrderService;
import com.rkshop.service.UserAddressService;
import com.rkshop.service.VipUserService;

@Controller
@RequestMapping("/shoporder")
public class ShopOrderController {
	
	@Autowired
	private UserAddressService userAddressService;
	@Autowired
	private ShopOrderService shopOrderService;
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private VipUserService vipuserService;
	@Autowired
	private ShopOrderGoodsService shopOrderGoodsService;
	
	@RequestMapping("/list")
	public String listByPage(
			@RequestParam(value="pageNum",required=false, defaultValue="1") int pageNum, 
			@RequestParam(value="pageSize",required=false, defaultValue="10") int pageSize, 
			ShopOrder record, HttpSession session, String admin, ModelMap modelmap) {
		
			VipUser vipuser = (VipUser) session.getAttribute("vipuser");
			record.setUserId(vipuser.getId());
			
			PageHelper.startPage(pageNum, pageSize);
			List<ShopOrder> list = shopOrderService.select(record);
			for (ShopOrder shopOrder : list) {
				ShopOrderGoods shopOrderGoods = new ShopOrderGoods();
				shopOrderGoods.setOrderId(Integer.parseInt(shopOrder.getOrderSn()));
				List<ShopOrderGoods> listshopOrderGoods = shopOrderGoodsService.select(shopOrderGoods);
				shopOrder.setShopOrderGoods(listshopOrderGoods.get(0));
			}
			PageInfo<ShopOrder> pageInfo = new PageInfo<>(list);
			modelmap.put("pageInfo", pageInfo);
			
			String orderId = String.valueOf(record.getId());
			if(!orderId.equals("null")) {
				ShopOrderGoods shopOrderGoods = new ShopOrderGoods();
				shopOrderGoods.setOrderId(Integer.parseInt(record.getOrderSn()));
				List<ShopOrderGoods> listshopOrderGoods = shopOrderGoodsService.select(shopOrderGoods);
				ShopOrderGoods shopOrderGood = listshopOrderGoods.get(0);
				
				modelmap.put("shopOrderGood", shopOrderGood);
				return "/WEB-INF/page/vip/shpOrderInfo";
			}else {
				return "/WEB-INF/page/vip/shpOrderList";
			}
	}
	
	@RequestMapping("/list2")
	public String listByPage2(
		@RequestParam(value="pageNum",required=false, defaultValue="1") int pageNum, 
		@RequestParam(value="pageSize",required=false, defaultValue="10") int pageSize, 
		ShopOrder record, ModelMap modelmap) {
	
		PageHelper.startPage(pageNum, pageSize);
		List<ShopOrder> list = shopOrderService.select(record);
		PageInfo<ShopOrder> pageInfo = new PageInfo<>(list);
		modelmap.put("pageInfo", pageInfo);
		
		return "/WEB-INF/page/admin/joint/order/orderList";
	}
	
	@RequestMapping("/orderInfo")
	public String orderInfo(ShopOrder record, String admin,  ModelMap modelmap) {
		List<ShopOrder> list = shopOrderService.select(record);
		
		ShopOrderGoods shopOrderGoods = new ShopOrderGoods();
		shopOrderGoods.setOrderId(Integer.parseInt(list.get(0).getOrderSn()));
		List<ShopOrderGoods> listshopOrderGoods = shopOrderGoodsService.select(shopOrderGoods);
		
		modelmap.put("shopOrder", list.get(0));
		modelmap.put("listshopOrderGoods", listshopOrderGoods);
		if(admin==null) {
			return "/WEB-INF/page/vip/shpOrderInfo";
		}else {
			return "/WEB-INF/page/admin/joint/order/orderInfo";
		}
	}
	
	
	@RequestMapping("/insert")
	public int insert(ShopOrder record) {
		return shopOrderService.insert(record);
	}
	
	
	@RequestMapping("/update")
	public void update(ShopOrder record, String isDefault, String userId) {
		if(isDefault!=null && !isDefault.equals("")) {
			
			UserAddress userAddress = new UserAddress();
			userAddress.setIsDefault(Integer.parseInt(isDefault));
			userAddress.setUserId(Integer.parseInt(userId));
			List<UserAddress> listAddress = userAddressService.select(userAddress);
			
			record.setUserName(listAddress.get(0).getUserName());
			record.setProvince(listAddress.get(0).getProvince());
			record.setCity(listAddress.get(0).getCity());
			record.setArea(listAddress.get(0).getArea());
			record.setAddress(listAddress.get(0).getAddress());
			record.setPhone(listAddress.get(0).getPhone());
			record.setEmail(listAddress.get(0).getEmail());
			record.setCode(listAddress.get(0).getCode());
			shopOrderService.update(record);
		}else {
			shopOrderService.update(record);
		}
	}
	
	@RequestMapping("/update2")
	public String update2(ShopOrder record, HttpSession session) {
		List<ShopOrder> list = shopOrderService.select(record);
		
		VipUser vipuser = (VipUser) session.getAttribute("vipuser");
		VipUser vipUser = new VipUser();
		vipUser.setId(vipuser.getId());
		vipUser.setRechargeMoney(vipuser.getRechargeMoney().subtract(list.get(0).getTotalMoney()));
		vipuserService.update(vipUser);
		session.setAttribute("vipuser", vipUser);
		
		ShopOrderGoods shopOrderGoods = new ShopOrderGoods();
		shopOrderGoods.setOrderId(Integer.parseInt(list.get(0).getOrderSn()));
		List<ShopOrderGoods> listshopOrderGoods = shopOrderGoodsService.select(shopOrderGoods);
		for (ShopOrderGoods shopOrderGoods2 : listshopOrderGoods) {
			Goods goods = new Goods();
			goods.setId(shopOrderGoods2.getGoodsId());
			int goodsnum = goodsService.select(goods).get(0).getGoodsNumber()-1;
			Goods goods1 = new Goods();
			goods1.setId(shopOrderGoods2.getGoodsId());
			goods1.setGoodsNumber(goodsnum);
			goodsService.update(goods1);
		}
		
		record.setShopState(1);
		shopOrderService.update(record);
		return "/WEB-INF/page/vip/pay";
	}
	
	@RequestMapping("/update3")
	@ResponseBody
	public int updat3(ShopOrder record) {
		return shopOrderService.update(record);
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public int delete(int id) {
		return shopOrderService.delete(id);
	}
	
}
