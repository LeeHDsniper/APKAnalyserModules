package com.google.android.gms.internal;

import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public final class zziz
  extends zzod<zziz>
{
  private Map<Integer, Double> zzLb = new HashMap(4);
  
  public zziz() {}
  
  public String toString()
  {
    HashMap localHashMap = new HashMap();
    Iterator localIterator = zzLb.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      localHashMap.put("metric" + localEntry.getKey(), localEntry.getValue());
    }
    return zzA(localHashMap);
  }
  
  public void zza(zziz paramZziz)
  {
    zzLb.putAll(zzLb);
  }
  
  public Map<Integer, Double> zzhI()
  {
    return Collections.unmodifiableMap(zzLb);
  }
}
