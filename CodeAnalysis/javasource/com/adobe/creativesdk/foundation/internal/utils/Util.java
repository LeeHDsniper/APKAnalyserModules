package com.adobe.creativesdk.foundation.internal.utils;

import android.util.Base64;

public class Util
{
  public static String bytesToHexString(byte[] paramArrayOfByte)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    int j = paramArrayOfByte.length;
    int i = 0;
    while (i < j)
    {
      localStringBuilder.append(String.format("%02x", new Object[] { Integer.valueOf(paramArrayOfByte[i] & 0xFF) }));
      i += 1;
    }
    return localStringBuilder.toString();
  }
  
  public static String convertByteArrayToString(byte[] paramArrayOfByte)
  {
    try
    {
      paramArrayOfByte = new String(Base64.encode(paramArrayOfByte, 2), "UTF-8");
      return paramArrayOfByte;
    }
    catch (Exception paramArrayOfByte) {}
    return null;
  }
  
  public static byte[] convertStringToByteArray(String paramString)
  {
    try
    {
      paramString = Base64.decode(paramString, 2);
      return paramString;
    }
    catch (Exception paramString) {}
    return null;
  }
}
