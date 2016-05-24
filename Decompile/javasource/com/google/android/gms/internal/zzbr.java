package com.google.android.gms.internal;

import android.text.TextUtils;

@zzgk
public final class zzbr
{
  private String zztN;
  private int zztO = -1;
  
  public zzbr()
  {
    this((String)zzby.zztW.zzdd(), -1);
  }
  
  public zzbr(String paramString)
  {
    this(paramString, -1);
  }
  
  public zzbr(String paramString, int paramInt)
  {
    if (TextUtils.isEmpty(paramString)) {
      paramString = (String)zzby.zztW.zzdd();
    }
    for (;;)
    {
      zztN = paramString;
      zztO = paramInt;
      return;
    }
  }
  
  public String zzdb()
  {
    return zztN;
  }
  
  public int zzdc()
  {
    return zztO;
  }
}
