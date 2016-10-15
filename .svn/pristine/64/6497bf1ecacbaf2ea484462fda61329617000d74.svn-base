package com.zx.stlife.entity.stat;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.base.jpa.model.SuperIntEntity;
import com.zx.stlife.constant.Const;

/**
 * 差额统计.
 * 
 * @author
 */
@Entity
@Table(name = "stat_money")
public class StatMoney extends SuperIntEntity{

	private Date statDate;
	
	private Integer rechargeValue;
	
	private Integer payValue;
	
	private Integer jifendhValue;
	
	private Integer redpackValue;
	
	private Integer remainrechargeValue;
	
	private Integer remainredpackValue;
	
	private Integer expireredpackValue;
	
	private Integer personnumValue;
	
	private Integer differenceValue;

    /**
     * Default constructor
     */
    public StatMoney() {
        super();
    }
	
	public StatMoney(Date statDate,Integer rechargeValue,Integer payValue,
			Integer jifendhValue,
			Integer redpackValue,Integer remainrechargeValue,Integer remainredpackValue,
			Integer expireredpackValue,Integer personnumValue,Integer differenceValue){
		this.statDate = statDate;
		this.rechargeValue = rechargeValue;
		this.payValue = payValue;
		this.jifendhValue = jifendhValue;
		this.redpackValue = redpackValue;
		this.remainrechargeValue = remainrechargeValue;
		this.remainredpackValue = remainredpackValue;
		this.expireredpackValue = expireredpackValue;
		this.personnumValue = personnumValue;
		this.differenceValue = differenceValue;
	}

	public Date getStatDate() {
		return statDate;
	}

	public void setStatDate(Date statDate) {
		this.statDate = statDate;
	}

	public Integer getRechargeValue() {
		return rechargeValue;
	}

	public void setRechargeValue(Integer rechargeValue) {
		this.rechargeValue = rechargeValue;
	}

	public Integer getPayValue() {
		return payValue;
	}

	public void setPayValue(Integer payValue) {
		this.payValue = payValue;
	}

	public Integer getJifendhValue() {
		return jifendhValue;
	}

	public void setJifendhValue(Integer jifendhValue) {
		this.jifendhValue = jifendhValue;
	}

	public Integer getRedpackValue() {
		return redpackValue;
	}

	public void setRedpackValue(Integer redpackValue) {
		this.redpackValue = redpackValue;
	}

	public Integer getRemainrechargeValue() {
		return remainrechargeValue;
	}

	public void setRemainrechargeValue(Integer remainrechargeValue) {
		this.remainrechargeValue = remainrechargeValue;
	}

	public Integer getRemainredpackValue() {
		return remainredpackValue;
	}

	public void setRemainredpackValue(Integer remainredpackValue) {
		this.remainredpackValue = remainredpackValue;
	}

	public Integer getExpireredpackValue() {
		return expireredpackValue;
	}

	public void setExpireredpackValue(Integer expireredpackValue) {
		this.expireredpackValue = expireredpackValue;
	}

	public Integer getPersonnumValue() {
		return personnumValue;
	}

	public void setPersonnumValue(Integer personnumValue) {
		this.personnumValue = personnumValue;
	}

	public Integer getDifferenceValue() {
		return differenceValue;
	}

	public void setDifferenceValue(Integer differenceValue) {
		this.differenceValue = differenceValue;
	}
	
	
}
