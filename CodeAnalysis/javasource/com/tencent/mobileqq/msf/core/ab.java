package com.tencent.mobileqq.msf.core;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;

final class ab
  extends Handler
{
  ab(Looper paramLooper)
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
      aa.a();
      aa.b().sendEmptyMessageDelayed(1000, 3600000L);
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
