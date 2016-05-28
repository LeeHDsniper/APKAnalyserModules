package com.google.android.gms.internal;

import com.google.android.gms.ads.internal.zzp;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

@zzgk
public class zzdq
  implements Iterable<zzdp>
{
  private final List<zzdp> zzxu = new LinkedList();
  
  public zzdq() {}
  
  private zzdp zzc(zzip paramZzip)
  {
    Iterator localIterator = zzp.zzbK().iterator();
    while (localIterator.hasNext())
    {
      zzdp localZzdp = (zzdp)localIterator.next();
      if (zzoL == paramZzip) {
        return localZzdp;
      }
    }
    return null;
  }
  
  public Iterator<zzdp> iterator()
  {
    return zzxu.iterator();
  }
  
  public void zza(zzdp paramZzdp)
  {
    zzxu.add(paramZzdp);
  }
  
  public boolean zza(zzip paramZzip)
  {
    paramZzip = zzc(paramZzip);
    if (paramZzip != null)
    {
      zzxr.abort();
      return true;
    }
    return false;
  }
  
  public void zzb(zzdp paramZzdp)
  {
    zzxu.remove(paramZzdp);
  }
  
  public boolean zzb(zzip paramZzip)
  {
    return zzc(paramZzip) != null;
  }
}
