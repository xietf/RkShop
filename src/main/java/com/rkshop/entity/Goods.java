package com.rkshop.entity;

import java.math.BigDecimal;
import java.util.Date;

public class Goods {

    private Integer id;

    private String goodsName;

    private String goodsImg;

    private String goodsSn;

    private BigDecimal marketPrice;

    private BigDecimal sellPrice;

    private Integer goodsNumber;

    private Integer isOnSale;

    private Date addTime;

    private Integer clickCount;

    private Integer isNew;

    private Integer catalogId;

    private Integer isHot;

    private String description;
    
    private Integer pricemin;
    
    private Integer pricemax;
    
    private String zonghe;
    
    
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

    public String getGoodsSn() {
        return goodsSn;
    }

    public void setGoodsSn(String goodsSn) {
        this.goodsSn = goodsSn == null ? null : goodsSn.trim();
    }

    public BigDecimal getMarketPrice() {
        return marketPrice;
    }

    public void setMarketPrice(BigDecimal marketPrice) {
        this.marketPrice = marketPrice;
    }

    public BigDecimal getSellPrice() {
        return sellPrice;
    }

    public void setSellPrice(BigDecimal sellPrice) {
        this.sellPrice = sellPrice;
    }

    public Integer getGoodsNumber() {
        return goodsNumber;
    }

    public void setGoodsNumber(Integer goodsNumber) {
        this.goodsNumber = goodsNumber;
    }

    public Integer getIsOnSale() {
        return isOnSale;
    }

    public void setIsOnSale(Integer isOnSale) {
        this.isOnSale = isOnSale;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public Integer getClickCount() {
        return clickCount;
    }

    public void setClickCount(Integer clickCount) {
        this.clickCount = clickCount;
    }

    public Integer getIsNew() {
        return isNew;
    }

    public void setIsNew(Integer isNew) {
        this.isNew = isNew;
    }

    public Integer getCatalogId() {
        return catalogId;
    }

    public void setCatalogId(Integer catalogId) {
        this.catalogId = catalogId;
    }

    public Integer getIsHot() {
        return isHot;
    }

    public void setIsHot(Integer isHot) {
        this.isHot = isHot;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

	public Integer getPricemin() {
		return pricemin;
	}

	public void setPricemin(Integer pricemin) {
		this.pricemin = pricemin;
	}

	public Integer getPricemax() {
		return pricemax;
	}

	public void setPricemax(Integer pricemax) {
		this.pricemax = pricemax;
	}

	public String getZonghe() {
		return zonghe;
	}

	public void setZonghe(String zonghe) {
		this.zonghe = zonghe;
	}

	@Override
	public String toString() {
		return "Goods [id=" + id + ", goodsName=" + goodsName + ", goodsImg=" + goodsImg + ", goodsSn=" + goodsSn
				+ ", marketPrice=" + marketPrice + ", sellPrice=" + sellPrice + ", goodsNumber=" + goodsNumber
				+ ", isOnSale=" + isOnSale + ", addTime=" + addTime + ", clickCount=" + clickCount + ", isNew=" + isNew
				+ ", catalogId=" + catalogId + ", isHot=" + isHot + ", description=" + description + ", pricemin="
				+ pricemin + ", pricemax=" + pricemax + ", zonghe=" + zonghe + "]";
	}
	
    
}