package com.example.logistics_system.service;

import com.example.logistics_system.bean.Deliv;
import com.example.logistics_system.bean.Deliverer;
import com.example.logistics_system.bean.DelivererOrder;
import com.example.logistics_system.bean.OrderForm;
import com.example.logistics_system.dao.DelivererDAO;
import com.example.logistics_system.dao.DelivererOrderDAO;
import com.example.logistics_system.dao.OrderFormDAO;
import com.example.logistics_system.utils.DelivererOrderUtil;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

@Service
public class DelivererOrderService
{
    @Autowired
    private DelivererOrderDAO delivererOrderDAO;

    @Autowired
    private OrderFormDAO orderFormDAO;

    @Autowired
    private DelivererDAO delivererDAO;

    public boolean requestOrderService(Deliverer deliverer, int orderFormId)
    {
        OrderForm orderForm = orderFormDAO.getOne(orderFormId);
        if (delivererOrderDAO.findByDelivererAndOrderForm(deliverer, orderForm) != null)
            return false;
        DelivererOrder delivererOrder = new DelivererOrder(DelivererOrderUtil.ORDER_DELIVERER_REQUEST, orderForm, deliverer);
        orderForm.getDelivererOrders().add(delivererOrder);

        if (deliverer != null)
        {
            if (deliverer.getDelivererOrders() == null)
                System.out.println("deliverer.getDelivererOrders() is null");
        }
        else
            System.out.println("deliverer is null");

        if (deliverer.getDelivererOrders() == null)
            deliverer.setDelivererOrders(new HashSet<>());
        deliverer.getDelivererOrders().add(delivererOrder);
        delivererOrderDAO.save(delivererOrder);
        return true;
    }

    public String cancelRequestService(Deliverer deliverer, int orderFormId)
    {
        OrderForm orderForm = orderFormDAO.getOne(orderFormId);
        DelivererOrder delivererOrder;
        if ((delivererOrder = delivererOrderDAO.findByDelivererAndOrderForm(deliverer, orderForm)) == null)
            return "请求不存在";
        delivererOrderDAO.delete(delivererOrder);
        return "撤销成功";
    }

    public void refuseOrderService(int delivererId, int orderFormId)
    {
        OrderForm orderForm = orderFormDAO.getOne(orderFormId);
        Deliverer deliverer = delivererDAO.getOne(delivererId);
        DelivererOrder delivererOrder = delivererOrderDAO.findByDelivererAndOrderForm(deliverer, orderForm);
        delivererOrder.setState(DelivererOrderUtil.ORDER_ADMIN_REFUSE);
        delivererOrderDAO.save(delivererOrder);
    }

    public void acceptOrderService(int delivererId, int orderFormId)
    {
        OrderForm orderForm = orderFormDAO.getOne(orderFormId);
        Set<DelivererOrder> delivererOrders = orderForm.getDelivererOrders();
        for (DelivererOrder delivererOrder : delivererOrders)
        {
            if (delivererOrder.getDeliverer().getId() == delivererId)
                delivererOrder.setState(DelivererOrderUtil.ORDER_ADMIN_ACCEPT);
            else
                delivererOrder.setState(DelivererOrderUtil.ORDER_ADMIN_REFUSE);
        }
        delivererOrderDAO.saveAll(delivererOrders);
    }

    public Page<DelivererOrder> getDelivererOrdersService(Deliverer deliverer, int state, int start, int size)
    {
        start = start < 0 ? 0 : start;
        Sort sort = new Sort(Sort.Direction.ASC, "id");
        Pageable pageable = PageRequest.of(start, size, sort);
        return delivererOrderDAO.findAllByDelivererAndState(deliverer, state, pageable);
    }

    public Page<DelivererOrder> getDelivererRequestService(int delivererId, int orderFormId, int start, int size)
    {
        Deliverer deliverer = delivererDAO.getOne(delivererId);
        OrderForm orderForm = orderFormDAO.getOne(orderFormId);
        start = start < 0 ? 0 : start;
        Sort sort = new Sort(Sort.Direction.ASC, "id");
        Pageable pageable = PageRequest.of(start, size, sort);
        if (delivererId != 0 && orderFormId != 0)
            return delivererOrderDAO.findAllByDelivererAndOrderFormAndState(deliverer, orderForm, DelivererOrderUtil.ORDER_DELIVERER_REQUEST, pageable);
        else if (delivererId != 0)
            return delivererOrderDAO.findAllByDelivererAndState(deliverer, DelivererOrderUtil.ORDER_DELIVERER_REQUEST, pageable);
        else if (orderFormId != 0)
            return delivererOrderDAO.findAllByOrderFormAndState(orderForm, DelivererOrderUtil.ORDER_DELIVERER_REQUEST, pageable);
        return delivererOrderDAO.findAllByState(DelivererOrderUtil.ORDER_DELIVERER_REQUEST, pageable);
    }

    public String orderStateService(Deliverer deliverer, int orderFormId, int delivererOrderState, int orderState)
    {
        OrderForm orderForm = orderFormDAO.getOne(orderFormId);
        DelivererOrder delivererOrder = delivererOrderDAO.findByDelivererAndOrderForm(deliverer, orderForm);
        if (delivererOrder == null)
            return "订单不存在";
        delivererOrder.setState(delivererOrderState);
        delivererOrderDAO.save(delivererOrder);
        orderForm.setState(orderState);
        orderFormDAO.save(orderForm);
        return "操作成功";
    }

    public Map<Integer, String> getOptionDeliverers(Integer orderFormId)
    {
        Gson gson = new Gson();
        OrderForm orderForm = orderFormDAO.getOne(orderFormId);
        Set<DelivererOrder> delivererOrders = orderForm.getDelivererOrders();
        Map<Integer, String> map = new HashMap<>();
        for (DelivererOrder delivererOrder : delivererOrders)
        {
            if (delivererOrder.getState() == DelivererOrderUtil.ORDER_DELIVERER_REQUEST)
            {
                Deliverer deliverer = delivererOrder.getDeliverer();
                int id = deliverer.getId();
                String name = deliverer.getName();
                Deliv deliv = new Deliv(id, name);
                map.put(id, gson.toJson(deliv));
            }
        }
        return map;
    }

    public Set<DelivererOrder> getAllRequestOrdersService()
    {
        return delivererOrderDAO.findAllByState(DelivererOrderUtil.ORDER_DELIVERER_REQUEST);
    }
}
