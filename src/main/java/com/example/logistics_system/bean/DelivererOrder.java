package com.example.logistics_system.bean;

import javax.persistence.*;

@Entity
@Table(name = "delivererOrder")
public class DelivererOrder
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private int state;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "oid")
    private OrderForm orderForm;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "did")
    private Deliverer deliverer;

    public DelivererOrder()
    {
    }

    public DelivererOrder(int state, OrderForm orderForm, Deliverer deliverer)
    {
        this.state = state;
        this.orderForm = orderForm;
        this.deliverer = deliverer;
    }

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public OrderForm getOrderForm()
    {
        return orderForm;
    }

    public void setOrderForm(OrderForm orderForm)
    {
        this.orderForm = orderForm;
    }

    public Deliverer getDeliverer()
    {
        return deliverer;
    }

    public void setDeliverer(Deliverer deliverer)
    {
        this.deliverer = deliverer;
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
