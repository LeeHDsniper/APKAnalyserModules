package com.google.android.gms.internal;

import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public final class zziy
  extends zzod<zziy>
{
  private Map<Integer, String> zzLa = new HashMap(4);
  
  public zziy() {}
  
  public String toString()
  {
    HashMap localHashMap = new HashMap();
    Iterator localIterator = zzLa.entrySet().iterator();
    while (localIterator.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)localIterator.next();
      localHashMap.put("dimension" + localEntry.getKey(), localEntry.getValue());
    }
    return zzA(localHashMap);
  }
  
  public void zza(zziy paramZziy)
  {
    zzLa.putAll(zzLa);
  }
  
  public Map<Integer, String> zzhH()
  {
    return Collections.unmodifiableMap(zzLa);
  }
}
