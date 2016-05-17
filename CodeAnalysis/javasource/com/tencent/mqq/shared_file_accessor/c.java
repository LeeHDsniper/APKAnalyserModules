package com.tencent.mqq.shared_file_accessor;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

final class c
  extends Handler
{
  public c(a paramA, Looper paramLooper)
  {
    super(paramLooper);
  }
  
  public final void handleMessage(Message paramMessage)
  {
    switch (what)
    {
    default: 
      return;
    }
    paramMessage = LogUtil.timeLogBegin();
    List localList;
    if (a.b) {
      synchronized (a)
      {
        localList = a.a(a);
        a.a(a, a.b(a));
        a.a(a, a.c(a));
        a.b(a, false);
        a.a = true;
        a.a(a, new ArrayList());
        a.b(a, new HashMap());
      }
    }
    try
    {
      a.a(localList);
      for (;;)
      {
        synchronized (a)
        {
          a.a(a, false);
          a.a = false;
          a.d(a).clear();
          a.a(a, null);
          a.notifyAll();
          LogUtil.timeLogEnd(SharedPreferencesProxyManager.getInstance().a(), null, a.c, null, null, "save-file", d.c, true, paramMessage);
          LogUtil.timeLogEnd("save file " + a.c, paramMessage);
          return;
          paramMessage = finally;
          throw paramMessage;
        }
        try
        {
          a.a(null);
        }
        catch (Throwable localThrowable1) {}
      }
    }
    catch (Throwable localThrowable2)
    {
      for (;;) {}
    }
  }
}
