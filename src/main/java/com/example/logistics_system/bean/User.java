package com.example.logistics_system.bean;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "user")
public class User
{
    @Id
    private int id;
    private String username;
    private String name;
    private String password;
    private String email;
    private String phoneNumber;
    private String sex;

    private String province;
    private String city;
    private String country;
    private String address;

    @OneToMany(fetch = FetchType.EAGER)
    @JoinColumn(name = "uid")
    private Set<OrderForm> orderForms;

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
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

    public Set<OrderForm> getOrderForms()
    {
        return orderForms;
    }

    public void setOrderForms(Set<OrderForm> orderForms)
    {
        this.orderForms = orderForms;
    }

    public String getSex()
    {
        return sex;
    }

    public void setSex(String sex)
    {
        this.sex = sex;
    }

    public String getProvince()
    {
        return province;
    }

    public void setProvince(String province)
    {
        this.province = province;
    }

    public String getCity()
    {
        return city;
    }

    public void setCity(String city)
    {
        this.city = city;
    }

    public String getCountry()
    {
        return country;
    }

    public void setCountry(String country)
    {
        this.country = country;
    }

    public String getAddress()
    {
        return address;
    }

    public void setAddress(String address)
    {
        this.address = address;
    }
}
