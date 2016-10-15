package com.zx.stlife.service.sys;

import com.base.jpa.query.Page;
import com.base.jpa.query.Query;
import com.base.modules.persistence.Hibernates;
import com.base.modules.security.utils.Digests;
import com.base.modules.util.Encodes;
import com.base.modules.util.SimpleUtils;
import com.zx.stlife.base.UserUtils;
import com.zx.stlife.constant.Const;
import com.zx.stlife.entity.sys.Article;
import com.zx.stlife.repository.jpa.sys.ArticleDao;
import com.zx.stlife.service.base.ShiroDbRealm;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

public class ArticleService {

	private static Logger logger = LoggerFactory.getLogger(ArticleService.class);

	@Autowired
	private ArticleDao articleDao;

	@Transactional
	public void saveArticle(Article article) {
		articleDao.saveAndFlush(article);
	}

}
