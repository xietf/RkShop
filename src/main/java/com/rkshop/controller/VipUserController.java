package com.rkshop.controller;

import java.io.File;
import java.math.BigDecimal;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.rkshop.entity.RechargeLog;
import com.rkshop.entity.ShopOrder;
import com.rkshop.entity.User;
import com.rkshop.entity.VipUser;
import com.rkshop.service.RechargeLogService;
import com.rkshop.service.ShopOrderService;
import com.rkshop.service.VipUserService;

@Controller
@RequestMapping("/vipuser")
public class VipUserController {

	@Autowired
	private VipUserService vipUserService;
	@Autowired
	RechargeLogService rechargeLogService;
	@Autowired
	private ShopOrderService shopOrderService;

	/**
	 * 用户登录代码
	 * @param session
	 * @param record
	 * @param modelmap
	 * @return
	 */
	@RequestMapping("/login")
	public String login(HttpSession session, VipUser record, ModelMap modelmap) {
		List<VipUser> list = vipUserService.select(record);
		if (list.size() > 0) {
			String lastIp = null;
			try {
				lastIp = InetAddress.getLocalHost().getHostAddress().toString();
			} catch (UnknownHostException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			record = list.get(0);
			record.setLastLoginTime(new Date());
			record.setLastIp(lastIp);
			vipUserService.update(record);
			session.setAttribute("vipuser", list.get(0));
			return "/page/index";
		} else {
			modelmap.put("result", 2);
			return "/page/login";
		}
	}

	@RequestMapping("/outLogin")
	public String outLogin(HttpSession session) {
		session.removeAttribute("vipuser");
		return "/page/index";

	}

	@RequestMapping("/YNlogin")
	public String YNlogin(HttpSession session) {
		if (session.getAttribute("vipuser") == null) {
			return "/page/login";
		} else {
			return "/WEB-INF/page/vip/center";
		}
	}

	@RequestMapping("/goPersonalCenter")
	public String goPersonalCenter(HttpSession session, ModelMap modelmap) {
		try {
			String ip = InetAddress.getLocalHost().getHostAddress().toString();
			VipUser vipuser = (VipUser) session.getAttribute("vipuser");
			int weiwancheng = 0;
			int yiwancheng = 0;

			ShopOrder shopOrder = new ShopOrder();
			shopOrder.setUserId(vipuser.getId());
			List<ShopOrder> listshopOrder = shopOrderService.select(shopOrder);
			for (ShopOrder shopOrder2 : listshopOrder) {
				switch (shopOrder2.getShopState()) {
				case -1:
				case 0:
				case 1:
					weiwancheng += 1;
					break;
				case 2:
					yiwancheng += 1;
					break;
				}
			}
			
			VipUser vipUser = new VipUser();
			vipUser.setId(vipuser.getId());
			List<VipUser> listvipUser = vipUserService.select(vipUser);
			
			modelmap.put("vipUser", listvipUser.get(0));
			modelmap.put("weiwancheng", weiwancheng);
			modelmap.put("yiwancheng", yiwancheng);
			modelmap.put("ip", ip);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "/WEB-INF/page/vip/personalCenter";
	}

	@RequestMapping("/list")
	public String listByPage(@RequestParam(value = "pageNum", required = false, defaultValue = "1") int pageNum,
			@RequestParam(value = "pageSize", required = false, defaultValue = "10") int pageSize, VipUser record,
			String mak, ModelMap modelmap) {

		PageHelper.startPage(pageNum, pageSize);
		List<VipUser> list = vipUserService.select(record);
		PageInfo<VipUser> pageInfo = new PageInfo<>(list);
		modelmap.put("pageInfo", pageInfo);

		if (mak != null) {
			return "/WEB-INF/page/vip/vipuserInfo";
		} else {
			return "/WEB-INF/page/admin/joint/vipuser/vipUserList";
		}
	}
	
	@RequestMapping("/insert")
	public String insert(VipUser record, String code, ModelMap modelmap, HttpSession session) {

		String yanzhengma = (String) session.getAttribute("yanzhengma");

		if (yanzhengma.equals(code)) {
			record.setAddTime(new Date());
			vipUserService.insert(record);
			modelmap.put("insertResult", 1);
			return "/page/register";
		} else {
			modelmap.put("insertResult", 2);
			return "/page/register";
		}

	}

	@PostMapping("/update")
	@ResponseBody
	public String uploadFile(VipUser record, @RequestParam("fileimg") MultipartFile fileimg, HttpSession session)
			throws Exception {

		String filename = fileimg.getOriginalFilename();

		System.out.println("userImg1:" + filename);

		if (filename == null || filename.equals("")) {
			filename = record.getUserImg();
			System.out.println("userImg2:" + filename);
		}
		System.out.println("userImg3:" + filename);
		String fileName = record.getUsername() + filename.substring(filename.lastIndexOf("."));
		String basePath = session.getServletContext().getRealPath("/public/images/");
		File baseFile = new File(basePath);
		if (!baseFile.exists()) {
			baseFile.mkdirs();
		}
		String savePath = basePath + fileName;
		fileimg.transferTo(new File(savePath));

		record.setUserImg(fileName);
		int rowcount = vipUserService.update(record);
		System.out.println(savePath);
		System.out.println(record.toString());
		return "�޸ĳɹ�";
	}

	@RequestMapping("/update")
	public int update(VipUser record) {
		return vipUserService.update(record);
	}

	@RequestMapping("/delete")
	@ResponseBody
	public int delete(int id) {
		return vipUserService.delete(id);
	}

	@RequestMapping("/toChongzhi")
	public String toChongzhi(VipUser record, ModelMap modelmap) {
		List<VipUser> list = vipUserService.select(record);
		VipUser vipuser = list.get(0);
		modelmap.put("vipuser", vipuser);
		return "/WEB-INF/page/vip/chongzhi";
	}

	@RequestMapping("/chongzhi")
	@ResponseBody
	public int chongzhi(VipUser record, BigDecimal money) {

		SimpleDateFormat sim = new SimpleDateFormat("MMddHHmmss");
		String rechargeSn = sim.format(new Date());

		RechargeLog rechargeLog = new RechargeLog();
		rechargeLog.setMoney(record.getRechargeMoney());
		rechargeLog.setUserId(record.getId());
		rechargeLog.setAddTime(new Date());
		rechargeLog.setRechargeSn(rechargeSn);
		rechargeLogService.insert(rechargeLog);

		record.setRechargeMoney(record.getRechargeMoney().add(money));
		int rowcount = vipUserService.update(record);

		return rowcount;
	}

	@RequestMapping("/toupdataPassword")
	public String toupdataPassword(VipUser record, ModelMap modelmap) {
		List<VipUser> list = vipUserService.select(record);
		modelmap.put("vipuser", list.get(0));
		return "/WEB-INF/page/vip/updatePassword";
	}

}
