package com.example.logistics_system.dao;

import com.example.logistics_system.bean.Admin;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AdminDAO extends JpaRepository<Admin, Integer>
{
}
