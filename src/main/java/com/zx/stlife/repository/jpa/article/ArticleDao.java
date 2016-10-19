package com.zx.stlife.repository.jpa.article;

import java.util.List;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.base.jpa.MyJpaRepository;
import com.zx.stlife.entity.article.Article;

public interface ArticleDao extends MyJpaRepository<Article, Integer> {

    @Modifying
    @Query("delete from Article where id=?1")
    int deleteById(Integer id);

    @Modifying
    @Query("update Article set title=?2, content=?3, updateTime=now() where id=?1")
    void updateArticle(Integer id, String title, String content);

    @Query("select t from Article t where t.id=?1")
    Article getArticle(Integer id);

    @Query("select t from Article t")
    List<Article> getAllArticle();

    @Query("select t from Article t where t.title like %?1%")
    List<Article> getArticleByTitle(String title);
}
