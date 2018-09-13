package com.example.logistics_system.service;

import com.example.logistics_system.bean.Deliverer;
import com.example.logistics_system.bean.DelivererOrder;
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
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
public class OrderFormService
{
    @Autowired
    private OrderFormDAO orderFormDAO;

    @Autowired
    private DelivererOrderDAO delivererOrderDAO;

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
        Set<DelivererOrder> delivererOrders = deliverer.getDelivererOrders();
        Set<Integer> ids = new HashSet<>();
        if (delivererOrders != null)
        {
            for (DelivererOrder delivererOrder : delivererOrders)
                ids.add(delivererOrder.getOrderForm().getId());
        }
        if (ids.isEmpty())
            ids.add(Integer.MAX_VALUE);
        System.out.println(ids);
        return orderFormDAO.findAllBySenderProvinceAndSenderCityAndSenderCountryAndStateAndIdNotIn(deliverer.getProvince(), deliverer.getCity(), deliverer.getCountry(), OrderUtil.ORDER_ORDER, ids, pageable);
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

    @Transactional
    public void deleteOrderService(int id)
    {
        OrderForm orderForm = orderFormDAO.getOne(id);
        delivererOrderDAO.deleteAllByOrderForm(orderForm);
        orderFormDAO.deleteById(id);
    }

    public void signOrderService(int id)
    {
        OrderForm orderForm = orderFormDAO.getOne(id);
        orderForm.setState(OrderUtil.ORDER_SIGN);
        orderFormDAO.save(orderForm);
    }

    public List<OrderForm> getAllOrderedOrderService()
    {
        return orderFormDAO.findAllByState(OrderUtil.ORDER_ORDER);
    }
}
