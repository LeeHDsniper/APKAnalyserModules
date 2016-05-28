package com.google.android.gms.internal;

import android.text.TextUtils;
import java.util.HashMap;
import java.util.Map;

public final class zzok
  extends zzod<zzok>
{
  private String zzNT;
  private String zzNU;
  private String zzaIs;
  private String zzaIt;
  
  public zzok() {}
  
  public void setAppId(String paramString)
  {
    zzaIs = paramString;
  }
  
  public void setAppInstallerId(String paramString)
  {
    zzaIt = paramString;
  }
  
  public void setAppName(String paramString)
  {
    zzNT = paramString;
  }
  
  public void setAppVersion(String paramString)
  {
    zzNU = paramString;
  }
  
  public String toString()
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("appName", zzNT);
    localHashMap.put("appVersion", zzNU);
    localHashMap.put("appId", zzaIs);
    localHashMap.put("appInstallerId", zzaIt);
    return zzA(localHashMap);
  }
  
  public void zza(zzok paramZzok)
  {
    if (!TextUtils.isEmpty(zzNT)) {
      paramZzok.setAppName(zzNT);
    }
    if (!TextUtils.isEmpty(zzNU)) {
      paramZzok.setAppVersion(zzNU);
    }
    if (!TextUtils.isEmpty(zzaIs)) {
      paramZzok.setAppId(zzaIs);
    }
    if (!TextUtils.isEmpty(zzaIt)) {
      paramZzok.setAppInstallerId(zzaIt);
    }
  }
  
  public String zzjZ()
  {
    return zzNT;
  }
  
  public String zzkb()
  {
    return zzNU;
  }
  
  public String zztW()
  {
    return zzaIs;
  }
  
  public String zzxA()
  {
    return zzaIt;
  }
}
