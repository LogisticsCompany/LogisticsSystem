package com.example.logistics_system.controller;

import com.example.logistics_system.bean.Deliverer;
import com.example.logistics_system.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class AdminController
{
    @Autowired
    private AdminService adminService;

    @RequestMapping(value = "/deliverer", method = RequestMethod.POST)
    public String generateDeliverer(HttpServletRequest request)
    {
        Deliverer deliverer = adminService.generateDelivererService();
        request.getSession().setAttribute("deliverer", deliverer);
        return "";
    }
}
