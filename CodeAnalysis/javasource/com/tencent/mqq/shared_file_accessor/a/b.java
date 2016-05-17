package com.tencent.mqq.shared_file_accessor.a;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import java.io.FileWriter;
import java.io.IOException;

final class b
  extends Handler
{
  public b(a paramA, Looper paramLooper)
  {
    super(paramLooper);
  }
  
  public final void handleMessage(Message arg1)
  {
    switch (what)
    {
    default: 
    case 0: 
      do
      {
        return;
        ??? = (String)obj;
      } while (a.b(a) == null);
      try
      {
        a.b(a).write(???);
        a.b(a).flush();
        return;
      }
      catch (IOException ???)
      {
        ???.printStackTrace();
        return;
      }
    }
    synchronized (a)
    {
      sendMessage(Message.obtain(this, 0, a.a(a).toString()));
      a.a(a).setLength(0);
      return;
    }
  }
}
