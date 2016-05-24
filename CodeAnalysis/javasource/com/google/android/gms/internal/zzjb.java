package com.google.android.gms.internal;

import android.text.TextUtils;
import com.google.android.gms.common.internal.zzx;
import java.util.HashMap;
import java.util.Map;

public final class zzjb
  extends zzod<zzjb>
{
  private String zzGh;
  private String zzLc;
  private String zzLd;
  private String zzLe;
  private boolean zzLf;
  private String zzLg;
  private boolean zzLh;
  private double zzLi;
  
  public zzjb() {}
  
  public String getClientId()
  {
    return zzLd;
  }
  
  public String getUserId()
  {
    return zzGh;
  }
  
  public void setClientId(String paramString)
  {
    zzLd = paramString;
  }
  
  public void setSampleRate(double paramDouble)
  {
    if ((paramDouble >= 0.0D) && (paramDouble <= 100.0D)) {}
    for (boolean bool = true;; bool = false)
    {
      zzx.zzb(bool, "Sample rate must be between 0% and 100%");
      zzLi = paramDouble;
      return;
    }
  }
  
  public void setUserId(String paramString)
  {
    zzGh = paramString;
  }
  
  public String toString()
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("hitType", zzLc);
    localHashMap.put("clientId", zzLd);
    localHashMap.put("userId", zzGh);
    localHashMap.put("androidAdId", zzLe);
    localHashMap.put("AdTargetingEnabled", Boolean.valueOf(zzLf));
    localHashMap.put("sessionControl", zzLg);
    localHashMap.put("nonInteraction", Boolean.valueOf(zzLh));
    localHashMap.put("sampleRate", Double.valueOf(zzLi));
    return zzA(localHashMap);
  }
  
  public void zzG(boolean paramBoolean)
  {
    zzLf = paramBoolean;
  }
  
  public void zzH(boolean paramBoolean)
  {
    zzLh = paramBoolean;
  }
  
  public void zza(zzjb paramZzjb)
  {
    if (!TextUtils.isEmpty(zzLc)) {
      paramZzjb.zzaS(zzLc);
    }
    if (!TextUtils.isEmpty(zzLd)) {
      paramZzjb.setClientId(zzLd);
    }
    if (!TextUtils.isEmpty(zzGh)) {
      paramZzjb.setUserId(zzGh);
    }
    if (!TextUtils.isEmpty(zzLe)) {
      paramZzjb.zzaT(zzLe);
    }
    if (zzLf) {
      paramZzjb.zzG(true);
    }
    if (!TextUtils.isEmpty(zzLg)) {
      paramZzjb.zzaU(zzLg);
    }
    if (zzLh) {
      paramZzjb.zzH(zzLh);
    }
    if (zzLi != 0.0D) {
      paramZzjb.setSampleRate(zzLi);
    }
  }
  
  public void zzaS(String paramString)
  {
    zzLc = paramString;
  }
  
  public void zzaT(String paramString)
  {
    zzLe = paramString;
  }
  
  public void zzaU(String paramString)
  {
    zzLg = paramString;
  }
  
  public String zzhK()
  {
    return zzLc;
  }
  
  public String zzhL()
  {
    return zzLe;
  }
  
  public boolean zzhM()
  {
    return zzLf;
  }
  
  public String zzhN()
  {
    return zzLg;
  }
  
  public boolean zzhO()
  {
    return zzLh;
  }
  
  public double zzhP()
  {
    return zzLi;
  }
}
