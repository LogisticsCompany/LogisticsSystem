package com.example.logistics_system.bean;

import javax.persistence.*;

@Entity
@Table(name = "order_form")
public class OrderForm
{
    @Id
    private int id;
    private String OrderNumber;

    private String sender;
    private String senderAddress;
    private String senderPhoneNumber;

    private String receiver;
    private String receiverAddress;
    private String receiverPhoneNumber;

    private String productInfo;
    private String state;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "uid")
    private User user;

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
        return OrderNumber;
    }

    public void setOrderNumber(String orderNumber)
    {
        OrderNumber = orderNumber;
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
}
