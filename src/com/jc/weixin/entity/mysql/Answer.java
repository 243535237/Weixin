package com.jc.weixin.entity.mysql;

public class Answer {
	private Integer id;
	private Integer questionsid;
	private String answer;
	private String picture;
	private String describe;
	private Integer[] eventid;
	private Integer xh;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getQuestionsid() {
		return questionsid;
	}
	public void setQuestionsid(Integer questionsid) {
		this.questionsid = questionsid;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getPicture() {
		return picture;
	}
	public void setPicture(String picture) {
		this.picture = picture;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public Integer[] getEventid() {
		return eventid;
	}
	public void setEventid(Integer[] eventid) {
		this.eventid = eventid;
	}
	public Integer getXh() {
		return xh;
	}
	public void setXh(Integer xh) {
		this.xh = xh;
	}
	
}
