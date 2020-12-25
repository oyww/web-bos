package com.gyf.bos.service.impl;

import com.gyf.bos.dao.IWorkordermanageDao;

import com.gyf.bos.model.Workordermanage;
import com.gyf.bos.service.IWorkordermanageService;
import com.gyf.bos.service.base.BaseServiceImpl;
import org.activiti.engine.HistoryService;

import org.activiti.engine.RuntimeService;
import org.activiti.engine.TaskService;
import org.activiti.engine.task.Task;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional//事务是由事务管理器来实现
public class WorkordermanageServiceImpl extends BaseServiceImpl<Workordermanage> implements IWorkordermanageService {
    @Autowired
    private IWorkordermanageDao workOrderManageDao;
    @Autowired
    private RuntimeService rs;
    @Autowired
    private TaskService taskService;
    @Autowired
    private HistoryService historyService;
    @Override
    public void save(Workordermanage entity) {
        workordermanageDao.save(entity);
    }

    @Override
    public void delete(Workordermanage entity) {

    }

    @Override
    public void update(Workordermanage entity) {

    }

    @Override
    public Workordermanage find(Serializable id) {
        return null;
    }

    @Override
    public List<Workordermanage> findAll() {
        return null;
    }

    @Override
    public List<Workordermanage> findAllWithNoStart() {

        DetachedCriteria dc = DetachedCriteria.forClass(Workordermanage.class);
        dc.add(Restrictions.eq("start","0"));
        return workordermanageDao.findAllByDetachedCriteria(dc);
    }

    @Override
    public void start(String id) {
        //启动配送流程
        //1.根据id查找Workordermanager
        Workordermanage wom = workordermanageDao.find(id);

        //2.把start改成1
        wom.setStart("1");

        //3.启动流程实例transfer
        //流程变量
        Map<String,Object> info = new HashMap<String,Object>();
        info.put("orderInfo",wom.toString());

        //工作单的id
        String businessId = wom.getId();
        rs.startProcessInstanceByKey("transfer",businessId,info);
    }

    @Override
    public Workordermanage findById(String bk) {
        return workOrderManageDao.findById(bk);
    }

    @Override
    public void checkWorkOrderManager(String check, String taskId, String id) {
        // TODO Auto-generated method stub
        //1.取出任务【一定要先取出来】
        Task task =taskService.createTaskQuery().taskId(taskId).singleResult();
        String pii = task.getProcessInstanceId();
        //2.办理任务
        Map<String,Object> vars = new HashMap<String,Object>();
        vars.put("check", check);
        taskService.complete(taskId, vars);
        if(check.equals("0")){
            //3.更改状态
            workOrderManageDao.findById(id).setStart("0");
            //4.删除流程实例
            historyService.deleteHistoricProcessInstance(pii);
        }
    }
}
