package com.example.logistics_system.service;

import com.example.logistics_system.bean.Deliverer;
import com.example.logistics_system.bean.OrderForm;
import com.example.logistics_system.bean.User;
import com.example.logistics_system.dao.DelivererOrderDAO;
import com.example.logistics_system.dao.OrderFormDAO;
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
    private OrderFormDAO orderFormDAO;

    public int addOrderService(User user, OrderForm orderForm)
    {
        if (user == null)
            return 2;
        orderForm.setOrderNumber(OrderUtil.generateOrderNumber());
        orderForm.setState(OrderUtil.ORDER_ORDER);
        orderForm.setUser(user);
        orderFormDAO.save(orderForm);
        return 0;
    }

    public Page<OrderForm> getApplicableOrders(Deliverer deliverer, int start, int size)
    {
        start = start < 0 ? 0 : start;
        Sort sort = new Sort(Sort.Direction.ASC, "id");
        Pageable pageable = PageRequest.of(start, size, sort);
        return orderFormDAO.findAllBySenderProvinceAndSenderCityAndSenderCountryAndState(deliverer.getProvince(), deliverer.getCity(), deliverer.getCountry(), OrderUtil.ORDER_ORDER, pageable);
    }

    public OrderForm getOrderService(String orderNumber)
    {
        return orderFormDAO.findByOrderNumber(orderNumber);
    }

    public Page<OrderForm> getUserOrdersService(User user, int start, int size, int state)
    {
        start = start < 0 ? 0 : start;
        Sort sort = new Sort(Sort.Direction.ASC, "id");
        Pageable pageable = PageRequest.of(start, size, sort);
        switch (state)
        {
            case OrderUtil.ORDER_ALL:
                return orderFormDAO.findAllByUser(user, pageable);
            default:
                return orderFormDAO.findAllByUserAndState(user, state, pageable);
        }
    }

    public void deleteOrderService(int id)
    {
        orderFormDAO.deleteById(id);
    }
}
