package com.jc.weixin.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.jc.weixin.dao.FollowDao;
import com.jc.weixin.dao.QuestionsDao;
import com.jc.weixin.dao.UserInfoDao;
import com.jc.weixin.dao.impl.FollowDaoImpl;
import com.jc.weixin.dao.impl.QuestionsDaoImpl;
import com.jc.weixin.dao.impl.UserInfoDaoImpl;
import com.jc.weixin.entity.ArticlesMessage;
import com.jc.weixin.entity.TextMessage;
import com.jc.weixin.entity.child.Articles;
import com.jc.weixin.entity.mysql.Answer;
import com.jc.weixin.entity.mysql.Follow;
import com.jc.weixin.entity.mysql.Questions;
import com.jc.weixin.entity.mysql.UserInfo;
import com.jc.weixin.util.MessageType;
import com.jc.weixin.util.MessageUtil;
import com.jc.weixin.util.MySqlUtil;

public class CoreService{
	
	private String basePath;
	private FollowDao followDao = new FollowDaoImpl();
	private UserInfoDao userInfoDao = new UserInfoDaoImpl();
	private QuestionsDao questionsDao = new QuestionsDaoImpl();
	
	//用户信息
	private UserInfo userinfo = null;
	//用户的答题信息
	private Questions questions = null;
	
	//系统ID
	private String toUserName;
	//用户ID
	private String fromUserName;
	//消息类型
	private String msgType;

	
	/**
	 * 关注
	 * @return
	 */
	public String firstText(){
		
		Follow user = followDao.getFollow(fromUserName);
		StringBuffer sb = new StringBuffer();
		
		if(user==null){
			sb.append("欢迎你第一次进入游戏:\n");
			Follow f = new Follow();
			f.setFollowdate(new Date());
			f.setOpenid(fromUserName);
			f.setState(1);
			followDao.save(f);
			
			UserInfo u = new UserInfo();
			u.setOpenid(fromUserName);
			u.setFhbsl(0);
			u.setKssj(new Date());
			u.setWz("1");
			userInfoDao.saveUser(u);
			
		}else{
			followDao.updateState(user, 0);
			sb.append("欢迎进入游戏:\n");
		}
		
		userInfoDao.updateWzByOpenid(fromUserName, "1");

		sb.append("1.开始游戏:\n");
		sb.append("2.游戏排行:\n");
		sb.append("3.退出游戏:\n");
		return sb.toString();
		
	}
	
	/**
	 * 开始游戏
	 * @return
	 */
	public String startGame(){
		//判断用户的当前关数和章数
		
		int gs = userinfo.getDqgs();
		int zs = userinfo.getDqzs();
		
		if(gs==1 && zs==0){
			//增加复活币
			userInfoDao.addFhb(fromUserName, 2);
			//进入下一章
			userInfoDao.updateZs(fromUserName, 1);
		}
		
		String passName = "";
		
		switch (questions.getPassnum()) {
		case 1:
			passName = "镜源篇";
			break;
		}
		
		//答案类型(1:文字 2:图片 3:两者)
		int datype = questions.getAnswertype();
		List<Answer> answerList = questions.getAnswerList();
		ArticlesMessage articlesMessage = new ArticlesMessage();
		articlesMessage.setCreateTime(new Date().getTime());
		articlesMessage.setFromUserName(toUserName);
		articlesMessage.setMsgType(MessageType.RESP_MESSAGE_TYPE_NEWS);
		articlesMessage.setToUserName(fromUserName);
		List<Articles> articlesList = new ArrayList<Articles>();
		Articles articles = new Articles();
		
		if(datype==1){
			
			articles.setPicUrl(basePath+"/images/"+questions.getPicture());
			
			StringBuffer description = new StringBuffer();
			
			description.append(questions.getSubject()+"\n\n");
			
			for (Answer answer : answerList) {
				description.append(answer.getAnswer()+"\n");
			}
			
			
			if(questions.getXh()==0){
				articles.setTitle(questions.getPassnum()+":"+passName+"---故事引进");
				description.append("\n回复[N]继续:\n回复[复活币]可查询复活币数量:");
			}else{
				articles.setTitle(questions.getPassnum()+":"+passName+"---场景"+questions.getXh());
				description.append("\n回复对应数字继续:\n回复[复活币]可查询复活币数量:");
			}
			
			articles.setDescription(description.toString());
			articles.setUrl(basePath+"content.jsp?passnum="+questions.getPassnum()+"&xh="+questions.getXh());
			articlesList.add(articles);
			articlesMessage.setArticles(articlesList);
			articlesMessage.setArticleCount(articlesList.size());
			
		}else if(datype==2){
			
			articles = new Articles();
			articles.setTitle(questions.getSubject());
			articles.setPicUrl("");
			articles.setUrl(basePath+"content.jsp?passnum="+questions.getPassnum()+"&xh="+questions.getXh());
			articles.setDescription("");
			articlesList.add(articles);
			
			for (Answer answer : answerList) {
				articles = new Articles();
				articles.setTitle(answer.getAnswer());
				articles.setPicUrl(basePath+"/images/"+answer.getPicture());
				articles.setUrl(basePath+"index.jsp");
				articles.setDescription(answer.getAnswer());
				
				articlesList.add(articles);
			}
			
			articlesMessage.setArticles(articlesList);
			articlesMessage.setArticleCount(articlesList.size());
			
		}
		
		
		return MessageUtil.messageToXML(articlesMessage);
		
	}
	
	
	/**
	 * 判断答案是否正确
	 * @param content
	 * @return
	 */
	public String getAnswer(String content){

		Answer result = null;
		List<Answer> list = questions.getAnswerList();
		StringBuffer sb = new StringBuffer();
		for (Answer answer : list) {
			if(content.equals(String.valueOf(answer.getXh()))){
				result = answer;
			}
		}
		
		if(result!=null){
			sb.append("你选择的答案是:"+result.getXh()+"\n"+result.getDescribe()+"\n");
			
			if(result.getEventid()!=null && result.getEventid().length>0){
				Integer[] eventid = result.getEventid();
				for (Integer e : eventid) {
					switch (e) {
					case 1:
						//复活币-1
						userInfoDao.addFhb(fromUserName, -1);
						break;
					case 2:
						//复活币+1
						userInfoDao.addFhb(fromUserName, 1);
						break;
					case 3:
						//复活币-2
						userInfoDao.addFhb(fromUserName, -2);
						break;
					case 4:
						//复活币+2
						userInfoDao.addFhb(fromUserName, 2);
						break;
					case 5:
						//复活币-3
						userInfoDao.addFhb(fromUserName, -3);
						break;
					case 6:
						//复活币+3
						userInfoDao.addFhb(fromUserName, 3);
						break;
					case 7:
						//复活币清零
						userInfoDao.addFhb(fromUserName, -9999);
						break;
						
					}
				}
			}
			
			
			//查询复活币数量
			Integer fhbsl = userInfoDao.getFhbByOpenId(fromUserName);
			if(fhbsl<=0){
				//复活币清零
				userInfoDao.addFhb(fromUserName, -9999);
				//清空关数和章数
				userInfoDao.clearGsAndZs(fromUserName,1,0);
				//设置位置在菜单
				userInfoDao.updateWzByOpenid(fromUserName, "1");
				sb.append("\n你已经没有复活币了游戏结束\n输入【菜单】返回");
			}else{
				//查询总章数
				int zzs = questionsDao.getZs();
				
				if(userinfo.getDqzs()+1<=zzs){
					//挑战下一章
					userInfoDao.updateZs(fromUserName, 1);
					sb.append("\n回复[N]继续:\n回复[复活币]可查询复活币数量:");
				}else{
					//设置位置在菜单
					userInfoDao.updateWzByOpenid(fromUserName, "1");
					sb.append("\n恭喜你通过了本章考验，期待下一章的参与...");
					sb.append("\n回复【菜单】返回:");
				}
				
			}
		}else{
			sb = new StringBuffer("输入错误");
		}
		return sb.toString();
	}
	
	/**
	 * 查询复活币
	 * @return
	 */
	public String selFHB(){
		Integer fhbsl = userInfoDao.getFhbByOpenId(fromUserName);
		return "你的复活币数量为:"+fhbsl;
	}
	
	/**
	 * 查看排行
	 * @return
	 */
	public String selectPh(){
		List<UserInfo> list = userInfoDao.getUserInfoList(0, 10);
		StringBuffer sb = new StringBuffer();
		sb.append("最高关数前十名排行榜：\n");
		int i = 0;
		for (UserInfo userInfo : list) {
			i++;
			sb.append("第"+i+"名:\n");
			sb.append("名称:"+userInfo.getName()+"\n");
			sb.append("最高关数:"+userInfo.getLszggs()+"\n");
			sb.append("最高章数:"+userInfo.getLszgzs()+"\n");
			sb.append("----------------------\n");
		}
		sb.append("\n输入【菜单】返回:");
		return sb.toString();
	}
	
	public String processRequest(HttpServletRequest request,String basePath){
		
		
		
		this.basePath = basePath;
		
		
		String xml = "";
		
		//用户信息
		try {
			Map<String, String> map = MessageUtil.parseXML(request);
			toUserName = map.get("ToUserName");
			fromUserName = map.get("FromUserName");
			msgType = map.get("MsgType");
			
			TextMessage textMessage = new TextMessage(fromUserName, toUserName, new Date().getTime(), MessageType.RESP_MESSAGE_TYPE_TEXT);
			
			if(msgType.equals(MessageType.REQ_MESSAGE_TYPE_TEXT)){
				String content = map.get("Content");
				MySqlUtil.saveTextMessage(fromUserName, content);
				
				userinfo = userInfoDao.getUserInfoByOpenId(fromUserName);
				questions = questionsDao.getQuestions(userinfo.getDqgs(),userinfo.getDqzs(), true);
				
				if(content.contains("菜单") && !userinfo.getWz().equals("2")){
					textMessage.setContent(firstText());
					xml = MessageUtil.messageToXML(textMessage);
				}else if(userinfo.getWz().equals("1")){
					/*
					 * 菜单
					 */
					//开始游戏
					if(content.equals("1")){
						if(userinfo.getName()==null || userinfo.getName().equals("")){
							//添加名字
							textMessage.setContent("你是第一次进入游戏，请填写你的名字:");
							//修改位置
							userInfoDao.updateWzByOpenid(fromUserName, "2");
							xml = MessageUtil.messageToXML(textMessage);
						}else{
							userInfoDao.updateWzByOpenid(fromUserName, "3");
							xml = startGame();
						}
					}else if((content.equals("2"))){
						textMessage.setContent(selectPh());
						xml = MessageUtil.messageToXML(textMessage);
					}else{
						textMessage.setContent("输入错误，请输入【菜单】返回到菜单:");
						xml = MessageUtil.messageToXML(textMessage);
					}
					
				}else if(userinfo.getWz().equals("2")){
					/*
					 * 修改名字
					 */
					boolean result = userInfoDao.updateNameByOpenid(fromUserName, content);
					if(result){
						textMessage.setContent("修改成功，你的名字是:["+content+"],输入【菜单】返回上层:");
						userInfoDao.updateWzByOpenid(fromUserName, "1");
						xml = MessageUtil.messageToXML(textMessage);
					}
				}else if(userinfo.getWz().equals("3")){
					/*
					 * 游戏中
					 */
					
					//用于输入的答案序号
					String daxhStr = "";
					
					for (int i=0;i<questions.getAnswerList().size();i++) {
						daxhStr += (i+1);
					}
					if(content.contains("复活币")){
						textMessage.setContent(selFHB());
						xml = MessageUtil.messageToXML(textMessage);
					}else if(daxhStr.contains(content)){
						textMessage.setContent(getAnswer(content));
						xml = MessageUtil.messageToXML(textMessage);
					}else if("Nn".contains(content)){
						xml = startGame();
					}else{
						textMessage.setContent("输入错误请重新输入:");
						xml = MessageUtil.messageToXML(textMessage);
					}
				}
				
				
			}else if(msgType.equals(MessageType.REQ_MESSAGE_TYPE_EVENT)){
				/*
				 * 事件
				 */
				String event = map.get("Event");
				
				if(event.equals(MessageType.EVENT_TYPE_SUBSCRIBE)){
					//关注事件
					textMessage.setContent(firstText());
					xml = MessageUtil.messageToXML(textMessage);
					System.out.println(xml);
				}else if(event.equals(MessageType.EVENT_TYPE_UNSUBSCRIBE)){
					//取消关注事件
					Follow user = followDao.getFollow(fromUserName);
					followDao.updateState(user, 1);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return xml;
		
	}
	
	
	private static CoreService coreService;
	
	public static CoreService getCoreService(){
		if(coreService==null){
			coreService = new CoreService();
		}
		return coreService;
	}
	
	private CoreService(){}
	
}