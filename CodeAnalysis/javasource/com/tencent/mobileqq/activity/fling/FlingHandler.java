package com.tencent.mobileqq.activity.fling;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Configuration;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import java.lang.ref.WeakReference;

public abstract class FlingHandler
{
  public WeakReference a;
  
  public FlingHandler(Activity paramActivity)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    a = new WeakReference(paramActivity);
  }
  
  int a()
  {
    Activity localActivity = (Activity)a.get();
    if (localActivity != null) {
      return localActivity.getIntent().getIntExtra("fling_code_key", 0);
    }
    return 0;
  }
  
  protected abstract void a();
  
  protected abstract boolean a();
  
  protected abstract void b();
  
  boolean b()
  {
    return a() != 0;
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration) {}
  
  public void onStart()
  {
    a();
  }
  
  public void onStop()
  {
    b();
  }
}
