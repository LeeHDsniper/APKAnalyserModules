package com.google.android.gms.internal;

import android.text.TextUtils;
import com.google.android.gms.ads.internal.zzp;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

public class zzcd
{
  private final Object zzpc = new Object();
  boolean zzvf;
  private final List<zzcc> zzvr = new LinkedList();
  private final Map<String, String> zzvs = new LinkedHashMap();
  private String zzvt;
  private zzcc zzvu;
  
  public zzcd(boolean paramBoolean, String paramString1, String paramString2)
  {
    zzvf = paramBoolean;
    zzvs.put("action", paramString1);
    zzvs.put("ad_format", paramString2);
  }
  
  private boolean zza(zzcc paramZzcc, long paramLong, String... paramVarArgs)
  {
    synchronized (zzpc)
    {
      int j = paramVarArgs.length;
      int i = 0;
      while (i < j)
      {
        zzcc localZzcc = new zzcc(paramLong, paramVarArgs[i], paramZzcc);
        zzvr.add(localZzcc);
        i += 1;
      }
      return true;
    }
  }
  
  public void zzR(String paramString)
  {
    if (!zzvf) {
      return;
    }
    synchronized (zzpc)
    {
      zzvt = paramString;
      return;
    }
  }
  
  public boolean zza(zzcc paramZzcc, String... paramVarArgs)
  {
    if ((!zzvf) || (paramZzcc == null)) {
      return false;
    }
    return zza(paramZzcc, zzp.zzbB().elapsedRealtime(), paramVarArgs);
  }
  
  public zzcc zzb(long paramLong)
  {
    if (!zzvf) {
      return null;
    }
    return new zzcc(paramLong, null, null);
  }
  
  public void zzd(String paramString1, String paramString2)
  {
    if (!zzvf) {
      return;
    }
    synchronized (zzpc)
    {
      zzvs.put(paramString1, paramString2);
      return;
    }
  }
  
  public zzcc zzdl()
  {
    return zzb(zzp.zzbB().elapsedRealtime());
  }
  
  public void zzdm()
  {
    synchronized (zzpc)
    {
      zzvu = zzdl();
      return;
    }
  }
  
  public String zzdn()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    synchronized (zzpc)
    {
      Iterator localIterator = zzvr.iterator();
      while (localIterator.hasNext())
      {
        zzcc localZzcc = (zzcc)localIterator.next();
        long l1 = localZzcc.getTime();
        String str2 = localZzcc.zzdj();
        localZzcc = localZzcc.zzdk();
        if ((localZzcc != null) && (l1 > 0L))
        {
          long l2 = localZzcc.getTime();
          localStringBuilder.append(str2).append('.').append(l1 - l2).append(',');
        }
      }
    }
    zzvr.clear();
    if (!TextUtils.isEmpty(zzvt)) {
      localObject2.append(zzvt);
    }
    for (;;)
    {
      String str1 = localObject2.toString();
      return str1;
      if (str1.length() > 0) {
        str1.setLength(str1.length() - 1);
      }
    }
  }
  
  public zzcc zzdo()
  {
    synchronized (zzpc)
    {
      zzcc localZzcc = zzvu;
      return localZzcc;
    }
  }
  
  Map<String, String> zzn()
  {
    synchronized (zzpc)
    {
      Map localMap = zzvs;
      return localMap;
    }
  }
}
