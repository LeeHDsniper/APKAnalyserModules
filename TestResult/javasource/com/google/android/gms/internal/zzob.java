package com.google.android.gms.internal;

import com.google.android.gms.common.internal.zzx;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public final class zzob
{
  private final zzoe zzaHQ;
  private boolean zzaHR;
  private long zzaHS;
  private long zzaHT;
  private long zzaHU;
  private long zzaHV;
  private long zzaHW;
  private boolean zzaHX;
  private final Map<Class<? extends zzod>, zzod> zzaHY;
  private final List<zzoh> zzaHZ;
  private final zzlm zzpO;
  
  zzob(zzob paramZzob)
  {
    zzaHQ = zzaHQ;
    zzpO = zzpO;
    zzaHS = zzaHS;
    zzaHT = zzaHT;
    zzaHU = zzaHU;
    zzaHV = zzaHV;
    zzaHW = zzaHW;
    zzaHZ = new ArrayList(zzaHZ);
    zzaHY = new HashMap(zzaHY.size());
    paramZzob = zzaHY.entrySet().iterator();
    while (paramZzob.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)paramZzob.next();
      zzod localZzod = zzf((Class)localEntry.getKey());
      ((zzod)localEntry.getValue()).zza(localZzod);
      zzaHY.put(localEntry.getKey(), localZzod);
    }
  }
  
  zzob(zzoe paramZzoe, zzlm paramZzlm)
  {
    zzx.zzv(paramZzoe);
    zzx.zzv(paramZzlm);
    zzaHQ = paramZzoe;
    zzpO = paramZzlm;
    zzaHV = 1800000L;
    zzaHW = 3024000000L;
    zzaHY = new HashMap();
    zzaHZ = new ArrayList();
  }
  
  private static <T extends zzod> T zzf(Class<T> paramClass)
  {
    try
    {
      paramClass = (zzod)paramClass.newInstance();
      return paramClass;
    }
    catch (InstantiationException paramClass)
    {
      throw new IllegalArgumentException("dataType doesn't have default constructor", paramClass);
    }
    catch (IllegalAccessException paramClass)
    {
      throw new IllegalArgumentException("dataType default constructor is not accessible", paramClass);
    }
  }
  
  public void zzL(long paramLong)
  {
    zzaHT = paramLong;
  }
  
  public void zzb(zzod paramZzod)
  {
    zzx.zzv(paramZzod);
    Class localClass = paramZzod.getClass();
    if (localClass.getSuperclass() != zzod.class) {
      throw new IllegalArgumentException();
    }
    paramZzod.zza(zze(localClass));
  }
  
  public <T extends zzod> T zzd(Class<T> paramClass)
  {
    return (zzod)zzaHY.get(paramClass);
  }
  
  public <T extends zzod> T zze(Class<T> paramClass)
  {
    zzod localZzod2 = (zzod)zzaHY.get(paramClass);
    zzod localZzod1 = localZzod2;
    if (localZzod2 == null)
    {
      localZzod1 = zzf(paramClass);
      zzaHY.put(paramClass, localZzod1);
    }
    return localZzod1;
  }
  
  public zzob zzxh()
  {
    return new zzob(this);
  }
  
  public Collection<zzod> zzxi()
  {
    return zzaHY.values();
  }
  
  public List<zzoh> zzxj()
  {
    return zzaHZ;
  }
  
  public long zzxk()
  {
    return zzaHS;
  }
  
  public void zzxl()
  {
    zzxp().zze(this);
  }
  
  public boolean zzxm()
  {
    return zzaHR;
  }
  
  void zzxn()
  {
    zzaHU = zzpO.elapsedRealtime();
    if (zzaHT != 0L) {}
    for (zzaHS = zzaHT;; zzaHS = zzpO.currentTimeMillis())
    {
      zzaHR = true;
      return;
    }
  }
  
  zzoe zzxo()
  {
    return zzaHQ;
  }
  
  zzof zzxp()
  {
    return zzaHQ.zzxp();
  }
  
  boolean zzxq()
  {
    return zzaHX;
  }
  
  void zzxr()
  {
    zzaHX = true;
  }
}
