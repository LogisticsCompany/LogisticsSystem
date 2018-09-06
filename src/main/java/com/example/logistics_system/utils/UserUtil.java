package com.example.logistics_system.utils;

import com.example.logistics_system.bean.User;

public class UserUtil
{
    public static void modifySex(User user)
    {
        switch (user.getSex())
        {
            case "男":
                user.setSex("male");
                break;
            case "女":
                user.setSex("female");
                break;
            case "male":
                user.setSex("男");
                break;
            case "female":
                user.setSex("女");
                break;
        }
    }
}
