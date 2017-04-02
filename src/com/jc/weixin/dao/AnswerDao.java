package com.jc.weixin.dao;

import java.util.List;

import com.jc.weixin.entity.mysql.Answer;

public interface AnswerDao {
	public List<Answer> getAnswerListByQuestionsid(Integer questionsid);
	
	public Answer getResult(Integer questionsid,Integer xh);
}
