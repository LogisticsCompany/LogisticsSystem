package com.example.logistics_system;

import com.example.logistics_system.service.AdminService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class LogisticsSystemApplicationTests
{

    @Autowired
    private AdminService adminService;

    @Test
    public void contextLoads()
    {
        String username = "admin";
        String password = "admin";
        adminService.registerService(username, password);
    }

}
