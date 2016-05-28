package com.google.android.gms.analytics.internal;

import com.google.android.gms.common.internal.zzx;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public class zzh
{
  private final long zzLS;
  private final String zzLT;
  private final boolean zzLU;
  private long zzLV;
  private final String zzLd;
  private final Map<String, String> zzvs;
  
  public zzh(long paramLong1, String paramString1, String paramString2, boolean paramBoolean, long paramLong2, Map<String, String> paramMap)
  {
    zzx.zzcs(paramString1);
    zzx.zzcs(paramString2);
    zzLS = paramLong1;
    zzLd = paramString1;
    zzLT = paramString2;
    zzLU = paramBoolean;
    zzLV = paramLong2;
    if (paramMap != null)
    {
      zzvs = new HashMap(paramMap);
      return;
    }
    zzvs = Collections.emptyMap();
  }
  
  public String getClientId()
  {
    return zzLd;
  }
  
  public long zziw()
  {
    return zzLS;
  }
  
  public String zzix()
  {
    return zzLT;
  }
  
  public boolean zziy()
  {
    return zzLU;
  }
  
  public long zziz()
  {
    return zzLV;
  }
  
  public Map<String, String> zzn()
  {
    return zzvs;
  }
  
  public void zzn(long paramLong)
  {
    zzLV = paramLong;
  }
}
