package com.rkshop.entity;

import java.math.BigDecimal;
import java.util.Date;

public class ShopOrderGoods {

    private Integer id;

    private Integer goodsId;

    private Integer userId;

    private Date addTime;

    private String goodsName;

    private String goodsImg;

    private BigDecimal price;

    private Integer goNum;

    private BigDecimal totalPrice;

    private Integer orderId;

    private String goodsSn;

    private Integer catalogId;
    
    
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

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public String getGoodsName() {
        return goodsName;
    }

    public void setGoodsName(String goodsName) {
        this.goodsName = goodsName == null ? null : goodsName.trim();
    }

    public String getGoodsImg() {
        return goodsImg;
    }

    public void setGoodsImg(String goodsImg) {
        this.goodsImg = goodsImg == null ? null : goodsImg.trim();
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getGoNum() {
        return goNum;
    }

    public void setGoNum(Integer goNum) {
        this.goNum = goNum;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getGoodsSn() {
        return goodsSn;
    }

    public void setGoodsSn(String goodsSn) {
        this.goodsSn = goodsSn == null ? null : goodsSn.trim();
    }

    public Integer getCatalogId() {
        return catalogId;
    }

    public void setCatalogId(Integer catalogId) {
        this.catalogId = catalogId;
    }

	@Override
	public String toString() {
		return "ShopOrderGoods [id=" + id + ", goodsId=" + goodsId + ", userId=" + userId + ", addTime=" + addTime
				+ ", goodsName=" + goodsName + ", goodsImg=" + goodsImg + ", price=" + price + ", goNum=" + goNum
				+ ", totalPrice=" + totalPrice + ", orderId=" + orderId + ", goodsSn=" + goodsSn + ", catalogId="
				+ catalogId + "]";
	}
    
}