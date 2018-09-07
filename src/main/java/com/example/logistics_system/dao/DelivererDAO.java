package com.example.logistics_system.dao;

import com.example.logistics_system.bean.Deliverer;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DelivererDAO extends JpaRepository<Deliverer, Integer>
{
    Deliverer findByUsername(String username);

    @Override
    Page<Deliverer> findAll(Pageable pageable);
}
