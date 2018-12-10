package com.rkshop.controller;

import java.io.File;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rkshop.entity.Goods;
import com.rkshop.entity.GoodsCatalog;
import com.rkshop.entity.ShopOrder;
import com.rkshop.entity.ShopOrderGoods;
import com.rkshop.entity.UserAddress;
import com.rkshop.entity.UserCartLog;
import com.rkshop.entity.VipUser;
import com.rkshop.service.GoodsCatalogService;
import com.rkshop.service.GoodsService;
import com.rkshop.service.ShopOrderGoodsService;
import com.rkshop.service.ShopOrderService;
import com.rkshop.service.UserAddressService;

@Controller
@RequestMapping("/goods")
public class GoodsController {

	@Autowired
	private GoodsService goodsService;
	@Autowired
	private GoodsCatalogService goodsCatalogService;
	@Autowired
	private UserAddressService userAddressService;
	@Autowired
	private ShopOrderService shopOrderService;
	@Autowired
	private ShopOrderGoodsService shopOrderGoodsService;

	/**
	 * 商品显示代码
	 * @param pageNum
	 * @param pageSize
	 * @param record
	 * @param price
	 * @param zonghe
	 * @param modelmap
	 * @return
	 */
	@RequestMapping("/GoodslistByPage")
	public String GoodslistByPage(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize, Goods record,
			String price, String zonghe, ModelMap modelmap) {

		if (record.getGoodsName() != null) {
			record.setGoodsName("%" + record.getGoodsName() + "%");
		}
		if (record.getCatalogId() == null || record.getCatalogId() == 0) {
			record.setCatalogId(null);
		}
		if (price == null || price.equals("0")) {
			price = null;
		} else if (price.equals("1")) {
			record.setPricemin(0);
			record.setPricemax(100);
		} else if (price.equals("2")) {
			record.setPricemin(101);
			record.setPricemax(500);
		} else if (price.equals("3")) {
			record.setPricemin(501);
			record.setPricemax(1000);
		} else if (price.equals("4")) {
			record.setPricemin(1001);
			record.setPricemax(2000);
		} else if (price.equals("5")) {
			record.setPricemin(2001);
		}
		if (zonghe == null || zonghe.equals("0")) {
			record.setZonghe(null);
		} else if (zonghe.equals("1")) {
			record.setZonghe("1");
		} else if (zonghe.equals("2")) {
			record.setZonghe("2");
		} else if (zonghe.equals("3")) {
			record.setZonghe("3");
		}

		PageHelper.startPage(pageNum, pageSize);
		List<Goods> list = goodsService.select(record);
		PageInfo<Goods> pageInfo = new PageInfo<>(list);
		modelmap.put("pageInfo", pageInfo);

		if (record.getIsNew() != null && record.getIsNew() == 1) {
			if (pageSize == 20) {
				return "/page/newGoodsList";
			}
			return "/page/index/newGoodsList";
		} else if (record.getIsHot() != null && record.getIsHot() == 1) {
			if (pageSize == 20) {
				return "/page/hotGoodsList";
			}
			return "/page/index/hotGoodsList";
		} else if (record.getId() != null) {
			record.setClickCount(list.get(0).getClickCount() + 1);
			goodsService.update(record);
			return "/page/goodsInfo";
		} else if (record.getGoodsName() != null) {
			modelmap.put("goodsName", record.getGoodsName());
			return "/page/getGoodsByLike";
		} else {
			return "/page/goodsList2";
		}
	}

	@RequestMapping("/buy")
	public String buy(HttpSession session, Goods record, int goodsNum, ModelMap modelmap) {

		BigDecimal allPrice = new BigDecimal(0);
		SimpleDateFormat sim = new SimpleDateFormat("MMddHHmmss");
		String orderSn = sim.format(new Date());

		try {
			VipUser vipuser = (VipUser) session.getAttribute("vipuser");
			UserAddress userAddress = new UserAddress();
			userAddress.setUserId(vipuser.getId());
			userAddress.setIsDefault(1);
			List<UserAddress> listAddress = userAddressService.select(userAddress);

			List<Goods> list = goodsService.select(record);
			for (Goods goods : list) {
				ShopOrderGoods shopOrderGoods = new ShopOrderGoods();
				shopOrderGoods.setGoodsId(goods.getId());
				shopOrderGoods.setUserId(vipuser.getId());
				shopOrderGoods.setGoodsName(goods.getGoodsName());
				shopOrderGoods.setGoodsImg(goods.getGoodsImg());
				shopOrderGoods.setPrice(goods.getSellPrice());
				shopOrderGoods.setGoNum(goodsNum);
				shopOrderGoods.setTotalPrice(goods.getSellPrice().multiply(new BigDecimal(goodsNum)));
				shopOrderGoods.setGoodsSn(goods.getGoodsSn());
				shopOrderGoods.setCatalogId(goods.getCatalogId());
				shopOrderGoods.setAddTime(new Date());
				shopOrderGoods.setOrderId(Integer.parseInt(orderSn));
				shopOrderGoodsService.insert(shopOrderGoods);
				allPrice = goods.getSellPrice().multiply(new BigDecimal(goodsNum));
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
			modelmap.put("userId", vipuser.getId());
			modelmap.put("goodsNum", goodsNum);
			modelmap.put("allPrice", allPrice);
			modelmap.put("list", list);
			return "/WEB-INF/page/vip/writeorder2";
		} catch (Exception e) {
			System.out.println("δ��¼");
			return "/page/login";
		}
	}

	@RequestMapping("/list")
	public String list(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize, Goods record,
			ModelMap modelmap) {

		PageHelper.startPage(pageNum, pageSize);
		List<Goods> list = goodsService.select(record);
		PageInfo<Goods> pageInfo = new PageInfo<>(list);
		modelmap.put("pageInfo", pageInfo);

		return "/WEB-INF/page/admin/joint/goods/goodsList";
	}

	@RequestMapping("/toinsert")
	public String toinsert(Goods record) {
		return "/WEB-INF/page/admin/joint/goods/goodsAdd";
	}

	@RequestMapping("/insert")
	public String insert(Goods record, HttpSession session, @RequestParam("imgfile") MultipartFile imgfile)
			throws Exception {
		String filename = imgfile.getOriginalFilename();

		String fileName = record.getGoodsName() + filename.substring(filename.lastIndexOf("."));
		String basePath = session.getServletContext().getRealPath("/public/images/");
		File baseFile = new File(basePath);
		if (!baseFile.exists()) {
			baseFile.mkdirs();
		}
		String savePath = basePath + fileName;
		imgfile.transferTo(new File(savePath));

		record.setGoodsImg(fileName);
		record.setAddTime(new Date());
		int rowcount = goodsService.insert(record);
		return "/WEB-INF/page/admin/index";
	}

	@RequestMapping("/toupdate")
	public String toupdate(Goods record, ModelMap modelmap) {
		List<Goods> listgoods = goodsService.select(record);
		
		GoodsCatalog goodsCatalog = new GoodsCatalog();
		//goodsCatalog.setId(listgoods.get(0).getCatalogId());
		List<GoodsCatalog> listgoodsCatalog = goodsCatalogService.select(goodsCatalog);
		
		GoodsCatalog goodsCatalog2 = new GoodsCatalog();
		goodsCatalog2.setId(listgoods.get(0).getCatalogId());
		List<GoodsCatalog> listgoodsCatalog2 = goodsCatalogService.select(goodsCatalog2);
		
		modelmap.put("listgoodsCatalog", listgoodsCatalog);
		modelmap.put("goodscatalog", listgoodsCatalog2.get(0));
		modelmap.put("goods", listgoods.get(0));
		return "/WEB-INF/page/admin/joint/goods/goodsUpdate";
	}

	@RequestMapping("/update")
	public String update(Goods record, String catalogid, HttpSession session, @RequestParam("imgfile") MultipartFile imgfile)
			throws Exception {
		
		String filename = imgfile.getOriginalFilename();
		System.out.println("1df:"+filename);
		System.out.println("2df:"+catalogid);
		String fileName = record.getGoodsName() + filename.substring(filename.lastIndexOf("."));
		String basePath = session.getServletContext().getRealPath("/public/images/");
		File baseFile = new File(basePath);
		if (!baseFile.exists()) {
			baseFile.mkdirs();
		}
		String savePath = basePath + fileName;
		imgfile.transferTo(new File(savePath));

		record.setGoodsImg(fileName);
		record.setAddTime(new Date());
		record.setCatalogId(Integer.parseInt(catalogid));
		goodsService.update(record);
		return "/WEB-INF/page/admin/index";
	}

	@RequestMapping("/delete")
	@ResponseBody
	public int delete(int id) {
		return goodsService.delete(id);
	}

}
