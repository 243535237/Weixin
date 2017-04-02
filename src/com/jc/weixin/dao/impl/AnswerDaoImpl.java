package com.jc.weixin.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.jc.weixin.dao.AnswerDao;
import com.jc.weixin.entity.mysql.Answer;
import com.jc.weixin.util.MySqlUtil;

public class AnswerDaoImpl implements AnswerDao {
	
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	@Override
	public List<Answer> getAnswerListByQuestionsid(Integer questionsid) {
		List<Answer> list = new ArrayList<Answer>();
		Answer answer = null;
		try {
			String sql = "select * from answer where questionsid= ? order by xh";
			con = MySqlUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1,questionsid);
			rs = ps.executeQuery();
			while(rs.next()){
				answer = new Answer();
				answer.setId(rs.getInt("id"));
				answer.setQuestionsid(rs.getInt("questionsid"));
				answer.setAnswer(rs.getString("answer"));
				answer.setPicture(rs.getString("picture"));
				answer.setDescribe(rs.getString("describe"));
				answer.setXh(rs.getInt("xh"));
				String event = rs.getString("eventid");
				if(event!=null && !event.equals("")){
					String[] array = event.split("#");
					Integer[] eventId = new Integer[array.length];
					for (int i = 0; i < array.length; i++) {
						eventId[i] = Integer.parseInt(array[i]);
					}
					answer.setEventid(eventId);
				}
				list.add(answer);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			MySqlUtil.releaseResource(con, ps ,rs);
		}
		return list;
	}

	@Override
	public Answer getResult(Integer questionsid, Integer xh) {
		Answer answer = null;
		try {
			String sql = "select * from answer where questionsid=2 and xh=?";
			con = MySqlUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1,questionsid);
			ps.setInt(2,xh);
			rs = ps.executeQuery();
			if(rs.next()){
				answer = new Answer();
				answer.setId(rs.getInt("id"));
				answer.setQuestionsid(rs.getInt("questionsid"));
				answer.setAnswer(rs.getString("answer"));
				answer.setPicture(rs.getString("picture"));
				answer.setDescribe(rs.getString("describe"));
				answer.setXh(rs.getInt("xh"));
				String event = rs.getString("eventid");
				if(event!=null && !event.equals("")){
					String[] array = event.split("#");
					Integer[] eventId = new Integer[array.length];
					for (int i = 0; i < array.length; i++) {
						eventId[i] = Integer.parseInt(array[i]);
					}
					answer.setEventid(eventId);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			MySqlUtil.releaseResource(con, ps ,rs);
		}
		return answer;
	}

}
