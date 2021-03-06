package com.gyf.bos.web.realm;

import com.gyf.bos.dao.IFunctionDao;
import com.gyf.bos.dao.IUserDao;
import com.gyf.bos.model.Function;
import com.gyf.bos.model.User;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.realm.Realm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class BOSRealm extends AuthorizingRealm {
    /**
     * 权限-与角色权关
     *
     * @param principal
     * @return
     */
    @Autowired
    private IFunctionDao functionDao;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principal) {
        //拿到用户
        User loginUser = (User) principal.getPrimaryPrincipal();

        //根据用户ID查权限
        List<Function> functions = null;

        //admin超级管理员
        if (loginUser.getUsername().equals("admin")) {
            functions = functionDao.findAll();
        } else {
            functions = functionDao.findListByUserId(loginUser.getId());
        }

        //往shiro添加权限
        //别用父类引用，不然特有方法不能使用
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        for (Function function : functions) {
            info.addStringPermission(function.getCode());
        }
        //手动添加权限
        info.addStringPermission("staff");//字符串在配置文件中
        info.addRole("staff");//手动添加角色
        info.addStringPermission("admin");//字符串在配置文件中
        info.addRole("admin");//手动添加角色
        return info;
    }

    /**
     * 登录认证
     *
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    @Autowired
    private IUserDao userDao;
    //必须实现的抽象父类的方法：身份认证
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        //强转token
        UsernamePasswordToken uptoken = (UsernamePasswordToken) authenticationToken;
        //获得页面传给token的用户名和密码
        String username = uptoken.getUsername();
        char[] pwd = uptoken.getPassword();//有可能需要提前MD5加密

        //通过用户名查询数据库是否存在该用户
        User db_user = userDao.findByUsername(username);
        if (null!=db_user){
            //创建简单信息认真对象
            /**
             * 参数1：数据库查到的用户
             * 参数2：页面传递的密码（也许需要加密），安全管理器会自动和数据库的密码比对和信息封装
             * 参数3：自定义realm的简单类名
             */
            SimpleAuthenticationInfo info=new SimpleAuthenticationInfo(db_user,pwd,this.getClass().getSimpleName());
            return info;//返回后，由安全管理器比较密码是否正确
        }
        return null;
    }
}
