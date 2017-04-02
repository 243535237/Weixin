package com.jc.weixin.entity;

import com.jc.weixin.entity.child.Image;

public class ImageMessage extends BaseMessage {
	private Image Image;

	public Image getImage() {
		return Image;
	}

	public void setImage(Image image) {
		Image = image;
	}
	
}

