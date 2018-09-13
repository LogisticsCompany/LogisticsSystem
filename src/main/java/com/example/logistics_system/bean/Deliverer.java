package com.example.logistics_system.bean;

import org.springframework.context.annotation.Lazy;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "deliverer")
public class Deliverer
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String username;
    private String name;
    private String password;
    private String email;
    private String phoneNumber;

    private int province;
    private int city;
    private int country;

    @OneToMany(fetch = FetchType.EAGER)
    @JoinColumn(name = "did")
    private Set<DelivererOrder> delivererOrders;

    public Deliverer()
    {
    }

    public Deliverer(String username, String password, int province, int city, int country)
    {
        this.username = username;
        this.password = password;
        this.province = province;
        this.city = city;
        this.country = country;
    }

    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getName()
    {
        return name;
    }

    public void setName(String name)
    {
        this.name = name;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public String getPhoneNumber()
    {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber)
    {
        this.phoneNumber = phoneNumber;
    }

    public int getProvince()
    {
        return province;
    }

    public void setProvince(int province)
    {
        this.province = province;
    }

    public int getCity()
    {
        return city;
    }

    public void setCity(int city)
    {
        this.city = city;
    }

    public int getCountry()
    {
        return country;
    }

    public void setCountry(int country)
    {
        this.country = country;
    }

    public Set<DelivererOrder> getDelivererOrders()
    {
        return delivererOrders;
    }

    public void setDelivererOrders(Set<DelivererOrder> delivererOrders)
    {
        this.delivererOrders = delivererOrders;
    }
}
