package com.facebook.ads.internal;

import com.facebook.ads.AdError;
import com.facebook.ads.internal.util.s;

public class b
{
  private final AdErrorType a;
  private final String b;
  
  public b(AdErrorType paramAdErrorType, String paramString)
  {
    String str = paramString;
    if (s.a(paramString)) {
      str = paramAdErrorType.getDefaultErrorMessage();
    }
    a = paramAdErrorType;
    b = str;
  }
  
  public AdErrorType a()
  {
    return a;
  }
  
  public AdError b()
  {
    if (a.a()) {
      return new AdError(a.getErrorCode(), b);
    }
    return new AdError(AdErrorType.UNKNOWN_ERROR.getErrorCode(), AdErrorType.UNKNOWN_ERROR.getDefaultErrorMessage());
  }
}
