package com.tencent.mobileqq.msf.sdk;

import android.app.ActivityManager;
import android.app.ActivityManager.MemoryInfo;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.app.ActivityManager.RunningServiceInfo;
import android.content.ComponentName;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Build.VERSION;
import android.os.DeadObjectException;
import android.os.Environment;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.RemoteException;
import android.text.format.Formatter;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.IBaseActionListener;
import com.tencent.qphone.base.remote.IBaseService;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.atomic.AtomicInteger;

public class n
{
  private static final String a = "MSF.D.RemoteServiceProxy";
  private static int b = 0;
  private static long c = -1L;
  protected static ConcurrentLinkedQueue f = new ConcurrentLinkedQueue();
  protected static ConcurrentHashMap g = new ConcurrentHashMap();
  static final String m = "appTimeoutReq";
  private static boolean p = false;
  protected volatile IBaseService d;
  protected Object e = new Object();
  protected volatile Handler h;
  protected volatile long i = -1L;
  protected volatile long j = -1L;
  protected volatile int k = -1;
  AtomicInteger l = new AtomicInteger();
  String n;
  protected ServiceConnection o = new o(this);
  
  public n(String paramString)
  {
    n = paramString;
  }
  
  private void a(SharedPreferences.Editor paramEditor)
  {
    paramEditor.putString("availMem", e());
    paramEditor.putString("lowMem", f());
    paramEditor.putString("time", new Date().toString());
    paramEditor.putString("process", k());
    paramEditor.putString("state", j());
  }
  
  private String e()
  {
    try
    {
      Object localObject = (ActivityManager)BaseApplication.getContext().getSystemService("activity");
      ActivityManager.MemoryInfo localMemoryInfo = new ActivityManager.MemoryInfo();
      ((ActivityManager)localObject).getMemoryInfo(localMemoryInfo);
      QLog.d("MSF.D.RemoteServiceProxy", 1, "Property get avail memory:" + availMem);
      localObject = Formatter.formatFileSize(BaseApplication.getContext(), availMem);
      return localObject;
    }
    catch (Exception localException)
    {
      QLog.d("MSF.D.RemoteServiceProxy", 1, "failed to get avail memory");
    }
    return null;
  }
  
  private String f()
  {
    try
    {
      ActivityManager localActivityManager = (ActivityManager)BaseApplication.getContext().getSystemService("activity");
      ActivityManager.MemoryInfo localMemoryInfo = new ActivityManager.MemoryInfo();
      localActivityManager.getMemoryInfo(localMemoryInfo);
      QLog.d("MSF.D.RemoteServiceProxy", 1, "Property get low memory feature:" + lowMemory);
      boolean bool = lowMemory;
      return String.valueOf(bool);
    }
    catch (Exception localException)
    {
      QLog.d("MSF.D.RemoteServiceProxy", 1, "failed to get low memory feature");
    }
    return null;
  }
  
  private String j()
  {
    boolean bool = false;
    for (;;)
    {
      try
      {
        Iterator localIterator = ((ActivityManager)BaseApplication.getContext().getSystemService("activity")).getRunningServices(256).iterator();
        Object localObject1 = null;
        int i1 = 0;
        Object localObject2;
        if (localIterator.hasNext())
        {
          localObject2 = (ActivityManager.RunningServiceInfo)localIterator.next();
          if (process.trim().equals("com.tencent.mobileqq:MSF"))
          {
            bool = true;
            localObject1 = localObject2;
          }
        }
        else
        {
          QLog.d("MSF.D.RemoteServiceProxy", 1, "isMsfAlive:" + bool + ", cur service process count:" + i1);
          localObject2 = new StringBuilder();
          ((StringBuilder)localObject2).append("countService_").append(i1).append(":");
          if ((bool) && (localObject1 != null))
          {
            ((StringBuilder)localObject2).append("alive_").append(bool).append(":");
            ((StringBuilder)localObject2).append("activeSince_").append(activeSince).append(":");
            ((StringBuilder)localObject2).append("clientCount_").append(clientCount).append(":");
            ((StringBuilder)localObject2).append("clientLabel_").append(clientLabel).append(":");
            ((StringBuilder)localObject2).append("clientPkg_").append(clientPackage).append(":");
            ((StringBuilder)localObject2).append("crashCount_").append(crashCount).append(":");
            ((StringBuilder)localObject2).append("flags_").append(flags).append(":");
            ((StringBuilder)localObject2).append("foreground_").append(foreground).append(":");
            ((StringBuilder)localObject2).append("lastActivityTime_").append(lastActivityTime).append(":");
            ((StringBuilder)localObject2).append("pid_").append(pid).append(":");
            ((StringBuilder)localObject2).append("process_").append(process).append(":");
            ((StringBuilder)localObject2).append("restarting_").append(restarting).append(":");
            ((StringBuilder)localObject2).append("started_").append(started).append(":");
            ((StringBuilder)localObject2).append("uid_").append(uid);
            return ((StringBuilder)localObject2).toString();
          }
          ((StringBuilder)localObject2).append("alive_").append(bool);
          continue;
        }
        i1 += 1;
      }
      catch (Exception localException)
      {
        QLog.d("MSF.D.RemoteServiceProxy", 1, "failed to getServiceState");
        return null;
      }
    }
  }
  
  private String k()
  {
    try
    {
      int i1 = android.os.Process.myPid();
      Object localObject = ((ActivityManager)BaseApplication.getContext().getSystemService("activity")).getRunningAppProcesses().iterator();
      while (((Iterator)localObject).hasNext())
      {
        ActivityManager.RunningAppProcessInfo localRunningAppProcessInfo = (ActivityManager.RunningAppProcessInfo)((Iterator)localObject).next();
        if (pid == i1)
        {
          localObject = processName;
          return localObject;
        }
      }
    }
    catch (Exception localException)
    {
      QLog.d("MSF.D.RemoteServiceProxy", 1, "failed to get current process name");
    }
    return null;
  }
  
  private void l()
  {
    b = 0;
    j = -1L;
    c = -1L;
    p = false;
  }
  
  protected int a(ToServiceMsg paramToServiceMsg)
    throws RemoteException
  {
    return d.sendToServiceMsg(paramToServiceMsg);
  }
  
  protected FromServiceMsg a(ToServiceMsg paramToServiceMsg, String paramString)
  {
    paramToServiceMsg = com.tencent.mobileqq.msf.core.n.a(paramToServiceMsg);
    paramToServiceMsg.setBusinessFail(1013, paramString);
    return paramToServiceMsg;
  }
  
  void a()
  {
    try
    {
      ComponentName localComponentName = new ComponentName(BaseApplication.getContext().getPackageName(), n);
      Intent localIntent = new Intent();
      localIntent.setComponent(localComponentName);
      BaseApplication.getContext().startService(localIntent);
      if (QLog.isColorLevel()) {
        QLog.d("MSF.D.RemoteServiceProxy", 2, " start service finish");
      }
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  protected void a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    c(paramToServiceMsg, paramFromServiceMsg);
  }
  
  public int b(ToServiceMsg paramToServiceMsg)
  {
    int i1 = 1;
    if (paramToServiceMsg == null) {}
    for (;;)
    {
      return -1;
      if (paramToServiceMsg.getServiceCmd().equals("RegPrxySvc.PbSyncMsg")) {
        paramToServiceMsg.setMsfCommand(MsfCommand.msf_pbSyncMsg);
      }
      if (paramToServiceMsg.getAppSeq() < 0) {
        paramToServiceMsg.setAppSeq(MsfSdkUtils.getNextAppSeq());
      }
      try
      {
        synchronized (e)
        {
          if (h == null)
          {
            HandlerThread localHandlerThread = new HandlerThread("Timeout-Checker", 5);
            localHandlerThread.start();
            h = new Handler(localHandlerThread.getLooper());
          }
          if (h())
          {
            if (paramToServiceMsg.getTimeout() == -1L) {
              paramToServiceMsg.setTimeout(30000L);
            }
            if (paramToServiceMsg.isNeedCallback())
            {
              paramToServiceMsg.addAttribute("appTimeoutReq", Integer.valueOf(l.incrementAndGet()));
              g.put(Integer.valueOf(paramToServiceMsg.getAppSeq()), paramToServiceMsg);
              ??? = new a(paramToServiceMsg);
              if (("LongConn.OffPicUp".equalsIgnoreCase(paramToServiceMsg.getServiceCmd())) || ("ImgStore.GroupPicUp".equalsIgnoreCase(paramToServiceMsg.getServiceCmd())))
              {
                h.postDelayed((Runnable)???, paramToServiceMsg.getTimeout() + 20000L);
                QLog.d("MSF.D.RemoteServiceProxy", 1, "PicUpMsg timer start, appSeq: " + paramToServiceMsg.getAppSeq() + ", delayMillis: " + String.valueOf(paramToServiceMsg.getTimeout() + 20000L));
              }
            }
            else
            {
              if (i1 == 0) {
                break label449;
              }
              if (b > 0)
              {
                long l1 = System.currentTimeMillis();
                if ((-1L != c) && (l1 < c + 120000L))
                {
                  ??? = k();
                  ??? = BaseApplication.getContext().getSharedPreferences("pull_msf_succ" + (String)???, 0).edit();
                  ((SharedPreferences.Editor)???).putString("uin", paramToServiceMsg.getUin());
                  a((SharedPreferences.Editor)???);
                  ((SharedPreferences.Editor)???).commit();
                  QLog.d("MSF.D.RemoteServiceProxy", 1, "succ to pull msf service.");
                }
                l();
              }
              i1 = a(paramToServiceMsg);
              return i1;
            }
          }
          else
          {
            i1 = 0;
          }
        }
      }
      catch (DeadObjectException localDeadObjectException)
      {
        for (;;)
        {
          c(paramToServiceMsg);
          return -1;
          h.postDelayed(localDeadObjectException, paramToServiceMsg.getTimeout() + 2000L);
        }
      }
      catch (Exception localException)
      {
        if (d == null)
        {
          c(paramToServiceMsg);
          return -1;
          label449:
          c(paramToServiceMsg);
          synchronized (e)
          {
            i();
            if ((b <= 10) || (System.currentTimeMillis() <= c + 60000L) || (p)) {
              continue;
            }
            ??? = k();
            ??? = BaseApplication.getContext().getSharedPreferences("pull_msf" + (String)???, 0).edit();
            ((SharedPreferences.Editor)???).putString("uin", paramToServiceMsg.getUin());
            a((SharedPreferences.Editor)???);
            ((SharedPreferences.Editor)???).commit();
            QLog.d("MSF.D.RemoteServiceProxy", 1, "cannot pull msf service.");
            p = true;
            return -1;
          }
        }
        ((Exception)???).printStackTrace();
      }
    }
    return -1;
  }
  
  /* Error */
  boolean b()
  {
    // Byte code:
    //   0: new 343	android/content/ComponentName
    //   3: dup
    //   4: invokestatic 131	com/tencent/qphone/base/util/BaseApplication:getContext	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   7: invokevirtual 346	com/tencent/qphone/base/util/BaseApplication:getPackageName	()Ljava/lang/String;
    //   10: aload_0
    //   11: getfield 89	com/tencent/mobileqq/msf/sdk/n:n	Ljava/lang/String;
    //   14: invokespecial 349	android/content/ComponentName:<init>	(Ljava/lang/String;Ljava/lang/String;)V
    //   17: astore_2
    //   18: new 351	android/content/Intent
    //   21: dup
    //   22: invokespecial 352	android/content/Intent:<init>	()V
    //   25: astore_3
    //   26: aload_3
    //   27: aload_2
    //   28: invokevirtual 356	android/content/Intent:setComponent	(Landroid/content/ComponentName;)Landroid/content/Intent;
    //   31: pop
    //   32: invokestatic 131	com/tencent/qphone/base/util/BaseApplication:getContext	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   35: aload_3
    //   36: aload_0
    //   37: getfield 87	com/tencent/mobileqq/msf/sdk/n:o	Landroid/content/ServiceConnection;
    //   40: iconst_1
    //   41: invokevirtual 528	com/tencent/qphone/base/util/BaseApplication:bindService	(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z
    //   44: istore_1
    //   45: invokestatic 363	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   48: ifeq +42 -> 90
    //   51: ldc 13
    //   53: iconst_2
    //   54: new 148	java/lang/StringBuilder
    //   57: dup
    //   58: invokespecial 149	java/lang/StringBuilder:<init>	()V
    //   61: ldc_w 530
    //   64: invokevirtual 155	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   67: aload_0
    //   68: getfield 89	com/tencent/mobileqq/msf/sdk/n:n	Ljava/lang/String;
    //   71: invokevirtual 155	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   74: ldc_w 532
    //   77: invokevirtual 155	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   80: iload_1
    //   81: invokevirtual 182	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   84: invokevirtual 161	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   87: invokestatic 166	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   90: iload_1
    //   91: ireturn
    //   92: astore_2
    //   93: iconst_0
    //   94: istore_1
    //   95: aload_2
    //   96: invokevirtual 368	java/lang/Exception:printStackTrace	()V
    //   99: iload_1
    //   100: ireturn
    //   101: astore_2
    //   102: goto -7 -> 95
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	105	0	this	n
    //   44	56	1	bool	boolean
    //   17	11	2	localComponentName	ComponentName
    //   92	4	2	localException1	Exception
    //   101	1	2	localException2	Exception
    //   25	11	3	localIntent	Intent
    // Exception table:
    //   from	to	target	type
    //   0	45	92	java/lang/Exception
    //   45	90	101	java/lang/Exception
  }
  
  protected void c(ToServiceMsg paramToServiceMsg)
  {
    f.add(paramToServiceMsg);
  }
  
  protected void c(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    try
    {
      paramToServiceMsg.getActionListener().onRecvFromMsg(paramFromServiceMsg);
      return;
    }
    catch (RemoteException paramToServiceMsg)
    {
      paramToServiceMsg.printStackTrace();
    }
  }
  
  public boolean c()
  {
    try
    {
      ComponentName localComponentName = new ComponentName(BaseApplication.getContext(), n);
      Intent localIntent = new Intent();
      localIntent.setComponent(localComponentName);
      boolean bool = BaseApplication.getContext().stopService(localIntent);
      if (QLog.isColorLevel()) {
        QLog.d("MSF.D.RemoteServiceProxy", 2, " stopService " + n + " service finished " + bool);
      }
      return bool;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
    return false;
  }
  
  protected void d()
  {
    p localP = new p(this);
    localP.setName("handleWaitSendProxyMsgThread");
    localP.start();
  }
  
  public void g()
  {
    try
    {
      BaseApplication.getContext().unbindService(o);
      d = null;
      if (QLog.isColorLevel()) {
        QLog.d("MSF.D.RemoteServiceProxy", 2, " unbindService service finished");
      }
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  protected boolean h()
  {
    return d != null;
  }
  
  public void i()
  {
    long l1 = System.currentTimeMillis();
    if ((i == -1L) || (l1 - i > 10000L))
    {
      i = l1;
      a();
      b();
    }
    do
    {
      long l2;
      do
      {
        for (;;)
        {
          return;
          QLog.d("MSF.D.RemoteServiceProxy", 1, "wait start " + n + " service result, skiped...");
          try
          {
            int i1 = Build.VERSION.SDK_INT;
            if (i1 >= 21)
            {
              QLog.d("MSF.D.RemoteServiceProxy", 1, "sdk version:" + i1);
              l2 = l1 - j;
              if ((j == -1L) || (l2 > 10000L))
              {
                if (b == 0) {
                  c = l1;
                }
                b += 1;
                j = l1;
                if (b % 3 == 2)
                {
                  c();
                  g();
                  QLog.d("MSF.D.RemoteServiceProxy", 1, "pullmsf to stop and unbind service above android 5");
                }
                BaseApplication.getContext().sendBroadcast(new Intent("com.tencent.mobileqq.msf.startmsf"));
                k = 1;
                QLog.d("MSF.D.RemoteServiceProxy", 1, "start MsfService through Broadcast");
              }
              if ((j == -1L) || (l2 <= k * 2000)) {
                continue;
              }
              b();
              k += 1;
              QLog.d("MSF.D.RemoteServiceProxy", 1, "delay binding MSF Service");
            }
          }
          catch (Exception localException)
          {
            QLog.d("MSF.D.RemoteServiceProxy", 1, "start MsfService exception " + localException.toString());
            return;
          }
        }
        l2 = j;
      } while ((j != -1L) && (l1 - l2 <= 10000L));
      if (b == 0) {
        c = l1;
      }
      b += 1;
      j = l1;
    } while (b % 3 != 2);
    c();
    g();
    QLog.d("MSF.D.RemoteServiceProxy", 1, "pullmsf to stop and unbind service below android 5");
  }
  
  protected class a
    implements Runnable
  {
    private ToServiceMsg b;
    
    public a(ToServiceMsg paramToServiceMsg)
    {
      b = paramToServiceMsg;
    }
    
    public void run()
    {
      if (("LongConn.OffPicUp".equalsIgnoreCase(b.getServiceCmd())) || ("ImgStore.GroupPicUp".equalsIgnoreCase(b.getServiceCmd()))) {
        QLog.d("MSF.D.RemoteServiceProxy", 1, "enter MonitorTaskWrapper.run(), appseq is " + b.getAppSeq());
      }
      Object localObject = (ToServiceMsg)n.g.get(Integer.valueOf(b.getAppSeq()));
      if ((localObject != null) && (((ToServiceMsg)localObject).getAttribute("appTimeoutReq", Integer.valueOf(-1)) == b.getAttribute("appTimeoutReq", Integer.valueOf(-2))) && ((ToServiceMsg)n.g.remove(Integer.valueOf(b.getAppSeq())) != null))
      {
        QLog.d("MSF.D.RemoteServiceProxy", 1, "found timeout req, appseq is " + b.getAppSeq());
        localObject = a(b, b.getServiceName() + " timeout");
        a(b, (FromServiceMsg)localObject);
      }
    }
  }
  
  class b
    implements Runnable
  {
    b() {}
    
    public void run()
    {
      try
      {
        long l = System.currentTimeMillis();
        Object localObject = Environment.getExternalStorageDirectory().getPath() + "/tencent/msflogs/com/tencent/mobileqq/" + "com.tencent.mobileqq_PullLog_" + QLog.getLogFileFormatter().format(Long.valueOf(l)) + ".log";
        if (QLog.isColorLevel()) {
          QLog.d("MSF.D.RemoteServiceProxy", 2, "start to store logcat " + (String)localObject);
        }
        localObject = "logcat -b main -b system -b radio -b events -v time -f " + (String)localObject;
        if (QLog.isColorLevel()) {
          QLog.d("MSF.D.RemoteServiceProxy", 2, "start to execute command " + (String)localObject);
        }
        localObject = new BufferedReader(new InputStreamReader(Runtime.getRuntime().exec((String)localObject).getErrorStream()));
        for (;;)
        {
          String str = ((BufferedReader)localObject).readLine();
          if (str == null) {
            break;
          }
          QLog.d("MSF.D.RemoteServiceProxy", 1, "logcat storage error:" + str);
        }
        localException.close();
      }
      catch (Exception localException)
      {
        QLog.d("MSF.D.RemoteServiceProxy", 1, "", localException);
        return;
      }
    }
  }
}
