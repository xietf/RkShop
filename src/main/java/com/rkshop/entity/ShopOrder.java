package com.rkshop.entity;

import java.math.BigDecimal;
import java.util.Date;

public class ShopOrder {

    private Integer id;

    private String orderSn;
    
    private String ordersn;

    private Date addTime;

    private String userName;

    private String province;

    private String city;

    private String area;

    private String address;

    private String phone;

    private String email;

    private String code;

    private Integer shopState;

    private Integer userId;

    private BigDecimal totalMoney;

    private String remark;
    
    private ShopOrderGoods shopOrderGoods;
    
    
    /**
     * GET¡¢SET·½·¨
     * @return
     */
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderSn() {
        return orderSn;
    }

    public void setOrderSn(String orderSn) {
        this.orderSn = orderSn == null ? null : orderSn.trim();
    }

    public String getOrdersn() {
		return ordersn;
	}

	public void setOrdersn(String ordersn) {
		this.ordersn = ordersn;
	}

	public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province == null ? null : province.trim();
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area == null ? null : area.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public Integer getShopState() {
        return shopState;
    }

    public void setShopState(Integer shopState) {
        this.shopState = shopState;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public BigDecimal getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(BigDecimal totalMoney) {
        this.totalMoney = totalMoney;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

	public ShopOrderGoods getShopOrderGoods() {
		return shopOrderGoods;
	}

	public void setShopOrderGoods(ShopOrderGoods shopOrderGoods) {
		this.shopOrderGoods = shopOrderGoods;
	}

	@Override
	public String toString() {
		return "ShopOrder [id=" + id + ", orderSn=" + orderSn + ", addTime=" + addTime + ", userName=" + userName
				+ ", province=" + province + ", city=" + city + ", area=" + area + ", address=" + address + ", phone="
				+ phone + ", email=" + email + ", code=" + code + ", shopState=" + shopState + ", userId=" + userId
				+ ", totalMoney=" + totalMoney + ", remark=" + remark + "]";
	}
    
}