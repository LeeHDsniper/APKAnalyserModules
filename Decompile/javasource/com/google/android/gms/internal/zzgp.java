package com.google.android.gms.internal;

import com.google.android.gms.ads.internal.request.AdRequestInfoParcel;
import com.google.android.gms.ads.internal.request.AdResponseParcel;
import com.google.android.gms.ads.internal.util.client.zzb;
import com.google.android.gms.ads.internal.zzp;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@zzgk
public final class zzgp
{
  private int mOrientation = -1;
  private List<String> zzCX;
  private String zzFf;
  private String zzFg;
  private List<String> zzFh;
  private String zzFi;
  private String zzFj;
  private List<String> zzFk;
  private long zzFl = -1L;
  private boolean zzFm = false;
  private final long zzFn = -1L;
  private long zzFo = -1L;
  private boolean zzFp = false;
  private boolean zzFq = false;
  private boolean zzFr = false;
  private boolean zzFs = true;
  private int zzFt = 0;
  private String zzvM;
  private final AdRequestInfoParcel zzyd;
  
  public zzgp(AdRequestInfoParcel paramAdRequestInfoParcel)
  {
    zzyd = paramAdRequestInfoParcel;
  }
  
  static String zzd(Map<String, List<String>> paramMap, String paramString)
  {
    paramMap = (List)paramMap.get(paramString);
    if ((paramMap != null) && (!paramMap.isEmpty())) {
      return (String)paramMap.get(0);
    }
    return null;
  }
  
  static long zze(Map<String, List<String>> paramMap, String paramString)
  {
    paramMap = (List)paramMap.get(paramString);
    if ((paramMap != null) && (!paramMap.isEmpty()))
    {
      paramMap = (String)paramMap.get(0);
      try
      {
        float f = Float.parseFloat(paramMap);
        return (f * 1000.0F);
      }
      catch (NumberFormatException localNumberFormatException)
      {
        zzb.zzaE("Could not parse float from " + paramString + " header: " + paramMap);
      }
    }
    return -1L;
  }
  
  static List<String> zzf(Map<String, List<String>> paramMap, String paramString)
  {
    paramMap = (List)paramMap.get(paramString);
    if ((paramMap != null) && (!paramMap.isEmpty()))
    {
      paramMap = (String)paramMap.get(0);
      if (paramMap != null) {
        return Arrays.asList(paramMap.trim().split("\\s+"));
      }
    }
    return null;
  }
  
  private boolean zzg(Map<String, List<String>> paramMap, String paramString)
  {
    paramMap = (List)paramMap.get(paramString);
    return (paramMap != null) && (!paramMap.isEmpty()) && (Boolean.valueOf((String)paramMap.get(0)).booleanValue());
  }
  
  private void zzi(Map<String, List<String>> paramMap)
  {
    zzFf = zzd(paramMap, "X-Afma-Ad-Size");
  }
  
  private void zzj(Map<String, List<String>> paramMap)
  {
    paramMap = zzf(paramMap, "X-Afma-Click-Tracking-Urls");
    if (paramMap != null) {
      zzFh = paramMap;
    }
  }
  
  private void zzk(Map<String, List<String>> paramMap)
  {
    paramMap = (List)paramMap.get("X-Afma-Debug-Dialog");
    if ((paramMap != null) && (!paramMap.isEmpty())) {
      zzFi = ((String)paramMap.get(0));
    }
  }
  
  private void zzl(Map<String, List<String>> paramMap)
  {
    paramMap = zzf(paramMap, "X-Afma-Tracking-Urls");
    if (paramMap != null) {
      zzFk = paramMap;
    }
  }
  
  private void zzm(Map<String, List<String>> paramMap)
  {
    long l = zze(paramMap, "X-Afma-Interstitial-Timeout");
    if (l != -1L) {
      zzFl = l;
    }
  }
  
  private void zzn(Map<String, List<String>> paramMap)
  {
    zzFj = zzd(paramMap, "X-Afma-ActiveView");
  }
  
  private void zzo(Map<String, List<String>> paramMap)
  {
    boolean bool2 = zzFq;
    if ((zzyd != null) && (zzyd.zzDE != 0)) {}
    for (boolean bool1 = true;; bool1 = false)
    {
      zzFq = (bool1 | bool2);
      return;
    }
  }
  
  private void zzp(Map<String, List<String>> paramMap)
  {
    zzFp |= zzg(paramMap, "X-Afma-Custom-Rendering-Allowed");
  }
  
  private void zzq(Map<String, List<String>> paramMap)
  {
    zzFm |= zzg(paramMap, "X-Afma-Mediation");
  }
  
  private void zzr(Map<String, List<String>> paramMap)
  {
    paramMap = zzf(paramMap, "X-Afma-Manual-Tracking-Urls");
    if (paramMap != null) {
      zzCX = paramMap;
    }
  }
  
  private void zzs(Map<String, List<String>> paramMap)
  {
    long l = zze(paramMap, "X-Afma-Refresh-Rate");
    if (l != -1L) {
      zzFo = l;
    }
  }
  
  private void zzt(Map<String, List<String>> paramMap)
  {
    paramMap = (List)paramMap.get("X-Afma-Orientation");
    if ((paramMap != null) && (!paramMap.isEmpty()))
    {
      paramMap = (String)paramMap.get(0);
      if (!"portrait".equalsIgnoreCase(paramMap)) {
        break label56;
      }
      mOrientation = zzp.zzbz().zzgw();
    }
    label56:
    while (!"landscape".equalsIgnoreCase(paramMap)) {
      return;
    }
    mOrientation = zzp.zzbz().zzgv();
  }
  
  private void zzu(Map<String, List<String>> paramMap)
  {
    paramMap = (List)paramMap.get("X-Afma-Use-HTTPS");
    if ((paramMap != null) && (!paramMap.isEmpty())) {
      zzFr = Boolean.valueOf((String)paramMap.get(0)).booleanValue();
    }
  }
  
  private void zzv(Map<String, List<String>> paramMap)
  {
    paramMap = (List)paramMap.get("X-Afma-Content-Url-Opted-Out");
    if ((paramMap != null) && (!paramMap.isEmpty())) {
      zzFs = Boolean.valueOf((String)paramMap.get(0)).booleanValue();
    }
  }
  
  private void zzw(Map<String, List<String>> paramMap)
  {
    paramMap = zzf(paramMap, "X-Afma-OAuth-Token-Status");
    zzFt = 0;
    if (paramMap == null) {}
    String str;
    do
    {
      return;
      while (!paramMap.hasNext()) {
        paramMap = paramMap.iterator();
      }
      str = (String)paramMap.next();
      if ("Clear".equalsIgnoreCase(str))
      {
        zzFt = 1;
        return;
      }
    } while (!"No-Op".equalsIgnoreCase(str));
    zzFt = 0;
  }
  
  public void zzb(String paramString1, Map<String, List<String>> paramMap, String paramString2)
  {
    zzFg = paramString1;
    zzvM = paramString2;
    zzh(paramMap);
  }
  
  public void zzh(Map<String, List<String>> paramMap)
  {
    zzi(paramMap);
    zzj(paramMap);
    zzk(paramMap);
    zzl(paramMap);
    zzm(paramMap);
    zzq(paramMap);
    zzr(paramMap);
    zzs(paramMap);
    zzt(paramMap);
    zzn(paramMap);
    zzu(paramMap);
    zzp(paramMap);
    zzo(paramMap);
    zzv(paramMap);
    zzw(paramMap);
  }
  
  public AdResponseParcel zzj(long paramLong)
  {
    return new AdResponseParcel(zzyd, zzFg, zzvM, zzFh, zzFk, zzFl, zzFm, -1L, zzCX, zzFo, mOrientation, zzFf, paramLong, zzFi, zzFj, zzFp, zzFq, zzFr, zzFs, false, zzFt);
  }
}
