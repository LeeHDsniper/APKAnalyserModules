package com.google.android.gms.analytics.internal;

import android.util.Log;
import com.google.android.gms.analytics.Logger;

class zzs
  implements Logger
{
  private boolean zzKz;
  private int zzMQ = 2;
  
  zzs() {}
  
  public void error(String paramString) {}
  
  public int getLogLevel()
  {
    return zzMQ;
  }
  
  public void setLogLevel(int paramInt)
  {
    zzMQ = paramInt;
    if (!zzKz)
    {
      Log.i((String)zzy.zzNa.get(), "Logger is deprecated. To enable debug logging, please run:\nadb shell setprop log.tag." + (String)zzy.zzNa.get() + " DEBUG");
      zzKz = true;
    }
  }
  
  public void warn(String paramString) {}
}
