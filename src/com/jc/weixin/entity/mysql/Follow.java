package com.jc.weixin.entity.mysql;

import java.util.Date;

/**
 * �û���ע��¼��
 * @author Administrator
 *
 */
public class Follow {
	private int id;
	private String openid;
	private Date followdate;
	private Date cancelfollowdate;
	private int state; //0:δ��ע  1:��ע��
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOpenid() {
		return openid;
	}
	public void setOpenid(String openid) {
		this.openid = openid;
	}
	public Date getFollowdate() {
		return followdate;
	}
	public void setFollowdate(Date followdate) {
		this.followdate = followdate;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public Date getCancelfollowdate() {
		return cancelfollowdate;
	}
	public void setCancelfollowdate(Date cancelfollowdate) {
		this.cancelfollowdate = cancelfollowdate;
	}
	
}
