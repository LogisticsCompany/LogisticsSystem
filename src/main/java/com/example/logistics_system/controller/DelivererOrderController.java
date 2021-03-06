package com.example.logistics_system.controller;

import com.example.logistics_system.bean.Deliverer;
import com.example.logistics_system.bean.DelivererOrder;
import com.example.logistics_system.bean.OrderForm;
import com.example.logistics_system.service.DelivererOrderService;
import com.example.logistics_system.service.DelivererService;
import com.example.logistics_system.service.OrderFormService;
import com.example.logistics_system.utils.DelivererOrderUtil;
import com.example.logistics_system.utils.OrderUtil;
import com.google.gson.GsonBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Controller
public class DelivererOrderController
{
    @Autowired
    private DelivererOrderService delivererOrderService;

    @Autowired
    private DelivererService delivererService;

    @Autowired
    private OrderFormService orderFormService;

    @RequestMapping(value = "/delivererStateOrders", method = RequestMethod.GET)
    public String getDelivererOrders(HttpServletRequest request,
                                     @RequestParam(value = "start", defaultValue = "0") int start,
                                     @RequestParam(value = "size", defaultValue = "10") int size,
                                     @RequestParam(value = "state") int state)
    {
        Deliverer deliverer = (Deliverer) request.getSession().getAttribute("deliverer");
        Page<DelivererOrder> delivererOrders = delivererOrderService.getDelivererOrdersService(deliverer, state, start, size);
        request.getSession().setAttribute("delivererOrders", delivererOrders);
        request.getSession().setAttribute("state", state);
        return "order";
    }

    @RequestMapping(value = "/requestOrder", method = RequestMethod.GET)
    public String requestOrder(int orderFormId, HttpServletRequest request)
    {
        Deliverer deliverer = (Deliverer) request.getSession().getAttribute("deliverer");
        if (delivererOrderService.requestOrderService(deliverer, orderFormId))
            request.getSession().setAttribute("requestMessage", "申请成功");
        else
            request.getSession().setAttribute("requestMessage", "不能重复申请!");
        return "redirect:delivererOrders";
    }

    @RequestMapping(value = "/cancelRequest", method = RequestMethod.GET)
    public String cancelRequest(int orderFormId, HttpServletRequest request)
    {
        Deliverer deliverer = (Deliverer) request.getSession().getAttribute("deliverer");
        String cancelMessage = delivererOrderService.cancelRequestService(deliverer, orderFormId);
        request.getSession().setAttribute("cancelMessage", cancelMessage);
        return "redirect:delivererStateOrders?state=" + DelivererOrderUtil.ORDER_DELIVERER_REQUEST;
    }

    @RequestMapping(value = "/accomplishOrder", method = RequestMethod.GET)
    public String accomplishOrder(int orderFormId, HttpServletRequest request)
    {
        Deliverer deliverer = (Deliverer) request.getSession().getAttribute("deliverer");
        String deliveryMessage = delivererOrderService.orderStateService(deliverer, orderFormId, DelivererOrderUtil.ORDER_DONE, OrderUtil.ORDER_ARRIVED);
        request.getSession().setAttribute("deliveryMessage", deliveryMessage);
        return "redirect:delivererStateOrders?state=" + DelivererOrderUtil.ORDER_ADMIN_ACCEPT;
    }

    @RequestMapping(value = "/optionDeliverers", method = {RequestMethod.POST, RequestMethod.GET})
    @ResponseBody
    public String getOptionDeliverers(@RequestParam(value = "orderFormId") String orderFormId)
    {
        GsonBuilder gsonBuilder = new GsonBuilder();
        Map<Integer, String> map = delivererOrderService.getOptionDeliverers(Integer.valueOf(orderFormId));
        return gsonBuilder.create().toJson(map);
    }

    @RequestMapping(value = "/allRequestOrders", method = RequestMethod.GET)
    public String getAllRequestOrders(HttpServletRequest request)
    {
        Set<DelivererOrder> delivererOrders = delivererOrderService.getAllRequestOrdersService();
        request.getSession().setAttribute("delivererOrders", delivererOrders);
        return "admin/apply/list2";
    }

    @RequestMapping(value = "/acceptOrder", method = RequestMethod.POST)
    public String acceptDelivererOrder(@RequestParam(value = "delivererId") int delivererId,
                                       @RequestParam(value = "orderFormId") int orderFormId,
                                       HttpServletRequest request)
    {
        delivererOrderService.acceptOrderService(delivererId, orderFormId);
        request.getSession().setAttribute("message", "操作成功");
        return "redirect:allRequestOrders";
    }

    @RequestMapping(value = "/refuseOrder", method = RequestMethod.POST)
    public String refuseDelivererOrder(@RequestParam(value = "delivererId") int delivererId,
                                       @RequestParam(value = "orderFormId") int orderFormId,
                                       HttpServletRequest request)
    {
        delivererOrderService.refuseOrderService(delivererId, orderFormId);
        request.getSession().setAttribute("message", "操作成功");
        return "redirect:allRequestOrders";
    }

    @RequestMapping(value = "/delivererAndOrder", method = RequestMethod.GET)
    public String getDelivererAndOrder(HttpServletRequest request)
    {
        List<Deliverer> deliverers = delivererService.getAllDeliverers();
        List<OrderForm> orderForms = orderFormService.getAllOrderedOrderService();
        request.getSession().setAttribute("deliverers", deliverers);
        request.getSession().setAttribute("orderForms", orderForms);
        return "admin/apply/list3";
    }

    @RequestMapping(value = "/assignOrder", method = RequestMethod.POST)
    public String assignOrder(@RequestParam(value = "delivererId") int delivererId,
                              @RequestParam(value = "orderFormId") int orderFormId,
                              HttpServletRequest request)
    {
        delivererOrderService.assignOrderService(delivererId, orderFormId);
        request.getSession().setAttribute("message", "操作成功");
        return "redirect:delivererAndOrder";
    }

    @RequestMapping(value = "/courierOrders", method = RequestMethod.GET)
    public String courierOrders(HttpServletRequest request,
                                @RequestParam(value = "start", defaultValue = "0") int start,
                                @RequestParam(value = "size", defaultValue = "10") int size,
                                @RequestParam(value = "state") int state)
    {
        Page<DelivererOrder> delivererOrders = delivererOrderService.courierOrdersService(state, start, size);
        request.getSession().setAttribute("delivererOrders", delivererOrders);
        request.getSession().setAttribute("state", state);
        return "admin/apply/list";
    }
}
