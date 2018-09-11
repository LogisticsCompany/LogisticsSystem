package com.example.logistics_system.dao;

import com.example.logistics_system.bean.Deliverer;
import com.example.logistics_system.bean.DelivererOrder;
import com.example.logistics_system.bean.OrderForm;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Set;

public interface DelivererOrderDAO extends JpaRepository<DelivererOrder, Integer>
{
    DelivererOrder findByDelivererAndOrderForm(Deliverer deliverer, OrderForm orderForm);

    Page<DelivererOrder> findAllByDeliverer(Deliverer deliverer, Pageable pageable);

    Page<DelivererOrder> findAllByDelivererAndState(Deliverer deliverer, int state, Pageable pageable);

    Page<DelivererOrder> findAllByDelivererAndOrderFormAndState(Deliverer deliverer, OrderForm orderForm, int state, Pageable pageable);

    Page<DelivererOrder> findAllByOrderFormAndState(OrderForm orderForm, int state, Pageable pageable);

    Page<DelivererOrder> findAllByState(int state, Pageable pageable);
}
