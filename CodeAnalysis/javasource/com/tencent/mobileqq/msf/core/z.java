package com.tencent.mobileqq.msf.core;

import android.os.Handler;
import android.os.Message;

class z
  extends Handler
{
  z(y paramY) {}
  
  public void handleMessage(Message paramMessage)
  {
    switch (what)
    {
    default: 
      return;
    }
    paramMessage = (String)obj;
    a.s.refreshWebviewTickets(paramMessage, "SidExpiredPush");
  }
}
