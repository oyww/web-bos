package com.gyf.bos.service;

import com.gyf.bos.model.User;
import com.gyf.bos.model.Workbill;
import com.gyf.bos.model.Workordermanage;
import com.gyf.bos.service.base.IBaseService;

import java.util.List;

public interface IWorkordermanageService extends IBaseService<Workordermanage>{


    List<Workordermanage> findAllWithNoStart();

    void start(String id);

    public Workordermanage findById(String bk);

    public void checkWorkOrderManager(String check, String taskId, String id);


}
