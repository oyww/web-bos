package com.gyf.bos.dao.impl;

import com.gyf.bos.dao.IRegionDao;
import com.gyf.bos.dao.ISubareaDao;
import com.gyf.bos.dao.base.BaseDaoImpl;
import com.gyf.bos.model.Region;
import com.gyf.bos.model.Subarea;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SubareaDaoImpl extends BaseDaoImpl<Subarea> implements ISubareaDao {


    @Override
    public List<Object> findSubareasGroupByProvince() {
        String str1 = "SELECT r.province ,count(*) FROM ";
        String str2 = " Subarea s LEFT OUTER JOIN s.region r Group BY r.province";
        List<Object> list = (List<Object>)this.hibernateTemplate.find(str1 + str2);
        return list;
    }
}
