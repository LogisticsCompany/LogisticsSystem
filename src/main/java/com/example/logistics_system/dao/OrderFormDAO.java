package com.example.logistics_system.dao;

import com.example.logistics_system.bean.OrderForm;
import com.example.logistics_system.bean.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Set;

public interface OrderFormDAO extends JpaRepository<OrderForm, Integer>
{
    Page<OrderForm> findAllBySenderProvinceAndSenderCityAndSenderCountryAndStateAndIdNotIn(int province, int city, int country, int state, Set<Integer> ids, Pageable pageable);

    OrderForm findByOrderNumber(String orderNumber);

    Page<OrderForm> findAllByUser(User user, Pageable pageable);

    Page<OrderForm> findAllByUserAndState(User user, int state, Pageable pageable);
}
