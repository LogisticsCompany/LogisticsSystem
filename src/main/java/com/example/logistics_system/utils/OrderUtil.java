package com.example.logistics_system.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderUtil
{
    public final static String
            ORDER_ORDER = "ORDER_ORDER",
            ORDER_DELIVERY = "ORDER_DELIVERY",
            ORDER_REFUSE = "ORDER_REFUSE",
            ORDER_SIGN = "ORDER_SIGN",
            ORDER_ARRIVED = "ORDER_ARRIVED",
            ORDER_DELIVERER_REQUESET = "ORDER_DELIVERER_REQUESET",
            ORDER_ADMIN_ACCEPT = "ORDER_ADMIN_ACCEPT";

    public static String generateOrderNumber()
    {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        return "ON" + sdf.format(new Date());
    }
}
