package com.example.logistics_system.controller;

import com.example.logistics_system.bean.OrderForm;
import com.example.logistics_system.service.OrderFormService;
import com.example.logistics_system.utils.OrderUtil;
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
        System.out.println(orderForm);
//        String username = (String) request.getSession().getAttribute("username");
//        switch (orderFormService.addOrderService(username, orderForm))
//        {
//            case 1:
//                request.setAttribute("notLoggedIn", 0);
//                break;
//            case 2:
//                request.setAttribute("noUser", 0);
//                break;
//            case 0:
//                request.setAttribute("orderNumber", orderForm.getOrderNumber());
//                break;
//        }
        return "new_order";
    }

    @RequestMapping(value = "/delivererOrders", method = RequestMethod.GET)
    public String getApplicableOrders(HttpServletRequest request,
                                      @RequestParam(value = "start", defaultValue = "0") int start,
                                      @RequestParam(value = "size", defaultValue = "10") int size)
    {
        String username = (String) request.getSession().getAttribute("username");
        Page<OrderForm> orderForms = orderFormService.getApplicableOrders(username, start, size);
        request.getSession().setAttribute("orderForms", orderForms);
        return "";
    }

    @RequestMapping(value = "/userOrders", method = RequestMethod.GET)
    public String getUserOrders(HttpServletRequest request,
                                @RequestParam(value = "start", defaultValue = "0") int start,
                                @RequestParam(value = "size", defaultValue = "10") int size,
                                @RequestParam(value = "state") String state)
    {
        String username = (String) request.getSession().getAttribute("username");
        Page<OrderForm> orderForms = orderFormService.getUserOrdersService(username, start, size, state);
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

    @RequestMapping(value = "/order", method = RequestMethod.PUT)
    public String modifyOrderState(int id, String state, HttpServletRequest request)
    {
        switch (orderFormService.modifyOrderStateService(id, state))
        {
            case OrderUtil.NORMAL_STATE:
                request.getSession().setAttribute("result", "操作成功");
                break;
            case OrderUtil.ORDER_NOT_EXIST:
                request.getSession().setAttribute("result", "订单不存在");
                break;
            case OrderUtil.ILLEGAL_OPERATION:
                request.getSession().setAttribute("result", "非法操作");
                break;
        }
        return "";
    }

    @RequestMapping(value = "/order", method = RequestMethod.DELETE)
    public String deleteOrder(int id)
    {
        orderFormService.deleteOrderService(id);
        return "";
    }
}
