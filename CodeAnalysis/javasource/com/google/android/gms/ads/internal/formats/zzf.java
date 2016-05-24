package com.google.android.gms.ads.internal.formats;

import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.internal.zzcj;
import com.google.android.gms.internal.zzcr.zza;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzlh;
import java.util.Arrays;
import java.util.List;

@zzgk
public class zzf
  extends zzcr.zza
  implements zzh.zza
{
  private final Object zzpc = new Object();
  private final zza zzvS;
  private zzh zzvT;
  private final String zzvW;
  private final zzlh<String, zzc> zzvX;
  private final zzlh<String, String> zzvY;
  
  public zzf(String paramString, zzlh<String, zzc> paramZzlh, zzlh<String, String> paramZzlh1, zza paramZza)
  {
    zzvW = paramString;
    zzvX = paramZzlh;
    zzvY = paramZzlh1;
    zzvS = paramZza;
  }
  
  public List<String> getAvailableAssetNames()
  {
    int n = 0;
    String[] arrayOfString = new String[zzvX.size() + zzvY.size()];
    int j = 0;
    int i = 0;
    int k;
    int m;
    for (;;)
    {
      k = n;
      m = i;
      if (j >= zzvX.size()) {
        break;
      }
      arrayOfString[i] = ((String)zzvX.keyAt(j));
      i += 1;
      j += 1;
    }
    while (k < zzvY.size())
    {
      arrayOfString[m] = ((String)zzvY.keyAt(k));
      k += 1;
      m += 1;
    }
    return Arrays.asList(arrayOfString);
  }
  
  public String getCustomTemplateId()
  {
    return zzvW;
  }
  
  public void performClick(String paramString)
  {
    synchronized (zzpc)
    {
      if (zzvT == null)
      {
        zzb.e("Attempt to call performClick before ad initialized.");
        return;
      }
      zzvT.performClick(paramString);
      return;
    }
  }
  
  public void recordImpression()
  {
    synchronized (zzpc)
    {
      if (zzvT == null)
      {
        zzb.e("Attempt to perform recordImpression before ad initialized.");
        return;
      }
      zzvT.recordImpression();
      return;
    }
  }
  
  public String zzS(String paramString)
  {
    return (String)zzvY.get(paramString);
  }
  
  public zzcj zzT(String paramString)
  {
    return (zzcj)zzvX.get(paramString);
  }
  
  public void zza(zzh paramZzh)
  {
    synchronized (zzpc)
    {
      zzvT = paramZzh;
      return;
    }
  }
  
  public String zzdu()
  {
    return "3";
  }
  
  public zza zzdv()
  {
    return zzvS;
  }
}
