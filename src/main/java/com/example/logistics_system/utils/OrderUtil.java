package com.example.logistics_system.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderUtil
{
    public final static int
            ORDER_ORDER = 0,
            ORDER_DELIVERY = 1,
            ORDER_SIGN = 2,
            ORDER_ARRIVED = 3,
            ORDER_DELIVERER_REQUEST = 4,
            ORDER_ADMIN_REFUSE = 5,
            ORDER_ADMIN_ACCEPT = 6,
            ORDER_USER_ORDER = 7,
            ORDER_ALL = 8;

    public final static String[] STATES = new String[]
            {
                    "已下单",
                    "正在派送",
                    "已签收",
                    "已到达"
            };

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
