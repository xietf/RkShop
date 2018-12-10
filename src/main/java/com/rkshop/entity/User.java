package com.rkshop.entity;

import java.util.Date;

public class User {

    private Integer id;

    private String username;

    private String password;

    private Integer status;

    private Date createTime;

    private Date lastLoginTime;

    private String remark;
    
    
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", status=" + status
				+ ", createTime=" + createTime + ", lastLoginTime=" + lastLoginTime + ", remark=" + remark + "]";
	}
    
    
}