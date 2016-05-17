package com.tencent.mobileqq.pluginsdk;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;

public abstract class PluginBroadcastReceiver
  extends BroadcastReceiver
  implements IPluginBroadcastReceiver
{
  private int a;
  protected String mApkFilePath;
  protected ClassLoader mDexClassLoader;
  protected boolean mIsRunInPlugin;
  protected BroadcastReceiver mOutReceiver;
  protected PackageInfo mPackageInfo;
  
  public PluginBroadcastReceiver() {}
  
  public void IInit(String paramString1, String paramString2, BroadcastReceiver paramBroadcastReceiver, ClassLoader paramClassLoader, PackageInfo paramPackageInfo, int paramInt)
  {
    if (DebugHelper.sDebug) {
      DebugHelper.log("plugin_tag", "PluginBroadcastReceiver.Init:" + paramString1 + ", " + a);
    }
    mIsRunInPlugin = true;
    mApkFilePath = paramString2;
    mOutReceiver = paramBroadcastReceiver;
    mDexClassLoader = paramClassLoader;
    mPackageInfo = paramPackageInfo;
    a = paramInt;
  }
  
  public void IOnReceive(Context paramContext, Intent paramIntent)
  {
    if (DebugHelper.sDebug) {
      DebugHelper.log("plugin_tag", "PluginBroadcastReceiver.IOnReceive");
    }
    onReceive(new c(paramContext, 0, mApkFilePath, mDexClassLoader, paramContext.getResources(), a), paramIntent);
  }
}
