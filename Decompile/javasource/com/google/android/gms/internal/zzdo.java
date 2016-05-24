package com.google.android.gms.internal;

import android.content.Context;
import android.graphics.Color;
import android.os.SystemClock;
import android.text.TextUtils;
import android.view.MotionEvent;
import com.google.android.gms.ads.internal.overlay.zzd;
import com.google.android.gms.ads.internal.util.client.zza;
import com.google.android.gms.ads.internal.util.client.zzb;
import java.util.Map;
import java.util.WeakHashMap;
import org.json.JSONObject;

@zzgk
public final class zzdo
  implements zzdg
{
  private final Map<zzip, Integer> zzxq = new WeakHashMap();
  
  public zzdo() {}
  
  private static int zza(Context paramContext, Map<String, String> paramMap, String paramString, int paramInt)
  {
    paramMap = (String)paramMap.get(paramString);
    int i = paramInt;
    if (paramMap != null) {}
    try
    {
      i = com.google.android.gms.ads.internal.client.zzk.zzcE().zzb(paramContext, Integer.parseInt(paramMap));
      return i;
    }
    catch (NumberFormatException paramContext)
    {
      zzb.zzaE("Could not parse " + paramString + " in a video GMSG: " + paramMap);
    }
    return paramInt;
  }
  
  public void zza(zzip paramZzip, Map<String, String> paramMap)
  {
    Object localObject2 = (String)paramMap.get("action");
    if (localObject2 == null) {
      zzb.zzaE("Action missing from video GMSG.");
    }
    int i;
    int j;
    for (;;)
    {
      return;
      if (zzb.zzM(3))
      {
        localObject1 = new JSONObject(paramMap);
        ((JSONObject)localObject1).remove("google.afma.Notify_dt");
        zzb.zzaC("Video GMSG: " + (String)localObject2 + " " + ((JSONObject)localObject1).toString());
      }
      if ("background".equals(localObject2))
      {
        paramMap = (String)paramMap.get("color");
        if (TextUtils.isEmpty(paramMap))
        {
          zzb.zzaE("Color parameter missing from color video GMSG.");
          return;
        }
        try
        {
          i = Color.parseColor(paramMap);
          paramMap = paramZzip.zzgQ();
          if (paramMap != null)
          {
            paramMap = paramMap.zzew();
            if (paramMap != null)
            {
              paramMap.setBackgroundColor(i);
              return;
            }
          }
        }
        catch (IllegalArgumentException paramZzip)
        {
          zzb.zzaE("Invalid color parameter in video GMSG.");
          return;
        }
        zzxq.put(paramZzip, Integer.valueOf(i));
        return;
      }
      localObject1 = paramZzip.zzgQ();
      if (localObject1 == null)
      {
        zzb.zzaE("Could not get ad overlay for a video GMSG.");
        return;
      }
      boolean bool1 = "new".equals(localObject2);
      boolean bool2 = "position".equals(localObject2);
      if ((bool1) || (bool2))
      {
        localObject2 = paramZzip.getContext();
        j = zza((Context)localObject2, paramMap, "x", 0);
        int k = zza((Context)localObject2, paramMap, "y", 0);
        int m = zza((Context)localObject2, paramMap, "w", -1);
        int n = zza((Context)localObject2, paramMap, "h", -1);
        try
        {
          i = Integer.parseInt((String)paramMap.get("player"));
          if ((bool1) && (((zzd)localObject1).zzew() == null))
          {
            ((zzd)localObject1).zza(j, k, m, n, i);
            if (!zzxq.containsKey(paramZzip)) {
              continue;
            }
            i = ((Integer)zzxq.get(paramZzip)).intValue();
            ((zzd)localObject1).zzew().setBackgroundColor(i);
          }
        }
        catch (NumberFormatException paramMap)
        {
          for (;;)
          {
            i = 0;
          }
          ((zzd)localObject1).zzd(j, k, m, n);
          return;
        }
      }
    }
    Object localObject1 = ((zzd)localObject1).zzew();
    if (localObject1 == null)
    {
      com.google.android.gms.ads.internal.overlay.zzk.zzd(paramZzip);
      return;
    }
    if ("click".equals(localObject2))
    {
      paramZzip = paramZzip.getContext();
      i = zza(paramZzip, paramMap, "x", 0);
      j = zza(paramZzip, paramMap, "y", 0);
      long l = SystemClock.uptimeMillis();
      paramZzip = MotionEvent.obtain(l, l, 0, i, j, 0);
      ((com.google.android.gms.ads.internal.overlay.zzk)localObject1).zzd(paramZzip);
      paramZzip.recycle();
      return;
    }
    if ("currentTime".equals(localObject2))
    {
      paramZzip = (String)paramMap.get("time");
      if (paramZzip == null)
      {
        zzb.zzaE("Time parameter missing from currentTime video GMSG.");
        return;
      }
      try
      {
        ((com.google.android.gms.ads.internal.overlay.zzk)localObject1).seekTo((int)(Float.parseFloat(paramZzip) * 1000.0F));
        return;
      }
      catch (NumberFormatException paramMap)
      {
        zzb.zzaE("Could not parse time parameter from currentTime video GMSG: " + paramZzip);
        return;
      }
    }
    if ("hide".equals(localObject2))
    {
      ((com.google.android.gms.ads.internal.overlay.zzk)localObject1).setVisibility(4);
      return;
    }
    if ("load".equals(localObject2))
    {
      ((com.google.android.gms.ads.internal.overlay.zzk)localObject1).zzeP();
      return;
    }
    if ("mimetype".equals(localObject2))
    {
      ((com.google.android.gms.ads.internal.overlay.zzk)localObject1).setMimeType((String)paramMap.get("mimetype"));
      return;
    }
    if ("muted".equals(localObject2))
    {
      if (Boolean.parseBoolean((String)paramMap.get("muted")))
      {
        ((com.google.android.gms.ads.internal.overlay.zzk)localObject1).zzeq();
        return;
      }
      ((com.google.android.gms.ads.internal.overlay.zzk)localObject1).zzer();
      return;
    }
    if ("pause".equals(localObject2))
    {
      ((com.google.android.gms.ads.internal.overlay.zzk)localObject1).pause();
      return;
    }
    if ("play".equals(localObject2))
    {
      ((com.google.android.gms.ads.internal.overlay.zzk)localObject1).play();
      return;
    }
    if ("show".equals(localObject2))
    {
      ((com.google.android.gms.ads.internal.overlay.zzk)localObject1).setVisibility(0);
      return;
    }
    if ("src".equals(localObject2))
    {
      ((com.google.android.gms.ads.internal.overlay.zzk)localObject1).zzak((String)paramMap.get("src"));
      return;
    }
    if ("volume".equals(localObject2))
    {
      paramZzip = (String)paramMap.get("volume");
      if (paramZzip == null)
      {
        zzb.zzaE("Level parameter missing from volume video GMSG.");
        return;
      }
      try
      {
        ((com.google.android.gms.ads.internal.overlay.zzk)localObject1).zza(Float.parseFloat(paramZzip));
        return;
      }
      catch (NumberFormatException paramMap)
      {
        zzb.zzaE("Could not parse volume parameter from volume video GMSG: " + paramZzip);
        return;
      }
    }
    if ("watermark".equals(localObject2))
    {
      ((com.google.android.gms.ads.internal.overlay.zzk)localObject1).zzeQ();
      return;
    }
    zzb.zzaE("Unknown video action: " + (String)localObject2);
  }
}
