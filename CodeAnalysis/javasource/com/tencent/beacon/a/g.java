package com.tencent.beacon.a;

import android.annotation.TargetApi;
import android.app.Activity;
import android.app.Application.ActivityLifecycleCallbacks;
import android.os.Bundle;
import android.util.SparseArray;
import java.lang.ref.WeakReference;

@TargetApi(14)
public final class g
  implements Application.ActivityLifecycleCallbacks
{
  private static SparseArray<WeakReference<Activity>> a = new SparseArray();
  
  public g() {}
  
  private static void a(Activity paramActivity)
  {
    if ((paramActivity != null) && (a != null))
    {
      int i = paramActivity.hashCode();
      if (a.get(i) == null)
      {
        paramActivity = new WeakReference(paramActivity);
        a.put(i, paramActivity);
      }
    }
  }
  
  public final void onActivityCreated(Activity paramActivity, Bundle paramBundle)
  {
    a(paramActivity);
  }
  
  public final void onActivityDestroyed(Activity paramActivity)
  {
    b.a = true;
    a(paramActivity);
  }
  
  public final void onActivityPaused(Activity paramActivity)
  {
    b.a = true;
    a(paramActivity);
  }
  
  public final void onActivityResumed(Activity paramActivity)
  {
    b.a = true;
    a(paramActivity);
  }
  
  public final void onActivitySaveInstanceState(Activity paramActivity, Bundle paramBundle)
  {
    b.a = true;
    a(paramActivity);
  }
  
  public final void onActivityStarted(Activity paramActivity)
  {
    b.a = true;
    a(paramActivity);
  }
  
  public final void onActivityStopped(Activity paramActivity)
  {
    b.a = true;
    a(paramActivity);
  }
}
