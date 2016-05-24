package com.google.android.gms.internal;

import android.os.Handler;
import com.google.android.gms.ads.internal.client.zzk;
import com.google.android.gms.ads.internal.util.client.zza;
import com.google.android.gms.common.api.Releasable;
import java.util.HashMap;
import java.util.Map;

@zzgk
public abstract class zzdr
  implements Releasable
{
  protected zzip zzoL;
  
  public zzdr(zzip paramZzip)
  {
    zzoL = paramZzip;
  }
  
  public abstract void abort();
  
  public void release() {}
  
  public abstract boolean zzZ(String paramString);
  
  protected void zza(final String paramString1, final String paramString2, final int paramInt)
  {
    zza.zzIy.post(new Runnable()
    {
      public void run()
      {
        HashMap localHashMap = new HashMap();
        localHashMap.put("event", "precacheComplete");
        localHashMap.put("src", paramString1);
        localHashMap.put("cachedSrc", paramString2);
        localHashMap.put("totalBytes", Integer.toString(paramInt));
        zzoL.zzc("onPrecacheEvent", localHashMap);
      }
    });
  }
  
  protected void zza(final String paramString1, final String paramString2, final int paramInt1, final int paramInt2, final boolean paramBoolean)
  {
    zza.zzIy.post(new Runnable()
    {
      public void run()
      {
        HashMap localHashMap = new HashMap();
        localHashMap.put("event", "precacheProgress");
        localHashMap.put("src", paramString1);
        localHashMap.put("cachedSrc", paramString2);
        localHashMap.put("bytesLoaded", Integer.toString(paramInt1));
        localHashMap.put("totalBytes", Integer.toString(paramInt2));
        if (paramBoolean) {}
        for (String str = "1";; str = "0")
        {
          localHashMap.put("cacheReady", str);
          zzoL.zzc("onPrecacheEvent", localHashMap);
          return;
        }
      }
    });
  }
  
  protected String zzaa(String paramString)
  {
    return zzk.zzcE().zzaB(paramString);
  }
  
  protected void zzf(final String paramString1, final String paramString2)
  {
    zza.zzIy.post(new Runnable()
    {
      public void run()
      {
        HashMap localHashMap = new HashMap();
        localHashMap.put("event", "precacheCanceled");
        localHashMap.put("src", paramString1);
        if (paramString2 != null) {
          localHashMap.put("cachedSrc", paramString2);
        }
        zzoL.zzc("onPrecacheEvent", localHashMap);
      }
    });
  }
}
