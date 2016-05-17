package com.tencent.mobileqq.pluginsdk;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.os.IBinder;
import mqq.app.AppService;

public abstract class PluginService
  extends AppService
  implements IPluginService
{
  private int a;
  private Context b;
  protected String mApkFilePath;
  protected ClassLoader mDexClassLoader;
  protected boolean mIsRunInPlugin;
  protected Service mOutService;
  protected PackageInfo mPackageInfo;
  protected String mPluginID;
  
  public PluginService() {}
  
  public void IInit(String paramString1, String paramString2, Service paramService, ClassLoader paramClassLoader, PackageInfo paramPackageInfo, int paramInt)
  {
    if (DebugHelper.sDebug) {
      DebugHelper.log("plugin_tag", "PluginService.IInit: " + paramString1 + ", " + a);
    }
    mIsRunInPlugin = true;
    mPluginID = paramString1;
    mApkFilePath = paramString2;
    mOutService = paramService;
    mDexClassLoader = paramClassLoader;
    mPackageInfo = paramPackageInfo;
    a = paramInt;
    if (b == null) {}
    try
    {
      b = new c(paramService, 0, mApkFilePath, mDexClassLoader, paramService.getResources(), a);
      attachBaseContext(b);
      return;
    }
    catch (Error paramString1)
    {
      for (;;) {}
    }
  }
  
  public IBinder IOnBind(Intent paramIntent)
  {
    IBinder localIBinder = onBind(paramIntent);
    if (DebugHelper.sDebug) {
      DebugHelper.log("plugin_tag", "PluginService.IOnBind: " + localIBinder + ", " + paramIntent);
    }
    return localIBinder;
  }
  
  public void IOnCreate()
  {
    onCreate();
  }
  
  public void IOnDestroy()
  {
    onDestroy();
  }
  
  public void IOnStart(Intent paramIntent, int paramInt)
  {
    onStart(paramIntent, paramInt);
  }
  
  public int IOnStartCommand(Intent paramIntent, int paramInt1, int paramInt2)
  {
    return onStartCommand(paramIntent, paramInt1, paramInt2);
  }
  
  public boolean IOnUnbind(Intent paramIntent)
  {
    return onUnbind(paramIntent);
  }
  
  public ApplicationInfo getApplicationInfo()
  {
    if (mIsRunInPlugin) {
      return mPackageInfo.applicationInfo;
    }
    return super.getApplicationInfo();
  }
  
  public PackageInfo getPackageInfo()
  {
    if (mIsRunInPlugin) {
      return mPackageInfo;
    }
    return null;
  }
  
  public String getPackageName()
  {
    if (mIsRunInPlugin) {
      return mPackageInfo.packageName;
    }
    return super.getPackageName();
  }
  
  public Object getSystemService(String paramString)
  {
    if (("window".equals(paramString)) || ("search".equals(paramString)))
    {
      if (mIsRunInPlugin) {
        return mOutService.getSystemService(paramString);
      }
      return super.getSystemService(paramString);
    }
    if (b != null) {
      return b.getSystemService(paramString);
    }
    return super.getSystemService(paramString);
  }
}
