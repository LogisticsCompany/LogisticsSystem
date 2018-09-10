package com.example.logistics_system.dao;

import com.example.logistics_system.bean.OrderForm;
import com.example.logistics_system.bean.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderFormDAO extends JpaRepository<OrderForm, Integer>
{
    Page<OrderForm> findAllBySenderProvinceAndSenderCityAndSenderCountry(int province, int city, int country, Pageable pageable);
    OrderForm findByOrderNumber(String orderNumber);
    Page<OrderForm> findAllByUser(User user, Pageable pageable);
    Page<OrderForm> findAllByUserAndState(User user, String state, Pageable pageable);
}
