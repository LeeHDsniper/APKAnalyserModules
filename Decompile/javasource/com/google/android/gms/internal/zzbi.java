package com.google.android.gms.internal;

import com.google.android.gms.ads.internal.util.client.zzb;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

@zzgk
public class zzbi
{
  private final Object zzpc = new Object();
  private int zzrM;
  private List<zzbh> zzrN = new LinkedList();
  
  public zzbi() {}
  
  public boolean zza(zzbh paramZzbh)
  {
    synchronized (zzpc)
    {
      return zzrN.contains(paramZzbh);
    }
  }
  
  public boolean zzb(zzbh paramZzbh)
  {
    synchronized (zzpc)
    {
      Iterator localIterator = zzrN.iterator();
      while (localIterator.hasNext())
      {
        zzbh localZzbh = (zzbh)localIterator.next();
        if ((paramZzbh != localZzbh) && (localZzbh.zzcm().equals(paramZzbh.zzcm())))
        {
          localIterator.remove();
          return true;
        }
      }
      return false;
    }
  }
  
  public void zzc(zzbh paramZzbh)
  {
    synchronized (zzpc)
    {
      if (zzrN.size() >= 10)
      {
        zzb.zzaC("Queue is full, current size = " + zzrN.size());
        zzrN.remove(0);
      }
      int i = zzrM;
      zzrM = (i + 1);
      paramZzbh.zzg(i);
      zzrN.add(paramZzbh);
      return;
    }
  }
  
  public zzbh zzcs()
  {
    Object localObject1 = null;
    label146:
    label149:
    for (;;)
    {
      synchronized (zzpc)
      {
        if (zzrN.size() == 0)
        {
          zzb.zzaC("Queue empty");
          return null;
        }
        if (zzrN.size() >= 2)
        {
          int i = Integer.MIN_VALUE;
          Iterator localIterator = zzrN.iterator();
          if (localIterator.hasNext())
          {
            zzbh localZzbh2 = (zzbh)localIterator.next();
            int j = localZzbh2.getScore();
            if (j <= i) {
              break label146;
            }
            localObject1 = localZzbh2;
            i = j;
            break label149;
          }
          zzrN.remove(localObject1);
          return localObject1;
        }
      }
      zzbh localZzbh1 = (zzbh)zzrN.get(0);
      localZzbh1.zzcn();
      return localZzbh1;
    }
  }
}
