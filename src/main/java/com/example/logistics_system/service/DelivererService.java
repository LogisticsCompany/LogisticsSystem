package com.example.logistics_system.service;

import com.example.logistics_system.bean.Deliverer;
import com.example.logistics_system.dao.DelivererDAO;
import com.example.logistics_system.utils.DelivererUtil;
import com.example.logistics_system.utils.MD5Util;
import com.example.logistics_system.utils.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.Random;

@Service
public class DelivererService
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

    public Deliverer loginService(String username, String password)
    {
        Deliverer deliverer = delivererDAO.findByUsername(username);
        password = MD5Util.encode(password);
        if (deliverer == null || !deliverer.getPassword().equals(password))
            return null;
        return deliverer;
    }

    public Page<Deliverer> getDeliverersService(int start, int size)
    {
        start = start < 0 ? 0 : start;
        Sort sort = new Sort(Sort.Direction.ASC, "id");
        Pageable pageable = PageRequest.of(start, size, sort);
        return delivererDAO.findAll(pageable);
    }

    public void deleteDelivererService(int id)
    {
        delivererDAO.deleteById(id);
    }
}
