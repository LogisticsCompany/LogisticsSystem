package com.example.logistics_system.service;

import com.example.logistics_system.bean.Deliverer;
import com.example.logistics_system.bean.OrderForm;
import com.example.logistics_system.bean.User;
import com.example.logistics_system.dao.DelivererDAO;
import com.example.logistics_system.dao.OrderFormDAO;
import com.example.logistics_system.dao.UserDAO;
import com.example.logistics_system.utils.OrderUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.Set;

@Service
public class OrderFormService
{
    @Autowired
    private UserDAO userDAO;

    @Autowired
    private DelivererDAO delivererDAO;

    @Autowired
    private OrderFormDAO orderFormDAO;

    public int addOrderService(User user, OrderForm orderForm)
    {
        if (user == null)
            return 2;
        orderForm.setOrderNumber(OrderUtil.generateOrderNumber());
        orderForm.setState(OrderUtil.ORDER_ORDER);
        orderForm.setUser(user);
        Set<OrderForm> orderForms = user.getOrderForms();
        orderForms.add(orderForm);
        orderFormDAO.saveAll(orderForms);
        return 0;
    }

    public Page<OrderForm> getApplicableOrders(String username, int start, int size)
    {
        Deliverer deliverer = delivererDAO.findByUsername(username);
        start = start < 0 ? 0 : start;
        Sort sort = new Sort(Sort.Direction.ASC, "id");
        Pageable pageable = PageRequest.of(start, size, sort);
        return orderFormDAO.findAllBySenderProvinceAndSenderCityAndSenderCountry(deliverer.getProvince(), deliverer.getCity(), deliverer.getCountry(), pageable);
    }

    public OrderForm getOrderService(String orderNumber)
    {
        return orderFormDAO.findByOrderNumber(orderNumber);
    }

    public Page<OrderForm> getUserOrdersService(String username, int start, int size, String state)
    {
        start = start < 0 ? 0 : start;
        Sort sort = new Sort(Sort.Direction.ASC, "id");
        Pageable pageable = PageRequest.of(start, size, sort);
        User user = userDAO.findByUsername(username);
        if (user == null)
            return null;
        if (state == null)
            return orderFormDAO.findAllByUser(user, pageable);
        return orderFormDAO.findAllByUserAndState(user, state, pageable);
    }

    public int modifyOrderStateService(int id, String state)
    {
        OrderForm orderForm = orderFormDAO.getOne(id);
        if (orderForm == null)
            return OrderUtil.ORDER_NOT_EXIST;
        switch (state)
        {
            case OrderUtil.ORDER_ORDER:
                return OrderUtil.ILLEGAL_OPERATION;
            case OrderUtil.ORDER_DELIVERY:
                if (!orderForm.getState().equals(OrderUtil.ORDER_ADMIN_ACCEPT))
                    return OrderUtil.ILLEGAL_OPERATION;
                break;
            case OrderUtil.ORDER_SIGN:
                if (!orderForm.getState().equals(OrderUtil.ORDER_ARRIVED))
                    return OrderUtil.ILLEGAL_OPERATION;
                break;
            case OrderUtil.ORDER_ARRIVED:
                if (!orderForm.getState().equals(OrderUtil.ORDER_DELIVERY))
                    return OrderUtil.ILLEGAL_OPERATION;
                break;
            case OrderUtil.ORDER_DELIVERER_REQUEST:
                if (!orderForm.getState().equals(OrderUtil.ORDER_ORDER))
                    return OrderUtil.ILLEGAL_OPERATION;
                break;
            case OrderUtil.ORDER_ADMIN_ACCEPT:
            case OrderUtil.ORDER_ADMIN_REFUSE:
                if (!orderForm.getState().equals(OrderUtil.ORDER_ORDER) || !orderForm.getState().equals(OrderUtil.ORDER_DELIVERER_REQUEST))
                    return OrderUtil.ILLEGAL_OPERATION;
                break;
        }
        return OrderUtil.NORMAL_STATE;
    }

    public void deleteOrderService(int id)
    {
        orderFormDAO.deleteById(id);
    }
}
