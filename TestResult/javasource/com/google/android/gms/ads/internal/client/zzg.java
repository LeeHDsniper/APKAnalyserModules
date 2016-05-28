package com.google.android.gms.ads.internal.client;

import android.content.Context;
import android.location.Location;
import android.os.Bundle;
import com.google.ads.mediation.admob.AdMobAdapter;
import com.google.android.gms.ads.internal.reward.client.RewardedVideoAdRequestParcel;
import com.google.android.gms.ads.internal.zzp;
import com.google.android.gms.ads.search.SearchAdRequest;
import com.google.android.gms.internal.zzgk;
import com.google.android.gms.internal.zzhu;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Set;

@zzgk
public class zzg
{
  public static final zzg zzsF = new zzg();
  
  protected zzg() {}
  
  public static zzg zzcA()
  {
    return zzsF;
  }
  
  public AdRequestParcel zza(Context paramContext, zzx paramZzx)
  {
    Object localObject1 = paramZzx.getBirthday();
    long l;
    String str1;
    int i;
    label59:
    boolean bool1;
    int j;
    Location localLocation;
    Bundle localBundle;
    boolean bool2;
    String str2;
    if (localObject1 != null)
    {
      l = ((Date)localObject1).getTime();
      str1 = paramZzx.getContentUrl();
      i = paramZzx.getGender();
      localObject1 = paramZzx.getKeywords();
      if (((Set)localObject1).isEmpty()) {
        break label223;
      }
      localObject1 = Collections.unmodifiableList(new ArrayList((Collection)localObject1));
      bool1 = paramZzx.isTestDevice(paramContext);
      j = paramZzx.zzcP();
      localLocation = paramZzx.getLocation();
      localBundle = paramZzx.getNetworkExtrasBundle(AdMobAdapter.class);
      bool2 = paramZzx.getManualImpressionsEnabled();
      str2 = paramZzx.getPublisherProvidedId();
      localObject2 = paramZzx.zzcM();
      if (localObject2 == null) {
        break label229;
      }
    }
    label223:
    label229:
    for (Object localObject2 = new SearchAdRequestParcel((SearchAdRequest)localObject2);; localObject2 = null)
    {
      Object localObject3 = null;
      Context localContext = paramContext.getApplicationContext();
      paramContext = localObject3;
      if (localContext != null)
      {
        paramContext = localContext.getPackageName();
        paramContext = zzp.zzbx().zza(Thread.currentThread().getStackTrace(), paramContext);
      }
      return new AdRequestParcel(6, l, localBundle, i, (List)localObject1, bool1, j, bool2, str2, (SearchAdRequestParcel)localObject2, localLocation, str1, paramZzx.zzcO(), paramZzx.getCustomTargeting(), Collections.unmodifiableList(new ArrayList(paramZzx.zzcQ())), paramZzx.zzcL(), paramContext);
      l = -1L;
      break;
      localObject1 = null;
      break label59;
    }
  }
  
  public RewardedVideoAdRequestParcel zza(Context paramContext, zzx paramZzx, String paramString)
  {
    return new RewardedVideoAdRequestParcel(zza(paramContext, paramZzx), paramString);
  }
}
