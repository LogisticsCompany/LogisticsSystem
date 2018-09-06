package com.example.logistics_system.dao;

import com.example.logistics_system.bean.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDAO extends JpaRepository<User, Integer>
{
    User findByUsername(String username);
}
