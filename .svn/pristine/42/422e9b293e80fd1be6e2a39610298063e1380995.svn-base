package com.zx.stlife.service.member;

import java.text.ParseException;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.base.jpa.query.Page;
import com.base.jpa.query.Query;
import com.base.modules.util.DateUtilsEx;
import com.zx.stlife.repository.jpa.member.StatMarginDao;

@Component
@Transactional(readOnly = true)
public class StatMarginService {

	@Autowired
	private StatMarginDao statMarginDao;
	
    public void getMargin(Page page, Map<String, String> params) {
        Query query = new Query();
        query.table("select t from StatMoney t");
        String beginDate = params.get("beginDate");
        if (StringUtils.isNotEmpty(beginDate)) {
			query.ge("t.statDate", DateUtilsEx.stringToDate(beginDate, "yyyy-MM-dd"));
        }
        String endDate = params.get("endDate");
        if (StringUtils.isNotEmpty(endDate)) {
			query.le("t.statDate", DateUtilsEx.stringToDate(endDate, "yyyy-MM-dd"));
        }
        statMarginDao.queryPage(page, query.getQLString(), query.getValues());
    }
}
