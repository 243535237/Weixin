package com.jc.weixin.dao;

import java.util.List;

import com.jc.weixin.entity.mysql.Follow;

public interface FollowDao {
	public Integer save(Follow follow);
	public boolean updateState (Follow follow,int type);
	public Follow getFollow(Integer id);
	public Follow getFollow(String openid);
	public List<Follow> getFollowList(String content);
}
