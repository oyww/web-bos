package com.test.hessian_service;

import com.caucho.hessian.client.HessianProxyFactory;
import com.oyww.bos.model.Customer;

import java.net.MalformedURLException;
import java.util.List;

public class App {
    public static void main(String[] args) {
        HessianProxyFactory proxyFactory=new HessianProxyFactory();
        try {
            CustomerService service = (CustomerService)proxyFactory.create(CustomerService.class, "http://localhost:8080/hessian/customer");
            List<Customer> customerList = service.findall();
            for (Customer customer : customerList) {
                System.out.println(customer);
            }
        } catch (MalformedURLException e) {
            e.printStackTrace();
        }
    }
}
