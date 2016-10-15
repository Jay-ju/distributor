package com.zx.stlife.controller.web.sys;

import com.zx.stlife.base.ParamsEntity;
import com.zx.stlife.entity.sys.Article;
import com.zx.stlife.entity.sys.Category;
import com.zx.stlife.service.sys.ArticleService;
import com.zx.stlife.controller.web.BaseController;
import com.base.jpa.query.Page;
import com.base.modules.util.WebUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping(value = "/sys/article")

public class ArticleController extends BaseController {

	@Autowired
	private ArticleService articleService;
	
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String save(@Valid @ModelAttribute("preloadEntity") Article entity,
					   ParamsEntity paramsEntity,
					   RedirectAttributes redirectAttributes) {
		try{		
			articleService.saveArticle(entity);
			return "true";
		}
		catch (Exception ex){
			return "false";
		}
	}
}
