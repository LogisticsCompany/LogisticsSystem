package com.example.logistics_system.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderUtil
{
    public final static int
            ORDER_DELIVERY = 1,
            ORDER_SIGN = 2,
            ORDER_ARRIVED = 3,
            ORDER_ORDER = 4,
            ORDER_REFUSE_SIGN = 5,
            ORDER_ALL = 6;

    public final static String[] STATES = new String[]
            {
                    "",
                    "正在派送",
                    "已签收",
                    "已到达",
                    "已下单",
                    "已拒收"
            };

    public final static String
            NORMAL_STATE = "操作成功",
            ORDER_NOT_EXIST = "订单不存在",
            ILLEGAL_OPERATION = "非法操作";

    public static String generateOrderNumber()
    {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
        return "ON" + sdf.format(new Date());
    }
}
