package com.jc.weixin.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import com.jc.weixin.dao.AnswerDao;
import com.jc.weixin.dao.QuestionsDao;
import com.jc.weixin.entity.mysql.Answer;
import com.jc.weixin.entity.mysql.Questions;
import com.jc.weixin.util.MySqlUtil;

public class QuestionsDaoImpl implements QuestionsDao {
	
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	private AnswerDao answerDao = new AnswerDaoImpl();

	@Override
	public Questions getQuestions(int passnum, int xh,boolean selChild) {
		Questions questions = null;
		try {
			String sql = "select * from questions where passnum= ? and xh = ?";
			con = MySqlUtil.getConnection();
			ps = con.prepareStatement(sql);
			ps.setInt(1,passnum);
			ps.setInt(2, xh);
			rs = ps.executeQuery();
			if(rs.next()){
				questions = new Questions();
				questions.setAnswertype(rs.getInt("answertype"));
				questions.setId(rs.getInt("id"));
				questions.setPassnum(rs.getInt("passnum"));
				questions.setPicture(rs.getString("picture"));
				questions.setSubject(rs.getString("subject"));
				questions.setXh(rs.getInt("xh"));
				if(selChild){
					List<Answer> list = answerDao.getAnswerListByQuestionsid(questions.getId());
					questions.setAnswerList(list);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			MySqlUtil.releaseResource(con, ps ,rs);
		}
		return questions;
	}

	@Override
	public Integer getZs() {
		int xh = 0;
		try {
			String sql = "select max(xh) from questions";
			con = MySqlUtil.getConnection();
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()){
				xh = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			MySqlUtil.releaseResource(con, ps ,rs);
		}
		return xh;
	}

}
