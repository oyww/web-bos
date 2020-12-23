package com.gyf.bos.service;

import com.gyf.bos.model.Decidedzone;
import com.gyf.bos.model.Function;
import com.gyf.bos.model.PageBean;
import com.gyf.bos.service.base.IBaseService;

public interface IFunctionService extends IBaseService<Function>{
    public void pageQuery(PageBean<Function> pb);
}
