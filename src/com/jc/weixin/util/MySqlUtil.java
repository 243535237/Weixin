package com.jc.weixin.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class MySqlUtil {
	
	//服务器接口地址：http://tetest.ecs12.tomcats.pw/Weixin/CoreServlet
	
	//本地接口地址http://y5vvcehurp.proxy.qqbrowser.cc/Weixin/CoreServlet
	
	//useUnicode=true&amp;characterEncoding=UTF-8
	
	//private static String url = "jdbc:mysql://localhost:3306/tetest?characterEncoding=UTF-8";
	//private static String url = "jdbc:mysql://localhost:3306/tetest";
	private static String url = "jdbc:mysql://ecs12.tomcats.pw:3112/tetest";
	private static String userName = "tetest";
	private static String password = "15736419";
	//private static String userName = "root";
	//private static String password = "root";
	private static String driver = "com.mysql.jdbc.Driver";
	
	
	private static Connection con = null;
	
	
	public static Connection getConnection(){
		
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,userName,password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return con;
	}
	
	public static void releaseResource(Connection con,PreparedStatement ps,ResultSet rs){
		try {
			if(rs!=null) rs.close();
			if(ps!=null) ps.close();
			if(con!=null) con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public static void saveTextMessage(String openid,String content){
		Connection con = MySqlUtil.getConnection();
		PreparedStatement ps = null;
		try {
			String sql = "insert into message_text(open_id,content,create_time) values (?,?,now())";
			ps = con.prepareStatement(sql);
			ps.setString(1, openid);
			ps.setString(2, content);
			ps.execute();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			MySqlUtil.releaseResource(con,ps,null);
		}
	}
}
