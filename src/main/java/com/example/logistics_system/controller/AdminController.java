package com.example.logistics_system.controller;

import com.example.logistics_system.bean.Admin;
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

    @RequestMapping(value = "/adminLogin", method = RequestMethod.POST)
    public String login(String username, String password, HttpServletRequest request)
    {
        Admin admin;
        if ((admin = adminService.loginService(username, password)) != null)
            request.getSession().setAttribute("admin", admin);
        else
            request.getSession().setAttribute("loginError", 0);
        return "";
    }
}
