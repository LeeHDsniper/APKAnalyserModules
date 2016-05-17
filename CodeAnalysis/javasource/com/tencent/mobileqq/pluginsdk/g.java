package com.tencent.mobileqq.pluginsdk;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

class g
  extends BroadcastReceiver
{
  g(PluginProxyActivity paramPluginProxyActivity) {}
  
  public void onReceive(Context paramContext, Intent paramIntent)
  {
    if ((PluginProxyActivity.mGestureLockEnable) && (a.mStopFlag == 0) && (a.getGestureLock(a, PluginProxyActivity.a()))) {
      a.startUnlockActivity();
    }
  }
}
