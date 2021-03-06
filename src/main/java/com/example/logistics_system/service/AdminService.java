package com.example.logistics_system.service;

import com.example.logistics_system.bean.Admin;
import com.example.logistics_system.dao.AdminDAO;
import com.example.logistics_system.utils.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminService
{
    @Autowired
    private AdminDAO adminDAO;

    public Admin loginService(String username, String password)
    {
        Admin admin = adminDAO.findByUsername(username);
        password = MD5Util.encode(password);
        if (admin == null || !admin.getPassword().equals(password))
            return null;
        return admin;
    }

    public void registerService(String username, String password)
    {
        Admin admin = new Admin();
        admin.setPassword(MD5Util.encode(password));
        admin.setUsername(username);
        adminDAO.save(admin);
    }
}
