package com.example.logistics_system.dao;

import com.example.logistics_system.bean.DelivererOrder;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Set;

public interface DelivererOrderDAO extends JpaRepository<DelivererOrder, Integer>
{
    DelivererOrder findByDelivererIdAndOrderFormId(int delivererId, int orderFormId);

    Set<DelivererOrder> findAllByOrderFormId(int orderFormId);

    Page<DelivererOrder> findAllByDelivererIdAndState(int delivererId, int state, Pageable pageable);

    Page<DelivererOrder> findAllByDelivererId(int delivererId, Pageable pageable);

    Page<DelivererOrder> findAllByState(int state, Pageable pageable);

    Page<DelivererOrder> findAllByDelivererIdAndOrderFormIdAndState(int delivererId, int orderFormId, int state, Pageable pageable);

    Page<DelivererOrder> findAllByOrderFormIdAndState(int orderFormId, int state, Pageable pageable);
}
