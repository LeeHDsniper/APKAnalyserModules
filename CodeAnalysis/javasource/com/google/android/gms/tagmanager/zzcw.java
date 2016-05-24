package com.google.android.gms.tagmanager;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

class zzcw<K, V>
  implements zzl<K, V>
{
  private final Map<K, V> zzaSl = new HashMap();
  private final int zzaSm;
  private final zzm.zza<K, V> zzaSn;
  private int zzaSo;
  
  zzcw(int paramInt, zzm.zza<K, V> paramZza)
  {
    zzaSm = paramInt;
    zzaSn = paramZza;
  }
  
  public V get(K paramK)
  {
    try
    {
      paramK = zzaSl.get(paramK);
      return paramK;
    }
    finally
    {
      paramK = finally;
      throw paramK;
    }
  }
  
  public void zzf(K paramK, V paramV)
  {
    if ((paramK == null) || (paramV == null)) {
      try
      {
        throw new NullPointerException("key == null || value == null");
      }
      finally {}
    }
    zzaSo += zzaSn.sizeOf(paramK, paramV);
    if (zzaSo > zzaSm)
    {
      Iterator localIterator = zzaSl.entrySet().iterator();
      do
      {
        if (!localIterator.hasNext()) {
          break;
        }
        Map.Entry localEntry = (Map.Entry)localIterator.next();
        zzaSo -= zzaSn.sizeOf(localEntry.getKey(), localEntry.getValue());
        localIterator.remove();
      } while (zzaSo > zzaSm);
    }
    zzaSl.put(paramK, paramV);
  }
}
