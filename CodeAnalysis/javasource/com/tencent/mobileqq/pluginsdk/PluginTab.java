package com.tencent.mobileqq.pluginsdk;

import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.view.View;
import android.widget.TabHost.OnTabChangeListener;
import android.widget.TabHost.TabContentFactory;
import android.widget.TabHost.TabSpec;
import com.tencent.qphone.base.util.QLog;

public class PluginTab
  extends PluginActivity
  implements TabHost.OnTabChangeListener, TabHost.TabContentFactory
{
  private PluginTabHost d;
  private String e;
  private TabHost.OnTabChangeListener f;
  
  public PluginTab() {}
  
  protected final void addTabSpec(TabHost.TabSpec paramTabSpec, String paramString, Intent paramIntent)
  {
    if (d == null) {
      return;
    }
    if (DebugHelper.sDebug) {
      DebugHelper.log("plugin_tag", "PluginTab addTabSpec:" + paramTabSpec.getTag() + ", " + paramString);
    }
    paramTabSpec.setContent(this);
    d.a(paramTabSpec.getTag(), paramString, paramIntent);
    d.addTab(paramTabSpec);
  }
  
  public View createTabContent(String paramString)
  {
    if (DebugHelper.sDebug) {
      DebugHelper.log("plugin_tag", "PluginTab createTabContent:" + paramString);
    }
    PluginTabHost.TabSpecPluginInfo localTabSpecPluginInfo = d.getPluginInfo(paramString);
    if (localTabSpecPluginInfo != null)
    {
      try
      {
        paramString = getBaseContext().getClassLoader();
        IPluginActivity localIPluginActivity = (IPluginActivity)paramString.loadClass(mActivityName).newInstance();
        if (DebugHelper.sDebug) {
          DebugHelper.log("plugin_tag", "PluginTab Activity:" + localIPluginActivity);
        }
        localIPluginActivity.IInit(mPluginID, mApkFilePath, this, paramString, mPackageInfo, mUseSkinEngine, mPluginResourcesType);
        localIPluginActivity.ISetIsTab();
        localIPluginActivity.ISetParent(this);
        localIPluginActivity.ISetIntent(mIntent);
        localIPluginActivity.IOnSetTheme();
        localIPluginActivity.IOnCreate(null);
        paramString = localIPluginActivity.IGetContentView();
        localException1.printStackTrace();
      }
      catch (Exception localException1)
      {
        try
        {
          mActivity = localIPluginActivity;
          return paramString;
        }
        catch (Exception localException2)
        {
          for (;;) {}
        }
        localException1 = localException1;
        paramString = null;
      }
      QLog.e("plugin_tag", 1, mPluginID + " createTabContent fail", localException1);
      PluginRuntime.handleCrash(localException1, mPluginID, this);
      return paramString;
    }
    return null;
  }
  
  protected IPluginActivity getActivityByTag(String paramString)
  {
    Object localObject2 = null;
    Object localObject1 = localObject2;
    if (paramString != null)
    {
      localObject1 = localObject2;
      if (d != null)
      {
        paramString = d.getPluginInfo(paramString);
        localObject1 = localObject2;
        if (paramString != null) {
          localObject1 = mActivity;
        }
      }
    }
    return localObject1;
  }
  
  protected IPluginActivity getCurrentActivity()
  {
    if (d == null) {
      return null;
    }
    return getActivityByTag(d.getCurrentTabTag());
  }
  
  public PluginTabHost getTabHost()
  {
    return d;
  }
  
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
    IPluginActivity localIPluginActivity = getCurrentActivity();
    if (localIPluginActivity != null) {
      localIPluginActivity.IOnActivityResult(paramInt1, paramInt2, paramIntent);
    }
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    super.onConfigurationChanged(paramConfiguration);
    int j = d.getTabCount();
    int i = 0;
    while (i < j)
    {
      paramConfiguration = d.getTabAt(i);
      if (paramConfiguration != null)
      {
        paramConfiguration = d.getPluginInfo(paramConfiguration.getTag());
        if ((paramConfiguration == null) || (mActivity == null)) {}
      }
      i += 1;
    }
  }
  
  protected void onDestroy()
  {
    super.onDestroy();
    if (d == null) {}
    for (;;)
    {
      return;
      int j = d.getTabCount();
      int i = 0;
      while (i < j)
      {
        Object localObject = d.getTabAt(i);
        if (localObject != null)
        {
          localObject = d.getPluginInfo(((TabHost.TabSpec)localObject).getTag());
          if ((localObject != null) && (mActivity != null)) {
            mActivity.IOnDestroy();
          }
        }
        i += 1;
      }
    }
  }
  
  protected void onPause()
  {
    super.onPause();
    IPluginActivity localIPluginActivity = getCurrentActivity();
    if (localIPluginActivity != null) {
      localIPluginActivity.IOnPause();
    }
  }
  
  protected void onRestart()
  {
    super.onRestart();
    IPluginActivity localIPluginActivity = getCurrentActivity();
    if (localIPluginActivity != null) {
      localIPluginActivity.IOnRestart();
    }
  }
  
  protected void onResume()
  {
    super.onResume();
    IPluginActivity localIPluginActivity = getCurrentActivity();
    if (localIPluginActivity != null) {
      localIPluginActivity.IOnResume();
    }
  }
  
  protected void onStart()
  {
    super.onStart();
    IPluginActivity localIPluginActivity = getCurrentActivity();
    if (localIPluginActivity != null) {
      localIPluginActivity.IOnStart();
    }
  }
  
  protected void onStop()
  {
    super.onStop();
    IPluginActivity localIPluginActivity = getCurrentActivity();
    if (localIPluginActivity != null) {
      localIPluginActivity.IOnStop();
    }
  }
  
  public void onTabChanged(String paramString)
  {
    if (DebugHelper.sDebug) {
      DebugHelper.log("plugin_tag", "PluginTab onTabChanged:" + paramString);
    }
    IPluginActivity localIPluginActivity = getActivityByTag(e);
    if (localIPluginActivity != null) {
      localIPluginActivity.IOnPause();
    }
    e = paramString;
    localIPluginActivity = getCurrentActivity();
    if (localIPluginActivity != null) {
      localIPluginActivity.IOnResume();
    }
    if (f != null) {
      f.onTabChanged(paramString);
    }
  }
  
  public void setOnTabChangedListener(TabHost.OnTabChangeListener paramOnTabChangeListener)
  {
    f = paramOnTabChangeListener;
  }
  
  protected final void setPluginTabHost(PluginTabHost paramPluginTabHost)
  {
    if (DebugHelper.sDebug) {
      DebugHelper.log("plugin_tag", "PluginTab setPluginTabHost:" + paramPluginTabHost);
    }
    d = paramPluginTabHost;
    d.setup();
    d.setOnTabChangedListener(this);
  }
}
