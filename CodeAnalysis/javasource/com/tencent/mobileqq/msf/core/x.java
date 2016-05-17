package com.tencent.mobileqq.msf.core;

import com.tencent.msf.boot.config.NativeConfigStore;

class x
  extends Thread
{
  x(w paramW) {}
  
  public void run()
  {
    try
    {
      Thread.sleep(180000L);
      MsfStore.getNativeConfigStore().removeConfig("LOGLEVEL_");
      MsfStore.getNativeConfigStore().removeConfig("LOGLEVELTIME");
      return;
    }
    catch (InterruptedException localInterruptedException)
    {
      for (;;)
      {
        localInterruptedException.printStackTrace();
      }
    }
  }
}
