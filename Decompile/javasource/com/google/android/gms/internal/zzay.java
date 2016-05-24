package com.google.android.gms.internal;

import android.content.Context;
import android.view.View;
import com.google.android.gms.ads.internal.client.AdSizeParcel;
import com.google.android.gms.ads.internal.util.client.VersionInfoParcel;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;
import java.util.WeakHashMap;

@zzgk
public class zzay
  implements zzba
{
  private final VersionInfoParcel zzpa;
  private final Object zzpc = new Object();
  private final WeakHashMap<zzhj, zzaz> zzqM = new WeakHashMap();
  private final ArrayList<zzaz> zzqN = new ArrayList();
  private final Context zzqO;
  private final zzdv zzqP;
  
  public zzay(Context paramContext, VersionInfoParcel paramVersionInfoParcel, zzdv paramZzdv)
  {
    zzqO = paramContext.getApplicationContext();
    zzpa = paramVersionInfoParcel;
    zzqP = paramZzdv;
  }
  
  public zzaz zza(AdSizeParcel paramAdSizeParcel, zzhj paramZzhj)
  {
    return zza(paramAdSizeParcel, paramZzhj, zzAR.getWebView());
  }
  
  public zzaz zza(AdSizeParcel paramAdSizeParcel, zzhj paramZzhj, View paramView)
  {
    synchronized (zzpc)
    {
      if (zzd(paramZzhj))
      {
        paramAdSizeParcel = (zzaz)zzqM.get(paramZzhj);
        return paramAdSizeParcel;
      }
      paramAdSizeParcel = new zzaz(paramAdSizeParcel, paramZzhj, zzpa, paramView, zzqP);
      paramAdSizeParcel.zza(this);
      zzqM.put(paramZzhj, paramAdSizeParcel);
      zzqN.add(paramAdSizeParcel);
      return paramAdSizeParcel;
    }
  }
  
  public void zza(zzaz paramZzaz)
  {
    synchronized (zzpc)
    {
      if (!paramZzaz.zzcd())
      {
        zzqN.remove(paramZzaz);
        Iterator localIterator = zzqM.entrySet().iterator();
        while (localIterator.hasNext()) {
          if (((Map.Entry)localIterator.next()).getValue() == paramZzaz) {
            localIterator.remove();
          }
        }
      }
    }
  }
  
  public boolean zzd(zzhj paramZzhj)
  {
    for (;;)
    {
      synchronized (zzpc)
      {
        paramZzhj = (zzaz)zzqM.get(paramZzhj);
        if ((paramZzhj != null) && (paramZzhj.zzcd()))
        {
          bool = true;
          return bool;
        }
      }
      boolean bool = false;
    }
  }
  
  public void zze(zzhj paramZzhj)
  {
    synchronized (zzpc)
    {
      paramZzhj = (zzaz)zzqM.get(paramZzhj);
      if (paramZzhj != null) {
        paramZzhj.zzcb();
      }
      return;
    }
  }
  
  public void zzf(zzhj paramZzhj)
  {
    synchronized (zzpc)
    {
      paramZzhj = (zzaz)zzqM.get(paramZzhj);
      if (paramZzhj != null) {
        paramZzhj.stop();
      }
      return;
    }
  }
  
  public void zzg(zzhj paramZzhj)
  {
    synchronized (zzpc)
    {
      paramZzhj = (zzaz)zzqM.get(paramZzhj);
      if (paramZzhj != null) {
        paramZzhj.pause();
      }
      return;
    }
  }
  
  public void zzh(zzhj paramZzhj)
  {
    synchronized (zzpc)
    {
      paramZzhj = (zzaz)zzqM.get(paramZzhj);
      if (paramZzhj != null) {
        paramZzhj.resume();
      }
      return;
    }
  }
}
