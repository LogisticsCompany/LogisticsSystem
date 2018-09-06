package com.example.logistics_system.service;

import com.example.logistics_system.bean.OrderForm;
import com.example.logistics_system.bean.User;
import com.example.logistics_system.dao.UserDAO;
import com.example.logistics_system.utils.OrderUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderFormService
{
    @Autowired
    private UserDAO userDAO;

    public int addOrderService(String username, OrderForm orderForm)
    {
        if (username == null)
            return 1;
        User user = userDAO.findByUsername(username);
        if (user == null)
            return 2;
        orderForm.setState(OrderUtil.ORDER_ORDER);
        user.getOrderForms().add(orderForm);
        userDAO.save(user);
        return 0;
    }
}
