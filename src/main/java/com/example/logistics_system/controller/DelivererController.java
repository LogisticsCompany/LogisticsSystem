package com.example.logistics_system.controller;

import com.example.logistics_system.bean.Deliverer;
import com.example.logistics_system.bean.OrderForm;
import com.example.logistics_system.service.DelivererService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
public class DelivererController
{
    @Autowired
    private DelivererService delivererService;

    @RequestMapping(value = "/deliverer", method = RequestMethod.POST)
    public String generateDeliverer(HttpServletRequest request)
    {
        Deliverer deliverer = delivererService.generateDelivererService();
        request.getSession().setAttribute("deliverer", deliverer);
        return "";
    }
}
