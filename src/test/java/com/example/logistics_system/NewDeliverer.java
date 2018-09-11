package com.example.logistics_system;

import com.example.logistics_system.bean.DelivererTemp;
import com.example.logistics_system.service.DelivererService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class NewDeliverer
{
    @Autowired
    private DelivererService delivererService;

    @Test
    public void contextLoads()
    {
        DelivererTemp delivererTemp = delivererService.generateDelivererService();
        System.out.println(delivererTemp.getUsername());
        System.out.println(delivererTemp.getPassword());
    }
}
