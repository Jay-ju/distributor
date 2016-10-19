package com.zx.stlife.controller.web.article;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.base.jpa.query.Page;
import com.base.modules.util.WebUtils;
import com.zx.stlife.base.ParamsEntity;
import com.zx.stlife.constant.Const;
import com.zx.stlife.controller.web.BaseController;
import com.zx.stlife.entity.article.Article;
import com.zx.stlife.service.article.ArticleService;

@Controller
@RequestMapping(value = "/article/article")
public class ArticleController extends BaseController {
	@Autowired
	private ArticleService service;

	private static final String PERMISSION_PREFIX = "article:article";
	private static final String VIEW_URI_PREFIX = "article/article-";

	@RequiresPermissions(PERMISSION_PREFIX + PERMISSION_VIEW)
	@RequestMapping(value = "list")
	public String list(Model model, Page page, ParamsEntity paramsEntity) {
		listContent(model, page, paramsEntity);
		return VIEW_URI_PREFIX + "list";
	}

	@RequiresPermissions(PERMISSION_PREFIX + PERMISSION_VIEW)
	@RequestMapping(value = "list-content")
	public String listContent(Model model, Page page, ParamsEntity paramsEntity) {
		service.search(page, paramsEntity.getParams());
		bindData(model);
		model.addAttribute("page", page);

		return VIEW_URI_PREFIX + "list-content";
	}

	private void bindData(Model model) {
		model.addAttribute("booleanMap", Const.booleanMap);
	}

	@RequiresPermissions(PERMISSION_PREFIX + PERMISSION_EDIT)
	@RequestMapping(value = "create", method = RequestMethod.GET)
	public String create(Model model, ParamsEntity paramsEntity) {
		model.addAttribute("entity", new Article());
		bindData(model);
		return VIEW_URI_PREFIX + "form";
	}

	@RequiresPermissions(PERMISSION_PREFIX + PERMISSION_EDIT)
	@RequestMapping(value = "edit/{id}", method = RequestMethod.GET)
	public String edit(@PathVariable("id") Integer id, Model model,
			ParamsEntity paramsEntity) {
		model.addAttribute("entity", service.get(id));
		bindData(model);
		return VIEW_URI_PREFIX + "form";
	}

	@RequiresPermissions(PERMISSION_PREFIX + PERMISSION_EDIT)
	@RequestMapping(value = "save", method = RequestMethod.POST)
	public String save(@Valid @ModelAttribute("preloadEntity") Article entity,
			ParamsEntity paramsEntity,
			@RequestParam(value = "title", required = false) String title,
			@RequestParam(value = "content", required = false) String content,
			RedirectAttributes redirectAttributes) {

		entity.setCreateTime(new Date());
		entity.setUpdateTime(new Date());
		entity.setContent(content);
		
		service.save(entity);

		redirectAttributes.addFlashAttribute("message", "文章信息保存成功");

		return getRedirectUrl(paramsEntity.get("listUrl"));
	}

	@RequiresPermissions(PERMISSION_PREFIX + PERMISSION_EDIT)
	@RequestMapping(value = "updateState", method = RequestMethod.POST)
	@ResponseBody
	public Integer updateArticle(@RequestParam("id") Integer id,
			@RequestParam("title") String title,
			@RequestParam("editorValue") String content,
			HttpServletResponse response) {
		Integer result = null;
		try {
			service.updateArticle(id, title, content);
			result = Const.COMMON_RESULT_SUCCESS;
		} catch (Exception ex) {
			logger.error(ex.getMessage(), ex);
			result = 0;
		}

		return result;
	}

	@RequiresPermissions(PERMISSION_PREFIX + PERMISSION_EDIT)
	@RequestMapping(value = "delete", method = RequestMethod.DELETE)
	public void delete(@RequestParam(value = "ids") List<Integer> ids,
			HttpServletResponse response) {
		String result = "1";
		try {
			service.delete(ids);
		} catch (Exception ex) {
			result = ex.getMessage();
			logger.error(ex.getMessage(), ex);
		}
		WebUtils.renderText(response, result);
	}
	
	@RequiresPermissions(PERMISSION_PREFIX + PERMISSION_EDIT)
	@RequestMapping(value = "preview", method = RequestMethod.GET)
	public String preview(@RequestParam(value = "content") String content,
			Model model) {
		model.addAttribute("content", content);
		bindData(model);
		return VIEW_URI_PREFIX + "preview-content";
	}

	/**
	 * 使用@ModelAttribute, 实现Struts2
	 * Preparable二次部分绑定的效果,先根据form的id从数据库查出User对象,再把Form提交的内容绑定到该对象上。
	 * 因为仅update()方法的form中有id属性，因此本方法在该方法中执行.
	 */
	@ModelAttribute("preloadEntity")
	public Article getEntity(
			@RequestParam(value = "id", required = false) Integer id) {
		if (null != id) {
			return service.get(id);
		}
		return new Article();
	}
}
