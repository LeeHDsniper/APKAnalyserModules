package com.google.android.gms.internal;

import android.app.Activity;
import android.app.Application.ActivityLifecycleCallbacks;
import android.os.Bundle;
import android.util.Log;
import com.google.android.gms.common.internal.zzx;
import java.util.HashMap;
import java.util.Map;

public final class zzot
  implements Application.ActivityLifecycleCallbacks
{
  private final zzoj zzaIR;
  private final Map<Activity, zzoq> zzaIS;
  
  public zzot(zzoj paramZzoj)
  {
    zzx.zzv(paramZzoj);
    zzaIR = paramZzoj;
    zzaIS = new HashMap();
  }
  
  public void onActivityCreated(Activity paramActivity, Bundle paramBundle)
  {
    if (paramBundle == null) {}
    do
    {
      return;
      paramBundle = paramBundle.getBundle("com.google.android.gms.measurement.screen_view");
    } while (paramBundle == null);
    int i = paramBundle.getInt("id");
    if (i <= 0)
    {
      Log.w("com.google.android.gms.measurement.internal.ActivityLifecycleTracker", "Invalid screenId in saved activity state");
      return;
    }
    paramActivity = zza(paramActivity, i);
    paramActivity.setScreenName(paramBundle.getString("name"));
    paramActivity.zzhT(paramBundle.getInt("referrer_id"));
    paramActivity.zzdU(paramBundle.getString("referrer_name"));
    paramActivity.zzam(paramBundle.getBoolean("interstitial"));
    paramActivity.zzxX();
  }
  
  public void onActivityDestroyed(Activity paramActivity)
  {
    zzaIS.remove(paramActivity);
  }
  
  public void onActivityPaused(Activity paramActivity) {}
  
  public void onActivityResumed(Activity paramActivity) {}
  
  public void onActivitySaveInstanceState(Activity paramActivity, Bundle paramBundle)
  {
    if (paramBundle == null) {}
    do
    {
      return;
      paramActivity = (zzoq)zzaIS.get(paramActivity);
    } while (paramActivity == null);
    Bundle localBundle = new Bundle();
    localBundle.putInt("id", paramActivity.zzbp());
    localBundle.putString("name", paramActivity.zzxT());
    localBundle.putInt("referrer_id", paramActivity.zzxU());
    localBundle.putString("referrer_name", paramActivity.zzxV());
    localBundle.putBoolean("interstitial", paramActivity.zzxY());
    paramBundle.putBundle("com.google.android.gms.measurement.screen_view", localBundle);
  }
  
  public void onActivityStarted(Activity paramActivity)
  {
    zzoq localZzoq = zza(paramActivity, 0);
    zzaIR.zzb(localZzoq, paramActivity);
  }
  
  public void onActivityStopped(Activity paramActivity) {}
  
  zzoq zza(Activity paramActivity, int paramInt)
  {
    zzx.zzv(paramActivity);
    zzoq localZzoq2 = (zzoq)zzaIS.get(paramActivity);
    zzoq localZzoq1 = localZzoq2;
    if (localZzoq2 == null) {
      if (paramInt != 0) {
        break label66;
      }
    }
    label66:
    for (localZzoq1 = new zzoq(true);; localZzoq1 = new zzoq(true, paramInt))
    {
      localZzoq1.setScreenName(paramActivity.getClass().getCanonicalName());
      zzaIS.put(paramActivity, localZzoq1);
      return localZzoq1;
    }
  }
}
