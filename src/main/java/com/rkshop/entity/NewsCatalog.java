package com.rkshop.entity;

public class NewsCatalog {

    private Integer id;

    private String name;

    private Integer catalogId;

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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getCatalogId() {
        return catalogId;
    }

    public void setCatalogId(Integer catalogId) {
        this.catalogId = catalogId;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

	@Override
	public String toString() {
		return "NewsCatalog [id=" + id + ", name=" + name + ", catalogId=" + catalogId + ", remark=" + remark + "]";
	}
    
}