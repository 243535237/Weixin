package com.jc.weixin.dao;

import java.util.List;

import com.jc.weixin.entity.mysql.UserInfo;

public interface UserInfoDao {
	public boolean saveUser(UserInfo user);
	public boolean updateUser(UserInfo user);
	public UserInfo getUserInfoById(Integer id);
	public UserInfo getUserInfoByOpenId(String openId);
	public String getWzByOpenid(String openId);
	public boolean nameIsExists(String name);
	public boolean updateWzByOpenid(String openId,String wz);
	public boolean updateNameByOpenid(String openId,String name);
	public List<UserInfo> getUserInfoList(int start,int end);
	
	public Integer getFhbByOpenId(String openId);
	
	
	/**
	 * 增加或减少复活币
	 * @param openid
	 * @param sl
	 * @return 
	 */
	public boolean addFhb(String openid,int sl);
	
	
	public boolean clearGsAndZs(String openid,Integer gs,Integer zs);
	public boolean updateZs(String openid,int zs);
	public boolean updateGs(String openid,int gs);
	
	public boolean updateLszgZs(String openid);
	public boolean updateLszgGs(String openid);
	
}
