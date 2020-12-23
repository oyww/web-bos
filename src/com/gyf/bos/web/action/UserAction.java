package com.gyf.bos.web.action;

import com.gyf.bos.model.User;
import com.gyf.bos.utils.MD5Utils;
import com.gyf.bos.web.action.base.BaseAction;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class UserAction extends BaseAction<User> {

    //创建了一个日志对象
    Logger logger = Logger.getLogger(UserAction.class);
    public String login(){
        logger.info(getModel());

        //1.获取参数
        String username = getModel().getUsername();
        String password = getModel().getPassword();

        //request
        HttpServletRequest request =  ServletActionContext.getRequest();
        String serverCheckCode = (String) request.getSession().getAttribute("key");
        String clientCheckCode = request.getParameter("checkcode");
        if(serverCheckCode.equalsIgnoreCase(clientCheckCode)){//验证码正确

            /**
             * 使用shiro，就不再使用userService的login方法来登录
             * 而是使用Subject的login方法
             */
            //获取一个Subject
            Subject  subject = SecurityUtils.getSubject();

            //创建一个Token,这个对象存着用户名和密码
            UsernamePasswordToken token = new UsernamePasswordToken(username, MD5Utils.text2md5(password));

            try {
                subject.login(token);//内部就会执行Realm的代码

                //登录成功【把用户对象存在session】
                User loginUser = (User) subject.getPrincipal();
                subject.getSession().setAttribute("loginUser",loginUser);

                return "home";
            }catch (AuthenticationException e){
                e.printStackTrace();//登录失败会抛出异常
                addActionError("登录失败，用户名密码不正确");
            }
        }else{
            //System.out.println("验证码不正确");
            addActionError("验证码不正确");
        }
        return "loginfailure";
    }

    @Override
    public String save() {
        return null;
    }

    @Override
    public String update() {
        return null;
    }

    @Override
    public String delete() {
        return null;
    }

    @Override
    public String list() {
        return null;
    }

    public String logout(){
        //把session数据清除
        ServletActionContext.getRequest().getSession().invalidate();

        return "login";
    }

    public String editPassword() throws IOException {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        //1.获取新密码
        String newPwd = getModel().getPassword();

        //2.获取用户id
        User loginUser = (User)request .getSession().getAttribute("loginUser");
        String userId = loginUser.getId();

        //3.调用service
        userService.modifyPassword(newPwd,userId);

        //4.返回一个数据
        response.setHeader("content-type","text/json;charset=utf-8");
        response.getWriter().print("{\"success\":\"1\"}");

        return NONE;
    }
}
