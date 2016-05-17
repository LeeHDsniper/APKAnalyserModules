package com.tencent.mobileqq.msf.core.quicksend;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;

class e
  extends Handler
{
  e(d paramD, Looper paramLooper)
  {
    super(paramLooper);
  }
  
  public void handleMessage(Message paramMessage)
  {
    switch (what)
    {
    default: 
      return;
    }
    try
    {
      d.a(a);
      d.b(a).sendEmptyMessageDelayed(1000, 1800000L);
      return;
    }
    catch (Throwable paramMessage)
    {
      for (;;)
      {
        paramMessage.printStackTrace();
      }
    }
  }
}
