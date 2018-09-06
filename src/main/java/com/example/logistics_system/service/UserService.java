package com.example.logistics_system.service;

import com.example.logistics_system.bean.User;
import com.example.logistics_system.dao.UserDAO;
import com.example.logistics_system.utils.MD5Util;
import com.example.logistics_system.utils.UserUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService
{
    @Autowired
    private UserDAO userDAO;

    public boolean loginService(String username, String pwd)
    {
        User user = userDAO.findByUsername(username);
        pwd = MD5Util.encode(pwd);
        if (user == null)
            return false;
        return user.getPassword().equals(pwd);
    }

    public boolean registerService(User user)
    {
        if (user == null)
            return false;
        User tmp = userDAO.findByUsername(user.getUsername());
        if (tmp != null)
            return false;
        UserUtil.modifySex(user);
        user.setPassword(MD5Util.encode(user.getPassword()));
        userDAO.save(user);
        return true;
    }
}
