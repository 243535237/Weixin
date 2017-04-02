package com.jc.weixin.entity;

public class TextMessage extends BaseMessage {
	private String Content;
	
	
	public TextMessage(){};
	
	public TextMessage(String toUserName,String fromUserName,Long createTime,String msgType){
		super.setToUserName(toUserName);
		super.setFromUserName(fromUserName);
		super.setCreateTime(createTime);
		super.setMsgType(msgType);
	};

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}
	
}
