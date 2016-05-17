package com.tencent.mobileqq.msf.sdk;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

final class b
  extends BroadcastReceiver
{
  b() {}
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    new c(this, "AppNetInfoReceiver", paramIntent).start();
  }
}
