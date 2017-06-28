package com.pojo;

import java.math.BigDecimal;
import java.util.Date;

public class Goods {
    private Integer id;

    private String productno;

    private String productname;

    private String producttype;

    private String productstandard;

    private String supplierid;

    private String productdate;
    
    private String productdatestart;
    
    private String productdateend;

    private String unit;

    private BigDecimal price;

    private String remark;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProductno() {
        return productno;
    }

    public void setProductno(String productno) {
        this.productno = productno == null ? null : productno.trim();
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname == null ? null : productname.trim();
    }

    public String getProducttype() {
        return producttype;
    }

    public void setProducttype(String producttype) {
        this.producttype = producttype == null ? null : producttype.trim();
    }

    public String getProductstandard() {
        return productstandard;
    }

    public void setProductstandard(String productstandard) {
        this.productstandard = productstandard == null ? null : productstandard.trim();
    }

    public String getSupplierid() {
        return supplierid;
    }

    public void setSupplierid(String supplierid) {
        this.supplierid = supplierid == null ? null : supplierid.trim();
    }

    public String getProductdate() {
        return productdate;
    }

    public void setProductdate(String productdate) {
        this.productdate = productdate;
    }
    
    public String getProductdatestart() {
		return productdatestart;
	}

	public void setProductdatestart(String productdatestart) {
		this.productdatestart = productdatestart;
	}

	public String getProductdateend() {
		return productdateend;
	}

	public void setProductdateend(String productdateend) {
		this.productdateend = productdateend;
	}

	public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit == null ? null : unit.trim();
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }
}