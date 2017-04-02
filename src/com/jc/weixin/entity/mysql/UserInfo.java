package com.jc.weixin.entity.mysql;

import java.util.Date;

/**
 * 用户信息表
 * @author Administrator
 *
 */
public class UserInfo {
	private Integer id;
	private String openid;
	private String name;
	private Date kssj;
	private Date jssj;
	private Integer fhbsl;
	private Integer dqzs;
	private Integer dqgs;
	private String wz;
	private Integer lszgzs;
	private Integer lszggs;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOpenid() {
		return openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getKssj() {
		return kssj;
	}
	public void setKssj(Date kssj) {
		this.kssj = kssj;
	}
	public Date getJssj() {
		return jssj;
	}
	public void setJssj(Date jssj) {
		this.jssj = jssj;
	}
	public Integer getFhbsl() {
		return fhbsl;
	}
	public void setFhbsl(Integer fhbsl) {
		this.fhbsl = fhbsl;
	}
	public Integer getDqzs() {
		return dqzs;
	}
	public void setDqzs(Integer dqzs) {
		this.dqzs = dqzs;
	}
	public Integer getDqgs() {
		return dqgs;
	}
	public void setDqgs(Integer dqgs) {
		this.dqgs = dqgs;
	}
	public Integer getLszgzs() {
		return lszgzs;
	}
	public void setLszgzs(Integer lszgzs) {
		this.lszgzs = lszgzs;
	}
	public Integer getLszggs() {
		return lszggs;
	}
	public void setLszggs(Integer lszggs) {
		this.lszggs = lszggs;
	}
	public String getWz() {
		return wz;
	}
	public void setWz(String wz) {
		this.wz = wz;
	}
	
}
