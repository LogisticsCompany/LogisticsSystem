package com.example.logistics_system;

import com.example.logistics_system.bean.OrderForm;
import com.example.logistics_system.bean.User;
import com.example.logistics_system.dao.UserDAO;
import com.example.logistics_system.service.AdminService;
import com.example.logistics_system.service.OrderFormService;
import com.example.logistics_system.utils.OrderUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.domain.Page;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class LogisticsSystemApplicationTests
{

    @Autowired
    private UserDAO userDAO;

    @Test
    public void contextLoads()
    {
        User user = userDAO.getOne(1);
        User user1 = userDAO.getOne(1);
        User user2 = userDAO.getOne(2);
        System.out.println(user == user1);
        System.out.println(user == user2);
    }

}
