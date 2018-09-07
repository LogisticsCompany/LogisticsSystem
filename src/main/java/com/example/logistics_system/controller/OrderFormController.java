package com.example.logistics_system.controller;

import com.example.logistics_system.bean.OrderForm;
import com.example.logistics_system.service.OrderFormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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

    @RequestMapping(value = "/applicableOrders", method = RequestMethod.GET)
    public String getApplicableOrder(HttpServletRequest request,
                                     @RequestParam(value = "start", defaultValue = "0") int start,
                                     @RequestParam(value = "size", defaultValue = "10") int size)
    {
        String username = (String) request.getSession().getAttribute("username");
        Page<OrderForm> orderForms = orderFormService.getApplicableOrder(username, start, size);
        request.getSession().setAttribute("orderForms", orderForms);
        return "";
    }

    @RequestMapping(value = "/order", method = RequestMethod.GET)
    public String getOrder(String orderNumber, HttpServletRequest request)
    {
        OrderForm orderForm = orderFormService.getOrderService(orderNumber);
        request.getSession().setAttribute("orderForm", orderForm);
        return "";
    }
}
