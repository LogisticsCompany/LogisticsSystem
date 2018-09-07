package com.example.logistics_system.service;

import com.example.logistics_system.bean.Deliverer;
import com.example.logistics_system.dao.DelivererDAO;
import com.example.logistics_system.utils.DelivererUtil;
import com.example.logistics_system.utils.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Random;

@Service
public class AdminService
{
    @Autowired
    private DelivererDAO delivererDAO;

    public Deliverer generateDelivererService()
    {
        String username;
        while (delivererDAO.findByUsername((username = DelivererUtil.generateUsername())) != null)
            Util.sleep(new Random().nextInt(10));
        Deliverer deliverer = new Deliverer();
        deliverer.setUsername(username);
        deliverer.setPassword(DelivererUtil.generatePassword());
        delivererDAO.save(deliverer);
        return deliverer;
    }
}
