package com.tencent.mobileqq.pluginsdk;

import android.app.Activity;
import android.app.AlertDialog.Builder;
import android.app.Dialog;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.ActivityInfo;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageInfo;
import android.content.res.Configuration;
import android.content.res.Resources.NotFoundException;
import android.os.Bundle;
import android.os.Environment;
import android.os.StatFs;
import android.text.TextUtils;
import android.view.KeyEvent;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.Window;
import android.widget.Toast;
import com.tencent.mobileqq.activity.fling.FlingGestureHandler;
import com.tencent.mobileqq.activity.fling.FlingHandler;
import com.tencent.mobileqq.activity.fling.FlingTrackerHandler;
import com.tencent.mobileqq.activity.fling.ScreenCapture;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.io.FileNotFoundException;
import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import mqq.app.MobileQQ;

public abstract class PluginProxyActivity
  extends Activity
{
  public static final String ACTION_PLUGIN_DIR_INFO_LOG = "com.tencent.mobileqq.ACTION_PLUGIN_DIR_INFO_LOG";
  public static final String ACTION_PLUGIN_STARTUP_FAILED = "com.tencent.mobileqq.ACTION_PLUGIN_STARTUP_FAILED";
  public static final String READER_ID = "qqreaderplugin.apk";
  private static final String b = "PluginProxyActivity";
  private static final String c = "pluginsdk_inner_intent_extras";
  private static final String d = "pluginsdk_inner_bundle";
  public static boolean mAppForground = true;
  public static boolean mGestureLockEnable = false;
  private static String o = "";
  private static Method r = null;
  private static Field s = null;
  Object a;
  private Class e = null;
  private IPluginActivity f = null;
  private boolean g = false;
  private int h;
  private String i = null;
  private String j = null;
  private String k = null;
  private String l = null;
  private String m = null;
  public boolean mActNeedImmersive = true;
  protected String mCreateErrorInfo = null;
  protected FlingHandler mFlingHandler;
  protected boolean mIsShowQQBackgroundIcon = true;
  protected boolean mNeedStatusTrans = true;
  protected int mStatusColor = 0;
  protected int mStopFlag = 0;
  private boolean n = false;
  private boolean p = true;
  private BroadcastReceiver q = new g(this);
  
  public PluginProxyActivity() {}
  
  private void a(Activity paramActivity, String paramString, Intent paramIntent, int paramInt)
  {
    Intent localIntent = new Intent(paramActivity, getProxyActivity(paramString));
    localIntent.putExtra("pluginsdk_pluginName", j);
    localIntent.putExtra("pluginsdk_pluginLocation", k);
    localIntent.putExtra("pluginsdk_pluginpath", i);
    localIntent.putExtra("pluginsdk_launchActivity", paramString);
    localIntent.putExtra("useSkinEngine", g);
    if ((h == 1) || (h == -1) || (h == 2)) {
      localIntent.putExtra("userQqResources", h);
    }
    if (paramIntent != null)
    {
      localIntent.addFlags(paramIntent.getFlags());
      localIntent.putExtra("pluginsdk_inner_intent_extras", new Bundle(paramIntent.getExtras()));
    }
    paramActivity.startActivityForResult(localIntent, paramInt);
  }
  
  private void a(Context paramContext, String paramString)
  {
    if (TextUtils.isEmpty(paramString)) {
      return;
    }
    try
    {
      paramContext = Class.forName("com.tencent.mobileqq.gesturelock.GesturePWDUtils");
      paramContext.getMethod("setUinForPlugin", new Class[] { Context.class, String.class }).invoke(paramContext, new Object[] { this, paramString });
      return;
    }
    catch (Exception paramContext)
    {
      paramContext.printStackTrace();
    }
  }
  
  private void a(Context paramContext, String paramString, int paramInt)
  {
    try
    {
      Toast.makeText(paramContext, paramString, paramInt).show();
      return;
    }
    catch (Throwable paramContext) {}
  }
  
  private void a(Context paramContext, boolean paramBoolean)
  {
    try
    {
      paramContext = Class.forName("com.tencent.mobileqq.gesturelock.GesturePWDUtils");
      paramContext.getMethod("setAppForground", new Class[] { Context.class, Boolean.TYPE }).invoke(paramContext, new Object[] { this, Boolean.valueOf(paramBoolean) });
      return;
    }
    catch (Exception paramContext)
    {
      paramContext.printStackTrace();
    }
  }
  
  private static void a(Bundle paramBundle, ClassLoader paramClassLoader)
    throws Exception
  {
    if (paramBundle == null) {}
    for (;;)
    {
      return;
      paramBundle.setClassLoader(paramClassLoader);
      Object localObject;
      if ((r == null) || (s == null))
      {
        localObject = paramBundle.getClass();
        r = ((Class)localObject).getDeclaredMethod("unparcel", new Class[0]);
        r.setAccessible(true);
        s = ((Class)localObject).getDeclaredField("mMap");
        s.setAccessible(true);
      }
      r.invoke(paramBundle, new Object[0]);
      paramBundle = (Map)s.get(paramBundle);
      if (paramBundle != null)
      {
        paramBundle = paramBundle.values().iterator();
        while (paramBundle.hasNext())
        {
          localObject = paramBundle.next();
          if ((localObject instanceof Bundle)) {
            a((Bundle)localObject, paramClassLoader);
          }
        }
      }
    }
  }
  
  private void a(String paramString1, String paramString2, String paramString3, String paramString4)
  {
    Object localObject = getIntent();
    String str = ((Intent)localObject).getStringExtra("clsUploader");
    localObject = ((Intent)localObject).getStringExtra("pluginsdk_selfuin");
    if (str != null)
    {
      Intent localIntent = new Intent("com.tencent.mobileqq.ACTION_PLUGIN_STARTUP_FAILED");
      localIntent.putExtra("pluginsdk_selfuin", (String)localObject);
      localIntent.putExtra("pluginsdk_pluginName", paramString1);
      localIntent.putExtra("pluginsdk_pluginLocation", paramString2);
      localIntent.putExtra("pluginsdk_pluginpath", i);
      localIntent.putExtra("pluginsdk_launchActivity", paramString3);
      localIntent.putExtra("pluginsdk_extraInfo", paramString4);
      localIntent.putExtra("clsUploader", str);
      sendBroadcast(localIntent);
    }
  }
  
  private boolean a(Context paramContext)
  {
    try
    {
      paramContext = Class.forName("com.tencent.mobileqq.gesturelock.GesturePWDUtils");
      paramContext = paramContext.getMethod("getAppForground", new Class[] { Context.class }).invoke(paramContext, new Object[] { this });
      if ((paramContext instanceof Boolean))
      {
        boolean bool = ((Boolean)paramContext).booleanValue();
        return bool;
      }
    }
    catch (Exception paramContext)
    {
      paramContext.printStackTrace();
    }
    return true;
  }
  
  private boolean a(Intent paramIntent)
  {
    String str = paramIntent.getAction();
    if ((!TextUtils.isEmpty(str)) && (str.equals("android.media.action.IMAGE_CAPTURE"))) {}
    do
    {
      do
      {
        do
        {
          return true;
        } while ((!TextUtils.isEmpty(str)) && (str.equals("android.intent.action.GET_CONTENT")));
        paramIntent = paramIntent.getComponent();
        if (paramIntent == null) {
          break;
        }
        str = paramIntent.getPackageName();
      } while ((!TextUtils.isEmpty(str)) && (str.equals("com.qzone")));
      paramIntent = paramIntent.getClassName();
    } while ((!TextUtils.isEmpty(paramIntent)) && (paramIntent.equals("com.tencent.mobileqq.activity.QQBrowserDelegationActivity")));
    return false;
  }
  
  private boolean a(Throwable paramThrowable)
  {
    boolean bool2 = false;
    if (((paramThrowable instanceof FileNotFoundException)) || ((paramThrowable.getMessage() != null) && (paramThrowable.getMessage().contains("permission"))))
    {
      QLog.d("plugin_tag", 1, "" + i);
      paramThrowable = getApplicationInfo();
      if (paramThrowable != null) {
        if ((flags & 0x1) <= 0) {
          break label163;
        }
      }
      label163:
      for (boolean bool1 = true;; bool1 = false)
      {
        if ((flags & 0x80) > 0) {
          bool2 = true;
        }
        QLog.d("plugin_tag", 1, "UID: " + uid + ", IsSystemApp: " + bool1 + ", IsUpdateSystemApp: " + bool2);
        sendBroadcast(new Intent("com.tencent.mobileqq.ACTION_PLUGIN_DIR_INFO_LOG"));
        showNeedUninstanllAndInstallDialog();
        return true;
      }
    }
    if ((paramThrowable instanceof Resources.NotFoundException))
    {
      showNeedUninstanllAndInstallDialog();
      return true;
    }
    if (((paramThrowable instanceof ClassNotFoundException)) || ((paramThrowable instanceof PluginUtils.a)))
    {
      float f1 = getAvailableInnernalMemorySize();
      QLog.d("plugin_tag", 1, "" + i + ", leftSpace(B) = " + f1);
      PluginRecoverReceiver.a(this, k);
      return false;
    }
    return shouldHandleStartPluginFailed(mCreateErrorInfo);
  }
  
  private void b()
  {
    if (mCreateErrorInfo != null)
    {
      if ((mCreateErrorInfo.contains("空间")) || (mCreateErrorInfo.contains("Space"))) {
        a(BaseApplication.getContext(), "系统可用内存不足，" + j + "启动失败!", 0);
      }
    }
    else {
      return;
    }
    a(BaseApplication.getContext(), j + "启动失败!", 0);
  }
  
  private boolean b(Context paramContext)
  {
    try
    {
      paramContext = Class.forName("com.tencent.mobileqq.gesturelock.GesturePWDUtils");
      paramContext = paramContext.getMethod("enableGestureLock", new Class[] { Context.class }).invoke(paramContext, new Object[] { this });
      if ((paramContext instanceof Boolean))
      {
        boolean bool = ((Boolean)paramContext).booleanValue();
        return bool;
      }
    }
    catch (Exception paramContext)
    {
      paramContext.printStackTrace();
    }
    return false;
  }
  
  private String c(Context paramContext)
  {
    try
    {
      paramContext = Class.forName("com.tencent.mobileqq.gesturelock.GesturePWDUtils");
      paramContext = paramContext.getMethod("getUinForPlugin", new Class[] { Context.class }).invoke(paramContext, new Object[] { this });
      if ((paramContext instanceof String))
      {
        paramContext = (String)paramContext;
        return paramContext;
      }
    }
    catch (Exception paramContext)
    {
      paramContext.printStackTrace();
    }
    return "";
  }
  
  private void c()
    throws Exception
  {
    Object localObject1 = (PackageInfo)PluginStatic.d.get(i);
    if (localObject1 == null)
    {
      if (DebugHelper.sDebug) {
        DebugHelper.log("PluginProxyActivity.initPlugin start getPackageInfo");
      }
      localObject1 = ApkFileParser.getPackageInfo(this, i, 129);
      if (DebugHelper.sDebug) {
        DebugHelper.log("PluginProxyActivity.initPlugin end getPackageInfo");
      }
      if (localObject1 == null) {
        throw new PluginUtils.a("Get Package Info Failed!");
      }
      PluginStatic.d.put(i, localObject1);
    }
    for (;;)
    {
      if ((l == null) || (l.length() == 0))
      {
        if ((activities == null) || (activities.length == 0)) {
          throw new PluginUtils.b();
        }
        l = activities[0].name;
      }
      Object localObject2 = PluginStatic.a(this, k, i);
      getIntent().setExtrasClassLoader((ClassLoader)localObject2);
      if (DebugHelper.sDebug) {
        DebugHelper.log("PluginProxyActivity.initPlugin start loadClass");
      }
      e = ((ClassLoader)localObject2).loadClass(l);
      if (DebugHelper.sDebug) {
        DebugHelper.log("PluginProxyActivity.initPlugin start loadClass");
      }
      f = ((IPluginActivity)e.newInstance());
      f.IInit(k, i, this, (ClassLoader)localObject2, (PackageInfo)localObject1, g, h);
      localObject1 = new Intent(getIntent());
      localObject2 = ((Intent)localObject1).getBundleExtra("pluginsdk_inner_intent_extras");
      if (localObject2 != null)
      {
        ((Intent)localObject1).putExtras((Bundle)localObject2);
        ((Intent)localObject1).removeExtra("pluginsdk_inner_intent_extras");
      }
      f.ISetIntent((Intent)localObject1);
      return;
    }
  }
  
  private void d()
  {
    Intent localIntent = new Intent("action_launch_completed");
    localIntent.putExtra("plugin_apk", k);
    sendBroadcast(localIntent);
  }
  
  private boolean e()
  {
    try
    {
      Object localObject = Class.forName("com.tencent.mobileqq.gesturelock.GesturePWDUtils");
      localObject = ((Class)localObject).getMethod("isAppOnForeground", new Class[] { Context.class }).invoke(localObject, new Object[] { this });
      if ((localObject instanceof Boolean))
      {
        boolean bool = ((Boolean)localObject).booleanValue();
        return bool;
      }
    }
    catch (Exception localException)
    {
      return false;
    }
    return false;
  }
  
  public static float getAvailableInnernalMemorySize()
  {
    Object localObject = Environment.getDataDirectory().getPath();
    try
    {
      localObject = new StatFs((String)localObject);
      float f1 = ((StatFs)localObject).getAvailableBlocks();
      int i1 = ((StatFs)localObject).getBlockSize();
      return i1 * f1;
    }
    catch (Exception localException) {}
    return -1.0F;
  }
  
  public static boolean isMoveTaskToBack(Context paramContext, Intent paramIntent)
  {
    if (paramIntent.getComponent() == null) {}
    while (!paramIntent.getComponent().getPackageName().equals(paramContext.getPackageName())) {
      return true;
    }
    return false;
  }
  
  public static void openActivityForResult(Activity paramActivity, String paramString1, String paramString2, String paramString3, String paramString4, Intent paramIntent, int paramInt)
  {
    paramIntent.putExtra("pluginsdk_pluginName", paramString1);
    paramIntent.putExtra("pluginsdk_pluginLocation", paramString2);
    paramIntent.putExtra("pluginsdk_launchActivity", paramString4);
    paramIntent.putExtra("pluginsdk_pluginpath", paramString3);
    try
    {
      paramActivity.startActivityForResult(paramIntent, paramInt);
      return;
    }
    catch (Throwable paramActivity) {}
  }
  
  public boolean dispatchTouchEvent(MotionEvent paramMotionEvent)
  {
    if (f != null) {
      return f.IDispatchTouchEvent(paramMotionEvent);
    }
    return super.dispatchTouchEvent(paramMotionEvent);
  }
  
  public boolean getGestureLock(Context paramContext, String paramString)
  {
    try
    {
      paramContext = Class.forName("com.tencent.mobileqq.gesturelock.GesturePWDUtils");
      paramContext = paramContext.getMethod("getJumpLock", new Class[] { Context.class, String.class }).invoke(paramContext, new Object[] { this, o });
      if ((paramContext instanceof Boolean))
      {
        boolean bool = ((Boolean)paramContext).booleanValue();
        return bool;
      }
    }
    catch (Exception paramContext)
    {
      return false;
    }
    return false;
  }
  
  public int getIsSupportImmersive()
  {
    try
    {
      Object localObject = Class.forName("com.tencent.widget.immersive.ImmersiveUtils");
      localObject = ((Class)localObject).getMethod("isSupporImmersive", new Class[0]).invoke(localObject, new Object[0]);
      DebugHelper.log("getIsSupportImmersive ret=" + localObject);
      QLog.d("plugintest", 2, "getIsSupportImmersive ret=" + localObject);
      if ((localObject instanceof Integer))
      {
        int i1 = ((Integer)localObject).intValue();
        return i1;
      }
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      QLog.d("plugintest", 2, "getIsSupportImmersive e=" + localException);
    }
    return 0;
  }
  
  public final String getPluginActivity()
  {
    String str2 = l;
    String str1 = str2;
    if (TextUtils.isEmpty(str2))
    {
      Bundle localBundle = getIntent().getExtras();
      str1 = str2;
      if (localBundle != null) {
        str1 = localBundle.getString("pluginsdk_launchActivity");
      }
    }
    return str1;
  }
  
  public String getPluginID()
  {
    return null;
  }
  
  protected Class getProxyActivity(String paramString)
  {
    return getClass();
  }
  
  public void initImmersive()
  {
    if (a != null) {}
    while (!QLog.isColorLevel()) {
      try
      {
        Method localMethod = a.getClass().getMethod("init", new Class[0]);
        QLog.d("plugintest", 2, "getMethod");
        localMethod.setAccessible(true);
        localMethod.invoke(a, new Object[0]);
        return;
      }
      catch (Exception localException)
      {
        do
        {
          localException.printStackTrace();
        } while (!QLog.isColorLevel());
        QLog.d("plugintest", 2, "setImmersiveBar e" + localException);
        return;
      }
    }
    QLog.d("plugintest", 2, "initImmersive msystemBar=null");
  }
  
  protected boolean isWrapContent()
  {
    boolean bool = true;
    if (f != null) {
      bool = f.IIsWrapContent();
    }
    DebugHelper.debug("PluginProxyActivity.isWrapContent: " + bool + ", from = " + f);
    return bool;
  }
  
  protected void onActivityResult(int paramInt1, int paramInt2, Intent paramIntent)
  {
    super.onActivityResult(paramInt1, paramInt2, paramIntent);
    if (f != null) {}
    try
    {
      ClassLoader localClassLoader = PluginStatic.b(k);
      if ((localClassLoader != null) && (paramIntent != null)) {
        paramIntent.setExtrasClassLoader(localClassLoader);
      }
      f.IOnActivityResult(paramInt1, paramInt2, paramIntent);
    }
    catch (Exception paramIntent)
    {
      for (;;)
      {
        paramIntent.printStackTrace();
      }
    }
    p = false;
  }
  
  public void onBackPressed()
  {
    boolean bool = false;
    if (f != null) {
      bool = f.IOnBackPressed();
    }
    if (!bool) {}
    try
    {
      super.onBackPressed();
      return;
    }
    catch (IllegalStateException localIllegalStateException)
    {
      finish();
    }
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    super.onConfigurationChanged(paramConfiguration);
    if (f != null) {
      f.IOnConfigurationChanged(paramConfiguration);
    }
    if ((isWrapContent()) && (mFlingHandler != null)) {
      mFlingHandler.onConfigurationChanged(paramConfiguration);
    }
  }
  
  protected void onCreate(Bundle paramBundle)
  {
    Object localObject3 = null;
    if (DebugHelper.sDebug) {
      DebugHelper.log("PluginProxyActivity onCreate");
    }
    MobileQQ.sMobileQQ.addOtherTypeActivity(this);
    a.a();
    if (DebugHelper.sDebug) {
      DebugHelper.log("PluginProxyActivity onCreate.registerAccountReceiverIfNeccessary");
    }
    Object localObject1;
    Object localObject2;
    if (paramBundle != null)
    {
      localObject1 = paramBundle.getBundle("pluginsdk_inner_bundle");
      localObject2 = paramBundle;
    }
    while (!PluginStatic.a((Bundle)localObject2))
    {
      super.onCreate(paramBundle);
      finish();
      return;
      localObject2 = getIntent().getExtras();
      localObject1 = null;
    }
    j = ((Bundle)localObject2).getString("pluginsdk_pluginName");
    k = ((Bundle)localObject2).getString("pluginsdk_pluginLocation");
    l = ((Bundle)localObject2).getString("pluginsdk_launchActivity");
    g = ((Bundle)localObject2).getBoolean("useSkinEngine", false);
    h = ((Bundle)localObject2).getInt("userQqResources", 0);
    i = ((Bundle)localObject2).getString("pluginsdk_pluginpath");
    PluginRecoverReceiver.a(k);
    if (DebugHelper.sDebug) {
      DebugHelper.log("PluginProxyActivity onCreate.fetchParams");
    }
    if (TextUtils.isEmpty(i)) {}
    try
    {
      i = PluginUtils.getInstalledPluginPath(this, k).getCanonicalPath();
      m = ((Bundle)localObject2).getString("pluginsdk_selfuin");
      if (!TextUtils.isEmpty(m))
      {
        o = m;
        a(this, m);
      }
      for (;;)
      {
        n = ((Bundle)localObject2).getBoolean("param_plugin_gesturelock", false);
        if ((n) || (b(this))) {
          mGestureLockEnable = true;
        }
        if (DebugHelper.sDebug) {
          DebugHelper.log("PluginProxyActivity onCreate start registerReceiver");
        }
        localObject2 = new IntentFilter();
        ((IntentFilter)localObject2).addAction("android.intent.action.SCREEN_OFF");
        try
        {
          registerReceiver(q, (IntentFilter)localObject2);
          if (DebugHelper.sDebug) {
            DebugHelper.log("plugin_tag", "PluginProxyActivity.onCreate Params:" + k + ", " + l);
          }
          if ((k == null) || (k.length() == 0))
          {
            localObject1 = new IllegalArgumentException("Param mPluingLocation missing!");
            i1 = 0;
            if (i1 == 0) {
              super.onCreate(paramBundle);
            }
            if (localObject1 == null) {
              break label665;
            }
            mCreateErrorInfo = PluginUtils.getExceptionInfo((Throwable)localObject1);
            if (DebugHelper.sDebug) {
              DebugHelper.log("PluginProxyActivity.onCreate startPlugin:" + j + ", " + mCreateErrorInfo);
            }
            if (!a((Throwable)localObject1))
            {
              b();
              finish();
            }
            a(j, k, l, mCreateErrorInfo);
            if (DebugHelper.sDebug) {
              DebugHelper.log("plugin_tag", "PluginProxyActivity onCreate start sendLaunchCompletedBroadcast");
            }
            d();
            setStatusTrans();
            return;
            o = c(this);
          }
        }
        catch (Exception localException1)
        {
          for (;;)
          {
            if (DebugHelper.sDebug)
            {
              DebugHelper.log("plugin_tag", "register exception.", localException1);
              continue;
              try
              {
                if (DebugHelper.sDebug) {
                  DebugHelper.log("PluginProxyActivity onCreate start initPlugin");
                }
                c();
                if (DebugHelper.sDebug) {
                  DebugHelper.log("PluginProxyActivity onCreate end initPlugin");
                }
                f.IOnSetTheme();
                super.onCreate(paramBundle);
              }
              catch (Throwable localThrowable1)
              {
                try
                {
                  if (DebugHelper.sDebug) {
                    DebugHelper.log("PluginProxyActivity onCreate start IOnCreate");
                  }
                  if (localObject1 != null) {
                    ((Bundle)localObject1).setClassLoader(PluginStatic.b(k));
                  }
                  f.IOnCreate((Bundle)localObject1);
                  if (DebugHelper.sDebug) {
                    DebugHelper.log("PluginProxyActivity onCreate end IOnCreate");
                  }
                  i1 = 1;
                  localObject1 = localObject3;
                }
                catch (Throwable localThrowable2)
                {
                  for (;;)
                  {
                    i1 = 1;
                  }
                }
                localThrowable1 = localThrowable1;
                i1 = 0;
              }
              f = null;
              localThrowable1.printStackTrace();
              PluginRuntime.handleCrash(localThrowable1, k, this);
              continue;
              label665:
              mCreateErrorInfo = "success";
              if (DebugHelper.sDebug) {
                DebugHelper.log("PluginProxyActivity.onCreate Success");
              }
              paramBundle = getIntent().getExtras();
              if (paramBundle != null)
              {
                i1 = paramBundle.getInt("fling_action_key");
                if (DebugHelper.sDebug) {
                  DebugHelper.log("PluginProxyActivity.onCreate FLING_ACTION_KEY: " + i1 + ", from: " + paramBundle);
                }
                if ((i1 != 0) && (isWrapContent())) {
                  if (1 == i1) {
                    mFlingHandler = new FlingTrackerHandler(this);
                  } else {
                    mFlingHandler = new FlingGestureHandler(this);
                  }
                }
              }
            }
          }
        }
      }
    }
    catch (Exception localException2)
    {
      int i1;
      for (;;) {}
    }
  }
  
  public boolean onCreateOptionsMenu(Menu paramMenu)
  {
    if (f != null) {
      return f.IOnCreateOptionsMenu(paramMenu);
    }
    return super.onCreateOptionsMenu(paramMenu);
  }
  
  protected void onDestroy()
  {
    super.onDestroy();
    if (f != null) {}
    try
    {
      f.IOnDestroy();
      if (DebugHelper.sDebug) {
        DebugHelper.log("PluginProxyActivity onDestroy");
      }
    }
    catch (Exception localException1)
    {
      try
      {
        unregisterReceiver(q);
        MobileQQ.sMobileQQ.removeOtherTypeActivity(this);
        return;
        localException1 = localException1;
        localException1.printStackTrace();
      }
      catch (Exception localException2)
      {
        for (;;)
        {
          localException2.printStackTrace();
        }
      }
    }
  }
  
  public boolean onKeyDown(int paramInt, KeyEvent paramKeyEvent)
  {
    boolean bool1 = false;
    if (f != null) {
      bool1 = f.IOnKeyDown(paramInt, paramKeyEvent);
    }
    boolean bool2 = bool1;
    if (!bool1) {
      bool2 = super.onKeyDown(paramInt, paramKeyEvent);
    }
    return bool2;
  }
  
  public boolean onMenuItemSelected(int paramInt, MenuItem paramMenuItem)
  {
    if (f != null) {
      return f.IOnMenuItemSelected(paramInt, paramMenuItem);
    }
    return super.onMenuItemSelected(paramInt, paramMenuItem);
  }
  
  public void onNewIntent(Intent paramIntent)
  {
    super.onNewIntent(paramIntent);
    Object localObject = PluginStatic.b(k);
    if (localObject != null) {
      paramIntent.setExtrasClassLoader((ClassLoader)localObject);
    }
    if (f != null)
    {
      paramIntent = new Intent(paramIntent);
      paramIntent.setExtrasClassLoader((ClassLoader)localObject);
      localObject = paramIntent.getBundleExtra("pluginsdk_inner_intent_extras");
      if (localObject != null)
      {
        paramIntent.putExtras((Bundle)localObject);
        paramIntent.removeExtra("pluginsdk_inner_intent_extras");
      }
      f.IOnNewIntent(paramIntent);
    }
  }
  
  public boolean onOptionsItemSelected(MenuItem paramMenuItem)
  {
    if (f != null) {
      return f.IOnOptionsItemSelected(paramMenuItem);
    }
    return super.onOptionsItemSelected(paramMenuItem);
  }
  
  protected void onPause()
  {
    super.onPause();
    if (f != null) {
      f.IOnPause();
    }
    if (DebugHelper.sDebug) {
      DebugHelper.log("PluginProxyActivity.onPause");
    }
  }
  
  public boolean onPrepareOptionsMenu(Menu paramMenu)
  {
    if (f != null) {
      return f.IOnPrepareOptionsMenu(paramMenu);
    }
    return super.onPrepareOptionsMenu(paramMenu);
  }
  
  protected void onRestoreInstanceState(Bundle paramBundle)
  {
    ClassLoader localClassLoader = PluginStatic.b(k);
    if (localClassLoader != null) {}
    try
    {
      a(paramBundle, localClassLoader);
      super.onRestoreInstanceState(paramBundle);
      if (f != null)
      {
        Bundle localBundle = paramBundle.getBundle("pluginsdk_inner_bundle");
        paramBundle = localBundle;
        if (localBundle == null) {
          paramBundle = new Bundle();
        }
        paramBundle.setClassLoader(localClassLoader);
        f.IOnRestoreInstanceState(paramBundle);
      }
      return;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
  
  protected void onResume()
  {
    try
    {
      super.onResume();
      if (f != null) {
        f.IOnResume();
      }
      if (DebugHelper.sDebug) {
        DebugHelper.log("PluginProxyActivity.onResume");
      }
      if ((f != null) && (f.IgetImmersiveConfig().isNeedColor) && (mActNeedImmersive)) {
        setImmersiveBar(this, true, f.IgetImmersiveConfig().mStatusColor);
      }
      if (mGestureLockEnable)
      {
        mAppForground = a(this);
        if ((!mAppForground) && (!TextUtils.isEmpty(o)) && (getGestureLock(this, o)) && (p)) {
          startUnlockActivity();
        }
        if (!mAppForground)
        {
          mAppForground = true;
          a(this, mAppForground);
        }
        mStopFlag = 0;
        p = true;
      }
      return;
    }
    catch (Exception localException)
    {
      for (;;) {}
    }
  }
  
  protected void onSaveInstanceState(Bundle paramBundle)
  {
    if (f != null)
    {
      Bundle localBundle2 = paramBundle.getBundle("pluginsdk_inner_bundle");
      Bundle localBundle1 = localBundle2;
      if (localBundle2 == null)
      {
        localBundle1 = new Bundle();
        paramBundle.putBundle("pluginsdk_inner_bundle", localBundle1);
      }
      f.IOnSaveInstanceState(localBundle1);
    }
    paramBundle.putString("pluginsdk_pluginName", j);
    paramBundle.putString("pluginsdk_pluginLocation", k);
    paramBundle.putString("pluginsdk_pluginpath", i);
    paramBundle.putString("pluginsdk_launchActivity", l);
    paramBundle.putBoolean("useSkinEngine", g);
    paramBundle.putInt("userQqResources", h);
    paramBundle.putString("pluginsdk_selfuin", m);
    paramBundle.putBoolean("param_plugin_gesturelock", n);
    super.onSaveInstanceState(paramBundle);
  }
  
  protected void onStart()
  {
    super.onStart();
    if (f != null) {
      f.IOnStart();
    }
    if (mIsShowQQBackgroundIcon)
    {
      Intent localIntent = new Intent("tencent.notify.foreground");
      localIntent.putExtra("selfuin", "");
      sendBroadcast(localIntent, "com.tencent.msg.permission.pushnotify");
    }
    if ((isWrapContent()) && (mFlingHandler != null)) {
      mFlingHandler.onStart();
    }
  }
  
  protected void onStop()
  {
    super.onStop();
    if (f != null) {
      f.IOnStop();
    }
    mAppForground = e();
    if (mGestureLockEnable)
    {
      if (!mAppForground) {
        a(this, mAppForground);
      }
      mStopFlag = 1;
    }
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if (f != null) {
      return f.IOnTouchEvent(paramMotionEvent);
    }
    return super.onTouchEvent(paramMotionEvent);
  }
  
  public void onUserInteraction()
  {
    if (f != null)
    {
      f.IOnUserInteraction();
      return;
    }
    super.onUserInteraction();
  }
  
  protected void onUserLeaveHint()
  {
    super.onUserLeaveHint();
    Intent localIntent;
    if (mIsShowQQBackgroundIcon)
    {
      localIntent = new Intent("tencent.notify.background");
      localIntent.putExtra("selfuin", "");
      localIntent.putExtra("classname", getClass().getName());
    }
    try
    {
      sendBroadcast(localIntent, "com.tencent.msg.permission.pushnotify");
      return;
    }
    catch (Exception localException) {}
  }
  
  public void onWindowFocusChanged(boolean paramBoolean)
  {
    super.onWindowFocusChanged(paramBoolean);
    if (f != null) {
      f.IOnWindowFocusChanged(paramBoolean);
    }
  }
  
  public void setImmersiveBar(Activity paramActivity, boolean paramBoolean, int paramInt)
  {
    try
    {
      if (QLog.isColorLevel()) {
        QLog.d("plugintest", 2, "setImmersiveBar");
      }
      Class localClass = Class.forName("com.tencent.widget.immersive.SystemBarCompact");
      QLog.d("plugintest", 2, "setImmersiveBar" + localClass.getClass());
      localClass.getDeclaredConstructors();
      a = localClass.getConstructor(new Class[] { Activity.class, Boolean.TYPE, Integer.TYPE }).newInstance(new Object[] { paramActivity, Boolean.valueOf(paramBoolean), Integer.valueOf(paramInt) });
      initImmersive();
      return;
    }
    catch (Exception paramActivity)
    {
      do
      {
        paramActivity.printStackTrace();
      } while (!QLog.isColorLevel());
      QLog.d("plugintest", 2, "setImmersiveBar e" + paramActivity);
    }
  }
  
  public void setStatusTrans()
  {
    DebugHelper.log("setStatusTrans getIsSupportImmersive=" + getIsSupportImmersive());
    QLog.d("plugintest", 2, "setStatusTrans getIsSupportImmersive=" + getIsSupportImmersive());
    if ((f != null) && (mNeedStatusTrans) && (f.IgetImmersiveConfig().isTranslate) && (getIsSupportImmersive() == 1)) {
      getWindow().addFlags(67108864);
    }
  }
  
  protected boolean shouldHandleStartPluginFailed(String paramString)
  {
    return false;
  }
  
  protected void showNeedUninstanllAndInstallDialog()
  {
    Object localObject = new AlertDialog.Builder(this);
    ((AlertDialog.Builder)localObject).setTitle("温馨提示");
    ((AlertDialog.Builder)localObject).setMessage("启动" + j + "失败，请卸载重装~");
    ((AlertDialog.Builder)localObject).setPositiveButton("我知道了", new f(this));
    localObject = ((AlertDialog.Builder)localObject).create();
    try
    {
      if (!isFinishing()) {
        ((Dialog)localObject).show();
      }
      return;
    }
    catch (Exception localException) {}
  }
  
  public void startActivityForResult(Intent paramIntent, int paramInt)
  {
    if (paramIntent.getBooleanExtra("pluginsdk_IsPluginActivity", false))
    {
      String str = null;
      ComponentName localComponentName = paramIntent.getComponent();
      if (localComponentName != null) {
        str = localComponentName.getClassName();
      }
      paramIntent.putExtra("pluginsdk_IsPluginActivity", false);
      if ((str != null) && (str.length() > 0)) {
        a(this, str, paramIntent, paramInt);
      }
    }
    for (;;)
    {
      mStopFlag = 2;
      return;
      startActivityForResult(paramIntent, paramInt, 2);
    }
  }
  
  public void startActivityForResult(Intent paramIntent, int paramInt1, int paramInt2)
  {
    mStopFlag = 2;
    if (a(paramIntent)) {
      p = false;
    }
    if (!isMoveTaskToBack(this, paramIntent)) {
      paramIntent.addFlags(262144);
    }
    switch (paramInt2)
    {
    default: 
      super.startActivityForResult(paramIntent, paramInt1);
      return;
    case 0: 
      super.startActivityForResult(paramIntent, paramInt1);
      return;
    case 1: 
      super.startActivityForResult(paramIntent, paramInt1);
      return;
    }
    startActivityForResultWithGesture(paramIntent, paramInt1);
  }
  
  public void startActivityForResultWithGesture(Intent paramIntent, int paramInt)
  {
    startActivityForResultWithGesture(paramIntent, paramInt, hashCode());
  }
  
  public void startActivityForResultWithGesture(Intent paramIntent, int paramInt1, int paramInt2)
  {
    paramIntent.putExtra("fling_action_key", 2);
    paramIntent.putExtra("fling_code_key", paramInt2);
    super.startActivityForResult(paramIntent, paramInt1);
  }
  
  public void startActivityForResultWithSnap(Intent paramIntent, int paramInt)
  {
    startActivityForResultWithSnap(paramIntent, paramInt, hashCode());
  }
  
  public void startActivityForResultWithSnap(Intent paramIntent, int paramInt1, int paramInt2)
  {
    if (DebugHelper.sDebug) {
      DebugHelper.log("PluginProxyActivity.startActivityForResultWithSnap:" + paramInt2);
    }
    String str = ScreenCapture.getSnapPath(this, paramInt2);
    if (str != null)
    {
      ScreenCapture.captureViewToFile(str, getWindow().getDecorView());
      paramIntent.putExtra("fling_action_key", 1);
      paramIntent.putExtra("fling_code_key", paramInt2);
    }
    super.startActivityForResult(paramIntent, paramInt1);
  }
  
  protected void startUnlockActivity()
  {
    try
    {
      startActivity(new Intent(this, Class.forName("com.tencent.mobileqq.activity.GesturePWDUnlockActivity")));
      return;
    }
    catch (ClassNotFoundException localClassNotFoundException)
    {
      localClassNotFoundException.printStackTrace();
    }
  }
}
