package com.example.logistics_system.controller;

import com.example.logistics_system.bean.Deliverer;
import com.example.logistics_system.bean.OrderForm;
import com.example.logistics_system.bean.User;
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
        User user = (User) request.getSession().getAttribute("user");
        switch (orderFormService.addOrderService(user, orderForm))
        {
            case 2:
                request.getSession().setAttribute("noUser", 0);
                break;
            case 0:
                request.getSession().setAttribute("orderForm", orderForm);
                request.getSession().setAttribute("user", user);
                break;
        }
        return "order_finish";
    }

    @RequestMapping(value = "/delivererOrders", method = RequestMethod.GET)
    public String getApplicableOrders(HttpServletRequest request,
                                      @RequestParam(value = "start", defaultValue = "0") int start,
                                      @RequestParam(value = "size", defaultValue = "10") int size)
    {
        Deliverer deliverer = (Deliverer) request.getSession().getAttribute("deliverer");
        Page<OrderForm> orderForms = orderFormService.getApplicableOrders(deliverer, start, size);
        request.getSession().setAttribute("orderForms", orderForms);
        return "";
    }

    @RequestMapping(value = "/userOrders", method = RequestMethod.GET)
    public String getUserOrders(HttpServletRequest request,
                                @RequestParam(value = "start", defaultValue = "0") int start,
                                @RequestParam(value = "size", defaultValue = "10") int size,
                                @RequestParam(value = "state") int state)
    {
        User user = (User) request.getSession().getAttribute("user");
        Page<OrderForm> orderForms = orderFormService.getUserOrdersService(user, start, size, state);
        request.getSession().setAttribute("orderForms", orderForms);
        request.getSession().setAttribute("state", state);
        return "my_order";
    }

    @RequestMapping(value = "/order", method = RequestMethod.GET)
    public String getOrder(String orderNumber, HttpServletRequest request)
    {
        OrderForm orderForm = orderFormService.getOrderService(orderNumber);
        request.getSession().setAttribute("orderForm", orderForm);
        return "";
    }

    @RequestMapping(value = "/order", method = RequestMethod.PUT)
    public String modifyOrderState(int id, int state, HttpServletRequest request)
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

    @RequestMapping(value = "/deleteOrder", method = RequestMethod.GET)
    public String deleteOrder(int id, int state)
    {
        orderFormService.deleteOrderService(id);
        return "redirect:userOrders?state=" + state;
    }
}
