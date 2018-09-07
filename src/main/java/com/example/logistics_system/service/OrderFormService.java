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

@Service
public class OrderFormService
{
    @Autowired
    private UserDAO userDAO;

    @Autowired
    private DelivererDAO delivererDAO;

    @Autowired
    private OrderFormDAO orderFormDAO;

    public int addOrderService(String username, OrderForm orderForm)
    {
        if (username == null)
            return 1;
        User user = userDAO.findByUsername(username);
        if (user == null)
            return 2;
        orderForm.setOrderNumber(OrderUtil.generateOrderNumber());
        orderForm.setState(OrderUtil.ORDER_ORDER);
        user.getOrderForms().add(orderForm);
        userDAO.save(user);
        return 0;
    }

    public Page<OrderForm> getApplicableOrder(String username, int start, int size)
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
}
