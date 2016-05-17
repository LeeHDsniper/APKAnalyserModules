package com.tencent.qphone.base.util;

public class StringUtils
{
  public StringUtils() {}
  
  public static String getIpAddrFromInt(int paramInt)
  {
    StringBuffer localStringBuffer = new StringBuffer("");
    localStringBuffer.append(String.valueOf(paramInt >>> 24));
    localStringBuffer.append(".");
    localStringBuffer.append(String.valueOf((0xFFFFFF & paramInt) >>> 16));
    localStringBuffer.append(".");
    localStringBuffer.append(String.valueOf((0xFFFF & paramInt) >>> 8));
    localStringBuffer.append(".");
    localStringBuffer.append(String.valueOf(paramInt & 0xFF));
    return localStringBuffer.toString();
  }
}
