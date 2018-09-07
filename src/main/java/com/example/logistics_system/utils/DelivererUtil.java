package com.example.logistics_system.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class DelivererUtil
{
    public static String generateUsername()
    {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        return "DN" + sdf.format(new Date());
    }

    public static String generatePassword()
    {
        StringBuilder sb = new StringBuilder("~!@#$%^&*()+-*/=");
        for (char c = '0'; c <= '9'; c++)
            sb.append(c);
        for (char c = 'a'; c <= 'z'; c++)
            sb.append(c);
        for (char c = 'A'; c <= 'Z'; c++)
            sb.append(c);
        char[] chars = sb.toString().toCharArray();
        int length = chars.length;
        StringBuilder password = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < 10; i++)
            password.append(chars[random.nextInt(length)]);
        return password.toString();
    }
}
