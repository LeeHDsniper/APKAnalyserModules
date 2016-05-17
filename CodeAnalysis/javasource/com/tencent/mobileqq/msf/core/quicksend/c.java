package com.tencent.mobileqq.msf.core.quicksend;

import android.os.Handler;
import android.os.Message;
import com.tencent.qphone.base.remote.ToServiceMsg;
import java.util.concurrent.ConcurrentHashMap;

class c
  extends Handler
{
  c(b paramB) {}
  
  public void handleMessage(Message paramMessage)
  {
    switch (what)
    {
    default: 
      return;
    }
    int i = arg1;
    b.a(a, (ToServiceMsg)b.a(a).get(Integer.valueOf(i)));
  }
}
