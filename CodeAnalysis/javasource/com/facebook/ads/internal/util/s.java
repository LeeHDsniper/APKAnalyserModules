package com.facebook.ads.internal.util;

import java.security.MessageDigest;

public class s
{
  public static boolean a(String paramString)
  {
    return (paramString == null) || (paramString.length() <= 0);
  }
  
  public static String b(String paramString)
  {
    try
    {
      paramString = MessageDigest.getInstance("MD5").digest(paramString.getBytes("utf-8"));
      StringBuilder localStringBuilder = new StringBuilder();
      int j = paramString.length;
      int i = 0;
      while (i < j)
      {
        localStringBuilder.append(Integer.toString((paramString[i] & 0xFF) + 256, 16).substring(1));
        i += 1;
      }
      paramString = localStringBuilder.toString();
      return paramString;
    }
    catch (Exception paramString) {}
    return null;
  }
}
