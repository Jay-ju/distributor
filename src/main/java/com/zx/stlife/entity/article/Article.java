package com.zx.stlife.entity.article;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import com.base.jpa.model.SuperIntEntity;
import com.zx.stlife.constant.Const;

/**
 * 文章信息
 */
@Entity
@Table(name = "t_article")
public class Article extends SuperIntEntity {

    /**
     * 
     */
    private static final long serialVersionUID = -5246494921267636142L;

    /**
     * Default constructor
     */
    public Article() {
        super(Const.CommonState.ENABLE);
    }

    /**
     * 标题
     */
    private String title;

    /** 内容 */
    private String content;
    /**
     * 修改时间
     */
    private Date updateTime;

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

}