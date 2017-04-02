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
	
	//�û���Ϣ
	private UserInfo userinfo = null;
	//�û��Ĵ�����Ϣ
	private Questions questions = null;
	
	//ϵͳID
	private String toUserName;
	//�û�ID
	private String fromUserName;
	//��Ϣ����
	private String msgType;

	
	/**
	 * ��ע
	 * @return
	 */
	public String firstText(){
		
		Follow user = followDao.getFollow(fromUserName);
		StringBuffer sb = new StringBuffer();
		
		if(user==null){
			sb.append("��ӭ���һ�ν�����Ϸ:\n");
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
			sb.append("��ӭ������Ϸ:\n");
		}
		
		userInfoDao.updateWzByOpenid(fromUserName, "1");

		sb.append("1.��ʼ��Ϸ:\n");
		sb.append("2.��Ϸ����:\n");
		sb.append("3.�˳���Ϸ:\n");
		return sb.toString();
		
	}
	
	/**
	 * ��ʼ��Ϸ
	 * @return
	 */
	public String startGame(){
		//�ж��û��ĵ�ǰ����������
		
		int gs = userinfo.getDqgs();
		int zs = userinfo.getDqzs();
		
		if(gs==1 && zs==0){
			//���Ӹ����
			userInfoDao.addFhb(fromUserName, 2);
			//������һ��
			userInfoDao.updateZs(fromUserName, 1);
		}
		
		String passName = "";
		
		switch (questions.getPassnum()) {
		case 1:
			passName = "��Դƪ";
			break;
		}
		
		//������(1:���� 2:ͼƬ 3:����)
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
				articles.setTitle(questions.getPassnum()+":"+passName+"---��������");
				description.append("\n�ظ�[N]����:\n�ظ�[�����]�ɲ�ѯ���������:");
			}else{
				articles.setTitle(questions.getPassnum()+":"+passName+"---����"+questions.getXh());
				description.append("\n�ظ���Ӧ���ּ���:\n�ظ�[�����]�ɲ�ѯ���������:");
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
	 * �жϴ��Ƿ���ȷ
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
			sb.append("��ѡ��Ĵ���:"+result.getXh()+"\n"+result.getDescribe()+"\n");
			
			if(result.getEventid()!=null && result.getEventid().length>0){
				Integer[] eventid = result.getEventid();
				for (Integer e : eventid) {
					switch (e) {
					case 1:
						//�����-1
						userInfoDao.addFhb(fromUserName, -1);
						break;
					case 2:
						//�����+1
						userInfoDao.addFhb(fromUserName, 1);
						break;
					case 3:
						//�����-2
						userInfoDao.addFhb(fromUserName, -2);
						break;
					case 4:
						//�����+2
						userInfoDao.addFhb(fromUserName, 2);
						break;
					case 5:
						//�����-3
						userInfoDao.addFhb(fromUserName, -3);
						break;
					case 6:
						//�����+3
						userInfoDao.addFhb(fromUserName, 3);
						break;
					case 7:
						//���������
						userInfoDao.addFhb(fromUserName, -9999);
						break;
						
					}
				}
			}
			
			
			//��ѯ���������
			Integer fhbsl = userInfoDao.getFhbByOpenId(fromUserName);
			if(fhbsl<=0){
				//���������
				userInfoDao.addFhb(fromUserName, -9999);
				//��չ���������
				userInfoDao.clearGsAndZs(fromUserName,1,0);
				//����λ���ڲ˵�
				userInfoDao.updateWzByOpenid(fromUserName, "1");
				sb.append("\n���Ѿ�û�и��������Ϸ����\n���롾�˵�������");
			}else{
				//��ѯ������
				int zzs = questionsDao.getZs();
				
				if(userinfo.getDqzs()+1<=zzs){
					//��ս��һ��
					userInfoDao.updateZs(fromUserName, 1);
					sb.append("\n�ظ�[N]����:\n�ظ�[�����]�ɲ�ѯ���������:");
				}else{
					//����λ���ڲ˵�
					userInfoDao.updateWzByOpenid(fromUserName, "1");
					sb.append("\n��ϲ��ͨ���˱��¿��飬�ڴ���һ�µĲ���...");
					sb.append("\n�ظ����˵�������:");
				}
				
			}
		}else{
			sb = new StringBuffer("�������");
		}
		return sb.toString();
	}
	
	/**
	 * ��ѯ�����
	 * @return
	 */
	public String selFHB(){
		Integer fhbsl = userInfoDao.getFhbByOpenId(fromUserName);
		return "��ĸ��������Ϊ:"+fhbsl;
	}
	
	/**
	 * �鿴����
	 * @return
	 */
	public String selectPh(){
		List<UserInfo> list = userInfoDao.getUserInfoList(0, 10);
		StringBuffer sb = new StringBuffer();
		sb.append("��߹���ǰʮ�����а�\n");
		int i = 0;
		for (UserInfo userInfo : list) {
			i++;
			sb.append("��"+i+"��:\n");
			sb.append("����:"+userInfo.getName()+"\n");
			sb.append("��߹���:"+userInfo.getLszggs()+"\n");
			sb.append("�������:"+userInfo.getLszgzs()+"\n");
			sb.append("----------------------\n");
		}
		sb.append("\n���롾�˵�������:");
		return sb.toString();
	}
	
	public String processRequest(HttpServletRequest request,String basePath){
		
		
		
		this.basePath = basePath;
		
		
		String xml = "";
		
		//�û���Ϣ
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
				
				if(content.contains("�˵�") && !userinfo.getWz().equals("2")){
					textMessage.setContent(firstText());
					xml = MessageUtil.messageToXML(textMessage);
				}else if(userinfo.getWz().equals("1")){
					/*
					 * �˵�
					 */
					//��ʼ��Ϸ
					if(content.equals("1")){
						if(userinfo.getName()==null || userinfo.getName().equals("")){
							//�������
							textMessage.setContent("���ǵ�һ�ν�����Ϸ������д�������:");
							//�޸�λ��
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
						textMessage.setContent("������������롾�˵������ص��˵�:");
						xml = MessageUtil.messageToXML(textMessage);
					}
					
				}else if(userinfo.getWz().equals("2")){
					/*
					 * �޸�����
					 */
					boolean result = userInfoDao.updateNameByOpenid(fromUserName, content);
					if(result){
						textMessage.setContent("�޸ĳɹ������������:["+content+"],���롾�˵��������ϲ�:");
						userInfoDao.updateWzByOpenid(fromUserName, "1");
						xml = MessageUtil.messageToXML(textMessage);
					}
				}else if(userinfo.getWz().equals("3")){
					/*
					 * ��Ϸ��
					 */
					
					//��������Ĵ����
					String daxhStr = "";
					
					for (int i=0;i<questions.getAnswerList().size();i++) {
						daxhStr += (i+1);
					}
					if(content.contains("�����")){
						textMessage.setContent(selFHB());
						xml = MessageUtil.messageToXML(textMessage);
					}else if(daxhStr.contains(content)){
						textMessage.setContent(getAnswer(content));
						xml = MessageUtil.messageToXML(textMessage);
					}else if("Nn".contains(content)){
						xml = startGame();
					}else{
						textMessage.setContent("�����������������:");
						xml = MessageUtil.messageToXML(textMessage);
					}
				}
				
				
			}else if(msgType.equals(MessageType.REQ_MESSAGE_TYPE_EVENT)){
				/*
				 * �¼�
				 */
				String event = map.get("Event");
				
				if(event.equals(MessageType.EVENT_TYPE_SUBSCRIBE)){
					//��ע�¼�
					textMessage.setContent(firstText());
					xml = MessageUtil.messageToXML(textMessage);
					System.out.println(xml);
				}else if(event.equals(MessageType.EVENT_TYPE_UNSUBSCRIBE)){
					//ȡ����ע�¼�
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