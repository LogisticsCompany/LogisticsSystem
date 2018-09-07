package com.example.logistics_system.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class DelivererController
{
    @RequestMapping(value = "/order", method = RequestMethod.GET)
    public String getApplicableOrder(HttpServletRequest request)
    {
        String username = (String) request.getSession().getAttribute("username");
        return "";
    }
}
