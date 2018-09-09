package com.example.logistics_system.bean;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "delivererOrder")
public class DelivererOrder
{
    @Id
    private int id;
    private int delivererId;
    private int orderFormId;
    private int state;

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public int getDelivererId()
    {
        return delivererId;
    }

    public void setDelivererId(int delivererId)
    {
        this.delivererId = delivererId;
    }

    public int getOrderFormId()
    {
        return orderFormId;
    }

    public void setOrderFormId(int orderFormId)
    {
        this.orderFormId = orderFormId;
    }

    public int getState()
    {
        return state;
    }

    public void setState(int state)
    {
        this.state = state;
    }
}
