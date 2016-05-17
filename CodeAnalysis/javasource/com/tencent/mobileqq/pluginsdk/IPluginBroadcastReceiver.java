package com.tencent.mobileqq.pluginsdk;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;

public abstract interface IPluginBroadcastReceiver
{
  public abstract void IInit(String paramString1, String paramString2, BroadcastReceiver paramBroadcastReceiver, ClassLoader paramClassLoader, PackageInfo paramPackageInfo, int paramInt);
  
  public abstract void IOnReceive(Context paramContext, Intent paramIntent);
}
