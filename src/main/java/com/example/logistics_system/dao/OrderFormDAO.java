package com.example.logistics_system.dao;

import com.example.logistics_system.bean.OrderForm;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderFormDAO extends JpaRepository<OrderForm, Integer>
{
}
