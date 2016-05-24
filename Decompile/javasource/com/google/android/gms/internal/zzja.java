package com.google.android.gms.internal;

import com.google.android.gms.common.internal.zzx;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

public final class zzja
  extends zzod<zzja>
{
  private final Map<String, Object> zzvs = new HashMap();
  
  public zzja() {}
  
  private String zzaR(String paramString)
  {
    zzx.zzcs(paramString);
    String str = paramString;
    if (paramString != null)
    {
      str = paramString;
      if (paramString.startsWith("&")) {
        str = paramString.substring(1);
      }
    }
    zzx.zzh(str, "Name can not be empty or \"&\"");
    return str;
  }
  
  public void set(String paramString1, String paramString2)
  {
    paramString1 = zzaR(paramString1);
    zzvs.put(paramString1, paramString2);
  }
  
  public String toString()
  {
    return zzA(zzvs);
  }
  
  public void zza(zzja paramZzja)
  {
    zzx.zzv(paramZzja);
    zzvs.putAll(zzvs);
  }
  
  public Map<String, Object> zzhJ()
  {
    return Collections.unmodifiableMap(zzvs);
  }
}
