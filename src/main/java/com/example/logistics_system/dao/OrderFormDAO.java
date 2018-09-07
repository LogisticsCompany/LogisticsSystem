package com.example.logistics_system.dao;

import com.example.logistics_system.bean.OrderForm;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderFormDAO extends JpaRepository<OrderForm, Integer>
{
    Page<OrderForm> findAllBySenderProvinceAndSenderCityAndSenderCountry(String province, String city, String country, Pageable pageable);
}
