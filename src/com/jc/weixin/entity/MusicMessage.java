package com.jc.weixin.entity;

import com.jc.weixin.entity.child.Music;

public class MusicMessage extends BaseMessage  {
	private Music Music;

	public Music getMusic() {
		return Music;
	}

	public void setMusic(Music music) {
		Music = music;
	}
	
}
