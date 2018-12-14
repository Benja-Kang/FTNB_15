package com.fantai.entity;

import java.sql.Timestamp;

public class SensorInfoList {
    private String sy_di_code;
    private Double se_hr_tem;
    private Double se_hr_hum;
    private Double se_hr_pressure;
    private Timestamp se_hr_time;

    public String getHr_time() {
        return se_hr_time.toString();
    }

    public void setDi_Code(String di_code) {
        this.sy_di_code = di_code;
    }

    public String getDi_Code() {
        return sy_di_code;
    }
    public Double getTem() {
        return se_hr_tem;
    }
    public Double getHum() {
        return se_hr_hum;
    }
    public Double getPressure() {
        return se_hr_pressure;
    }
}
