package com.tencent.mobileqq.msf.service;

import android.app.Notification;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.os.Build.VERSION;
import android.os.IBinder;
import com.tencent.mobileqq.msf.core.MsfCore;
import com.tencent.mobileqq.msf.core.a.a;
import com.tencent.mobileqq.msf.core.b.m;
import com.tencent.mobileqq.msf.core.o;
import com.tencent.mqq.shared_file_accessor.SharedPreferencesProxyManager;
import com.tencent.qphone.base.remote.IBaseService.Stub;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;

public class MsfService
  extends Service
{
  public static MsfCore core = new MsfCore();
  public static volatile boolean inited = false;
  static HashSet invalidUids = new HashSet();
  static e msfServiceReqHandler = new e();
  static f msfServiceRespHandler;
  static HashSet passedUids = new HashSet();
  public static volatile boolean sIsCreatedByAutoBoot = false;
  public static final String tag = "MSF.S.MsfService";
  private IBaseService.Stub binder = new d(this);
  
  public MsfService() {}
  
  public static MsfCore getCore()
  {
    return core;
  }
  
  public static boolean isSamePackage(Context paramContext, int paramInt, String paramString)
  {
    boolean bool2 = true;
    boolean bool1;
    if (invalidUids.contains(Integer.valueOf(paramInt)))
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.S.MsfService", 2, "found invalid uid call " + paramInt);
      }
      bool1 = false;
    }
    do
    {
      return bool1;
      bool1 = bool2;
    } while (passedUids.contains(Integer.valueOf(paramInt)));
    String[] arrayOfString = paramContext.getPackageManager().getPackagesForUid(paramInt);
    paramContext = paramContext.getPackageName();
    int j = arrayOfString.length;
    int i = 0;
    label92:
    if (i < j) {
      if (arrayOfString[i].equals(paramContext))
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.S.MsfService", 2, "found accountSyncRequest from the same packeName application,");
        }
        passedUids.add(Integer.valueOf(paramInt));
      }
    }
    for (i = 0;; i = 1)
    {
      bool1 = bool2;
      if (i == 0) {
        break;
      }
      invalidUids.add(Integer.valueOf(paramInt));
      paramContext = "";
      Object localObject = paramContext;
      if (arrayOfString != null)
      {
        i = arrayOfString.length;
        paramInt = 0;
        for (;;)
        {
          localObject = paramContext;
          if (paramInt >= i) {
            break;
          }
          localObject = arrayOfString[paramInt];
          paramContext = paramContext + " " + (String)localObject + ";";
          paramInt += 1;
        }
        i += 1;
        break label92;
      }
      if (QLog.isColorLevel()) {
        QLog.d("MSF.S.MsfService", 2, "found invalid uid call " + (String)localObject);
      }
      try
      {
        paramContext = new HashMap();
        paramContext.put("param_Reason", localObject);
        paramContext.put("method", paramString);
        core.getStatReporter().a("dim.Msf.invaildAppCall", true, 0L, 0L, paramContext, false, false);
        return false;
      }
      catch (Exception paramContext)
      {
        for (;;)
        {
          if (QLog.isColorLevel()) {
            QLog.d("MSF.S.MsfService", 2, "send invaild call error " + paramContext, paramContext);
          }
        }
      }
    }
  }
  
  /* Error */
  public static void serviceInit(Context paramContext, boolean paramBoolean)
  {
    // Byte code:
    //   0: iconst_0
    //   1: istore_2
    //   2: ldc 2
    //   4: monitorenter
    //   5: getstatic 34	com/tencent/mobileqq/msf/service/MsfService:inited	Z
    //   8: ifne +190 -> 198
    //   11: invokestatic 171	android/os/SystemClock:elapsedRealtime	()J
    //   14: lstore_3
    //   15: getstatic 32	com/tencent/mobileqq/msf/service/MsfService:core	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   18: aload_0
    //   19: iload_1
    //   20: invokevirtual 175	com/tencent/mobileqq/msf/core/MsfCore:init	(Landroid/content/Context;Z)Z
    //   23: pop
    //   24: invokestatic 171	android/os/SystemClock:elapsedRealtime	()J
    //   27: lstore 5
    //   29: ldc -79
    //   31: iconst_1
    //   32: new 81	java/lang/StringBuilder
    //   35: dup
    //   36: invokespecial 82	java/lang/StringBuilder:<init>	()V
    //   39: ldc -77
    //   41: invokevirtual 88	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   44: lload 5
    //   46: lload_3
    //   47: lsub
    //   48: invokevirtual 182	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   51: invokevirtual 95	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   54: invokestatic 99	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   57: aload_0
    //   58: getstatic 32	com/tencent/mobileqq/msf/service/MsfService:core	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   61: invokestatic 187	com/tencent/mobileqq/msf/service/c:a	(Landroid/content/Context;Lcom/tencent/mobileqq/msf/core/MsfCore;)V
    //   64: new 189	com/tencent/mobileqq/msf/service/f
    //   67: dup
    //   68: getstatic 32	com/tencent/mobileqq/msf/service/MsfService:core	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   71: invokespecial 192	com/tencent/mobileqq/msf/service/f:<init>	(Lcom/tencent/mobileqq/msf/core/MsfCore;)V
    //   74: putstatic 194	com/tencent/mobileqq/msf/service/MsfService:msfServiceRespHandler	Lcom/tencent/mobileqq/msf/service/f;
    //   77: getstatic 194	com/tencent/mobileqq/msf/service/MsfService:msfServiceRespHandler	Lcom/tencent/mobileqq/msf/service/f;
    //   80: ldc -60
    //   82: invokevirtual 200	com/tencent/mobileqq/msf/service/f:setName	(Ljava/lang/String;)V
    //   85: getstatic 194	com/tencent/mobileqq/msf/service/MsfService:msfServiceRespHandler	Lcom/tencent/mobileqq/msf/service/f;
    //   88: invokevirtual 203	com/tencent/mobileqq/msf/service/f:start	()V
    //   91: iconst_1
    //   92: putstatic 34	com/tencent/mobileqq/msf/service/MsfService:inited	Z
    //   95: invokestatic 171	android/os/SystemClock:elapsedRealtime	()J
    //   98: lload_3
    //   99: lsub
    //   100: lstore 7
    //   102: ldc -79
    //   104: iconst_1
    //   105: new 81	java/lang/StringBuilder
    //   108: dup
    //   109: invokespecial 82	java/lang/StringBuilder:<init>	()V
    //   112: ldc -51
    //   114: invokevirtual 88	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   117: lload 7
    //   119: invokevirtual 182	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   122: invokevirtual 95	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   125: invokestatic 99	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   128: new 132	java/util/HashMap
    //   131: dup
    //   132: invokespecial 133	java/util/HashMap:<init>	()V
    //   135: astore_0
    //   136: aload_0
    //   137: ldc -49
    //   139: new 81	java/lang/StringBuilder
    //   142: dup
    //   143: invokespecial 82	java/lang/StringBuilder:<init>	()V
    //   146: ldc 126
    //   148: invokevirtual 88	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   151: lload 5
    //   153: lload_3
    //   154: lsub
    //   155: invokevirtual 182	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   158: invokevirtual 95	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   161: invokevirtual 208	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   164: pop
    //   165: getstatic 32	com/tencent/mobileqq/msf/service/MsfService:core	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   168: getfield 212	com/tencent/mobileqq/msf/core/MsfCore:statReporter	Lcom/tencent/mobileqq/msf/core/b/m;
    //   171: astore 9
    //   173: lload 7
    //   175: ldc2_w 213
    //   178: lcmp
    //   179: ifle +23 -> 202
    //   182: iload_2
    //   183: istore_1
    //   184: aload 9
    //   186: ldc -40
    //   188: iload_1
    //   189: lload 7
    //   191: lconst_0
    //   192: aload_0
    //   193: iconst_0
    //   194: iconst_0
    //   195: invokevirtual 155	com/tencent/mobileqq/msf/core/b/m:a	(Ljava/lang/String;ZJJLjava/util/Map;ZZ)V
    //   198: ldc 2
    //   200: monitorexit
    //   201: return
    //   202: iconst_1
    //   203: istore_1
    //   204: goto -20 -> 184
    //   207: astore_0
    //   208: ldc 2
    //   210: monitorexit
    //   211: aload_0
    //   212: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	213	0	paramContext	Context
    //   0	213	1	paramBoolean	boolean
    //   1	182	2	bool	boolean
    //   14	140	3	l1	long
    //   27	125	5	l2	long
    //   100	90	7	l3	long
    //   171	14	9	localM	m
    // Exception table:
    //   from	to	target	type
    //   5	173	207	finally
    //   184	198	207	finally
  }
  
  private void startForegroundCompat()
  {
    try
    {
      if (Build.VERSION.SDK_INT < 18) {
        startForeground(9527, new Notification());
      }
      return;
    }
    catch (Exception localException) {}
  }
  
  private void stopForegroundCompat()
  {
    try
    {
      if (Build.VERSION.SDK_INT < 18) {
        stopForeground(true);
      }
      return;
    }
    catch (Exception localException) {}
  }
  
  public SharedPreferences getSharedPreferences(String paramString, int paramInt)
  {
    return SharedPreferencesProxyManager.getInstance().getProxy(paramString, paramInt);
  }
  
  protected void handleAccountSyncRequest(Context paramContext, ToServiceMsg paramToServiceMsg, int paramInt)
  {
    if (paramToServiceMsg == null) {
      if (QLog.isColorLevel()) {
        QLog.w("MSF.S.MsfService", 2, "handleAccountSyncRequest toServiceMsg null!");
      }
    }
    do
    {
      do
      {
        return;
      } while (!paramToServiceMsg.getServiceCmd().equals("cmd_sync_syncuser"));
      try
      {
        core.handleAccountSyncRequest(paramContext, paramToServiceMsg, paramInt);
        return;
      }
      catch (Exception paramContext) {}
    } while (!QLog.isColorLevel());
    QLog.d("MSF.S.MsfService", 2, "handleAccountSyncRequestReport error " + paramContext, paramContext);
  }
  
  public IBinder onBind(Intent paramIntent)
  {
    Object localObject = null;
    try
    {
      paramIntent = paramIntent.getStringExtra("to_SenderProcessName");
      QLog.d("MSF.S.MsfService", 1, "serivce onBind by :" + paramIntent);
      if (a.ad()) {
        a.a(false);
      }
      return binder;
    }
    catch (Exception paramIntent)
    {
      for (;;)
      {
        paramIntent.printStackTrace();
        paramIntent = localObject;
      }
    }
  }
  
  public void onCreate()
  {
    super.onCreate();
    QLog.d("MSF.S.MsfService", 1, "serivce onCreate");
    serviceInit(this, sIsCreatedByAutoBoot);
    if (QLog.isColorLevel()) {
      QLog.d("MSF.S.MsfService", 2, "serivce onCreate... autoBoot[" + sIsCreatedByAutoBoot + "]");
    }
    sIsCreatedByAutoBoot = false;
    startForegroundCompat();
  }
  
  public void onDestroy()
  {
    try
    {
      BaseApplication.getContext().unregisterReceiver(corenetConnICenter);
    }
    catch (Exception localException3)
    {
      try
      {
        BaseApplication.getContext().unregisterReceiver(core.getNetFlowStore());
      }
      catch (Exception localException3)
      {
        try
        {
          BaseApplication.getContext().unregisterReceiver(core.getStandyModeManager());
        }
        catch (Exception localException3)
        {
          try
          {
            for (;;)
            {
              o.a(o.P);
              stopForegroundCompat();
              super.onDestroy();
              return;
              localException1 = localException1;
              QLog.d("MSF.S.MsfService", 1, "unregisterReceiver failed. " + localException1, localException1);
              continue;
              localException2 = localException2;
              QLog.d("MSF.S.MsfService", 1, "unregisterReceiver failed. " + localException2, localException2);
              continue;
              localException3 = localException3;
              QLog.d("MSF.S.MsfService", 1, "unregisterReceiver failed. " + localException3, localException3);
            }
          }
          catch (Exception localException4)
          {
            for (;;)
            {
              QLog.d("MSF.S.MsfService", 1, "unregisterReceiver failed. " + localException4, localException4);
            }
          }
        }
      }
    }
  }
  
  public int onStartCommand(Intent paramIntent, int paramInt1, int paramInt2)
  {
    QLog.d("MSF.S.MsfService", 1, "serivce onStart");
    return super.onStartCommand(paramIntent, paramInt1, paramInt2);
  }
  
  public boolean onUnbind(Intent paramIntent)
  {
    String str = paramIntent.getStringExtra("to_SenderProcessName");
    if (QLog.isColorLevel()) {
      QLog.d("MSF.S.MsfService", 2, "serivce onUnbind by :" + str);
    }
    return super.onUnbind(paramIntent);
  }
}
