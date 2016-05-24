package com.google.android.gms.internal;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

@zzgk
public class zzbv
{
  private final Collection<zzbu> zztR = new ArrayList();
  private final Collection<zzbu<String>> zztS = new ArrayList();
  private final Collection<zzbu<String>> zztT = new ArrayList();
  
  public zzbv() {}
  
  public void zza(zzbu paramZzbu)
  {
    zztR.add(paramZzbu);
  }
  
  public void zzb(zzbu<String> paramZzbu)
  {
    zztS.add(paramZzbu);
  }
  
  public void zzc(zzbu<String> paramZzbu)
  {
    zztT.add(paramZzbu);
  }
  
  public List<String> zzde()
  {
    ArrayList localArrayList = new ArrayList();
    Iterator localIterator = zztS.iterator();
    while (localIterator.hasNext())
    {
      String str = (String)((zzbu)localIterator.next()).get();
      if (str != null) {
        localArrayList.add(str);
      }
    }
    return localArrayList;
  }
}
