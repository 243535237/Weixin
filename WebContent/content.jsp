<%@page import="com.jc.weixin.entity.mysql.Questions"%>
<%@page import="com.jc.weixin.dao.impl.QuestionsDaoImpl"%>
<%@page import="com.jc.weixin.dao.QuestionsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String contextPath = request.getContextPath();    
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+contextPath+"/";
	String xh = request.getParameter("xh");
	String passnum = request.getParameter("passnum");
	QuestionsDao questionsDao = new QuestionsDaoImpl();
	Questions q = questionsDao.getQuestions(Integer.parseInt(passnum), Integer.parseInt(xh), false);
%>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>第<%=q.getPassnum() %>关---第<%=q.getXh() %>章</title>
</head>
<body>
	<h1>
		<%
			out.print("<img src='"+basePath+"/images/"+q.getPicture()+"'/><br/>"+q.getSubject());
		%>
	</h1>
</body>
</html>