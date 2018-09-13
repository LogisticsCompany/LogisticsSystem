package com.example.logistics_system.controller;

import com.example.logistics_system.bean.Deliverer;
import com.example.logistics_system.bean.DelivererTemp;
import com.example.logistics_system.service.DelivererService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
public class DelivererController
{
    @Autowired
    private DelivererService delivererService;

    @RequestMapping(value = "/deliverer", method = RequestMethod.POST)
    public String generateDeliverer(HttpServletRequest request)
    {
        DelivererTemp delivererTemp = delivererService.generateDelivererService();
        request.getSession().setAttribute("delivererTemp", delivererTemp);
        return "";
    }

    @RequestMapping(value = "/delivererLogin", method = RequestMethod.POST)
    public String login(String username, String password, HttpServletRequest request)
    {
        Deliverer deliverer;
        if ((deliverer = delivererService.loginService(username, password)) != null)
        {
            request.getSession().setAttribute("deliverer", deliverer);
            return "redirect:delivererOrders";
        }
        else
        {
            request.getSession().setAttribute("loginError", 0);
            return "del_login";
        }
    }

    @RequestMapping(value = "/deliverer", method = RequestMethod.GET)
    public String getDeliverers(HttpServletRequest request,
                                @RequestParam(value = "start", defaultValue = "0") int start,
                                @RequestParam(value = "size", defaultValue = "10") int size)
    {
        Page<Deliverer> deliverers = delivererService.getDeliverersService(start, size);
        request.getSession().setAttribute("deliverers", deliverers);
        return "";
    }

    @RequestMapping(value = "/deliverer", method = RequestMethod.DELETE)
    public String deleteDeliverer(int id)
    {
        delivererService.deleteDelivererService(id);
        return "";
    }

    @RequestMapping(value = "/delivererInformation", method = RequestMethod.POST)
    public String modifyPersonalInfo(Deliverer deliverer, HttpServletRequest request)
    {
        delivererService.saveDelivererService(deliverer);
        request.getSession().setAttribute("deliverer", deliverer);
        return "courier_inf";
    }

    @RequestMapping(value = "/generateDeliverer", method = RequestMethod.POST)
    @ResponseBody
    public String generateDeliverer()
    {
        DelivererTemp delivererTemp = delivererService.generateDelivererService();
        Gson gson = new Gson();
        return gson.toJson(delivererTemp);
    }
}
