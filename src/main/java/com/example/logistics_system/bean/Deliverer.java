package com.example.logistics_system.bean;

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

    private String province;
    private String city;
    private String country;

    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(
            name = "deliverer_order",
            joinColumns = @JoinColumn(name = "did"),
            inverseJoinColumns = @JoinColumn(name = "oid")
    )
    private Set<OrderForm> orderForms;

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

    public Set<OrderForm> getOrderForms()
    {
        return orderForms;
    }

    public void setOrderForms(Set<OrderForm> orderForms)
    {
        this.orderForms = orderForms;
    }
}
