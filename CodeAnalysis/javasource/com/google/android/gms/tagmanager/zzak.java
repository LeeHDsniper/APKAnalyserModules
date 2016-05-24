package com.google.android.gms.tagmanager;

import com.google.android.gms.internal.zzag.zza;
import java.util.HashSet;
import java.util.Map;
import java.util.Set;

abstract class zzak
{
  private final Set<String> zzaQc;
  private final String zzaQd;
  
  public zzak(String paramString, String... paramVarArgs)
  {
    zzaQd = paramString;
    zzaQc = new HashSet(paramVarArgs.length);
    int j = paramVarArgs.length;
    int i = 0;
    while (i < j)
    {
      paramString = paramVarArgs[i];
      zzaQc.add(paramString);
      i += 1;
    }
  }
  
  public String zzAc()
  {
    return zzaQd;
  }
  
  public Set<String> zzAd()
  {
    return zzaQc;
  }
  
  public abstract zzag.zza zzG(Map<String, zzag.zza> paramMap);
  
  boolean zzf(Set<String> paramSet)
  {
    return paramSet.containsAll(zzaQc);
  }
  
  public abstract boolean zzzx();
}
