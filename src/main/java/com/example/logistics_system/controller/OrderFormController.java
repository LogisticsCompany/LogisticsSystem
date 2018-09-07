package com.example.logistics_system.controller;

import com.example.logistics_system.bean.OrderForm;
import com.example.logistics_system.service.OrderFormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class OrderFormController
{
    @Autowired
    private OrderFormService orderFormService;

    @RequestMapping(value = "/order", method = RequestMethod.POST)
    public String addOrder(OrderForm orderForm, HttpServletRequest request)
    {
        String username = (String) request.getSession().getAttribute("username");
        switch (orderFormService.addOrderService(username, orderForm))
        {
            case 1:
                request.setAttribute("notLoggedIn", 0);
                break;
            case 2:
                request.setAttribute("noUser", 0);
                break;
            case 0:
                request.setAttribute("orderNumber", orderForm.getOrderNumber());
                break;
        }
        return "new_order";
    }
}
