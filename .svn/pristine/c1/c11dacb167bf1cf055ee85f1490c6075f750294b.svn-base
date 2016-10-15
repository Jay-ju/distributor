package com.zx.stlife.tools;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

public class XMLUtils {
	/**
	 * 解析xml,返回第一级元素键值对。如果第一级元素有子节点，则此节点的值是子节点的xml数据。
	 * 
	 * @param strxml
	 * @return
	 * @throws JDOMException
	 * @throws IOException
	 */
	public static Map<String, String> doXMLParse(String strxml) throws JDOMException, IOException {
		strxml = strxml.replaceFirst("encoding=\".*\"", "encoding=\"UTF-8\"");

		if (null == strxml || "".equals(strxml)) {
			return null;
		}

		Map m = new TreeMap();

		InputStream in = new ByteArrayInputStream(strxml.getBytes("UTF-8"));
		SAXBuilder builder = new SAXBuilder();
		Document doc = builder.build(in);
		Element root = doc.getRootElement();
		List list = root.getChildren();
		Iterator it = list.iterator();
		while (it.hasNext()) {
			Element e = (Element) it.next();
			String k = e.getName();
			String v = "";
			List children = e.getChildren();
			if (children.isEmpty()) {
				v = e.getTextNormalize();
			}
			else {
				v = getChildrenText(children);
			}

			m.put(k, v);
		}

		// 关闭流
		in.close();

		return m;
	}

	/**
	 * 获取子结点的xml
	 * 
	 * @param children
	 * @return String
	 */
	public static String getChildrenText(List children) {
		StringBuffer sb = new StringBuffer();
		if (!children.isEmpty()) {
			Iterator it = children.iterator();
			while (it.hasNext()) {
				Element e = (Element) it.next();
				String name = e.getName();
				String value = e.getTextNormalize();
				List list = e.getChildren();
				sb.append("<" + name + ">");
				if (!list.isEmpty()) {
					sb.append(getChildrenText(list));
				}
				sb.append(value);
				sb.append("</" + name + ">");
			}
		}
		return sb.toString();
	}
	
	/**
	 * 解析xml,返回第一级元素键值对。如果第一级元素有子节点，则此节点的值是子节点的xml数据。
	 * 
	 * @param strxml
	 * @return
	 * @throws JDOMException
	 * @throws IOException
	 */
	public static Map<String, String> doIPSXMLParse(String strxml) throws JDOMException, IOException {
		strxml = strxml.replaceFirst("encoding=\".*\"", "encoding=\"UTF-8\"");

		if (null == strxml || "".equals(strxml)) {
			return null;
		}

		strxml = strxml.replace("<GateWayRsp>", "");
		strxml = strxml.replace("</GateWayRsp>", "");
		strxml = strxml.replace("<GateWayReq>", "");
		strxml = strxml.replace("</GateWayReq>", "");
		strxml = strxml.replace("<head>", "");
		strxml = strxml.replace("</head>", "");
		strxml = strxml.replace("<body>", "");
		strxml = strxml.replace("</body>", "");
		
		Map m = new TreeMap();

		InputStream in = new ByteArrayInputStream(strxml.getBytes("UTF-8"));
		SAXBuilder builder = new SAXBuilder();
		Document doc = builder.build(in);
		Element root = doc.getRootElement();
		List list = root.getChildren();
		Iterator it = list.iterator();
		while (it.hasNext()) {
			Element e = (Element) it.next();
			String k = e.getName();
			String v = "";
			List children = e.getChildren();
			if (children.isEmpty()) {
				v = e.getTextNormalize();
			}
			else {
				v = getChildrenText(children);
			}

			m.put(k, v);
		}

		// 关闭流
		in.close();

		return m;
	}
	
	public static void main(String[] args) throws JDOMException, IOException {
		doIPSXMLParse("<Ips><GateWayRsp><head><Account>1820810016</Account><MerCode>182081</MerCode><ReqDate>20160821205535</ReqDate><Signature>17</Signature></head><body><Amount>1.00</Amount><CurrencyType>156</CurrencyType><Date>20160821</Date><FailUrl>http://stlife.isum.cn/stlife/wx/index</FailUrl><GatewayType>01</GatewayType><GoodsName>夺宝商品</GoodsName><Lang>GB</Lang><MerBillNo>402881085456544b0154566fcf7500</MerBillNo><Merchanturl>http://stlife.isum.cn/stlife/wx/index</Merchanturl><OrderEncodeType>5</OrderEncodeType><RetEncodeType>17</RetEncodeType><RetType>1</RetType><ServerUrl>http://stlife.isum.cn/stlife/wx/index</ServerUrl></body></GateWayRsp></Ips>");
	}
}
