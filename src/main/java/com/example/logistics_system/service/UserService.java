package com.example.logistics_system.service;

import com.example.logistics_system.bean.User;
import com.example.logistics_system.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService
{
    @Autowired
    private UserDAO userDAO;

    public boolean loginService(String name, String pwd)
    {
        User user = userDAO.findByName(name);
        return user.getPassword().equals(pwd);
    }
}
