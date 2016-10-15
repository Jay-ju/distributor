package com.zx.stlife.entity.sys;

import com.base.jpa.model.SuperIntEntity;
import com.zx.stlife.constant.Const;
import com.zx.stlife.entity.SuperIntVersion;

import javax.persistence.*;
import java.util.*;

/**
 * @author jukj
 *
 */
@Entity
@Table(name = "sys_article")
public class Article {

	private int id;
	private String article_title;
	private String article_content;
	private Date   create_time;
	private Date   update_time;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getArticle_title() {
		return article_title;
	}
	public void setArticle_title(String article_title) {
		this.article_title = article_title;
	}
	public String getArticle_content() {
		return article_content;
	}
	public void setArticle_content(String article_content) {
		this.article_content = article_content;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public Date getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}
}
