package com.rkshop.entity;

import java.util.Date;

public class UserCartLog {

    private Integer id;

    private Integer userId;

    private Integer goodsId;

    private Date addTime;

    private Integer goNum;
    
    private Goods goods;
    
    private String ids;
    

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

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getGoodsId() {
        return goodsId;
    }

    public void setGoodsId(Integer goodsId) {
        this.goodsId = goodsId;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public Integer getGoNum() {
        return goNum;
    }

    public void setGoNum(Integer goNum) {
        this.goNum = goNum;
    }
    
    public Goods getGoods() {
		return goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	@Override
	public String toString() {
		return "UserCartLog [id=" + id + ", userId=" + userId + ", goodsId=" + goodsId + ", addTime=" + addTime
				+ ", goNum=" + goNum + ", goods=" + goods + ", ids=" + ids + "]";
	}
	
}