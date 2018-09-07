package com.example.logistics_system.service;

import com.example.logistics_system.bean.Deliverer;
import com.example.logistics_system.bean.OrderForm;
import com.example.logistics_system.dao.DelivererDAO;
import com.example.logistics_system.dao.OrderFormDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

@Service
public class DelivererService
{
    @Autowired
    private DelivererDAO delivererDAO;

    @Autowired
    private OrderFormDAO orderFormDAO;

    public Page<OrderForm> getApplicableOrder(String username)
    {
        Deliverer deliverer = delivererDAO.findByUsername(username);
        return orderFormDAO.findAllBySenderProvinceAndSenderCityAndSenderCountry(deliverer.getProvince(), deliverer.getCity(), deliverer.getCountry(), null);
    }
}
