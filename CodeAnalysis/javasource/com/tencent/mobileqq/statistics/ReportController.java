package com.tencent.mobileqq.statistics;

import android.content.Intent;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.app.QQAppInterface;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.pluginsdk.PluginRuntime;
import com.tencent.mobileqq.servlet.ReportServlet;
import com.tencent.qphone.base.util.QLog;
import mqq.app.AppRuntime;
import mqq.app.NewIntent;
import reo;

public class ReportController
{
  static final String a = "ReportController";
  static final String b = "${uin_unknown}";
  static final String c = "${count_unknown}";
  public static final String d = "P_CliOper";
  public static final String e = "dc00899";
  public static final String f = "CliOper";
  public static final String g = "dc00898";
  @Deprecated
  public static final String h = "on_off";
  public static final String i = "CliStatus";
  public static final String j = "Pb_account_lifeservice";
  public static final String k = "Bqq_Crm";
  public static final String l = "webview_report";
  public static final String m = "VIPCOMIC";
  public static final String n = "QQREADER_PROCESS";
  public static final String o = "Grp_tribe";
  public static final String p = "BizTechReport";
  private static final String q = "com.tencent.mobileqq.statistics.ReportControllerImpl";
  
  public ReportController()
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  private static String a(String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, String paramString6, int paramInt1, int paramInt2, int paramInt3, String paramString7, String paramString8, String paramString9, String paramString10)
  {
    paramString1 = new StringBuilder(64);
    if ((paramString2 != null) && (paramString2.length() > 0)) {
      paramString1.append(paramString2).append('|');
    }
    paramString1.append(paramString3).append('|');
    paramString1.append(paramString4).append('|');
    paramString1.append(paramString5).append('|');
    paramString1.append(paramString6).append('|');
    paramString1.append(paramInt1).append('|');
    paramString1.append("${count_unknown}").append('|');
    paramString1.append(paramInt3).append('|');
    paramString1.append(paramString7).append('|');
    paramString1.append(paramString8).append('|');
    paramString1.append(paramString9).append('|');
    paramString1.append(paramString10).append('|');
    return paramString1.toString();
  }
  
  public static void a(QQAppInterface paramQQAppInterface)
  {
    if (QLog.isColorLevel()) {
      QLog.d("ReportController", 2, "stopReportLooper");
    }
    paramQQAppInterface = paramQQAppInterface.a();
    if (paramQQAppInterface != null) {
      paramQQAppInterface.a();
    }
  }
  
  static void a(QQAppInterface paramQQAppInterface, String paramString1, String paramString2, int paramInt)
  {
    Object localObject = paramString2;
    if (paramString2.contains("${uin_unknown}")) {
      localObject = paramString2.replace("${uin_unknown}", paramQQAppInterface.a());
    }
    paramString2 = ((String)localObject).replace("${count_unknown}", Integer.toString(paramInt));
    if (QLog.isColorLevel()) {
      QLog.d("ReportController", 2, "ReportRuntime: " + paramString1 + ", " + paramString2);
    }
    localObject = new NewIntent(paramQQAppInterface.getApplication(), ReportServlet.class);
    ((NewIntent)localObject).putExtra("sendType", 2);
    ((NewIntent)localObject).putExtra("tag", paramString1);
    ((NewIntent)localObject).putExtra("content", paramString2);
    ((NewIntent)localObject).setWithouLogin(true);
    paramQQAppInterface.startServlet((NewIntent)localObject);
  }
  
  public static void a(QQAppInterface paramQQAppInterface, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, int paramInt1, int paramInt2, int paramInt3, String paramString6, String paramString7, String paramString8, String paramString9)
  {
    QQAppInterface localQQAppInterface = paramQQAppInterface;
    if (paramQQAppInterface == null)
    {
      localQQAppInterface = paramQQAppInterface;
      if (BaseApplicationImpl.i == 1)
      {
        AppRuntime localAppRuntime = BaseApplicationImpl.a().a();
        localQQAppInterface = paramQQAppInterface;
        if (localAppRuntime != null)
        {
          localQQAppInterface = paramQQAppInterface;
          if ((localAppRuntime instanceof QQAppInterface)) {
            localQQAppInterface = (QQAppInterface)localAppRuntime;
          }
        }
      }
    }
    if (localQQAppInterface == null)
    {
      paramQQAppInterface = a(paramString1, paramString2, "${uin_unknown}", paramString3, paramString4, paramString5, paramInt1, paramInt3, paramInt2, paramString6, paramString7, paramString8, paramString9);
      paramString2 = new Intent();
      paramString2.setClassName(BaseApplicationImpl.a, "com.tencent.mobileqq.statistics.ReportReceiver");
      paramString2.putExtra("reporting_tag", paramString1);
      paramString2.putExtra("reporting_detail", paramQQAppInterface);
      paramString2.putExtra("reporting_count", paramInt3);
      paramString2.putExtra("is_runtime", 1);
      BaseApplicationImpl.a().sendBroadcast(paramString2);
      return;
    }
    a(localQQAppInterface, paramString1, a(paramString1, paramString2, localQQAppInterface.a(), paramString3, paramString4, paramString5, paramInt1, paramInt3, paramInt2, paramString6, paramString7, paramString8, paramString9), paramInt3);
  }
  
  public static void a(QQAppInterface paramQQAppInterface, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, int paramInt1, int paramInt2, String paramString6, String paramString7, String paramString8, String paramString9)
  {
    a(paramQQAppInterface, paramString1, paramString2, paramString3, paramString4, paramString5, paramInt1, paramInt2, 1, paramString6, paramString7, paramString8, paramString9);
  }
  
  public static void a(PluginRuntime paramPluginRuntime)
  {
    paramPluginRuntime.setClickEventReportor(new reo());
  }
  
  public static boolean a(QQAppInterface paramQQAppInterface, boolean paramBoolean)
  {
    if (QLog.isColorLevel()) {
      QLog.d("ReportController", 2, "startReportLooper");
    }
    paramQQAppInterface = paramQQAppInterface.a();
    if (paramQQAppInterface != null) {
      if (paramBoolean) {
        break label36;
      }
    }
    label36:
    for (paramBoolean = true;; paramBoolean = false)
    {
      paramQQAppInterface.a(paramBoolean);
      return true;
    }
  }
  
  static void b(QQAppInterface paramQQAppInterface, String paramString1, String paramString2, int paramInt)
  {
    if (paramString2 != null)
    {
      ReportController localReportController = paramQQAppInterface.a();
      if (localReportController != null)
      {
        String str = paramString2;
        if (paramString2.contains("${uin_unknown}")) {
          str = paramString2.replace("${uin_unknown}", paramQQAppInterface.a());
        }
        localReportController.a(paramString1, str, paramInt);
      }
    }
  }
  
  public static void b(QQAppInterface paramQQAppInterface, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, int paramInt1, int paramInt2, int paramInt3, String paramString6, String paramString7, String paramString8, String paramString9)
  {
    QQAppInterface localQQAppInterface = paramQQAppInterface;
    if (paramQQAppInterface == null)
    {
      localQQAppInterface = paramQQAppInterface;
      if (BaseApplicationImpl.i == 1)
      {
        AppRuntime localAppRuntime = BaseApplicationImpl.a().a();
        localQQAppInterface = paramQQAppInterface;
        if (localAppRuntime != null)
        {
          localQQAppInterface = paramQQAppInterface;
          if ((localAppRuntime instanceof QQAppInterface)) {
            localQQAppInterface = (QQAppInterface)localAppRuntime;
          }
        }
      }
    }
    if (localQQAppInterface == null)
    {
      paramQQAppInterface = a(paramString1, paramString2, "${uin_unknown}", paramString3, paramString4, paramString5, paramInt1, paramInt2, paramInt3, paramString6, paramString7, paramString8, paramString9);
      paramString2 = new Intent();
      paramString2.setClassName(BaseApplicationImpl.a, "com.tencent.mobileqq.statistics.ReportReceiver");
      paramString2.putExtra("reporting_tag", paramString1);
      paramString2.putExtra("reporting_detail", paramQQAppInterface);
      paramString2.putExtra("reporting_count", paramInt2);
      paramString2.putExtra("is_runtime", 0);
      BaseApplicationImpl.a().sendBroadcast(paramString2);
      return;
    }
    b(localQQAppInterface, paramString1, a(paramString1, paramString2, localQQAppInterface.a(), paramString3, paramString4, paramString5, paramInt1, paramInt2, paramInt3, paramString6, paramString7, paramString8, paramString9), paramInt2);
  }
  
  public static void b(QQAppInterface paramQQAppInterface, String paramString1, String paramString2, String paramString3, String paramString4, String paramString5, int paramInt1, int paramInt2, String paramString6, String paramString7, String paramString8, String paramString9)
  {
    b(paramQQAppInterface, paramString1, paramString2, paramString3, paramString4, paramString5, paramInt1, 1, paramInt2, paramString6, paramString7, paramString8, paramString9);
  }
  
  protected void a() {}
  
  protected void a(String paramString1, String paramString2, int paramInt) {}
  
  protected void a(boolean paramBoolean) {}
}
