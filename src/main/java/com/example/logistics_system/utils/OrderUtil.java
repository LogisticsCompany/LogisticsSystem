package com.example.logistics_system.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderUtil
{
    public final static String
            ORDER_ORDER = "ORDER_ORDER",
            ORDER_DELIVERY = "ORDER_DELIVERY",
            ORDER_SIGN = "ORDER_SIGN",
            ORDER_ARRIVED = "ORDER_ARRIVED",
            ORDER_DELIVERER_REQUEST = "ORDER_DELIVERER_REQUEST",
            ORDER_ADMIN_REFUSE = "ORDER_ADMIN_REFUSE",
            ORDER_ADMIN_ACCEPT = "ORDER_ADMIN_ACCEPT";

    public final static int
            NORMAL_STATE = 0,
            ORDER_NOT_EXIST = -1,
            ILLEGAL_OPERATION = -2;

    public static String generateOrderNumber()
    {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        return "ON" + sdf.format(new Date());
    }
}
