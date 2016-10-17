package com.zx.stlife.controller.web.sys;

import com.zx.stlife.entity.sys.Article;
import com.zx.stlife.service.sys.ArticleService;
import com.zx.stlife.controller.web.BaseController;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping(value = "/sys/article")
public class ArticleController extends BaseController {

	private static Logger logger = LoggerFactory.getLogger(ArticleService.class);
	
	@Autowired
	private ArticleService articleService;
	
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String save(@RequestParam(value = "title", required = false)String title, 
					   @RequestParam(value = "content", required = false)String content)
	{
		Article entity = new Article();
		entity.setId(new Integer(0));
		entity.setArticle_content(content);
		entity.setArticle_title(title);
		try{		
			articleService.saveArticle(entity);
			return "true";
		}
		catch (Exception ex){
			logger.warn("{}", ex.getMessage());
			return "false";
		}
	}
}
