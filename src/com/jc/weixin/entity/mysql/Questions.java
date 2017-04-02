package com.jc.weixin.entity.mysql;

import java.util.List;

/**
 * Ã‚ø‚±Ì
 * @author Administrator
 *
 */
public class Questions {
	private Integer id;
	private Integer passnum;
	private String subject;
	private String picture;
	private Integer answertype;
	private Integer xh;
	private List<Answer> answerList;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getPassnum() {
		return passnum;
	}
	public void setPassnum(Integer passnum) {
		this.passnum = passnum;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public Integer getAnswertype() {
		return answertype;
	}
	public void setAnswertype(Integer answertype) {
		this.answertype = answertype;
	}
	public Integer getXh() {
		return xh;
	}
	public void setXh(Integer xh) {
		this.xh = xh;
	}
	public List<Answer> getAnswerList() {
		return answerList;
	}
	public void setAnswerList(List<Answer> answerList) {
		this.answerList = answerList;
	}
	
}
