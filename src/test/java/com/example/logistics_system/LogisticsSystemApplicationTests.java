package com.example.logistics_system;

import com.example.logistics_system.bean.OrderForm;
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
    private OrderFormService orderFormService;

    @Test
    public void contextLoads()
    {
    }

}
