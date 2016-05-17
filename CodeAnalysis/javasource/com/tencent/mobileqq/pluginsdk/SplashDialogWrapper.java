package com.tencent.mobileqq.pluginsdk;

import android.app.Dialog;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Handler;
import android.os.Message;

public final class SplashDialogWrapper
{
  private Dialog a;
  private Context b;
  private Handler c = new a(this);
  private BroadcastReceiver d = null;
  private int e;
  private String f;
  private String g;
  private boolean h;
  
  public SplashDialogWrapper(Context paramContext, Dialog paramDialog, String paramString1, String paramString2, boolean paramBoolean, int paramInt)
  {
    b = paramContext;
    a = paramDialog;
    g = paramString2;
    f = paramString1;
    h = paramBoolean;
    e = paramInt;
  }
  
  public void dismiss()
  {
    if (d != null) {}
    try
    {
      b.unregisterReceiver(d);
      if (DebugHelper.sDebug) {
        DebugHelper.log("plugin_tag", "SplashDialogWrapper.dismiss unregisterReceiver");
      }
      d = null;
      c.removeMessages(0);
    }
    catch (IllegalArgumentException localIllegalArgumentException)
    {
      for (;;)
      {
        try
        {
          a.dismiss();
          return;
        }
        catch (Exception localException) {}
        localIllegalArgumentException = localIllegalArgumentException;
        localIllegalArgumentException.printStackTrace();
      }
    }
  }
  
  public void show()
  {
    c.sendEmptyMessageDelayed(0, e);
    IntentFilter localIntentFilter = new IntentFilter();
    localIntentFilter.addAction("action_launch_completed");
    d = new b(f, g);
    if (DebugHelper.sDebug) {
      DebugHelper.log("plugin_tag", "SplashDialogWrapper.show registerReceiver");
    }
    try
    {
      b.registerReceiver(d, localIntentFilter);
      a.show();
      return;
    }
    catch (Exception localException) {}
  }
  
  public static class LaunchCompletedIntent
    extends Intent
  {
    public static final String ACTION_LAUNCH_COMPLETED = "action_launch_completed";
    public static final String PARAM_PLUGIN_APK = "plugin_apk";
    public static final String PARAM_PLUGIN_NAME = "plugin_name";
    
    public LaunchCompletedIntent() {}
  }
  
  private static class a
    extends Handler
  {
    public static final int a = 0;
    private SplashDialogWrapper b = null;
    
    public a(SplashDialogWrapper paramSplashDialogWrapper)
    {
      b = paramSplashDialogWrapper;
    }
    
    public void handleMessage(Message paramMessage)
    {
      switch (what)
      {
      default: 
        return;
      }
      b.dismiss();
    }
  }
  
  private class b
    extends BroadcastReceiver
  {
    private String b;
    private String c;
    
    public b(String paramString1, String paramString2)
    {
      b = paramString1;
      c = paramString2;
    }
    
    public void onReceive(Context paramContext, Intent paramIntent)
    {
      paramContext = paramIntent.getStringExtra("plugin_apk");
      paramIntent = paramIntent.getStringExtra("plugin_name");
      if (DebugHelper.sDebug) {
        DebugHelper.log("plugin_tag", "LaunchCompletedObserver.onReceive: " + paramContext + ", " + paramIntent + ", " + SplashDialogWrapper.a(SplashDialogWrapper.this));
      }
      if ((c.equalsIgnoreCase(paramContext)) && ((SplashDialogWrapper.a(SplashDialogWrapper.this)) || (paramIntent != null))) {
        dismiss();
      }
    }
  }
}
