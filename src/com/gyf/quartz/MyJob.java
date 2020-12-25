package com.gyf.quartz;

import java.text.SimpleDateFormat;
import java.util.Date;

public class MyJob {
    public void run(){
        System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss执行了任务").format(new Date()));
    }
}
