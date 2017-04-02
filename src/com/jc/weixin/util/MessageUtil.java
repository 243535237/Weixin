package com.jc.weixin.util;

import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

import com.jc.weixin.entity.ArticlesMessage;
import com.jc.weixin.entity.ImageMessage;
import com.jc.weixin.entity.MusicMessage;
import com.jc.weixin.entity.TextMessage;
import com.jc.weixin.entity.VideoMessage;
import com.jc.weixin.entity.VoiceMessage;
import com.jc.weixin.entity.child.Articles;
import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.core.util.QuickWriter;
import com.thoughtworks.xstream.io.HierarchicalStreamWriter;
import com.thoughtworks.xstream.io.xml.PrettyPrintWriter;
import com.thoughtworks.xstream.io.xml.XppDriver;

public class MessageUtil {
	
	public static Map<String,String> parseXML(HttpServletRequest request){
		Map<String,String> map = new HashMap<String,String>();
		try {
			//获取Document对象
			SAXReader reader = new SAXReader();
			Document document = reader.read(request.getInputStream());
			//得到xml的根节点
			Element root = document.getRootElement();
			parse2XML(root,map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return map;
	}
	
	//xml转对象
	public static String messageToXML(TextMessage message){
		xstream.alias("xml", TextMessage.class);
		return xstream.toXML(message);
	}
	public static String messageToXML(ImageMessage message){
		xstream.alias("xml", ImageMessage.class);
		return xstream.toXML(message);
	}
	public static String messageToXML(ArticlesMessage message){
		xstream.alias("xml", ArticlesMessage.class);
		xstream.alias("item", Articles.class);
		return xstream.toXML(message);
	}
	public static String messageToXML(MusicMessage message){
		xstream.alias("xml", MusicMessage.class);
		return xstream.toXML(message);
	}
	public static String messageToXML(VideoMessage message){
		xstream.alias("xml", VideoMessage.class);
		return xstream.toXML(message);
	}
	public static String messageToXML(VoiceMessage message){
		xstream.alias("xml", VoiceMessage.class);
		return xstream.toXML(message);
	}
	
	
	
	private static void parse2XML(Element root,Map<String,String> map){
		//得到根节点的子节点
		@SuppressWarnings("unchecked")
		List<Element> elements = root.elements();
		
		if(elements.size()==0){
			map.put(root.getName(), root.getTextTrim());
		}else{
			for (Element element : elements) {
				parse2XML(element,map);
			}
		}
		
	}
	
	
	private static XStream xstream = new XStream(new XppDriver(){
		public HierarchicalStreamWriter createWriter(Writer out){
			
			return new PrettyPrintWriter(out){
				boolean cdata = true;
				public void startNode(String name,@SuppressWarnings("rawtypes") Class clazz){
					
					super.startNode(name, clazz);
				}
				
				protected void writeText(QuickWriter writer,String text){
					if(cdata){
						writer.write("<![CDATA[");
						writer.write(text);
						writer.write("]]>");
					}else{
						writer.write(text);
					}
				}
				
			};
			
		}
	});
	
	
}
