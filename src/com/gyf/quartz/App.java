package com.gyf.quartz;

import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {
    public static void main(String[] args) {
        new ClassPathXmlApplicationContext("classpath:com/gyf/quartz/config/applicationContext.xml");
    }
}
