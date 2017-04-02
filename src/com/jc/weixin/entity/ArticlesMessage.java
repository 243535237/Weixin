package com.jc.weixin.entity;

import java.util.List;

import com.jc.weixin.entity.child.Articles;

public class ArticlesMessage extends BaseMessage {
	private Integer ArticleCount;
	private List<Articles> Articles;
	public Integer getArticleCount() {
		return ArticleCount;
	}
	public void setArticleCount(Integer articleCount) {
		ArticleCount = articleCount;
	}
	public List<Articles> getArticles() {
		return Articles;
	}
	public void setArticles(List<Articles> articles) {
		Articles = articles;
	}
	
	
}
