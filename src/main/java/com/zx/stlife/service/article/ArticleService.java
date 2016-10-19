package com.zx.stlife.service.article;

import java.net.URLDecoder;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.base.jpa.query.Page;
import com.base.jpa.query.Query;
import com.base.modules.util.SimpleUtils;
import com.zx.stlife.constant.Const.CommonState;
import com.zx.stlife.entity.article.Article;
import com.zx.stlife.entity.goods.GoodsInfo;
import com.zx.stlife.repository.jpa.article.ArticleDao;

/**
 * @author liulg
 */
@Component
@Transactional(readOnly = true)
public class ArticleService {

    private static Logger logger = LoggerFactory.getLogger(ArticleService.class);

    @Autowired
    private ArticleDao dao;

    public Article get(Integer id){
        return dao.findOne(id);
    }

    public List<Article> findAll(){
        return dao.getAllArticle();
    }

    @Transactional
    public void save(Article entity) {
        entity = dao.save(entity);
    }

    public void search(Page<Article> page, Map<String, String> params) {
        Query query = new Query();

//        String title = params.get("title");
//        try {
//            title = URLDecoder.decode(title, "UTF-8");
//        } catch (Exception e) {
//            title = "";
//        }

        query.table("select t from Article t")
                .like("t.title", params.get("title"));

        query.orderBy("t.createTime desc");

        dao.queryPage(page, query.getQLString(), query.getValues());
    }

    @Transactional
    public void delete(List<Integer> ids){
        for (Integer id : ids) {
            dao.delete(id);
        }
    }

    @Transactional
    public void updateArticle(Integer id, String title, String content){
        dao.updateArticle(id, title, content);
    }

}
