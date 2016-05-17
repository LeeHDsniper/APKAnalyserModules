package com.tencent.mobileqq.app.automator;

import android.util.Log;
import com.tencent.mobileqq.app.MessageHandler;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.app.asyncdb.CacheManager;
import com.tencent.mobileqq.app.proxy.ProxyManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;

public class InitBeforeSyncMsg
  extends AsyncStep
{
  public InitBeforeSyncMsg()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  protected int a()
  {
    long l1 = System.currentTimeMillis();
    MessageHandler localMessageHandler;
    if (h == 14)
    {
      a.b.a(a.b.a());
      a.b.getManager(59);
      a.b.a().b();
      a.b.a().a();
      localMessageHandler = a.b.a();
      if (h != 15) {
        break label199;
      }
    }
    label199:
    for (int i = 2;; i = 1)
    {
      localMessageHandler.a(i);
      if (h != 15)
      {
        a.b.a().a();
        a.b.a().b = false;
      }
      long l2 = System.currentTimeMillis();
      Log.i("AutoMonitor", "STEP_DOSOMETHING, cost=" + (l2 - l1));
      return 7;
      if (h != 15) {
        break;
      }
      a.b.a().e();
      break;
    }
  }
}
