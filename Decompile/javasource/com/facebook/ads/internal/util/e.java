package com.facebook.ads.internal.util;

import java.util.Locale;

public enum e
{
  private e() {}
  
  public static e a(String paramString)
  {
    if (s.a(paramString)) {
      return a;
    }
    try
    {
      paramString = valueOf(paramString.toUpperCase(Locale.US));
      return paramString;
    }
    catch (IllegalArgumentException paramString) {}
    return a;
  }
}
