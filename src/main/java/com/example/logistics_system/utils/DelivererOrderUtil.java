package com.example.logistics_system.utils;

public class DelivererOrderUtil
{
    public static final int
            ORDER_DELIVERER_REQUEST = 0,
            ORDER_ADMIN_REFUSE = 1,
            ORDER_ADMIN_ACCEPT = 2,
            ORDER_DELIVERY = 3,
            ORDER_DONE = -1;

    public static final String[] STATES = new String[]
            {
                    "待审核",
                    "已拒绝",
                    "已通过",
                    "已派送"
            };
}
