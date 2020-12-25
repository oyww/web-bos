package com.gyf.bos.web.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import org.activiti.engine.RepositoryService;
import org.activiti.engine.repository.DeploymentBuilder;
import org.activiti.engine.repository.ProcessDefinition;
import org.activiti.engine.repository.ProcessDefinitionQuery;
import org.apache.struts2.ServletActionContext;
import org.aspectj.lang.annotation.After;
import org.springframework.beans.factory.annotation.Autowired;

import javax.servlet.ServletContext;
import java.io.*;
import java.util.List;
import java.util.zip.ZipInputStream;

public class ProcessDefinitionAction extends ActionSupport{

    /*---------------上传文件的参数---------------*/
    private File zipFile;
    private String zipFileContentType;
    private String zipFileFileName;

    public void setZipFileContentType(String zipFileContentType) {
        this.zipFileContentType = zipFileContentType;
    }

    public void setZipFileFileName(String zipFileFileName) {
        this.zipFileFileName = zipFileFileName;
    }

    public void setZipFile(File zipFile) {
        this.zipFile = zipFile;
    }


    //仓库的service
    @Autowired
    private RepositoryService rs;
    private List<ProcessDefinition> list;
    public List<ProcessDefinition> getList() {
        return list;
    }

    public String list(){

        //查询流程定义
        ProcessDefinitionQuery query = rs.createProcessDefinitionQuery();
        query.orderByDeploymentId().desc();//id的降序
        list = query.list();

        //数据存在值栈中,提供list的get方法


        return "list";
    }


    //发布一个流程
    public String deploy() throws FileNotFoundException {

        //1.获取部署的对象
        DeploymentBuilder builder = rs.createDeployment();

        //2.builder 添加压缩包的输入流
        builder.addZipInputStream(new ZipInputStream(new FileInputStream(zipFile)));

        builder.deploy();

        //查询最新的数据
        //查询流程定义
        ProcessDefinitionQuery query = rs.createProcessDefinitionQuery();
        query.orderByDeploymentId().desc();//id的降序
        list = query.list();


        //部署完后回到list页面
        return "list";
    }

    /**
     * 显示流程图
     * @return
     */
    private String id;//流程定义id

    public void setId(String id) {
        this.id = id;
    }

    public String viewpng(){

        //返回一张图片给客户端端口
        //1.根据流程id获取图片
        InputStream imgIS = rs.getProcessDiagram(id);

        //2.把imgIS放在值栈
        ActionContext.getContext().getValueStack().set("imgIS",imgIS);

        return "viewpng";

    }

    public void del() throws IOException {

        //1.先根据流程定义id查找部署id
        ProcessDefinitionQuery query = rs.createProcessDefinitionQuery();
        query.processDefinitionId(id);

        ProcessDefinition pd = query.singleResult();

        String deploymentId = pd.getDeploymentId();

        rs.deleteDeployment(deploymentId);

        ServletActionContext.getResponse().getWriter().write("success");
    }



}
