package com.zx.stlife.tools;

import static com.zx.stlife.constant.Const.HEEPAY_AGENT_ID;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.lang3.StringUtils;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.Namespace;
import org.dom4j.QName;

public class XML2Utils {
	public static Map<String, String> doXMLParse(String strxml) throws Exception {
		Document doc = DocumentHelper.parseText(strxml);
	    Map<String, String> map = (Map<String, String>) xml2map(doc.getRootElement());
	    return map;
	}

	private static Object xml2map(Element element) {
	    Map<String, Object> map = new HashMap<String, Object>();
	    List<Element> elements = element.elements();
	    if (elements.size() == 0) {
	      map.put(element.getName(), element.getText());
	      if (!element.isRootElement()) {
	        return element.getText();
	      }
	    } else if (elements.size() == 1) {
	      map.put(elements.get(0).getName(), xml2map(elements.get(0)));
	    } else if (elements.size() > 1) {
	      // 多个子节点的话就得考虑list的情况了，比如多个子节点有节点名称相同的
	      // 构造一个map用来去重
	      Map<String, Element> tempMap = new HashMap<String, Element>();
	      for (Element ele : elements) {
	        tempMap.put(ele.getName(), ele);
	      }
	      Set<String> keySet = tempMap.keySet();
	      for (String string : keySet) {
	        Namespace namespace = tempMap.get(string).getNamespace();
	        List<Element> elements2 = element.elements(new QName(string, namespace));
	        // 如果同名的数目大于1则表示要构建list
	        if (elements2.size() > 1) {
	          List<Object> list = new ArrayList<Object>();
	          for (Element ele : elements2) {
	            list.add(xml2map(ele));
	          }
	          map.put(string, list);
	        } else {
	          // 同名的数量不大于1则直接递归去
	          map.put(string, xml2map(elements2.get(0)));
	        }
	      }
	    }

	    return map;
	  }

	public static void main(String[] args) {
		try {
			Map<String, String> resultMap = doXMLParse("<?xml version=\"1.0\" encoding=\"utf-8\" ?><token_id>H1608031899990AL_87fc581d95d9ee0780d584f8605bfbf6</token_id>");
            if (!StringUtils.isEmpty(resultMap.get("token_id"))) {
            	System.out.println("ok");
            } else {
            	System.out.println("s");
            }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
