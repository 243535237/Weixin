package com.jc.weixin.entity;

import com.jc.weixin.entity.child.Video;

public class VideoMessage extends BaseMessage {
	private Video Video;

	public Video getVideo() {
		return Video;
	}

	public void setVideo(Video video) {
		Video = video;
	}
	
}
