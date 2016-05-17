import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Build.VERSION;
import android.os.Process;
import android.text.TextUtils;
import android.util.Base64;
import android.util.Pair;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.feedback.eup.CrashHandleListener;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.startup.director.StartupDirector;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.statistics.StatisticCollector.StatisticCallback;
import com.tencent.mobileqq.util.GifSoLoader;
import com.tencent.mobileqq.util.SystemUtil;
import com.tencent.mobileqq.util.WebpSoLoader;
import com.tencent.mobileqq.utils.DeviceInfoUtil;
import com.tencent.mqq.shared_file_accessor.SharedPreferencesProxyManager;
import com.tencent.qphone.base.util.QLog;
import com.tencent.smtt.sdk.QbSdk;
import com.tencent.smtt.sdk.WebView;
import com.tencent.tmdownloader.TMAssistantDownloadManager;
import cooperation.qzone.LocalMultiProcConfig;
import cooperation.qzone.QZoneCrashHandler;
import cooperation.qzone.RDMEtraMsgCollector;
import java.io.File;
import java.io.FileWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;
import java.util.Stack;
import mqq.app.AppRuntime;

public class rep
  implements CrashHandleListener
{
  public rep(StatisticCollector paramStatisticCollector)
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public byte[] getCrashExtraData(boolean paramBoolean, String paramString1, String paramString2, String paramString3, int paramInt, long paramLong)
  {
    return null;
  }
  
  public String getCrashExtraMessage(boolean paramBoolean, String paramString1, String paramString2, String paramString3, int paramInt, long paramLong)
  {
    QLog.d("StatisticCollector", 1, "getCrashExtraMessage...isNativeCrashed: " + paramBoolean + " crashType=" + paramString1 + " crashAddress=" + paramString2 + " crashStack=" + paramString3 + " native_SICODE=" + paramInt + " crashTime=" + paramLong);
    try
    {
      paramString2 = SystemUtil.b + "crashinfo/";
      localObject = new File(paramString2);
      if ((localObject != null) && (!((File)localObject).exists())) {
        ((File)localObject).mkdirs();
      }
      paramString2 = new FileWriter(paramString2 + paramLong + ".log");
      localObject = new StringBuilder(128);
      ((StringBuilder)localObject).append(StatisticCollector.a().format(new Date(paramLong))).append("\n").append(paramString1).append("\n").append(paramString3);
      paramString2.write(((StringBuilder)localObject).toString());
      paramString2.flush();
      paramString2.close();
    }
    catch (Exception paramString1)
    {
      for (;;)
      {
        Object localObject;
        paramString1.printStackTrace();
        continue;
        paramInt += 1;
      }
    }
    paramString1 = BaseApplicationImpl.processName;
    if ((paramBoolean) && ((paramString1.endsWith(":qzone")) || (paramString1.endsWith(":picture"))))
    {
      QLog.e("crash", 1, paramString3);
      QZoneCrashHandler.a(paramString3);
    }
    boolean bool;
    for (;;)
    {
      try
      {
        paramString1 = StatisticCollector.a().getSharedPreferences("sp_dex_patch", 4);
        paramBoolean = paramString1.getBoolean("enable", false);
        bool = paramBoolean;
        if (!paramBoolean) {}
      }
      catch (Throwable paramString1)
      {
        int i;
        label847:
        paramBoolean = false;
      }
      try
      {
        paramString2 = paramString1.getString("crashKey", "");
        bool = paramBoolean;
        if (!TextUtils.isEmpty(paramString2))
        {
          int j = 0;
          paramString2 = paramString2.split(";");
          i = j;
          if (paramString2 != null)
          {
            i = j;
            if (paramString2.length > 0)
            {
              i = j;
              if (!TextUtils.isEmpty(paramString3))
              {
                int k = paramString2.length;
                paramInt = 0;
                i = j;
                if (paramInt < k)
                {
                  if (!paramString3.contains(paramString2[paramInt])) {
                    continue;
                  }
                  i = 1;
                }
              }
            }
          }
          bool = paramBoolean;
          if (i != 0)
          {
            paramInt = paramString1.getInt("patchCrashCount", 0);
            if ((paramInt == 1) || (paramInt == 3))
            {
              paramString2 = paramString1.getString("name", "");
              if (!TextUtils.isEmpty(paramString2))
              {
                paramString2 = new File("/data/data/com.tencent.mobileqq/files/hotpatch/" + paramString2);
                if ((paramString2 != null) && (paramString2.exists())) {
                  paramString2.delete();
                }
              }
            }
            paramString1.edit().putInt("patchCrashCount", paramInt + 1).commit();
            bool = paramBoolean;
          }
        }
        paramString3 = new StringBuilder(128);
      }
      catch (Throwable paramString1)
      {
        for (;;) {}
      }
      try
      {
        paramString3.append("\nisPublicVersion=true");
        paramString3.append("\nrevision=201932");
        paramString3.append("\nsInjectResult: " + BaseApplicationImpl.sInjectResult);
        paramString3.append("\nsQQAppInterfaceEscaped: " + BaseApplicationImpl.a);
        paramString3.append("\nsSplashActivityEscaped: " + BaseApplicationImpl.b);
        paramString3.append("\nCountSuicide: " + StartupDirector.c);
        paramString3.append("\nPatch enable=" + bool + ", inject result=" + BaseApplicationImpl.j);
        paramString1 = WebpSoLoader.a;
        if ((paramString1 != null) && (paramString1.length >= 3)) {
          paramString3.append(String.format("\nWebP support library v%d.%d.%d was loaded.", new Object[] { Integer.valueOf(paramString1[0]), Integer.valueOf(paramString1[1]), Integer.valueOf(paramString1[2]) }));
        }
        paramString3.append("\n");
        paramString2 = StatisticCollector.a();
        localObject = DeviceInfoUtil.a();
        paramString3.append(DeviceInfoUtil.l()).append("\n");
        paramString1 = paramString2;
        if (paramString2 == null) {
          paramString1 = "null";
        }
        paramString3.append(paramString1).append("\n");
        paramString3.append("Rom total size: ").append(localObject[0]).append(" MB, Rom available size: ").append(localObject[1]).append(" MB\n");
        paramString3.append(AppRuntime.showInfo()).append("\n");
        if (StatisticCollector.a(a) != null) {
          break label1288;
        }
        paramString1 = "null";
        paramString3.append(paramString1).append("\n");
        paramString3.append(StatisticCollector.b(a).toString());
        paramString3.append(StatisticCollector.a(a).toString());
        if ((!TextUtils.isEmpty(QZoneCrashHandler.a)) && (Build.VERSION.SDK_INT >= 8)) {
          paramString3.append("lastCrashedText(Base64): " + Base64.encodeToString(QZoneCrashHandler.a.getBytes(), 0) + "\n");
        }
        if (!TextUtils.isEmpty(QZoneCrashHandler.b)) {
          paramString3.append("qzonePluginVersion:").append(QZoneCrashHandler.b).append("\n");
        }
        paramString3.append(RDMEtraMsgCollector.a().a());
        paramString3.append("\n");
      }
      catch (Throwable paramString1)
      {
        continue;
      }
      try
      {
        if (StatisticCollector.a(a).size() > 0) {
          paramString3.append(((rev)StatisticCollector.a(a).removeLast()).toString());
        }
        try
        {
          paramInt = WebView.getTbsSDKVersion(StatisticCollector.a());
          i = QbSdk.getTbsVersion(StatisticCollector.a());
          paramString2 = paramString3.append('\n').append("Current WebView: ");
          if (i == 0)
          {
            paramString1 = "system";
            paramString2.append(paramString1).append("; TBS sdk version: ").append(paramInt).append("; X5 core version: ").append(i);
            if (BaseApplicationImpl.i == 3) {
              paramString3.append("\nTBS CrashExtraMsg:").append(WebView.getCrashExtraMessage(StatisticCollector.a()));
            }
          }
        }
        catch (Throwable paramString1) {}
      }
      catch (Throwable paramString1) {}
    }
    for (;;)
    {
      paramString3.append("\nMobileQQ onActivityCreate component: ").append(astartComponentInfo);
      if ((abroadcastInfoQueue == null) || (abroadcastInfoQueue.isEmpty())) {
        break label1306;
      }
      paramString1 = abroadcastInfoQueue.iterator();
      while (paramString1.hasNext())
      {
        paramString2 = (Pair)paramString1.next();
        if (paramString2 != null) {
          paramString3.append("\nQQBroadcastReceiver time: ").append(StatisticCollector.a().format(new Date(((Long)first).longValue()))).append(", broadcast intent: ").append((String)second);
        }
      }
      paramString1.printStackTrace();
      bool = paramBoolean;
      break;
      label1288:
      paramString1 = StatisticCollector.a(a);
      break label847;
      paramString1 = "x5";
    }
    label1306:
    QLog.d("StatisticCollector", 1, "getCrashExtraMsg: " + paramString3.toString());
    return paramString3.toString();
  }
  
  public boolean onCrashHandleEnd(boolean paramBoolean)
  {
    QLog.d("StatisticCollector", 1, "onCrashHandleEnd...isNativeCrashed: " + paramBoolean);
    Object localObject = BaseApplicationImpl.processName;
    try
    {
      if (!((String)localObject).equals("com.tencent.mobileqq")) {
        break label218;
      }
      if (!a.a) {
        break label240;
      }
      QLog.d("StatisticCollector", 1, "onCrashHandleEnd...shouldStopMsf=" + a.a + ", kill package processes.");
      localObject = ((ActivityManager)StatisticCollector.a().getSystemService("activity")).getRunningAppProcesses();
      if ((localObject != null) && (((List)localObject).size() > 0))
      {
        localObject = ((List)localObject).iterator();
        while (((Iterator)localObject).hasNext())
        {
          ActivityManager.RunningAppProcessInfo localRunningAppProcessInfo = (ActivityManager.RunningAppProcessInfo)((Iterator)localObject).next();
          String str = processName;
          if ((str != null) && (str.startsWith("com.tencent.mobileqq:")) && (!str.endsWith(":MSF")))
          {
            Process.killProcess(pid);
            continue;
            return true;
          }
        }
      }
    }
    catch (Throwable localThrowable)
    {
      localThrowable.printStackTrace();
    }
    BaseApplicationImpl.a().stopMsfOnCrash(true);
    Process.killProcess(Process.myPid());
    for (;;)
    {
      BaseApplicationImpl.a().QQProcessExit(true);
      return true;
      label218:
      if ((localThrowable.endsWith(":qzone")) && (!paramBoolean)) {
        break;
      }
      BaseApplicationImpl.a().otherProcessExit(false);
      return true;
      label240:
      if (paramBoolean) {}
    }
  }
  
  public void onCrashHandleStart(boolean paramBoolean)
  {
    QLog.d("StatisticCollector", 1, "onCrashHandleStart...isNativeCrashed: " + paramBoolean + ", hasCrashed: " + StatisticCollector.a(a));
    if (StatisticCollector.a(a)) {
      Process.killProcess(Process.myPid());
    }
    try
    {
      localObject3 = new StringBuilder(128);
      localObject4 = new StringBuilder().append("topActivity:");
      if (BaseActivity.sTopActivity == null) {}
      int j;
      for (localObject1 = "null";; localObject1 = BaseActivity.sTopActivity.toString())
      {
        localObject1 = (String)localObject1;
        localObject4 = new StringBuilder(128);
        j = StatisticCollector.a(a).size();
        int i = Math.min(j, 5);
        while (i > 0)
        {
          str = (String)StatisticCollector.a(a).pop();
          if (((StringBuilder)localObject4).length() > 0) {
            ((StringBuilder)localObject4).append("\n--->");
          }
          ((StringBuilder)localObject4).append(str);
          i -= 1;
        }
        StatisticCollector.a(a, true);
        break;
      }
      StatisticCollector.a(a).clear();
      ((StringBuilder)localObject3).append((String)localObject1).append("\n");
      ((StringBuilder)localObject3).append("ActivityInfoStack:size=").append(j).append(",top five were:↓\n--->");
      ((StringBuilder)localObject3).append((CharSequence)localObject4).append("\n");
      ((StringBuilder)localObject3).append("Current mapEvent content is:\n");
      ((StringBuilder)localObject3).append(StatisticCollector.a(a).toString());
      StatisticCollector.a(a, ((StringBuilder)localObject3).toString());
    }
    catch (Throwable localThrowable2)
    {
      try
      {
        Object localObject3;
        Object localObject4;
        Object localObject1;
        String str;
        BaseApplicationImpl.a().closeAllActivitys();
        StatisticCollector.a(a, StatisticCollector.a(), (String)localObject1);
        for (;;)
        {
          try
          {
            if (((String)localObject1).equals("com.tencent.mobileqq"))
            {
              a.a();
              a.b();
            }
            if ((((String)localObject1).endsWith(":qzone")) || (((String)localObject1).endsWith(":web")) || (((String)localObject1).endsWith(":peak")))
            {
              a.a();
              a.b((String)localObject1);
            }
            if (((((String)localObject1).endsWith(":qzone")) || (((String)localObject1).endsWith(":web")) || (((String)localObject1).endsWith(":peak")) || (((String)localObject1).endsWith(":qzonevideo")) || (((String)localObject1).endsWith(":picture"))) && (LocalMultiProcConfig.a("key_sp_qzone_isforeground", false)))
            {
              QLog.d("StatisticCollector", 1, "qzone crash | crash time:" + System.currentTimeMillis() / 1000L);
              LocalMultiProcConfig.a("key_sp_qzone_crash_time_" + a.aU, System.currentTimeMillis() / 1000L);
              LocalMultiProcConfig.b("key_sp_qzone_isforeground", false);
            }
          }
          catch (Throwable localThrowable4)
          {
            QLog.d("StatisticCollector", 1, "init and update crashcontrol exception happen.");
            continue;
            localThrowable2.putStringArrayListExtra("procNameList", localThrowable4);
            localThrowable2.putExtra("verify", BaseApplicationImpl.a(localThrowable4, false));
            StatisticCollector.a().sendBroadcast(localThrowable2);
            BaseApplicationImpl.a().crashed();
            return;
          }
          try
          {
            StatisticCollector.a(a).append("Current thread Id=").append(Thread.currentThread().getId()).append(", Name=").append(Thread.currentThread().getName()).append("\n");
            SharedPreferencesProxyManager.getInstance().trySave();
            if (!((String)localObject1).equals("com.tencent.mobileqq")) {
              break label806;
            }
            localObject1 = new Intent("com.tencent.process.exit");
            localObject4 = ((ActivityManager)StatisticCollector.a().getSystemService("activity")).getRunningAppProcesses();
            localObject3 = new ArrayList();
            if ((localObject4 == null) || (((List)localObject4).size() <= 0)) {
              continue;
            }
            localObject4 = ((List)localObject4).iterator();
            if (!((Iterator)localObject4).hasNext()) {
              continue;
            }
            str = nextprocessName;
            if ((str != null) && (str.startsWith("com.tencent.mobileqq:")) && (!str.endsWith(":MSF")))
            {
              ((ArrayList)localObject3).add(str);
              continue;
              localThrowable2 = localThrowable2;
            }
          }
          catch (Throwable localThrowable1)
          {
            localThrowable1.printStackTrace();
            return;
          }
        }
        localThrowable2.printStackTrace();
      }
      catch (Throwable localThrowable3)
      {
        for (;;)
        {
          localThrowable3.printStackTrace();
        }
      }
    }
    localObject1 = BaseApplicationImpl.processName;
    label806:
    Object localObject2;
    do
    {
      do
      {
        while (localThrowable2.endsWith(":qzone"))
        {
          localObject2 = ((ActivityManager)StatisticCollector.a().getSystemService("activity")).getRunningAppProcesses().iterator();
          while (((Iterator)localObject2).hasNext())
          {
            ActivityManager.RunningAppProcessInfo localRunningAppProcessInfo = (ActivityManager.RunningAppProcessInfo)((Iterator)localObject2).next();
            if (processName.equals("com.tencent.mobileqq:qzonevideo")) {
              Process.killProcess(pid);
            }
          }
        }
        if (!((String)localObject2).endsWith(":video")) {
          break;
        }
        localObject2 = BaseApplicationImpl.a().a();
      } while ((localObject2 == null) || (!(localObject2 instanceof StatisticCollector.StatisticCallback)));
      ((StatisticCollector.StatisticCallback)localObject2).a();
      return;
    } while (!((String)localObject2).endsWith(":TMAssistantDownloadSDKService"));
    TMAssistantDownloadManager.closeAllService(StatisticCollector.a());
  }
  
  public boolean onCrashSaving(boolean paramBoolean, String paramString1, String paramString2, String paramString3, int paramInt, long paramLong, String paramString4, String paramString5, String paramString6)
  {
    WebpSoLoader.a(paramString3);
    GifSoLoader.a(paramString3);
    return true;
  }
}
