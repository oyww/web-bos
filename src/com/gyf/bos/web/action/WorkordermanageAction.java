package com.gyf.bos.web.action;

import com.gyf.bos.model.Decidedzone;
import com.gyf.bos.model.Workordermanage;
import com.gyf.bos.web.action.base.BaseAction;
import com.gyf.crm.domain.Customer;
import org.apache.commons.lang3.StringUtils;

import java.io.IOException;
import java.util.List;

public class WorkordermanageAction extends BaseAction<Workordermanage>{


    @Override
    public String save() {
        workordermanageService.save(getModel());
        try {
            responseStr("success");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return NONE;
    }

    @Override
    public String update() {
        return null;
    }

    @Override
    public String delete() throws IOException {
        return null;
    }

    List<Workordermanage> list;

    public List<Workordermanage> getList() {
        return list;
    }

    @Override
    public String list() {

        //查询未启动配送流程的工作单
        list = workordermanageService.findAllWithNoStart();
        return "list";
    }

    public String start(){

        //启动配置流程
        workordermanageService.start(getModel().getId());

        //返回列表界面
        return list();
    }
}
