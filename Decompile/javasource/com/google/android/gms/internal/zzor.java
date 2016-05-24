package com.google.android.gms.internal;

import android.text.TextUtils;
import java.util.HashMap;
import java.util.Map;

public final class zzor
  extends zzod<zzor>
{
  public String zzOj;
  public String zzaIN;
  public String zzaIO;
  
  public zzor() {}
  
  public String getAction()
  {
    return zzOj;
  }
  
  public String getTarget()
  {
    return zzaIO;
  }
  
  public String toString()
  {
    HashMap localHashMap = new HashMap();
    localHashMap.put("network", zzaIN);
    localHashMap.put("action", zzOj);
    localHashMap.put("target", zzaIO);
    return zzA(localHashMap);
  }
  
  public void zza(zzor paramZzor)
  {
    if (!TextUtils.isEmpty(zzaIN)) {
      paramZzor.zzdW(zzaIN);
    }
    if (!TextUtils.isEmpty(zzOj)) {
      paramZzor.zzdS(zzOj);
    }
    if (!TextUtils.isEmpty(zzaIO)) {
      paramZzor.zzdX(zzaIO);
    }
  }
  
  public void zzdS(String paramString)
  {
    zzOj = paramString;
  }
  
  public void zzdW(String paramString)
  {
    zzaIN = paramString;
  }
  
  public void zzdX(String paramString)
  {
    zzaIO = paramString;
  }
  
  public String zzya()
  {
    return zzaIN;
  }
}
