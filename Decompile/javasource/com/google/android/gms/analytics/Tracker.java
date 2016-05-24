package com.google.android.gms.analytics;

import android.text.TextUtils;
import com.google.android.gms.analytics.internal.zza;
import com.google.android.gms.analytics.internal.zzab;
import com.google.android.gms.analytics.internal.zzad;
import com.google.android.gms.analytics.internal.zzaf;
import com.google.android.gms.analytics.internal.zzam;
import com.google.android.gms.analytics.internal.zzan;
import com.google.android.gms.analytics.internal.zzb;
import com.google.android.gms.analytics.internal.zzd;
import com.google.android.gms.analytics.internal.zze;
import com.google.android.gms.analytics.internal.zzf;
import com.google.android.gms.analytics.internal.zzh;
import com.google.android.gms.analytics.internal.zzk;
import com.google.android.gms.analytics.internal.zzu;
import com.google.android.gms.common.internal.zzx;
import com.google.android.gms.internal.zzlm;
import com.google.android.gms.internal.zzof;
import com.google.android.gms.internal.zzok;
import com.google.android.gms.internal.zzom;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Random;
import java.util.Set;

public class Tracker
  extends zzd
{
  private boolean zzKH;
  private final Map<String, String> zzKI = new HashMap();
  private final zzad zzKJ;
  private final zza zzKK;
  private final Map<String, String> zzvs = new HashMap();
  
  Tracker(zzf paramZzf, String paramString, zzad paramZzad)
  {
    super(paramZzf);
    if (paramString != null) {
      zzvs.put("&tid", paramString);
    }
    zzvs.put("useSecure", "1");
    zzvs.put("&a", Integer.toString(new Random().nextInt(Integer.MAX_VALUE) + 1));
    if (paramZzad == null) {}
    for (zzKJ = new zzad("tracking");; zzKJ = paramZzad)
    {
      zzKK = new zza(paramZzf);
      return;
    }
  }
  
  private static void zza(Map<String, String> paramMap1, Map<String, String> paramMap2)
  {
    zzx.zzv(paramMap2);
    if (paramMap1 == null) {}
    for (;;)
    {
      return;
      paramMap1 = paramMap1.entrySet().iterator();
      while (paramMap1.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)paramMap1.next();
        String str = zzb(localEntry);
        if (str != null) {
          paramMap2.put(str, localEntry.getValue());
        }
      }
    }
  }
  
  private static boolean zza(Map.Entry<String, String> paramEntry)
  {
    String str = (String)paramEntry.getKey();
    paramEntry = (String)paramEntry.getValue();
    return (str.startsWith("&")) && (str.length() >= 2);
  }
  
  private static String zzb(Map.Entry<String, String> paramEntry)
  {
    if (!zza(paramEntry)) {
      return null;
    }
    return ((String)paramEntry.getKey()).substring(1);
  }
  
  private static void zzb(Map<String, String> paramMap1, Map<String, String> paramMap2)
  {
    zzx.zzv(paramMap2);
    if (paramMap1 == null) {}
    for (;;)
    {
      return;
      paramMap1 = paramMap1.entrySet().iterator();
      while (paramMap1.hasNext())
      {
        Map.Entry localEntry = (Map.Entry)paramMap1.next();
        String str = zzb(localEntry);
        if ((str != null) && (!paramMap2.containsKey(str))) {
          paramMap2.put(str, localEntry.getValue());
        }
      }
    }
  }
  
  public void enableAdvertisingIdCollection(boolean paramBoolean)
  {
    zzKH = paramBoolean;
  }
  
  public void send(final Map<String, String> paramMap)
  {
    final long l = zzid().currentTimeMillis();
    if (zzhu().getAppOptOut())
    {
      zzaZ("AppOptOut is set to true. Not sending Google Analytics hit");
      return;
    }
    boolean bool1 = zzhu().isDryRunEnabled();
    final HashMap localHashMap = new HashMap();
    zza(zzvs, localHashMap);
    zza(paramMap, localHashMap);
    final boolean bool2 = zzam.zze((String)zzvs.get("useSecure"), true);
    zzb(zzKI, localHashMap);
    zzKI.clear();
    paramMap = (String)localHashMap.get("t");
    if (TextUtils.isEmpty(paramMap))
    {
      zzie().zzh(localHashMap, "Missing hit type parameter");
      return;
    }
    final String str = (String)localHashMap.get("tid");
    if (TextUtils.isEmpty(str))
    {
      zzie().zzh(localHashMap, "Missing tracking id parameter");
      return;
    }
    final boolean bool3 = zzhD();
    try
    {
      if (("screenview".equalsIgnoreCase(paramMap)) || ("pageview".equalsIgnoreCase(paramMap)) || ("appview".equalsIgnoreCase(paramMap)) || (TextUtils.isEmpty(paramMap)))
      {
        int j = Integer.parseInt((String)zzvs.get("&a")) + 1;
        int i = j;
        if (j >= Integer.MAX_VALUE) {
          i = 1;
        }
        zzvs.put("&a", Integer.toString(i));
      }
      zzig().zzf(new Runnable()
      {
        public void run()
        {
          boolean bool = true;
          if (Tracker.zza(Tracker.this).zzhE()) {
            localHashMap.put("sc", "start");
          }
          zzam.zzc(localHashMap, "cid", zzhu().getClientId());
          Object localObject = (String)localHashMap.get("sf");
          if (localObject != null)
          {
            double d = zzam.zza((String)localObject, 100.0D);
            if (zzam.zza(d, (String)localHashMap.get("cid")))
            {
              zzb("Sampling enabled. Hit sampled out. sample rate", Double.valueOf(d));
              return;
            }
          }
          localObject = Tracker.zzb(Tracker.this);
          if (bool3)
          {
            zzam.zzb(localHashMap, "ate", ((zza)localObject).zzhM());
            zzam.zzb(localHashMap, "adid", ((zza)localObject).zzhQ());
            localObject = Tracker.zzc(Tracker.this).zziL();
            zzam.zzb(localHashMap, "an", ((zzok)localObject).zzjZ());
            zzam.zzb(localHashMap, "av", ((zzok)localObject).zzkb());
            zzam.zzb(localHashMap, "aid", ((zzok)localObject).zztW());
            zzam.zzb(localHashMap, "aiid", ((zzok)localObject).zzxA());
            localHashMap.put("v", "1");
            localHashMap.put("_v", zze.zzLB);
            zzam.zzb(localHashMap, "ul", Tracker.zzd(Tracker.this).zzjS().getLanguage());
            zzam.zzb(localHashMap, "sr", Tracker.zze(Tracker.this).zzjT());
            if ((!paramMap.equals("transaction")) && (!paramMap.equals("item"))) {
              break label383;
            }
          }
          label383:
          for (int i = 1;; i = 0)
          {
            if ((i != 0) || (Tracker.zzf(Tracker.this).zzkp())) {
              break label388;
            }
            Tracker.zzg(Tracker.this).zzh(localHashMap, "Too many hits sent too quickly, rate limiting invoked");
            return;
            localHashMap.remove("ate");
            localHashMap.remove("adid");
            break;
          }
          label388:
          long l2 = zzam.zzbo((String)localHashMap.get("ht"));
          long l1 = l2;
          if (l2 == 0L) {
            l1 = l;
          }
          if (bool2)
          {
            localObject = new zzab(Tracker.this, localHashMap, l1, str);
            Tracker.zzh(Tracker.this).zzc("Dry run enabled. Would have sent hit", localObject);
            return;
          }
          localObject = (String)localHashMap.get("cid");
          HashMap localHashMap = new HashMap();
          zzam.zza(localHashMap, "uid", localHashMap);
          zzam.zza(localHashMap, "an", localHashMap);
          zzam.zza(localHashMap, "aid", localHashMap);
          zzam.zza(localHashMap, "av", localHashMap);
          zzam.zza(localHashMap, "aiid", localHashMap);
          String str = zzKT;
          if (!TextUtils.isEmpty((CharSequence)localHashMap.get("adid"))) {}
          for (;;)
          {
            localObject = new zzh(0L, (String)localObject, str, bool, 0L, localHashMap);
            l2 = Tracker.zzi(Tracker.this).zza((zzh)localObject);
            localHashMap.put("_s", String.valueOf(l2));
            localObject = new zzab(Tracker.this, localHashMap, l1, str);
            Tracker.zzj(Tracker.this).zza((zzab)localObject);
            return;
            bool = false;
          }
        }
      });
      return;
    }
    finally {}
  }
  
  public void set(String paramString1, String paramString2)
  {
    zzx.zzb(paramString1, "Key should be non-null");
    if (TextUtils.isEmpty(paramString1)) {
      return;
    }
    zzvs.put(paramString1, paramString2);
  }
  
  public void setScreenName(String paramString)
  {
    set("&cd", paramString);
  }
  
  protected void zzhB()
  {
    zzKK.zza();
    String str = zzhA().zzjZ();
    if (str != null) {
      set("&an", str);
    }
    str = zzhA().zzkb();
    if (str != null) {
      set("&av", str);
    }
  }
  
  boolean zzhD()
  {
    return zzKH;
  }
  
  private class zza
    extends zzd
  {
    private long zzKX = -1L;
    private boolean zzKY;
    
    protected zza(zzf paramZzf)
    {
      super();
    }
    
    protected void zzhB() {}
    
    public boolean zzhE()
    {
      try
      {
        boolean bool = zzKY;
        zzKY = false;
        return bool;
      }
      finally
      {
        localObject = finally;
        throw localObject;
      }
    }
  }
}
