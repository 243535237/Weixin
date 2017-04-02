package com.jc.weixin.dao;

import com.jc.weixin.entity.mysql.Questions;

public interface QuestionsDao {
	public Questions getQuestions(int passnum,int xh,boolean selChild);
	public Integer getZs();
}
