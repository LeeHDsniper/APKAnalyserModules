package com.tencent.mobileqq.msf.core.c;

import android.content.IntentFilter;
import com.tencent.qphone.base.util.BaseApplication;

class b
  extends Thread
{
  b(a paramA, String paramString)
  {
    super(paramString);
  }
  
  public void run()
  {
    a.a(a);
    BaseApplication.getContext().registerReceiver(a, new IntentFilter("android.intent.action.SCREEN_OFF"));
    BaseApplication.getContext().registerReceiver(a, new IntentFilter("android.intent.action.SCREEN_ON"));
    if (!a.b(a)) {
      a.c(a);
    }
  }
}
