package com.example.logistics_system.controller;

import com.example.logistics_system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@Controller
public class UserController
{
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@RequestParam(value = "name") String name,
                        @RequestParam(value = "pwd") String pwd,
                        HttpServletRequest request)
    {
        if (userService.loginService(name, pwd))
            request.getSession().setAttribute("user", name);
        else
            request.getSession().setAttribute("loginError", 0);
        return "index";
    }
}
