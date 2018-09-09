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
    public String login(String username, String password, HttpServletRequest request)
    {
        User user;
        if ((user = userService.loginService(username, password)) != null)
            request.getSession().setAttribute("user", user);
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

    @RequestMapping(value = "/userInformation", method = RequestMethod.POST)
    public String modifyPersonalInfo(User user, HttpServletRequest request)
    {
        userService.saveUserService(user);
        request.getSession().setAttribute("user", user);
        return "reinformation";
    }

    @RequestMapping(value = "/user", method = RequestMethod.POST)
    public String modifyPassword(String password, HttpServletRequest request)
    {
        User user = (User) request.getSession().getAttribute("user");
        userService.modifyPasswordService(user, password);
        request.getSession().setAttribute("user", user);
        return "";
    }
}
