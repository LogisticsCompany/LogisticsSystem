package com.example.logistics_system.bean;

import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "order_form")
public class OrderForm
{
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String orderNumber;

    private String sender;
    private int senderProvince;
    private int senderCity;
    private int senderCountry;
    private String senderAddress;
    private String senderPhoneNumber;

    private String receiver;
    private int receiverProvince;
    private int receiverCity;
    private int receiverCountry;
    private String receiverAddress;
    private String receiverPhoneNumber;

    private String productInfo;
    private int state;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "uid")
    private User user;

    @OneToMany(fetch = FetchType.EAGER)
    @JoinColumn(name = "oid")
    private Set<DelivererOrder> delivererOrders;

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getOrderNumber()
    {
        return orderNumber;
    }

    public void setOrderNumber(String orderNumber)
    {
        this.orderNumber = orderNumber;
    }

    public String getSender()
    {
        return sender;
    }

    public void setSender(String sender)
    {
        this.sender = sender;
    }

    public String getSenderAddress()
    {
        return senderAddress;
    }

    public void setSenderAddress(String senderAddress)
    {
        this.senderAddress = senderAddress;
    }

    public String getReceiver()
    {
        return receiver;
    }

    public void setReceiver(String receiver)
    {
        this.receiver = receiver;
    }

    public String getReceiverAddress()
    {
        return receiverAddress;
    }

    public void setReceiverAddress(String receiverAddress)
    {
        this.receiverAddress = receiverAddress;
    }

    public String getProductInfo()
    {
        return productInfo;
    }

    public void setProductInfo(String productInfo)
    {
        this.productInfo = productInfo;
    }

    public int getState()
    {
        return state;
    }

    public void setState(int state)
    {
        this.state = state;
    }

    public User getUser()
    {
        return user;
    }

    public void setUser(User user)
    {
        this.user = user;
    }

    public String getSenderPhoneNumber()
    {
        return senderPhoneNumber;
    }

    public void setSenderPhoneNumber(String senderPhoneNumber)
    {
        this.senderPhoneNumber = senderPhoneNumber;
    }

    public String getReceiverPhoneNumber()
    {
        return receiverPhoneNumber;
    }

    public void setReceiverPhoneNumber(String receiverPhoneNumber)
    {
        this.receiverPhoneNumber = receiverPhoneNumber;
    }

    public int getSenderProvince()
    {
        return senderProvince;
    }

    public void setSenderProvince(int senderProvince)
    {
        this.senderProvince = senderProvince;
    }

    public int getSenderCity()
    {
        return senderCity;
    }

    public void setSenderCity(int senderCity)
    {
        this.senderCity = senderCity;
    }

    public int getSenderCountry()
    {
        return senderCountry;
    }

    public void setSenderCountry(int senderCountry)
    {
        this.senderCountry = senderCountry;
    }

    public int getReceiverProvince()
    {
        return receiverProvince;
    }

    public void setReceiverProvince(int receiverProvince)
    {
        this.receiverProvince = receiverProvince;
    }

    public int getReceiverCity()
    {
        return receiverCity;
    }

    public void setReceiverCity(int receiverCity)
    {
        this.receiverCity = receiverCity;
    }

    public int getReceiverCountry()
    {
        return receiverCountry;
    }

    public void setReceiverCountry(int receiverCountry)
    {
        this.receiverCountry = receiverCountry;
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
