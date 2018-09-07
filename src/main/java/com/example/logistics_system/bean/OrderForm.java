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
    private String senderProvince;
    private String senderCity;
    private String senderCountry;
    private String senderAddress;
    private String senderPhoneNumber;

    private String receiver;
    private String receiverProvince;
    private String receiverCity;
    private String receiverCountry;
    private String receiverAddress;
    private String receiverPhoneNumber;

    private String productInfo;
    private String state;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "uid")
    private User user;

    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(
            name = "deliverer_order",
            joinColumns = @JoinColumn(name = "oid"),
            inverseJoinColumns = @JoinColumn(name = "did")
    )
    private Set<Deliverer> deliverers;

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

    public String getState()
    {
        return state;
    }

    public void setState(String state)
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

    public Set<Deliverer> getDeliverers()
    {
        return deliverers;
    }

    public void setDeliverers(Set<Deliverer> deliverers)
    {
        this.deliverers = deliverers;
    }

    public String getSenderProvince()
    {
        return senderProvince;
    }

    public void setSenderProvince(String senderProvince)
    {
        this.senderProvince = senderProvince;
    }

    public String getSenderCity()
    {
        return senderCity;
    }

    public void setSenderCity(String senderCity)
    {
        this.senderCity = senderCity;
    }

    public String getSenderCountry()
    {
        return senderCountry;
    }

    public void setSenderCountry(String senderCountry)
    {
        this.senderCountry = senderCountry;
    }

    public String getReceiverProvince()
    {
        return receiverProvince;
    }

    public void setReceiverProvince(String receiverProvince)
    {
        this.receiverProvince = receiverProvince;
    }

    public String getReceiverCity()
    {
        return receiverCity;
    }

    public void setReceiverCity(String receiverCity)
    {
        this.receiverCity = receiverCity;
    }

    public String getReceiverCountry()
    {
        return receiverCountry;
    }

    public void setReceiverCountry(String receiverCountry)
    {
        this.receiverCountry = receiverCountry;
    }
}
