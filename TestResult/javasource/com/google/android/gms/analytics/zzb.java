package com.google.android.gms.analytics;

import android.net.Uri;
import android.net.Uri.Builder;
import android.text.TextUtils;
import com.google.android.gms.analytics.ecommerce.Product;
import com.google.android.gms.analytics.ecommerce.ProductAction;
import com.google.android.gms.analytics.ecommerce.Promotion;
import com.google.android.gms.analytics.internal.zzab;
import com.google.android.gms.analytics.internal.zzaf;
import com.google.android.gms.analytics.internal.zzam;
import com.google.android.gms.analytics.internal.zze;
import com.google.android.gms.analytics.internal.zzf;
import com.google.android.gms.analytics.internal.zzh;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zziy;
import com.google.android.gms.internal.zziz;
import com.google.android.gms.internal.zzja;
import com.google.android.gms.internal.zzjb;
import com.google.android.gms.internal.zzob;
import com.google.android.gms.internal.zzoh;
import com.google.android.gms.internal.zzok;
import com.google.android.gms.internal.zzol;
import com.google.android.gms.internal.zzom;
import com.google.android.gms.internal.zzon;
import com.google.android.gms.internal.zzoo;
import com.google.android.gms.internal.zzop;
import com.google.android.gms.internal.zzoq;
import com.google.android.gms.internal.zzor;
import com.google.android.gms.internal.zzos;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

public class zzb
  extends com.google.android.gms.analytics.internal.zzc
  implements zzoh
{
  private static DecimalFormat zzKk;
  private final zzf zzKa;
  private final Uri zzKl;
  private final boolean zzKm;
  private final boolean zzKn;
  private final String zztw;
  
  public zzb(zzf paramZzf, String paramString)
  {
    this(paramZzf, paramString, true, false);
  }
  
  public zzb(zzf paramZzf, String paramString, boolean paramBoolean1, boolean paramBoolean2)
  {
    super(paramZzf);
    zzx.zzcs(paramString);
    zzKa = paramZzf;
    zztw = paramString;
    zzKm = paramBoolean1;
    zzKn = paramBoolean2;
    zzKl = zzaP(zztw);
  }
  
  private static void zza(Map<String, String> paramMap, String paramString, double paramDouble)
  {
    if (paramDouble != 0.0D) {
      paramMap.put(paramString, zzb(paramDouble));
    }
  }
  
  private static void zza(Map<String, String> paramMap, String paramString, int paramInt1, int paramInt2)
  {
    if ((paramInt1 > 0) && (paramInt2 > 0)) {
      paramMap.put(paramString, paramInt1 + "x" + paramInt2);
    }
  }
  
  private static void zza(Map<String, String> paramMap, String paramString1, String paramString2)
  {
    if (!TextUtils.isEmpty(paramString2)) {
      paramMap.put(paramString1, paramString2);
    }
  }
  
  private static void zza(Map<String, String> paramMap, String paramString, boolean paramBoolean)
  {
    if (paramBoolean) {
      paramMap.put(paramString, "1");
    }
  }
  
  static Uri zzaP(String paramString)
  {
    zzx.zzcs(paramString);
    Uri.Builder localBuilder = new Uri.Builder();
    localBuilder.scheme("uri");
    localBuilder.authority("google-analytics.com");
    localBuilder.path(paramString);
    return localBuilder.build();
  }
  
  static String zzb(double paramDouble)
  {
    if (zzKk == null) {
      zzKk = new DecimalFormat("0.######");
    }
    return zzKk.format(paramDouble);
  }
  
  public static Map<String, String> zzc(zzob paramZzob)
  {
    HashMap localHashMap = new HashMap();
    Object localObject1 = (zzja)paramZzob.zzd(zzja.class);
    Object localObject2;
    Object localObject3;
    if (localObject1 != null)
    {
      localObject1 = ((zzja)localObject1).zzhJ().entrySet().iterator();
      while (((Iterator)localObject1).hasNext())
      {
        localObject2 = (Map.Entry)((Iterator)localObject1).next();
        localObject3 = zzh(((Map.Entry)localObject2).getValue());
        if (localObject3 != null) {
          localHashMap.put(((Map.Entry)localObject2).getKey(), localObject3);
        }
      }
    }
    localObject1 = (zzjb)paramZzob.zzd(zzjb.class);
    if (localObject1 != null)
    {
      zza(localHashMap, "t", ((zzjb)localObject1).zzhK());
      zza(localHashMap, "cid", ((zzjb)localObject1).getClientId());
      zza(localHashMap, "uid", ((zzjb)localObject1).getUserId());
      zza(localHashMap, "sc", ((zzjb)localObject1).zzhN());
      zza(localHashMap, "sf", ((zzjb)localObject1).zzhP());
      zza(localHashMap, "ni", ((zzjb)localObject1).zzhO());
      zza(localHashMap, "adid", ((zzjb)localObject1).zzhL());
      zza(localHashMap, "ate", ((zzjb)localObject1).zzhM());
    }
    localObject1 = (zzoq)paramZzob.zzd(zzoq.class);
    if (localObject1 != null)
    {
      zza(localHashMap, "cd", ((zzoq)localObject1).zzxT());
      zza(localHashMap, "a", ((zzoq)localObject1).zzbp());
      zza(localHashMap, "dr", ((zzoq)localObject1).zzxW());
    }
    localObject1 = (zzoo)paramZzob.zzd(zzoo.class);
    if (localObject1 != null)
    {
      zza(localHashMap, "ec", ((zzoo)localObject1).zzxQ());
      zza(localHashMap, "ea", ((zzoo)localObject1).getAction());
      zza(localHashMap, "el", ((zzoo)localObject1).getLabel());
      zza(localHashMap, "ev", ((zzoo)localObject1).getValue());
    }
    localObject1 = (zzol)paramZzob.zzd(zzol.class);
    if (localObject1 != null)
    {
      zza(localHashMap, "cn", ((zzol)localObject1).getName());
      zza(localHashMap, "cs", ((zzol)localObject1).getSource());
      zza(localHashMap, "cm", ((zzol)localObject1).zzxB());
      zza(localHashMap, "ck", ((zzol)localObject1).zzxC());
      zza(localHashMap, "cc", ((zzol)localObject1).getContent());
      zza(localHashMap, "ci", ((zzol)localObject1).getId());
      zza(localHashMap, "anid", ((zzol)localObject1).zzxD());
      zza(localHashMap, "gclid", ((zzol)localObject1).zzxE());
      zza(localHashMap, "dclid", ((zzol)localObject1).zzxF());
      zza(localHashMap, "aclid", ((zzol)localObject1).zzxG());
    }
    localObject1 = (zzop)paramZzob.zzd(zzop.class);
    if (localObject1 != null)
    {
      zza(localHashMap, "exd", ((zzop)localObject1).getDescription());
      zza(localHashMap, "exf", ((zzop)localObject1).zzxR());
    }
    localObject1 = (zzor)paramZzob.zzd(zzor.class);
    if (localObject1 != null)
    {
      zza(localHashMap, "sn", ((zzor)localObject1).zzya());
      zza(localHashMap, "sa", ((zzor)localObject1).getAction());
      zza(localHashMap, "st", ((zzor)localObject1).getTarget());
    }
    localObject1 = (zzos)paramZzob.zzd(zzos.class);
    if (localObject1 != null)
    {
      zza(localHashMap, "utv", ((zzos)localObject1).zzyb());
      zza(localHashMap, "utt", ((zzos)localObject1).getTimeInMillis());
      zza(localHashMap, "utc", ((zzos)localObject1).zzxQ());
      zza(localHashMap, "utl", ((zzos)localObject1).getLabel());
    }
    localObject1 = (zziy)paramZzob.zzd(zziy.class);
    if (localObject1 != null)
    {
      localObject1 = ((zziy)localObject1).zzhH().entrySet().iterator();
      while (((Iterator)localObject1).hasNext())
      {
        localObject2 = (Map.Entry)((Iterator)localObject1).next();
        localObject3 = zzc.zzP(((Integer)((Map.Entry)localObject2).getKey()).intValue());
        if (!TextUtils.isEmpty((CharSequence)localObject3)) {
          localHashMap.put(localObject3, ((Map.Entry)localObject2).getValue());
        }
      }
    }
    localObject1 = (zziz)paramZzob.zzd(zziz.class);
    if (localObject1 != null)
    {
      localObject1 = ((zziz)localObject1).zzhI().entrySet().iterator();
      while (((Iterator)localObject1).hasNext())
      {
        localObject2 = (Map.Entry)((Iterator)localObject1).next();
        localObject3 = zzc.zzR(((Integer)((Map.Entry)localObject2).getKey()).intValue());
        if (!TextUtils.isEmpty((CharSequence)localObject3)) {
          localHashMap.put(localObject3, zzb(((Double)((Map.Entry)localObject2).getValue()).doubleValue()));
        }
      }
    }
    localObject1 = (zzon)paramZzob.zzd(zzon.class);
    if (localObject1 != null)
    {
      localObject2 = ((zzon)localObject1).zzxM();
      if (localObject2 != null)
      {
        localObject2 = ((ProductAction)localObject2).build().entrySet().iterator();
        while (((Iterator)localObject2).hasNext())
        {
          localObject3 = (Map.Entry)((Iterator)localObject2).next();
          if (((String)((Map.Entry)localObject3).getKey()).startsWith("&")) {
            localHashMap.put(((String)((Map.Entry)localObject3).getKey()).substring(1), ((Map.Entry)localObject3).getValue());
          } else {
            localHashMap.put(((Map.Entry)localObject3).getKey(), ((Map.Entry)localObject3).getValue());
          }
        }
      }
      localObject2 = ((zzon)localObject1).zzxP().iterator();
      int i = 1;
      while (((Iterator)localObject2).hasNext())
      {
        localHashMap.putAll(((Promotion)((Iterator)localObject2).next()).zzaV(zzc.zzV(i)));
        i += 1;
      }
      localObject2 = ((zzon)localObject1).zzxN().iterator();
      i = 1;
      while (((Iterator)localObject2).hasNext())
      {
        localHashMap.putAll(((Product)((Iterator)localObject2).next()).zzaV(zzc.zzT(i)));
        i += 1;
      }
      localObject1 = ((zzon)localObject1).zzxO().entrySet().iterator();
      i = 1;
      while (((Iterator)localObject1).hasNext())
      {
        localObject2 = (Map.Entry)((Iterator)localObject1).next();
        Object localObject4 = (List)((Map.Entry)localObject2).getValue();
        localObject3 = zzc.zzY(i);
        localObject4 = ((List)localObject4).iterator();
        int j = 1;
        while (((Iterator)localObject4).hasNext())
        {
          localHashMap.putAll(((Product)((Iterator)localObject4).next()).zzaV((String)localObject3 + zzc.zzW(j)));
          j += 1;
        }
        if (!TextUtils.isEmpty((CharSequence)((Map.Entry)localObject2).getKey())) {
          localHashMap.put((String)localObject3 + "nm", ((Map.Entry)localObject2).getKey());
        }
        i += 1;
      }
    }
    localObject1 = (zzom)paramZzob.zzd(zzom.class);
    if (localObject1 != null)
    {
      zza(localHashMap, "ul", ((zzom)localObject1).getLanguage());
      zza(localHashMap, "sd", ((zzom)localObject1).zzxH());
      zza(localHashMap, "sr", ((zzom)localObject1).zzxI(), ((zzom)localObject1).zzxJ());
      zza(localHashMap, "vp", ((zzom)localObject1).zzxK(), ((zzom)localObject1).zzxL());
    }
    paramZzob = (zzok)paramZzob.zzd(zzok.class);
    if (paramZzob != null)
    {
      zza(localHashMap, "an", paramZzob.zzjZ());
      zza(localHashMap, "aid", paramZzob.zztW());
      zza(localHashMap, "aiid", paramZzob.zzxA());
      zza(localHashMap, "av", paramZzob.zzkb());
    }
    return localHashMap;
  }
  
  private static String zzh(Object paramObject)
  {
    if (paramObject == null) {
      paramObject = null;
    }
    String str;
    do
    {
      return paramObject;
      if (!(paramObject instanceof String)) {
        break;
      }
      str = (String)paramObject;
      paramObject = str;
    } while (!TextUtils.isEmpty(str));
    return null;
    if ((paramObject instanceof Double))
    {
      paramObject = (Double)paramObject;
      if (paramObject.doubleValue() != 0.0D) {
        return zzb(paramObject.doubleValue());
      }
      return null;
    }
    if ((paramObject instanceof Boolean))
    {
      if (paramObject != Boolean.FALSE) {
        return "1";
      }
      return null;
    }
    return String.valueOf(paramObject);
  }
  
  private static String zzy(Map<String, String> paramMap)
  {
    StringBuilder localStringBuilder = new StringBuilder();
    paramMap = paramMap.entrySet().iterator();
    while (paramMap.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)paramMap.next();
      if (localStringBuilder.length() != 0) {
        localStringBuilder.append(", ");
      }
      localStringBuilder.append((String)localEntry.getKey());
      localStringBuilder.append("=");
      localStringBuilder.append((String)localEntry.getValue());
    }
    return localStringBuilder.toString();
  }
  
  public void zzb(zzob paramZzob)
  {
    zzx.zzv(paramZzob);
    zzx.zzb(paramZzob.zzxm(), "Can't deliver not submitted measurement");
    zzx.zzci("deliver should be called on worker thread");
    Object localObject2 = paramZzob.zzxh();
    Object localObject1 = (zzjb)((zzob)localObject2).zze(zzjb.class);
    if (TextUtils.isEmpty(((zzjb)localObject1).zzhK())) {
      zzie().zzh(zzc((zzob)localObject2), "Ignoring measurement without type");
    }
    do
    {
      return;
      if (TextUtils.isEmpty(((zzjb)localObject1).getClientId()))
      {
        zzie().zzh(zzc((zzob)localObject2), "Ignoring measurement without client id");
        return;
      }
    } while (zzKa.zzis().getAppOptOut());
    double d = ((zzjb)localObject1).zzhP();
    if (zzam.zza(d, ((zzjb)localObject1).getClientId()))
    {
      zzb("Sampling enabled. Hit sampled out. sampling rate", Double.valueOf(d));
      return;
    }
    localObject2 = zzc((zzob)localObject2);
    ((Map)localObject2).put("v", "1");
    ((Map)localObject2).put("_v", zze.zzLB);
    ((Map)localObject2).put("tid", zztw);
    if (zzKa.zzis().isDryRunEnabled())
    {
      zzc("Dry run is enabled. GoogleAnalytics would have sent", zzy((Map)localObject2));
      return;
    }
    HashMap localHashMap = new HashMap();
    zzam.zzb(localHashMap, "uid", ((zzjb)localObject1).getUserId());
    Object localObject3 = (zzok)paramZzob.zzd(zzok.class);
    if (localObject3 != null)
    {
      zzam.zzb(localHashMap, "an", ((zzok)localObject3).zzjZ());
      zzam.zzb(localHashMap, "aid", ((zzok)localObject3).zztW());
      zzam.zzb(localHashMap, "av", ((zzok)localObject3).zzkb());
      zzam.zzb(localHashMap, "aiid", ((zzok)localObject3).zzxA());
    }
    localObject3 = ((zzjb)localObject1).getClientId();
    String str = zztw;
    if (!TextUtils.isEmpty(((zzjb)localObject1).zzhL())) {}
    for (boolean bool = true;; bool = false)
    {
      localObject1 = new zzh(0L, (String)localObject3, str, bool, 0L, localHashMap);
      ((Map)localObject2).put("_s", String.valueOf(zzhz().zza((zzh)localObject1)));
      paramZzob = new zzab(zzie(), (Map)localObject2, paramZzob.zzxk(), true);
      zzhz().zza(paramZzob);
      return;
    }
  }
  
  public Uri zzhs()
  {
    return zzKl;
  }
}
