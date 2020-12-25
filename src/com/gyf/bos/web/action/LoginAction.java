package com.gyf.bos.web.action;


import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;

import com.gyf.bos.dao.impl.UserDaoImpl;
import com.opensymphony.xwork2.ActionSupport;
@Scope("prototype")
public class LoginAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	
	public String toLoginPage(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String name = request.getParameter("name");
		System.out.println(name);
		return "success";
	}


	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
}
