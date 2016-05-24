package com.google.android.gms.internal;

import android.app.Activity;
import android.app.Application;
import android.app.Application.ActivityLifecycleCallbacks;
import android.content.Context;
import android.os.Bundle;

@zzgk
public class zzbj
  implements Application.ActivityLifecycleCallbacks
{
  private Activity mActivity;
  private Context mContext;
  private final Object zzpc = new Object();
  
  public zzbj(Application paramApplication, Activity paramActivity)
  {
    paramApplication.registerActivityLifecycleCallbacks(this);
    setActivity(paramActivity);
    mContext = paramApplication.getApplicationContext();
  }
  
  private void setActivity(Activity paramActivity)
  {
    synchronized (zzpc)
    {
      if (!paramActivity.getClass().getName().startsWith("com.google.android.gms.ads")) {
        mActivity = paramActivity;
      }
      return;
    }
  }
  
  public Activity getActivity()
  {
    return mActivity;
  }
  
  public Context getContext()
  {
    return mContext;
  }
  
  public void onActivityCreated(Activity paramActivity, Bundle paramBundle) {}
  
  public void onActivityDestroyed(Activity paramActivity)
  {
    synchronized (zzpc)
    {
      if (mActivity == null) {
        return;
      }
      if (mActivity.equals(paramActivity)) {
        mActivity = null;
      }
      return;
    }
  }
  
  public void onActivityPaused(Activity paramActivity)
  {
    setActivity(paramActivity);
  }
  
  public void onActivityResumed(Activity paramActivity)
  {
    setActivity(paramActivity);
  }
  
  public void onActivitySaveInstanceState(Activity paramActivity, Bundle paramBundle) {}
  
  public void onActivityStarted(Activity paramActivity)
  {
    setActivity(paramActivity);
  }
  
  public void onActivityStopped(Activity paramActivity) {}
}
