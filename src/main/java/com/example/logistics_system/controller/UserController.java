package com.example.logistics_system.controller;

import com.example.logistics_system.bean.User;
import com.example.logistics_system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
public class UserController
{
    @Autowired
    private UserService userService;

    @RequestMapping(value = "/userLogin", method = RequestMethod.POST)
    public String login(@RequestParam(value = "name") String username,
                        @RequestParam(value = "pwd") String pwd,
                        HttpServletRequest request)
    {
        if (userService.loginService(username, pwd))
            request.getSession().setAttribute("username", username);
        else
            request.getSession().setAttribute("loginError", 0);
        return "index";
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(User user, HttpServletRequest request)
    {
        if (!userService.registerService(user))
            request.getSession().setAttribute("registerError", 0);
        return "index";
    }
}
