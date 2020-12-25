package com.gyf.bos.utils;

import com.gyf.bos.model.User;
import org.apache.struts2.ServletActionContext;


public class BosContext {

	public static User getLoginUser(){
		return (User) ServletActionContext.getRequest().getSession().getAttribute("loginUser");
	}
}
