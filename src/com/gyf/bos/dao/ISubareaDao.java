package com.gyf.bos.dao;

import com.gyf.bos.dao.base.IBaseDao;
import com.gyf.bos.model.Region;
import com.gyf.bos.model.Subarea;

import java.util.List;

public interface ISubareaDao extends IBaseDao<Subarea> {
    List<Object> findSubareasGroupByProvince();

}
