package com.example.logistics_system.bean;

public class DelivererTemp
{
    private String username;
    private String password;

    public DelivererTemp()
    {
    }

    public DelivererTemp(String username, String password)
    {
        this.username = username;
        this.password = password;
    }

    public String getUsername()
    {
        return username;
    }

    public void setUsername(String username)
    {
        this.username = username;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }
}
