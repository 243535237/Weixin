package com.jc.weixin.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jc.weixin.dao.FollowDao;
import com.jc.weixin.entity.mysql.Follow;
import com.jc.weixin.util.MySqlUtil;

public class FollowDaoImpl implements FollowDao {
	
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	@Override
	public Integer save(Follow follow) {
		
		int resultid = 0;
		
		try {
			String sql = "insert into follow(openid,state,followdate) values (?,?,now())";
			
			con = MySqlUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setString(1, follow.getOpenid());
			ps.setInt(2, follow.getState());
			ps.execute();
			rs = ps.getGeneratedKeys(); // 获取结果
			if(rs.next()){
				resultid = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			MySqlUtil.releaseResource(con, ps ,rs);
		}
		return resultid;
	}

	@Override
	public boolean updateState(Follow follow,int type) {
		boolean result = false;
		try {
			String sql = "";
			if(type==1){
				sql = "update follow set state = 0 , cancelfollowdate = now() where id = ? ";
			}else{
				sql = "update follow set state = 1 , followdate = now() , cancelfollowdate = null  where id = ? ";
			}
			con = MySqlUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1, follow.getId());
			result = ps.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			MySqlUtil.releaseResource(con, ps ,rs);
		}
		return result;
	}

	@Override
	public Follow getFollow(Integer id) {
		Follow f = null;
		try {
			String sql = "select * from follow where id = "+id;
			con = MySqlUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				f = new Follow();
				f.setId(rs.getInt("id"));
				f.setOpenid(rs.getString("openid"));
				f.setFollowdate(rs.getTimestamp("followdate"));
				f.setState(rs.getInt("state"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			MySqlUtil.releaseResource(con, ps ,rs);
		}
		return f;
	}

	@Override
	public List<Follow> getFollowList(String content) {
		List<Follow> list = new ArrayList<Follow>();
		try {
			String sql = "select * from follow where 1=1 " + content;
			con = MySqlUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()){
				Follow f = new Follow();	
				f = new Follow();
				f.setId(rs.getInt("id"));
				f.setOpenid(rs.getString("openid"));
				f.setFollowdate(rs.getTimestamp("followdate"));
				f.setState(rs.getInt("state"));
				list.add(f);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			MySqlUtil.releaseResource(con, ps ,rs);
		}
		return list;
	}

	@Override
	public Follow getFollow(String openid) {
		Follow f = null;
		try {
			String sql = "select * from follow where openid = '"+openid+"'";
			con = MySqlUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				f = new Follow();
				f.setId(rs.getInt("id"));
				f.setOpenid(rs.getString("openid"));
				f.setFollowdate(rs.getTimestamp("followdate"));
				f.setState(rs.getInt("state"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			MySqlUtil.releaseResource(con, ps ,rs);
		}
		return f;
	}
	
}
