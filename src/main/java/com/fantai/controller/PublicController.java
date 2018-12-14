package com.fantai.controller;

import com.fantai.dao.CarInfoMapper;
import com.fantai.dao.LockInfoMapper;
import com.fantai.dao.SensorInfoMapper;
import com.fantai.entity.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/public")
public class PublicController {

    @Resource
    private CarInfoMapper carInfoMapper;

    @Resource
    private LockInfoMapper lockInfoMapper;

    @Resource
    private SensorInfoMapper sensorInfoMapper;

    @RequestMapping("/freshCar.do")
    @ResponseBody
    public List<CarInfo> freshCar(HttpServletRequest request){
        UserInfo userInfo = (UserInfo)request.getSession().getAttribute("user");
        String ui_id = userInfo.getSy_ui_id();
        List<CarInfo> list = carInfoMapper.findByUser(ui_id);
        return list;
    }

    @RequestMapping("/freshSensor.do")
    @ResponseBody
    public List<SensorInfo> freshSensor(HttpServletRequest request){
        UserInfo userInfo = (UserInfo)request.getSession().getAttribute("user");
        String ui_id = userInfo.getSy_ui_id();
        List<SensorInfo> list = sensorInfoMapper.findByUser(ui_id);  //获取专属于你账户的设备的信息
        return list;
    }

    @RequestMapping("/freshShowSensorChart.do")
    @ResponseBody
    public List<SensorInfoList> freshShowSensorChart(HttpServletRequest request){
        String deviceID = request.getQueryString();
        System.out.println(request.getQueryString());
        List<SensorInfoList> list = sensorInfoMapper.findDataByUser(deviceID);
        if(list.size()==0){
            System.out.println(list.size());
            System.out.println("No Datas!");
        }
        return list;
    }

    @RequestMapping("/freshLock.do")
    @ResponseBody
    public List<LockInfo> freshLock(HttpServletRequest request){
        UserInfo userInfo = (UserInfo)request.getSession().getAttribute("user");
        String ui_id = userInfo.getSy_ui_id();
        List<LockInfo> list = lockInfoMapper.findByUser(ui_id);
        return list;
    }

}
