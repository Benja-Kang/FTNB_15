package com.fantai.dao;

import com.fantai.annotation.MyBatisRepository;
import com.fantai.entity.SensorInfo;
import com.fantai.entity.SensorInfoList;

import java.util.List;

@MyBatisRepository
public interface SensorInfoMapper {

    List<SensorInfo> findByUser(String uid);
    List<SensorInfoList> findDataByUser(String code);
    SensorInfo findByCode(String code);

}
