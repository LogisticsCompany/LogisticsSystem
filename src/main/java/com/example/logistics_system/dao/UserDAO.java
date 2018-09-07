package com.example.logistics_system.dao;

import com.example.logistics_system.bean.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDAO extends JpaRepository<User, Integer>
{
    User findByUsername(String username);
    Page<User> findByProvinceAndCityAndCountry(String province, String city, String country, Pageable pageable);
}
