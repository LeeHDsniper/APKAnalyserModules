package cooperation.qqfav;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.content.res.Resources;
import android.os.Build.VERSION;
import android.os.RemoteException;
import android.text.TextUtils;
import com.qq.jce.wup.BasicClassTypeUtil;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pluginsdk.OnPluginInstallListener;
import com.tencent.mobileqq.pluginsdk.PluginStatic;
import com.tencent.mobileqq.utils.DialogUtil;
import com.tencent.mobileqq.utils.DisplayUtils;
import com.tencent.mobileqq.utils.QQCustomDialog;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.Iterator;
import java.util.List;
import mqq.app.AppRuntime;
import umx;
import umy;
import umz;

public final class QfavHelper
  implements umx
{
  private static SharedPreferences a;
  public static final String aH = "shared_prefs_qfav";
  public static final String aI = "pref_first_enter_";
  public static final String aJ = "pref_first_collection_";
  private static final String aK = "com.qqfav.QfavAppInterface";
  
  public QfavHelper()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public static SharedPreferences a(Context paramContext)
  {
    try
    {
      if (a == null) {
        a = paramContext.getSharedPreferences("shared_prefs_qfav", 4);
      }
      paramContext = a;
      return paramContext;
    }
    finally {}
  }
  
  public static ClassLoader a()
  {
    Object localObject = BaseApplicationImpl.a().getApplicationContext();
    try
    {
      localObject = PluginStatic.getOrCreateClassLoader((Context)localObject, "qqfav.apk");
      localException1.printStackTrace();
    }
    catch (Exception localException1)
    {
      try
      {
        BasicClassTypeUtil.setClassLoader(true, (ClassLoader)localObject);
        return localObject;
      }
      catch (Exception localException2)
      {
        for (;;) {}
      }
      localException1 = localException1;
      localObject = null;
    }
    return localObject;
  }
  
  public static Object a(String paramString)
  {
    return a(paramString, new Class[0], new Object[0]);
  }
  
  public static Object a(String paramString, Class paramClass, Object paramObject)
  {
    return a(paramString, new Class[] { paramClass }, new Object[] { paramObject });
  }
  
  public static Object a(String paramString, Class[] paramArrayOfClass, Object[] paramArrayOfObject)
  {
    for (;;)
    {
      try
      {
        localClass = Class.forName(paramString);
        if (localClass != null) {}
      }
      catch (ClassNotFoundException localClassNotFoundException)
      {
        try
        {
          Class localClass;
          QLog.i("qqfavQfavHelper#createInstance", 1, "className =" + paramString + ",cls == null");
          paramArrayOfClass = localClass.getDeclaredConstructor(paramArrayOfClass).newInstance(paramArrayOfObject);
          if (paramArrayOfClass != null) {
            break;
          }
          QLog.i("qqfavQfavHelper#createInstance", 4, "className =" + paramString + ",retObj == null");
        }
        catch (ClassNotFoundException paramString)
        {
          paramString.printStackTrace();
          return null;
        }
        localClassNotFoundException = localClassNotFoundException;
        localObject = a();
        if (localObject != null)
        {
          localObject = ((ClassLoader)localObject).loadClass(paramString);
          continue;
        }
      }
      catch (IllegalArgumentException paramString)
      {
        paramString.printStackTrace();
        return null;
      }
      catch (IllegalAccessException paramString)
      {
        paramString.printStackTrace();
        return null;
      }
      catch (InstantiationException paramString)
      {
        paramString.printStackTrace();
        return null;
      }
      catch (InvocationTargetException paramString)
      {
        paramString.printStackTrace();
        return null;
      }
      catch (NoSuchMethodException paramString)
      {
        paramString.printStackTrace();
        return null;
      }
      catch (NullPointerException paramString)
      {
        paramString.printStackTrace();
        return null;
      }
      catch (Exception paramString)
      {
        paramString.printStackTrace();
        return null;
      }
      Object localObject = null;
    }
    return paramArrayOfClass;
  }
  
  public static AppRuntime a(BaseApplicationImpl paramBaseApplicationImpl)
  {
    return (AppRuntime)a("com.qqfav.QfavAppInterface", new Class[] { BaseApplicationImpl.class, String.class }, new Object[] { paramBaseApplicationImpl, "qqfav" });
  }
  
  public static void a(Activity paramActivity, String paramString1, boolean paramBoolean1, String paramString2, boolean paramBoolean2)
  {
    QQToast localQQToast = new QQToast(paramActivity);
    localQQToast.c(2000);
    String str = paramString1;
    if (TextUtils.isEmpty(paramString1)) {
      str = BaseApplicationImpl.a().a().getAccount();
    }
    if (paramBoolean1)
    {
      localQQToast.a(QQToast.a(2));
      localQQToast.b(2131365750);
      if (a(paramActivity).getBoolean("pref_first_collection_" + str, true))
      {
        paramString2 = paramActivity.getString(2131365773);
        if (!paramBoolean2) {
          break label274;
        }
        paramString1 = paramActivity.getString(2131365775);
        DialogUtil.a(paramActivity, 230, paramString2, paramString1, 2131366996, 2131365776, new umy(), null).setMessageCount(null).show();
        a(paramActivity).edit().putBoolean("pref_first_collection_" + str, false).commit();
        if (QLog.isColorLevel()) {
          QLog.d("qqfav", 2, "First collection guide shown. Uin=" + str + ", flag=" + a(paramActivity).getBoolean(new StringBuilder().append("pref_first_collection_").append(str).toString(), true));
        }
      }
    }
    for (;;)
    {
      localQQToast.b(paramActivity.getResources().getDimensionPixelSize(2131492908) - (int)DisplayUtils.a(paramActivity, 5.0F));
      return;
      label274:
      paramString1 = paramActivity.getString(2131365774);
      break;
      localQQToast.a(QQToast.a(1));
      if (paramString2 == null) {
        localQQToast.b(2131365758);
      } else {
        localQQToast.a(paramString2);
      }
    }
  }
  
  public static void a(Context paramContext, OnPluginInstallListener paramOnPluginInstallListener)
  {
    Context localContext = paramContext;
    if (paramContext == null) {
      localContext = BaseApplicationImpl.a().getApplicationContext();
    }
    try
    {
      new umz(localContext, paramOnPluginInstallListener).start();
      return;
    }
    catch (Throwable paramContext)
    {
      do
      {
        paramContext.printStackTrace();
      } while (paramOnPluginInstallListener == null);
      try
      {
        paramOnPluginInstallListener.onInstallError("qqfav.apk", -1);
        return;
      }
      catch (RemoteException paramContext)
      {
        paramContext.printStackTrace();
      }
    }
  }
  
  public static void a(AppRuntime paramAppRuntime)
  {
    Object localObject = BaseApplicationImpl.a();
    int i;
    if (Build.VERSION.SDK_INT > 10)
    {
      i = 4;
      if (!((BaseApplicationImpl)localObject).getSharedPreferences("QfavNeedReupload", i).getBoolean(paramAppRuntime.getAccount() + "QfavNeedReupload", false)) {
        break label100;
      }
      if (QLog.isColorLevel()) {
        QLog.i("qqfav", 2, "reuploadQfavItems: flag=true");
      }
      localObject = new Intent("com.tencent.mobileqq.ACTION_QFAVIPC_BROADCAST");
      ((Intent)localObject).putExtra("nOperation", 5);
      QfavPluginProxyReceiver.a(paramAppRuntime, (Intent)localObject);
    }
    label100:
    while (!QLog.isColorLevel())
    {
      return;
      i = 0;
      break;
    }
    QLog.i("qqfav", 2, "reuploadQfavItems: flag=false");
  }
  
  public static boolean a(Activity paramActivity, String paramString)
  {
    Intent localIntent = new Intent();
    localIntent.putExtra("nOperation", 3);
    return QfavPluginProxyActivity.a(paramActivity, paramString, localIntent, -1);
  }
  
  public static boolean a(Activity paramActivity, String paramString, long paramLong)
  {
    Intent localIntent = new Intent();
    localIntent.putExtra("nOperation", 6);
    localIntent.putExtra("lId", paramLong);
    return QfavPluginProxyActivity.a(paramActivity, paramString, localIntent, -1);
  }
  
  public static boolean a(Activity paramActivity, String paramString, Intent paramIntent, int paramInt)
  {
    paramIntent.setFlags(paramIntent.getFlags() & 0xFBFFFFFF & 0xDFFFFFFF);
    return QfavPluginProxyActivity.a(paramActivity, paramString, paramIntent, paramInt);
  }
  
  public static boolean a(Activity paramActivity, String paramString, Intent paramIntent, int paramInt, boolean paramBoolean)
  {
    if (paramIntent == null) {}
    for (paramIntent = new Intent();; paramIntent = new Intent(paramIntent))
    {
      paramIntent.putExtra("nOperation", 2);
      paramIntent.putExtra("bShowProgress", paramBoolean);
      paramIntent.putExtra("begin", System.currentTimeMillis());
      QfavUtil.a(paramString);
      return QfavPluginProxyActivity.a(paramActivity, paramString, paramIntent, paramInt);
    }
  }
  
  public static boolean a(Context paramContext)
  {
    paramContext = ((ActivityManager)paramContext.getSystemService("activity")).getRunningAppProcesses();
    if (paramContext != null)
    {
      paramContext = paramContext.iterator();
      while (paramContext.hasNext())
      {
        ActivityManager.RunningAppProcessInfo localRunningAppProcessInfo = (ActivityManager.RunningAppProcessInfo)paramContext.next();
        if ((processName != null) && (processName.endsWith(":qqfav"))) {
          return true;
        }
      }
    }
    return false;
  }
  
  public static boolean b(Activity paramActivity, String paramString, long paramLong)
  {
    Intent localIntent = new Intent();
    localIntent.putExtra("nOperation", 7);
    return QfavPluginProxyActivity.a(paramActivity, paramString, localIntent, -1);
  }
}
