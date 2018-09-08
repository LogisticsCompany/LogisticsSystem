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

    public User loginService(String username, String password)
    {
        User user = userDAO.findByUsername(username);
        password = MD5Util.encode(password);
        if (user == null || !user.getPassword().equals(password))
            return null;
        return user;
    }

    public boolean registerService(User user)
    {
        if (user == null || userDAO.findByUsername(user.getUsername()) != null)
            return false;
//        UserUtil.modifySex(user);
        user.setAddress("");
        user.setProvince(-1);
        user.setCity(-1);
        user.setCountry(-1);
        user.setPassword(MD5Util.encode(user.getPassword()));
        userDAO.save(user);
        return true;
    }

    public void saveUserService(User user)
    {
        userDAO.save(user);
    }

    public void modifyPasswordService(User user, String password)
    {
        password = MD5Util.encode(password);
        user.setPassword(password);
        userDAO.save(user);
    }
}
