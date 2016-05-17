package com.tencent.mobileqq.pluginsdk;

import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.PackageInfo;
import android.os.IBinder;
import android.text.TextUtils;
import java.io.File;
import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;

public class PluginProxyService
  extends Service
{
  private IPluginService a;
  private int b;
  private String c;
  private String d;
  private String e;
  private String f;
  
  public PluginProxyService() {}
  
  private String a()
    throws Exception
  {
    PluginRecoverReceiver.a(d);
    Object localObject = (PackageInfo)PluginStatic.d.get(e);
    if (localObject == null)
    {
      try
      {
        PackageInfo localPackageInfo = ApkFileParser.getPackageInfo(this, e, 129);
        localObject = localPackageInfo;
      }
      catch (Throwable localThrowable2)
      {
        for (;;) {}
        PluginStatic.d.put(e, localObject);
      }
      if (localObject == null) {
        return "Get Package Info Failed!";
      }
    }
    for (;;)
    {
      ClassLoader localClassLoader = PluginStatic.a(this, d, e);
      Class localClass = localClassLoader.loadClass(f);
      try
      {
        a = ((IPluginService)localClass.newInstance());
        a.IInit(d, e, this, localClassLoader, (PackageInfo)localObject, b);
        return null;
      }
      catch (Throwable localThrowable1)
      {
        return "new PluginService failed!";
      }
    }
  }
  
  public static void bindService(Context paramContext, String paramString1, String paramString2, String paramString3, String paramString4, Intent paramIntent, ServiceConnection paramServiceConnection)
  {
    paramIntent.putExtra("pluginsdk_pluginName", paramString1);
    paramIntent.putExtra("pluginsdk_pluginLocation", paramString2);
    paramIntent.putExtra("pluginsdk_launchService", paramString4);
    paramIntent.putExtra("pluginsdk_pluginpath", paramString3);
    try
    {
      paramContext.bindService(paramIntent, paramServiceConnection, 1);
      return;
    }
    catch (Throwable paramContext) {}
  }
  
  public static void openService(Context paramContext, String paramString1, String paramString2, String paramString3, String paramString4, Intent paramIntent)
  {
    paramIntent.putExtra("pluginsdk_pluginName", paramString1);
    paramIntent.putExtra("pluginsdk_pluginLocation", paramString2);
    paramIntent.putExtra("pluginsdk_launchService", paramString4);
    paramIntent.putExtra("pluginsdk_pluginpath", paramString3);
    try
    {
      paramContext.startService(paramIntent);
      return;
    }
    catch (Throwable paramContext) {}
  }
  
  public IBinder onBind(Intent paramIntent)
  {
    IBinder localIBinder = null;
    if (DebugHelper.sDebug) {
      DebugHelper.log("plugin_tag", "PluginProxyService.onBind PluginService:" + a);
    }
    if (a == null) {
      startPluginIfNeccessary(paramIntent);
    }
    if (a != null) {
      localIBinder = a.IOnBind(paramIntent);
    }
    if (DebugHelper.sDebug) {
      DebugHelper.log("plugin_tag", "PluginProxyService.onBind IBinder:" + localIBinder);
    }
    return localIBinder;
  }
  
  public void onCreate()
  {
    super.onCreate();
    a.a();
    if (DebugHelper.sDebug) {
      DebugHelper.log("plugin_tag", "PluginProxyService.onCreate");
    }
  }
  
  public void onDestroy()
  {
    super.onDestroy();
    if (DebugHelper.sDebug) {
      DebugHelper.log("plugin_tag", "PluginProxyService.onDestroy");
    }
    if (a != null)
    {
      a.IOnDestroy();
      a = null;
    }
  }
  
  public void onStart(Intent paramIntent, int paramInt)
  {
    super.onStart(paramIntent, paramInt);
    if (DebugHelper.sDebug) {
      DebugHelper.log("plugin_tag", "PluginProxyService.onStart Intent:" + paramIntent);
    }
    if ((startPluginIfNeccessary(paramIntent)) && (a != null)) {
      a.IOnStart(paramIntent, paramInt);
    }
  }
  
  public int onStartCommand(Intent paramIntent, int paramInt1, int paramInt2)
  {
    super.onStartCommand(paramIntent, paramInt1, paramInt2);
    if (DebugHelper.sDebug) {
      DebugHelper.log("plugin_tag", "PluginProxyService.onStartCommand Intent:" + paramIntent);
    }
    if ((startPluginIfNeccessary(paramIntent)) && (a != null)) {
      a.IOnStartCommand(paramIntent, paramInt1, paramInt2);
    }
    return 3;
  }
  
  public boolean onUnbind(Intent paramIntent)
  {
    boolean bool = super.onUnbind(paramIntent);
    if (DebugHelper.sDebug) {
      DebugHelper.log("plugin_tag", "PluginProxyService.onUnbind Intent:" + paramIntent);
    }
    if (a != null) {
      bool = a.IOnUnbind(paramIntent);
    }
    return bool;
  }
  
  protected boolean startPluginIfNeccessary(Intent paramIntent)
  {
    if (DebugHelper.sDebug) {
      DebugHelper.log("plugin_tag", "PluginProxyService.startPluginIfNeccessary Intent:" + paramIntent);
    }
    if ((paramIntent == null) || (!PluginStatic.a(paramIntent.getExtras()))) {
      return false;
    }
    String str3 = paramIntent.getStringExtra("pluginsdk_pluginName");
    String str4 = paramIntent.getStringExtra("pluginsdk_pluginLocation");
    String str5 = paramIntent.getStringExtra("pluginsdk_launchService");
    b = paramIntent.getIntExtra("userQqResources", 0);
    String str2 = paramIntent.getStringExtra("pluginsdk_pluginpath");
    Object localObject = str2;
    if (TextUtils.isEmpty(str2)) {
      localObject = PluginUtils.getInstalledPluginPath(this, str4);
    }
    try
    {
      localObject = ((File)localObject).getCanonicalPath();
      if (DebugHelper.sDebug) {
        DebugHelper.log("plugin_tag", "PluginProxyService.startPluginIfNeccessary Params:" + str4 + ", " + str5);
      }
      if (a != null)
      {
        if ((d.equals(str4)) && (c.equals(str3)) && (f.equals(str5)))
        {
          if (DebugHelper.sDebug) {
            DebugHelper.log("plugin_tag", "PluginProxyService.startPluginIfNeccessary: already init the same service");
          }
          return true;
        }
        if (DebugHelper.sDebug) {
          DebugHelper.log("plugin_tag", "PluginProxyService.startPluginIfNeccessary: error arguments");
        }
        return false;
      }
      d = str4;
      e = ((String)localObject);
      c = str3;
      f = str5;
      localObject = PluginStatic.b(d);
      if (localObject != null) {
        paramIntent.setExtrasClassLoader((ClassLoader)localObject);
      }
      if ((d == null) || (d.length() == 0)) {
        paramIntent = "Param mPluingLocation missing!";
      }
      for (;;)
      {
        if (DebugHelper.sDebug) {
          DebugHelper.log("plugin_tag", "PluginProxyService.startPluginIfNeccessary ErrorInfo: " + paramIntent);
        }
        return true;
        paramIntent = new File(e);
        if ((!paramIntent.exists()) && (!paramIntent.isFile())) {
          paramIntent = "Plugin File Not Found!";
        } else {
          try
          {
            localObject = a();
            paramIntent = (Intent)localObject;
            if (localObject == null)
            {
              a.IOnCreate();
              paramIntent = (Intent)localObject;
            }
          }
          catch (Exception paramIntent)
          {
            paramIntent.printStackTrace();
            paramIntent = PluginUtils.getExceptionInfo(paramIntent);
            stopSelf();
          }
        }
      }
    }
    catch (IOException localIOException)
    {
      for (;;)
      {
        String str1 = str2;
      }
    }
  }
}
