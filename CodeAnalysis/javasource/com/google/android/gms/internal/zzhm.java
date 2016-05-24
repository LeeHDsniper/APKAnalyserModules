package com.google.android.gms.internal;

import android.content.ComponentName;
import android.content.Context;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.res.Resources;
import android.os.Bundle;
import com.google.android.gms.ads.internal.client.AdRequestParcel;
import com.google.android.gms.ads.internal.util.client.zzb;

@zzgk
public class zzhm
{
  final String zzGY;
  long zzHl = -1L;
  long zzHm = -1L;
  int zzHn = -1;
  int zzHo = 0;
  int zzHp = 0;
  private final Object zzpc = new Object();
  
  public zzhm(String paramString)
  {
    zzGY = paramString;
  }
  
  public static boolean zzG(Context paramContext)
  {
    int i = paramContext.getResources().getIdentifier("Theme.Translucent", "style", "android");
    if (i == 0)
    {
      zzb.zzaD("Please set theme of AdActivity to @android:style/Theme.Translucent to enable transparent background interstitial ad.");
      return false;
    }
    ComponentName localComponentName = new ComponentName(paramContext.getPackageName(), "com.google.android.gms.ads.AdActivity");
    try
    {
      if (i == getPackageManagergetActivityInfo0theme) {
        return true;
      }
      zzb.zzaD("Please set theme of AdActivity to @android:style/Theme.Translucent to enable transparent background interstitial ad.");
      return false;
    }
    catch (PackageManager.NameNotFoundException paramContext)
    {
      zzb.zzaE("Fail to fetch AdActivity theme");
      zzb.zzaD("Please set theme of AdActivity to @android:style/Theme.Translucent to enable transparent background interstitial ad.");
    }
    return false;
  }
  
  public void zzb(AdRequestParcel paramAdRequestParcel, long paramLong)
  {
    synchronized (zzpc)
    {
      if (zzHm == -1L)
      {
        zzHm = paramLong;
        zzHl = zzHm;
        if ((extras == null) || (extras.getInt("gw", 2) != 1)) {}
      }
      else
      {
        zzHl = paramLong;
      }
    }
    zzHn += 1;
  }
  
  public Bundle zze(Context paramContext, String paramString)
  {
    synchronized (zzpc)
    {
      Bundle localBundle = new Bundle();
      localBundle.putString("session_id", zzGY);
      localBundle.putLong("basets", zzHm);
      localBundle.putLong("currts", zzHl);
      localBundle.putString("seq_num", paramString);
      localBundle.putInt("preqs", zzHn);
      localBundle.putInt("pclick", zzHo);
      localBundle.putInt("pimp", zzHp);
      localBundle.putBoolean("support_transparent_background", zzG(paramContext));
      return localBundle;
    }
  }
  
  public void zzfT()
  {
    synchronized (zzpc)
    {
      zzHp += 1;
      return;
    }
  }
  
  public void zzfU()
  {
    synchronized (zzpc)
    {
      zzHo += 1;
      return;
    }
  }
  
  public long zzgl()
  {
    return zzHm;
  }
}
