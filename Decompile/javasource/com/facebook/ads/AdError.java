package com.facebook.ads;

import com.facebook.ads.internal.util.s;

public class AdError
{
  public static final AdError INTERNAL_ERROR = new AdError(2001, "Internal Error");
  public static final AdError LOAD_TOO_FREQUENTLY;
  @Deprecated
  public static final AdError MISSING_PROPERTIES = new AdError(2002, "Native ad failed to load due to missing properties");
  public static final AdError NETWORK_ERROR = new AdError(1000, "Network Error");
  public static final AdError NO_FILL = new AdError(1001, "No Fill");
  public static final AdError SERVER_ERROR;
  private final int a;
  private final String b;
  
  static
  {
    LOAD_TOO_FREQUENTLY = new AdError(1002, "Ad was re-loaded too frequently");
    SERVER_ERROR = new AdError(2000, "Server Error");
  }
  
  public AdError(int paramInt, String paramString)
  {
    String str = paramString;
    if (s.a(paramString)) {
      str = "unknown error";
    }
    a = paramInt;
    b = str;
  }
}
