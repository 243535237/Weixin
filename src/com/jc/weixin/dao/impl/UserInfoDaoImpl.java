package com.jc.weixin.dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jc.weixin.dao.UserInfoDao;
import com.jc.weixin.entity.mysql.UserInfo;
import com.jc.weixin.util.MySqlUtil;

public class UserInfoDaoImpl implements UserInfoDao {
	
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	@Override
	public boolean saveUser(UserInfo user) {
		boolean result = false;
		try {
			String sql = "INSERT INTO `userinfo`(`openid`, `name`, `kssj`, `fhbsl`,`wz`) VALUES (?,?,now(),?,?) ";
			con = MySqlUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getOpenid());
			ps.setString(2, user.getName());
			ps.setInt(3, user.getFhbsl());
			ps.setString(4, user.getWz());
			int count = ps.executeUpdate();
			System.out.println(count);
			if(count>0){
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			MySqlUtil.releaseResource(con, ps ,rs);
		}
		return result;
	}

	@Override
	public boolean updateUser(UserInfo user) {
		boolean result = false;
		try {
			String sql = "UPDATE `userinfo` SET `openid`= ?,`name`= ?,`kssj`= ?,`jssj`= ?,`fhbsl`= ?,`dqzs`= ?,`dqgs`= ?,`wz`= ?,`lszgzs`= ?,`lszggs`= ? WHERE `id` = ?";
			con = MySqlUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, user.getOpenid());
			ps.setString(2, user.getName());
			java.sql.Date kssj = null;
			if(user.getKssj()!=null){
				kssj = new Date(user.getKssj().getTime());
			}
			java.sql.Date jssj = null;
			if(user.getJssj()!=null){
				jssj = new Date(user.getJssj().getTime());
			}
			ps.setDate(3,kssj);
			ps.setDate(4,jssj);
			ps.setInt(5, user.getFhbsl());
			ps.setInt(6, user.getDqzs());
			ps.setInt(7, user.getDqgs());
			ps.setString(8, user.getWz());
			ps.setInt(9, user.getLszgzs());
			ps.setInt(10, user.getLszggs());
			ps.setInt(11, user.getId());
			int count = ps.executeUpdate();
			if(count>0){
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public UserInfo getUserInfoById(Integer id) {
		UserInfo user = null;
		try {
			String sql = "select * from userinfo where id="+id;
			con = MySqlUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				user = new UserInfo();
				user.setId(rs.getInt("id"));
				user.setOpenid(rs.getString("openid"));
				user.setName(rs.getString("name"));
				user.setKssj(rs.getTimestamp("kssj"));
				user.setJssj(rs.getTimestamp("jssj"));
				user.setFhbsl(rs.getInt("fhbsl"));
				user.setDqzs(rs.getInt("dqzs"));
				user.setDqgs(rs.getInt("dqgs"));
				user.setWz(rs.getString("wz"));
				user.setLszgzs(rs.getInt("lszgzs"));
				user.setLszggs(rs.getInt("lszggs"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			MySqlUtil.releaseResource(con, ps ,rs);
		}
		return user;
	}

	@Override
	public UserInfo getUserInfoByOpenId(String openId) {
		UserInfo user = null;
		try {
			String sql = "select * from userinfo where openid='"+openId+"'";
			con = MySqlUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				user = new UserInfo();
				user.setId(rs.getInt("id"));
				user.setOpenid(rs.getString("openid"));
				user.setName(rs.getString("name"));
				user.setKssj(rs.getTimestamp("kssj"));
				user.setJssj(rs.getTimestamp("jssj"));
				user.setFhbsl(rs.getInt("fhbsl"));
				user.setDqzs(rs.getInt("dqzs"));
				user.setDqgs(rs.getInt("dqgs"));
				user.setWz(rs.getString("wz"));
				user.setLszgzs(rs.getInt("lszgzs"));
				user.setLszggs(rs.getInt("lszggs"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			MySqlUtil.releaseResource(con, ps ,rs);
		}
		return user;
	}

	@Override
	public String getWzByOpenid(String openId) {
		String wz = "";
		try {
			String sql = "select wz from userinfo where openid='"+openId+"'";
			con = MySqlUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				wz = rs.getString("wz");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			MySqlUtil.releaseResource(con, ps ,rs);
		}
		return wz;
	}

	@Override
	public boolean nameIsExists(String name) {
		boolean result = false;
		try {
			String sql = "select id from userinfo where name='"+name+"'";
			con = MySqlUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			MySqlUtil.releaseResource(con, ps ,rs);
		}
		return result;
	}

	@Override
	public boolean updateWzByOpenid(String openId, String wz) {
		boolean result = false;
		try {
			String sql = "UPDATE `userinfo` SET `wz`= ? WHERE `openId` = ?";
			con = MySqlUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, wz);
			ps.setString(2, openId);
			int count = ps.executeUpdate();
			if(count>0){
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean updateNameByOpenid(String openId, String name) {
		boolean result = false;
		try {
			String sql = "UPDATE `userinfo` SET `name`= ? WHERE `openId` = ?";
			con = MySqlUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, openId);
			int count = ps.executeUpdate();
			if(count>0){
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public List<UserInfo> getUserInfoList(int start, int end) {
		List<UserInfo> list = new ArrayList<UserInfo>();
		UserInfo user = null;
		try {
			String sql = "select * from userinfo where name is not null ORDER BY lszggs desc,lszgzs desc LIMIT "+start+","+end+"";
			con = MySqlUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				user = new UserInfo();
				user.setId(rs.getInt("id"));
				user.setOpenid(rs.getString("openid"));
				user.setName(rs.getString("name"));
				user.setKssj(rs.getTimestamp("kssj"));
				user.setJssj(rs.getTimestamp("jssj"));
				user.setFhbsl(rs.getInt("fhbsl"));
				user.setDqzs(rs.getInt("dqzs"));
				user.setDqgs(rs.getInt("dqgs"));
				user.setWz(rs.getString("wz"));
				user.setLszgzs(rs.getInt("lszgzs"));
				user.setLszggs(rs.getInt("lszggs"));
				list.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			MySqlUtil.releaseResource(con, ps ,rs);
		}
		return list;
	}

	@Override
	public Integer getFhbByOpenId(String openId) {
		Integer fhbsl = 0;
		try {
			String sql = "select fhbsl from userinfo where openid = ?";
			con = MySqlUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1,openId );
			rs = ps.executeQuery();
			if(rs.next()){
				fhbsl = rs.getInt("fhbsl");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			MySqlUtil.releaseResource(con, ps ,rs);
		}
		return fhbsl;
	}
	
	@Override
	public boolean addFhb(String openid, int sl) {
		boolean result = false;
		try {
			con = MySqlUtil.getConnection();
			String sql = "";
			if(sl!=-9999){
				sql = "UPDATE `userinfo` SET `fhbsl`= `fhbsl`+? WHERE `openId` = ?";
				ps = con.prepareStatement(sql);
				ps.setInt(1, sl);
				ps.setString(2, openid);
			}else{
				sql = "UPDATE `userinfo` SET `fhbsl`= 0 WHERE `openId` = ?";
				ps.setString(1, openid);
			}
			
			int count = ps.executeUpdate();
			if(count>0){
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean clearGsAndZs(String openid,Integer gs,Integer zs) {
		boolean result = false;
		try {
			con = MySqlUtil.getConnection();
			String sql = "UPDATE `userinfo` SET `dqzs`= ?,`dqgs`= ? WHERE `openId` = ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, zs);
			ps.setInt(2, gs);
			ps.setString(3, openid);
			int count = ps.executeUpdate();
			if(count>0){
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean updateZs(String openid, int zs) {
		boolean result = false;
		try {
			String sql = "UPDATE `userinfo` SET `dqzs`= `dqzs`+? WHERE `openId` = ?";
			con = MySqlUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, zs);
			ps.setString(2, openid);
			int count = ps.executeUpdate();
			
			if(count>0){
				result = true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		updateLszgZs(openid);
		
		return result;
	}

	@Override
	public boolean updateGs(String openid, int gs) {
		boolean result = false;
		try {
			String sql = "UPDATE `userinfo` SET `dqgs`= `dqgs`+? WHERE `openId` = ?";
			con = MySqlUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, gs);
			ps.setString(2, openid);
			int count = ps.executeUpdate();
			if(count>0){
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean updateLszgZs(String openid) {
		boolean result = false;
		try {
			
			int dqzs = getUserInfoByOpenId(openid).getDqzs();
			int lszs = getUserInfoByOpenId(openid).getLszgzs();
			
			if(dqzs>lszs){
				String sql = "UPDATE `userinfo` SET `lszgzs`= "+dqzs+" WHERE `openId` = ?";
				con = MySqlUtil.getConnection();
				ps = con.prepareStatement(sql);
				ps.setString(1, openid);
				int count = ps.executeUpdate();
				if(count>0){
					result = true;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public boolean updateLszgGs(String openid) {
		boolean result = false;
		try {
			
			int dqgs = getUserInfoByOpenId(openid).getDqgs();
			int lsgs = getUserInfoByOpenId(openid).getLszggs();
			
			if(dqgs>lsgs){
				String sql = "UPDATE `userinfo` SET `lszggs`= "+dqgs+" WHERE `openId` = ?";
				con = MySqlUtil.getConnection();
				ps = con.prepareStatement(sql);
				ps.setString(1, openid);
				int count = ps.executeUpdate();
				if(count>0){
					result = true;
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
}
