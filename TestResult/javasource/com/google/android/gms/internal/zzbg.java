package com.google.android.gms.internal;

import com.google.android.gms.ads.internal.util.client.zzb;
import java.util.AbstractMap.SimpleEntry;
import java.util.HashSet;
import java.util.Iterator;
import org.json.JSONObject;

public class zzbg
  implements zzbf
{
  private final zzbe zzrA;
  private final HashSet<AbstractMap.SimpleEntry<String, zzdg>> zzrB;
  
  public zzbg(zzbe paramZzbe)
  {
    zzrA = paramZzbe;
    zzrB = new HashSet();
  }
  
  public void zza(String paramString, zzdg paramZzdg)
  {
    zzrA.zza(paramString, paramZzdg);
    zzrB.add(new AbstractMap.SimpleEntry(paramString, paramZzdg));
  }
  
  public void zza(String paramString1, String paramString2)
  {
    zzrA.zza(paramString1, paramString2);
  }
  
  public void zza(String paramString, JSONObject paramJSONObject)
  {
    zzrA.zza(paramString, paramJSONObject);
  }
  
  public void zzb(String paramString, zzdg paramZzdg)
  {
    zzrA.zzb(paramString, paramZzdg);
    zzrB.remove(new AbstractMap.SimpleEntry(paramString, paramZzdg));
  }
  
  public void zzb(String paramString, JSONObject paramJSONObject)
  {
    zzrA.zzb(paramString, paramJSONObject);
  }
  
  public void zzck()
  {
    Iterator localIterator = zzrB.iterator();
    while (localIterator.hasNext())
    {
      AbstractMap.SimpleEntry localSimpleEntry = (AbstractMap.SimpleEntry)localIterator.next();
      zzb.v("Unregistering eventhandler: " + ((zzdg)localSimpleEntry.getValue()).toString());
      zzrA.zzb((String)localSimpleEntry.getKey(), (zzdg)localSimpleEntry.getValue());
    }
    zzrB.clear();
  }
}
