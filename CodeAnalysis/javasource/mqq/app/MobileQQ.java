package mqq.app;

import android.app.Activity;
import android.app.ActivityManager;
import android.app.ActivityManager.RunningAppProcessInfo;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.os.Process;
import android.text.TextUtils;
import android.util.Pair;
import com.tencent.mobileqq.msf.sdk.MsfSdkUtils;
import com.tencent.mobileqq.msf.sdk.MsfServiceSdk;
import com.tencent.mobileqq.msf.sdk.utils.MonitorSocketStat;
import com.tencent.qphone.base.remote.SimpleAccount;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;
import java.util.Queue;
import java.util.concurrent.atomic.AtomicInteger;
import mqq.util.WeakReference;

public abstract class MobileQQ
  extends BaseApplication
  implements Handler.Callback
{
  public static final int BROADCAST_INFO_LIST_SIZE = 5;
  public static final String KEY_UIN = "uin";
  private static final int MSG_ACCOUNT = 1;
  protected static final int MSG_LAST_UIN = 3;
  private static final int MSG_MONITOR = 2;
  public static final String PACKAGE_NAME = "com.tencent.mobileqq";
  private static final String PREF_KEY = "currentAccount";
  private static final String PREF_SHARE = "share";
  private static final String PROPERTY_NAME = "Properties";
  public static final int STATE_EMPTY = 1;
  public static final int STATE_INITING = 2;
  public static final int STATE_READY = 3;
  public static String processName;
  public static String sInjectResult = null;
  public static MobileQQ sMobileQQ;
  private boolean accountChanged;
  private final List<WeakReference<BaseActivity>> activitys = new ArrayList();
  protected final ArrayList<WeakReference<AppActivity>> appActivities = new ArrayList();
  public Queue<Pair<Long, String>> broadcastInfoQueue = new LinkedList();
  private Runnable doExit = new Runnable()
  {
    public void run()
    {
      if ((activitys.isEmpty()) && (appActivities.isEmpty()) && (otherTypeActivitys.isEmpty()))
      {
        localObject1 = new Intent("mqq.intent.action.EXIT_" + MobileQQ.processName);
        sendBroadcast((Intent)localObject1);
        if (getProcessName().endsWith(":video"))
        {
          mService.msfSub.unbindMsfService();
          mAppRuntime.onDestroy();
        }
        mHandler.postDelayed(new Runnable()
        {
          public void run()
          {
            if (stopMSF)
            {
              mService.msfSub.stopMsfService();
              MobileQQ.killProcess(BaseApplication.getContext(), "com.tencent.mobileqq:MSF");
            }
            if (QLog.isColorLevel())
            {
              QLog.i("mqq", 2, String.format("Application(%s) exit.", new Object[] { MobileQQ.processName }));
              QLog.i("mqq", 2, "===========================================================");
            }
            System.exit(0);
          }
        }, 300L);
        return;
      }
      Object localObject1 = new StringBuffer();
      Iterator localIterator = activitys.iterator();
      Object localObject2;
      while (localIterator.hasNext())
      {
        localObject2 = (BaseActivity)((WeakReference)localIterator.next()).get();
        if (localObject2 != null)
        {
          ((StringBuffer)localObject1).append(localObject2.getClass().getSimpleName());
          ((StringBuffer)localObject1).append(",");
        }
      }
      localIterator = appActivities.iterator();
      while (localIterator.hasNext())
      {
        localObject2 = (AppActivity)((WeakReference)localIterator.next()).get();
        if (localObject2 != null)
        {
          ((StringBuffer)localObject1).append(localObject2.getClass().getSimpleName());
          ((StringBuffer)localObject1).append(",");
        }
      }
      localIterator = otherTypeActivitys.iterator();
      while (localIterator.hasNext())
      {
        localObject2 = (Activity)((WeakReference)localIterator.next()).get();
        if (localObject2 != null)
        {
          ((StringBuffer)localObject1).append(localObject2.getClass().getSimpleName());
          ((StringBuffer)localObject1).append(",");
        }
      }
      if (QLog.isColorLevel()) {
        QLog.i("mqq", 2, "do exit ->" + ((StringBuffer)localObject1).toString());
      }
      ((StringBuffer)localObject1).delete(0, ((StringBuffer)localObject1).length());
      mHandler.postDelayed(this, 50L);
    }
  };
  private boolean isCrashed;
  public boolean isPCActive = false;
  private AppRuntime mAppRuntime;
  final Handler mHandler = new Handler(this);
  private volatile AtomicInteger mRuntimeState = new AtomicInteger(1);
  private MainService mService;
  protected final ArrayList<WeakReference<Activity>> otherTypeActivitys = new ArrayList();
  private final Properties properties = new Properties();
  List<SimpleAccount> sortAccountList = null;
  public String startComponentInfo = null;
  private boolean stopMSF = false;
  private boolean stopMsfOnCrash = false;
  private Handler subHandler;
  
  public MobileQQ() {}
  
  private void exit(final boolean paramBoolean1, boolean paramBoolean2)
  {
    stopMSF = paramBoolean2;
    Object localObject;
    if (getProcessName().endsWith(":video"))
    {
      localObject = mService.msfSub;
      if (paramBoolean1) {
        break label115;
      }
    }
    label115:
    for (paramBoolean2 = true;; paramBoolean2 = false)
    {
      ((MsfServiceSdk)localObject).unRegisterMsfService(Boolean.valueOf(paramBoolean2));
      closeAllActivitys();
      QLog.d("mqq", 1, "exit isCrashed=" + isCrashed + " stopMsfOnCrash=" + stopMsfOnCrash);
      localObject = new Runnable()
      {
        public void run()
        {
          try
          {
            if (mAppRuntime == null) {
              waitAppRuntime(null);
            }
            if (!getProcessName().endsWith(":video"))
            {
              mAppRuntime.onDestroy();
              if (!paramBoolean1) {
                mService.msfSub.unRegisterMsfService();
              }
              mService.msfSub.unbindMsfService();
            }
            if (isCrashed)
            {
              Object localObject = new Intent("mqq.intent.action.EXIT_" + MobileQQ.processName);
              sendBroadcast((Intent)localObject);
              localObject = getProcessName();
              if ((((String)localObject).equals("com.tencent.mobileqq")) && (stopMsfOnCrash))
              {
                QLog.d("mqq", 1, "stop and kill msf service");
                mService.msfSub.stopMsfService();
                MobileQQ.killProcess(BaseApplication.getContext(), "com.tencent.mobileqq:MSF");
                System.exit(0);
                return;
              }
              if (((String)localObject).endsWith(":video")) {
                mAppRuntime.onDestroy();
              }
              System.exit(0);
              return;
            }
          }
          catch (Exception localException)
          {
            if (QLog.isColorLevel())
            {
              QLog.d("mqq", 2, "exit" + localException.getMessage());
              return;
              doExit.run();
            }
          }
        }
      };
      if (Thread.currentThread() == Looper.getMainLooper().getThread()) {
        break;
      }
      mHandler.postAtFrontOfQueue((Runnable)localObject);
      return;
    }
    ((Runnable)localObject).run();
  }
  
  public static MobileQQ getMobileQQ()
  {
    return sMobileQQ;
  }
  
  public static String getShortUinStr(String paramString)
  {
    String str;
    if (paramString == null) {
      str = "";
    }
    do
    {
      return str;
      str = paramString;
    } while (paramString.length() <= 4);
    return paramString.substring(0, 4);
  }
  
  public static boolean killProcess(Context paramContext, String paramString)
  {
    if ((paramContext == null) || (paramString == null)) {}
    ActivityManager.RunningAppProcessInfo localRunningAppProcessInfo;
    do
    {
      while (!paramContext.hasNext())
      {
        do
        {
          return false;
          paramContext = ((ActivityManager)paramContext.getSystemService("activity")).getRunningAppProcesses();
        } while (paramContext == null);
        paramContext = paramContext.iterator();
      }
      localRunningAppProcessInfo = (ActivityManager.RunningAppProcessInfo)paramContext.next();
    } while (!processName.equals(paramString));
    Process.killProcess(pid);
    return true;
  }
  
  private void loadProperites()
  {
    Object localObject7 = null;
    Object localObject8 = null;
    Object localObject1 = null;
    Object localObject6 = null;
    for (;;)
    {
      try
      {
        localFileInputStream = openFileInput("Properties");
        localObject6 = localFileInputStream;
        localObject7 = localFileInputStream;
        localObject8 = localFileInputStream;
        localObject1 = localFileInputStream;
        properties.load(localFileInputStream);
      }
      catch (FileNotFoundException localFileNotFoundException)
      {
        FileInputStream localFileInputStream;
        Object localObject2 = localObject6;
        if (!QLog.isColorLevel()) {
          continue;
        }
        localObject2 = localObject6;
        QLog.d("mqq", 2, "can not loadProperites => file not found");
        localObject2 = localObject6;
        localFileNotFoundException.printStackTrace();
        if (localObject6 == null) {
          continue;
        }
        try
        {
          localObject6.close();
          return;
        }
        catch (IOException localIOException2)
        {
          localIOException2.printStackTrace();
          return;
        }
      }
      catch (IOException localIOException6)
      {
        Object localObject3 = localObject7;
        if (!QLog.isColorLevel()) {
          continue;
        }
        localObject3 = localObject7;
        QLog.d("mqq", 2, "can not loadProperites => IOException");
        localObject3 = localObject7;
        localIOException6.printStackTrace();
        if (localObject7 == null) {
          continue;
        }
        try
        {
          localObject7.close();
          return;
        }
        catch (IOException localIOException3)
        {
          localIOException3.printStackTrace();
          return;
        }
      }
      catch (Exception localException)
      {
        Object localObject4 = localObject8;
        if (!QLog.isColorLevel()) {
          continue;
        }
        localObject4 = localObject8;
        QLog.d("mqq", 2, "can not loadProperites ");
        localObject4 = localObject8;
        localException.printStackTrace();
        if (localObject8 == null) {
          continue;
        }
        try
        {
          localObject8.close();
          return;
        }
        catch (IOException localIOException4)
        {
          localIOException4.printStackTrace();
          return;
        }
      }
      finally
      {
        if (localIOException4 == null) {
          break label192;
        }
      }
      try
      {
        localFileInputStream.close();
        return;
      }
      catch (IOException localIOException1)
      {
        localIOException1.printStackTrace();
        return;
      }
    }
    try
    {
      localIOException4.close();
      label192:
      throw localObject5;
    }
    catch (IOException localIOException5)
    {
      for (;;)
      {
        localIOException5.printStackTrace();
      }
    }
  }
  
  public void QQProcessExit(boolean paramBoolean)
  {
    exit(false, paramBoolean);
  }
  
  void addActivity(BaseActivity paramBaseActivity)
  {
    activitys.add(0, new WeakReference(paramBaseActivity));
  }
  
  public void addOtherTypeActivity(Activity paramActivity) {}
  
  public void closeAllActivitys()
  {
    Runnable local2 = new Runnable()
    {
      public void run()
      {
        try
        {
          i = activitys.size();
          QLog.d("mqq", 1, "closeAllActivitys...BaseActivity count: " + i);
          i -= 1;
          if (i < 0) {
            break label163;
          }
          Object localObject1 = (WeakReference)activitys.get(i);
          if (localObject1 == null) {
            break label408;
          }
          localObject1 = (BaseActivity)((WeakReference)localObject1).get();
          label75:
          if (localObject1 == null) {
            activitys.remove(i);
          } else if (!((Activity)localObject1).isFinishing()) {
            ((Activity)localObject1).finish();
          }
        }
        catch (Exception localException)
        {
          if (QLog.isColorLevel()) {
            QLog.d("mqq", 2, "closeAllActivitys: " + localException.getMessage());
          }
        }
        label145:
        return;
        activitys.remove(i);
        break label401;
        label163:
        int i = appActivities.size();
        QLog.d("mqq", 1, "closeAllActivitys...AppActivity count: " + i);
        i -= 1;
        label203:
        if (i >= 0)
        {
          localObject2 = (WeakReference)appActivities.get(i);
          if (localObject2 == null) {
            break label420;
          }
          localObject2 = (AppActivity)((WeakReference)localObject2).get();
          label234:
          if (localObject2 == null) {
            appActivities.remove(i);
          } else if (!((Activity)localObject2).isFinishing()) {
            ((Activity)localObject2).finish();
          } else {
            appActivities.remove(i);
          }
        }
        else
        {
          i = otherTypeActivitys.size();
          QLog.d("mqq", 1, "closeAllActivitys...other Activity count: " + i);
          i -= 1;
          label322:
          if (i < 0) {
            break label430;
          }
          localObject2 = (WeakReference)otherTypeActivitys.get(i);
          if (localObject2 == null) {
            break label432;
          }
        }
        label401:
        label408:
        label420:
        label425:
        label430:
        label432:
        for (Object localObject2 = (Activity)((WeakReference)localObject2).get();; localObject2 = null)
        {
          if (localObject2 == null)
          {
            otherTypeActivitys.remove(i);
          }
          else if (!((Activity)localObject2).isFinishing())
          {
            ((Activity)localObject2).finish();
          }
          else
          {
            otherTypeActivitys.remove(i);
            break label425;
            i -= 1;
            break;
            localObject2 = null;
            break label75;
            i -= 1;
            break label203;
            localObject2 = null;
            break label234;
          }
          i -= 1;
          break label322;
          break label145;
        }
      }
    };
    if (Thread.currentThread() != Looper.getMainLooper().getThread())
    {
      mHandler.postAtFrontOfQueue(local2);
      return;
    }
    local2.run();
  }
  
  public void crashed()
  {
    isCrashed = true;
  }
  
  void createNewRuntime(final SimpleAccount paramSimpleAccount, final boolean paramBoolean1, final boolean paramBoolean2, final int paramInt, final String paramString)
  {
    QLog.d("MobileQQ", 1, "createNewRuntime" + paramBoolean2 + paramBoolean1 + paramInt + paramString);
    paramSimpleAccount = new Runnable()
    {
      public void run()
      {
        if (mAppRuntime == null) {}
        for (int i = 1;; i = 0)
        {
          localObject1 = createRuntime(MobileQQ.processName);
          if (localObject1 != null) {
            break;
          }
          QLog.i("mqq", 1, MobileQQ.processName + " needn't AppRuntime!");
          return;
        }
        ((AppRuntime)localObject1).init(MobileQQ.this, mService, paramSimpleAccount);
        if (!getProcessName().endsWith(":video")) {
          getServicemsfSub.registerMsfService();
        }
        boolean bool;
        long l3;
        long l1;
        long l2;
        if ((paramSimpleAccount != null) && (paramSimpleAccount.isLogined()))
        {
          bool = true;
          if (paramInt != 2) {
            bool = ((AppRuntime)localObject1).canAutoLogin(paramSimpleAccount.getUin());
          }
          if ((paramBoolean1) || (bool))
          {
            ((AppRuntime)localObject1).setLogined();
            MobileQQ.access$702(MobileQQ.this, ((AppRuntime)localObject1).isLogin());
            if (!((AppRuntime)localObject1).isLogin()) {
              break label611;
            }
            if (mAppRuntime != null)
            {
              mAppRuntime.logout(Constants.LogoutReason.switchAccount, true);
              mAppRuntime.onDestroy();
            }
            if (paramBoolean2)
            {
              localObject2 = getFirstSimpleAccount();
              l3 = System.currentTimeMillis();
              l1 = l3;
              if (localObject2 != null) {
                l2 = l3;
              }
            }
          }
        }
        try
        {
          long l4 = string2Long(getProperty(((SimpleAccount)localObject2).getUin() + Constants.Key._logintime));
          l1 = l3;
          if (l3 <= l4)
          {
            l3 = l4 + 1L;
            l1 = l3;
            l2 = l3;
            if (QLog.isColorLevel())
            {
              l2 = l3;
              QLog.d("mqq", 2, "CNR account savetime => system time is error..shit");
              l1 = l3;
            }
          }
        }
        catch (Exception localException)
        {
          for (;;)
          {
            label451:
            localException.printStackTrace();
            l1 = l2;
          }
        }
        Object localObject2 = ((AppRuntime)localObject1).getAccount();
        if ((localObject2 != null) && (getProcessName().equals(getPackageName())))
        {
          localObject2 = mHandler.obtainMessage(3, localObject2);
          mHandler.sendMessageDelayed((Message)localObject2, 1000L);
        }
        setProperty(((AppRuntime)localObject1).getAccount() + Constants.Key._logintime, String.valueOf(l1));
        ((AppRuntime)localObject1).onCreate(null);
        MobileQQ.access$002(MobileQQ.this, (AppRuntime)localObject1);
        Object localObject1 = mHandler.obtainMessage(1);
        if (i != 0) {}
        for (i = 1;; i = 0)
        {
          arg2 = i;
          arg1 = paramInt;
          obj = paramString;
          if (Looper.getMainLooper() != Looper.myLooper()) {
            break label645;
          }
          mHandler.dispatchMessage((Message)localObject1);
          return;
          QLog.d("MobileQQ", 1, "createNewRuntime" + bool);
          break;
          if (paramSimpleAccount != null)
          {
            QLog.d("MobileQQ", 1, "CNR account != null and account.isLogined =" + paramSimpleAccount.isLogined());
            break;
          }
          QLog.d("MobileQQ", 1, "CNR account == null");
          break;
          label611:
          if (mAppRuntime != null) {
            break label451;
          }
          ((AppRuntime)localObject1).onCreate(null);
          MobileQQ.access$002(MobileQQ.this, (AppRuntime)localObject1);
          break label451;
        }
        label645:
        mHandler.sendMessage((Message)localObject1);
      }
    };
    if (mAppRuntime == null)
    {
      paramSimpleAccount.run();
      return;
    }
    mHandler.post(paramSimpleAccount);
  }
  
  public abstract AppRuntime createRuntime(String paramString);
  
  void dispatchAccountEvent(Constants.LogoutReason paramLogoutReason, int paramInt, boolean paramBoolean, String paramString)
  {
    boolean bool2 = true;
    int j = activitys.size();
    int i;
    label27:
    Object localObject;
    if (paramLogoutReason != null)
    {
      i = 1;
      j -= 1;
      if (j < 0) {
        break label162;
      }
      localObject = (BaseActivity)((WeakReference)activitys.get(j)).get();
      if (localObject != null) {
        break label86;
      }
      activitys.remove(j);
    }
    for (;;)
    {
      j -= 1;
      break label27;
      i = 0;
      break;
      label86:
      if (i == 0)
      {
        ((BaseActivity)localObject).setAppRuntime(mAppRuntime);
        if (accountChanged)
        {
          QLog.d("MobileQQ", 1, "dispatchAE  onAccountChanged");
          ((BaseActivity)localObject).onAccountChanged();
        }
        else
        {
          QLog.d("MobileQQ", 1, "dispatchAE  onAccoutChangeFailed");
          ((BaseActivity)localObject).onAccoutChangeFailed();
        }
      }
      else
      {
        QLog.d("MobileQQ", 1, "dispatchAE  onLogou");
        ((BaseActivity)localObject).onLogout(paramLogoutReason);
      }
    }
    label162:
    j = appActivities.size() - 1;
    if (j >= 0)
    {
      localObject = (AppActivity)((WeakReference)appActivities.get(j)).get();
      if (localObject == null) {
        appActivities.remove(j);
      }
      for (;;)
      {
        j -= 1;
        break;
        if (i == 0)
        {
          ((AppActivity)localObject).setAppRuntime(mAppRuntime);
          if (accountChanged)
          {
            QLog.d("MobileQQ", 1, "dispatchAE  onAccountChanged");
            ((AppActivity)localObject).onAccountChanged();
          }
          else
          {
            QLog.d("MobileQQ", 1, "dispatchAE  onAccoutChangeFailed");
            ((AppActivity)localObject).onAccoutChangeFailed();
          }
        }
        else
        {
          QLog.d("MobileQQ", 1, "dispatchAE  onLogou");
          ((AppActivity)localObject).onLogout(paramLogoutReason);
        }
      }
    }
    paramLogoutReason = mAppRuntime;
    if ((AppActivity.sResumeCount <= 0) && (BaseActivity.sResumeCount <= 0))
    {
      bool1 = true;
      isBackground_Pause = bool1;
      paramLogoutReason = mAppRuntime;
      if (Foreground.sCountActivity > 0) {
        break label470;
      }
    }
    label470:
    for (boolean bool1 = bool2;; bool1 = false)
    {
      isBackground_Stop = bool1;
      if (getPackageName().equals(getProcessName()))
      {
        if (i != 0) {
          break label476;
        }
        if (accountChanged)
        {
          paramLogoutReason = new Intent("mqq.intent.action.ACCOUNT_CHANGED");
          paramLogoutReason.putExtra("account", mAppRuntime.getAccount());
          paramLogoutReason.putExtra("type", paramInt);
          sendBroadcast(paramLogoutReason);
          if (!paramBoolean)
          {
            paramLogoutReason = new Intent("mqq.intent.action.EXIT_" + getMobileQQ().getPackageName());
            paramLogoutReason.putExtra("K_EXCEP", paramString);
            sendBroadcast(paramLogoutReason);
          }
        }
      }
      return;
      bool1 = false;
      break;
    }
    label476:
    sendBroadcast(new Intent("mqq.intent.action.LOGOUT"));
  }
  
  /* Error */
  public final void doInit(boolean paramBoolean)
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 129	mqq/app/MobileQQ:mRuntimeState	Ljava/util/concurrent/atomic/AtomicInteger;
    //   4: iconst_1
    //   5: iconst_2
    //   6: invokevirtual 495	java/util/concurrent/atomic/AtomicInteger:compareAndSet	(II)Z
    //   9: ifne +4 -> 13
    //   12: return
    //   13: aload_0
    //   14: getstatic 496	mqq/app/MobileQQ:processName	Ljava/lang/String;
    //   17: invokevirtual 499	mqq/app/MobileQQ:isNeedMSF	(Ljava/lang/String;)Z
    //   20: istore_2
    //   21: ldc -48
    //   23: iconst_1
    //   24: new 210	java/lang/StringBuilder
    //   27: dup
    //   28: invokespecial 211	java/lang/StringBuilder:<init>	()V
    //   31: ldc_w 501
    //   34: invokevirtual 217	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   37: getstatic 496	mqq/app/MobileQQ:processName	Ljava/lang/String;
    //   40: invokevirtual 217	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   43: invokevirtual 225	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   46: invokestatic 231	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   49: getstatic 496	mqq/app/MobileQQ:processName	Ljava/lang/String;
    //   52: ldc_w 503
    //   55: invokevirtual 185	java/lang/String:endsWith	(Ljava/lang/String;)Z
    //   58: ifne +245 -> 303
    //   61: iload_2
    //   62: ifeq +241 -> 303
    //   65: aload_0
    //   66: invokespecial 505	mqq/app/MobileQQ:loadProperites	()V
    //   69: aload_0
    //   70: new 187	mqq/app/MainService
    //   73: dup
    //   74: aload_0
    //   75: aload_0
    //   76: getstatic 496	mqq/app/MobileQQ:processName	Ljava/lang/String;
    //   79: invokevirtual 509	mqq/app/MobileQQ:getAppId	(Ljava/lang/String;)I
    //   82: aload_0
    //   83: getstatic 496	mqq/app/MobileQQ:processName	Ljava/lang/String;
    //   86: invokevirtual 512	mqq/app/MobileQQ:getBootBroadcastName	(Ljava/lang/String;)Ljava/lang/String;
    //   89: iload_1
    //   90: invokespecial 515	mqq/app/MainService:<init>	(Lmqq/app/MobileQQ;ILjava/lang/String;Z)V
    //   93: putfield 155	mqq/app/MobileQQ:mService	Lmqq/app/MainService;
    //   96: aload_0
    //   97: invokevirtual 177	mqq/app/MobileQQ:getProcessName	()Ljava/lang/String;
    //   100: ldc -77
    //   102: invokevirtual 185	java/lang/String:endsWith	(Ljava/lang/String;)Z
    //   105: ifne +13 -> 118
    //   108: aload_0
    //   109: getfield 155	mqq/app/MobileQQ:mService	Lmqq/app/MainService;
    //   112: getfield 191	mqq/app/MainService:msfSub	Lcom/tencent/mobileqq/msf/sdk/MsfServiceSdk;
    //   115: invokevirtual 518	com/tencent/mobileqq/msf/sdk/MsfServiceSdk:initMsfService	()V
    //   118: aload_0
    //   119: invokevirtual 521	mqq/app/MobileQQ:getAllAccounts	()Ljava/util/List;
    //   122: astore_3
    //   123: aload_3
    //   124: ifnull +258 -> 382
    //   127: aload_3
    //   128: iconst_0
    //   129: invokeinterface 399 2 0
    //   134: checkcast 523	com/tencent/qphone/base/remote/SimpleAccount
    //   137: astore_3
    //   138: aload_3
    //   139: astore 4
    //   141: aload_3
    //   142: ifnonnull +136 -> 278
    //   145: ldc -48
    //   147: iconst_1
    //   148: ldc_w 525
    //   151: invokestatic 231	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   154: aload_0
    //   155: ldc 46
    //   157: iconst_0
    //   158: invokevirtual 529	mqq/app/MobileQQ:getSharedPreferences	(Ljava/lang/String;I)Landroid/content/SharedPreferences;
    //   161: astore 6
    //   163: aload_3
    //   164: astore 4
    //   166: aload 6
    //   168: ifnull +110 -> 278
    //   171: aload 6
    //   173: ldc 43
    //   175: aconst_null
    //   176: invokeinterface 535 3 0
    //   181: astore 5
    //   183: invokestatic 347	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   186: ifeq +30 -> 216
    //   189: ldc -48
    //   191: iconst_1
    //   192: new 210	java/lang/StringBuilder
    //   195: dup
    //   196: invokespecial 211	java/lang/StringBuilder:<init>	()V
    //   199: ldc_w 537
    //   202: invokevirtual 217	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   205: aload 5
    //   207: invokevirtual 217	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   210: invokevirtual 225	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   213: invokestatic 231	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   216: aload_3
    //   217: astore 4
    //   219: aload 5
    //   221: ifnull +57 -> 278
    //   224: aload 6
    //   226: invokeinterface 541 1 0
    //   231: ldc 43
    //   233: invokeinterface 546 2 0
    //   238: invokeinterface 549 1 0
    //   243: pop
    //   244: new 523	com/tencent/qphone/base/remote/SimpleAccount
    //   247: dup
    //   248: invokespecial 550	com/tencent/qphone/base/remote/SimpleAccount:<init>	()V
    //   251: astore 4
    //   253: aload 4
    //   255: aload 5
    //   257: invokevirtual 553	com/tencent/qphone/base/remote/SimpleAccount:setUin	(Ljava/lang/String;)V
    //   260: aload 4
    //   262: invokevirtual 556	com/tencent/qphone/base/remote/SimpleAccount:isLogined	()Z
    //   265: pop
    //   266: aload 4
    //   268: ldc_w 558
    //   271: iconst_1
    //   272: invokestatic 561	java/lang/String:valueOf	(Z)Ljava/lang/String;
    //   275: invokevirtual 565	com/tencent/qphone/base/remote/SimpleAccount:setAttribute	(Ljava/lang/String;Ljava/lang/String;)V
    //   278: iconst_0
    //   279: istore_1
    //   280: getstatic 496	mqq/app/MobileQQ:processName	Ljava/lang/String;
    //   283: ldc 40
    //   285: invokevirtual 314	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   288: ifeq +5 -> 293
    //   291: iconst_1
    //   292: istore_1
    //   293: aload_0
    //   294: aload 4
    //   296: iconst_0
    //   297: iload_1
    //   298: iconst_5
    //   299: aconst_null
    //   300: invokevirtual 567	mqq/app/MobileQQ:createNewRuntime	(Lcom/tencent/qphone/base/remote/SimpleAccount;ZZILjava/lang/String;)V
    //   303: aload_0
    //   304: new 457	android/content/Intent
    //   307: dup
    //   308: new 210	java/lang/StringBuilder
    //   311: dup
    //   312: invokespecial 211	java/lang/StringBuilder:<init>	()V
    //   315: ldc_w 569
    //   318: invokevirtual 217	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   321: getstatic 496	mqq/app/MobileQQ:processName	Ljava/lang/String;
    //   324: invokevirtual 217	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   327: invokevirtual 225	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   330: invokespecial 462	android/content/Intent:<init>	(Ljava/lang/String;)V
    //   333: invokevirtual 480	mqq/app/MobileQQ:sendBroadcast	(Landroid/content/Intent;)V
    //   336: aload_0
    //   337: getfield 129	mqq/app/MobileQQ:mRuntimeState	Ljava/util/concurrent/atomic/AtomicInteger;
    //   340: astore_3
    //   341: aload_3
    //   342: monitorenter
    //   343: aload_0
    //   344: getfield 129	mqq/app/MobileQQ:mRuntimeState	Ljava/util/concurrent/atomic/AtomicInteger;
    //   347: iconst_3
    //   348: invokevirtual 572	java/util/concurrent/atomic/AtomicInteger:set	(I)V
    //   351: aload_0
    //   352: getfield 129	mqq/app/MobileQQ:mRuntimeState	Ljava/util/concurrent/atomic/AtomicInteger;
    //   355: invokevirtual 577	java/lang/Object:notifyAll	()V
    //   358: aload_3
    //   359: monitorexit
    //   360: ldc -48
    //   362: iconst_1
    //   363: ldc_w 579
    //   366: invokestatic 231	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   369: aload_0
    //   370: getfield 136	mqq/app/MobileQQ:mHandler	Landroid/os/Handler;
    //   373: iconst_2
    //   374: ldc2_w 580
    //   377: invokevirtual 585	android/os/Handler:sendEmptyMessageDelayed	(IJ)Z
    //   380: pop
    //   381: return
    //   382: aconst_null
    //   383: astore_3
    //   384: goto -246 -> 138
    //   387: astore 4
    //   389: aload_3
    //   390: monitorexit
    //   391: aload 4
    //   393: athrow
    //   394: astore_3
    //   395: ldc -48
    //   397: iconst_1
    //   398: ldc_w 587
    //   401: aload_3
    //   402: invokestatic 591	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   405: new 593	java/lang/RuntimeException
    //   408: dup
    //   409: aload_3
    //   410: invokespecial 596	java/lang/RuntimeException:<init>	(Ljava/lang/Throwable;)V
    //   413: athrow
    //   414: astore 4
    //   416: aload_0
    //   417: getfield 129	mqq/app/MobileQQ:mRuntimeState	Ljava/util/concurrent/atomic/AtomicInteger;
    //   420: astore_3
    //   421: aload_3
    //   422: monitorenter
    //   423: aload_0
    //   424: getfield 129	mqq/app/MobileQQ:mRuntimeState	Ljava/util/concurrent/atomic/AtomicInteger;
    //   427: iconst_3
    //   428: invokevirtual 572	java/util/concurrent/atomic/AtomicInteger:set	(I)V
    //   431: aload_0
    //   432: getfield 129	mqq/app/MobileQQ:mRuntimeState	Ljava/util/concurrent/atomic/AtomicInteger;
    //   435: invokevirtual 577	java/lang/Object:notifyAll	()V
    //   438: aload_3
    //   439: monitorexit
    //   440: ldc -48
    //   442: iconst_1
    //   443: ldc_w 579
    //   446: invokestatic 231	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   449: aload_0
    //   450: getfield 136	mqq/app/MobileQQ:mHandler	Landroid/os/Handler;
    //   453: iconst_2
    //   454: ldc2_w 580
    //   457: invokevirtual 585	android/os/Handler:sendEmptyMessageDelayed	(IJ)Z
    //   460: pop
    //   461: aload 4
    //   463: athrow
    //   464: astore 4
    //   466: aload_3
    //   467: monitorexit
    //   468: aload 4
    //   470: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	471	0	this	MobileQQ
    //   0	471	1	paramBoolean	boolean
    //   20	42	2	bool	boolean
    //   394	16	3	localThrowable	Throwable
    //   139	156	4	localObject2	Object
    //   387	5	4	localObject3	Object
    //   414	48	4	localObject4	Object
    //   464	5	4	localObject5	Object
    //   181	75	5	str	String
    //   161	64	6	localSharedPreferences	SharedPreferences
    // Exception table:
    //   from	to	target	type
    //   343	360	387	finally
    //   389	391	387	finally
    //   13	61	394	java/lang/Throwable
    //   65	118	394	java/lang/Throwable
    //   118	123	394	java/lang/Throwable
    //   127	138	394	java/lang/Throwable
    //   145	163	394	java/lang/Throwable
    //   171	216	394	java/lang/Throwable
    //   224	278	394	java/lang/Throwable
    //   280	291	394	java/lang/Throwable
    //   293	303	394	java/lang/Throwable
    //   303	336	394	java/lang/Throwable
    //   13	61	414	finally
    //   65	118	414	finally
    //   118	123	414	finally
    //   127	138	414	finally
    //   145	163	414	finally
    //   171	216	414	finally
    //   224	278	414	finally
    //   280	291	414	finally
    //   293	303	414	finally
    //   303	336	414	finally
    //   395	414	414	finally
    //   423	440	464	finally
    //   466	468	464	finally
  }
  
  public List<SimpleAccount> getAllAccounts()
  {
    if (sortAccountList == null)
    {
      ArrayList localArrayList = MsfSdkUtils.getLoginedAccountList();
      if ((localArrayList != null) && (!localArrayList.isEmpty())) {
        sortAccountList = localArrayList;
      }
    }
    if ((sortAccountList != null) && (sortAccountList.size() > 0))
    {
      Collections.sort(sortAccountList, new Comparator()
      {
        public int compare(SimpleAccount paramAnonymousSimpleAccount1, SimpleAccount paramAnonymousSimpleAccount2)
        {
          long l1 = string2Long(getProperty(paramAnonymousSimpleAccount1.getUin() + Constants.Key._logintime));
          long l2 = string2Long(getProperty(paramAnonymousSimpleAccount2.getUin() + Constants.Key._logintime));
          if ((paramAnonymousSimpleAccount1 != null) && (QLog.isColorLevel())) {
            QLog.d("mqq", 2, "a1.getUin() = " + paramAnonymousSimpleAccount1.getUin() + ";key.time = " + l1);
          }
          if ((paramAnonymousSimpleAccount2 != null) && (QLog.isColorLevel())) {
            QLog.d("mqq", 2, "a2.getUin() = " + paramAnonymousSimpleAccount2.getUin() + ";key.time = " + l2);
          }
          if (l2 > l1) {
            return 1;
          }
          return -1;
        }
      });
      return Collections.unmodifiableList(sortAccountList);
    }
    if (QLog.isColorLevel()) {
      QLog.w("mqq", 2, "Account list is NULL!");
    }
    return null;
  }
  
  public List<SimpleAccount> getAllNotSynAccountList()
  {
    return sortAccountList;
  }
  
  public abstract int getAppId(String paramString);
  
  public AppRuntime getAppRuntime(String paramString)
    throws AccountNotMatchException
  {
    AppRuntime localAppRuntime = waitAppRuntime(null);
    if ((paramString != null) && (paramString.equals(localAppRuntime.getAccount()))) {}
    while (paramString == localAppRuntime.getAccount()) {
      return localAppRuntime;
    }
    throw new AccountNotMatchException(localAppRuntime.getAccount(), paramString);
  }
  
  public abstract String getBootBroadcastName(String paramString);
  
  public SimpleAccount getFirstSimpleAccount()
  {
    List localList = getAllAccounts();
    if ((localList == null) || (localList.size() == 0)) {
      return null;
    }
    return (SimpleAccount)localList.get(0);
  }
  
  public String getProcessName()
  {
    if (processName == null)
    {
      int i = 0;
      String str2;
      do
      {
        str2 = MsfSdkUtils.getProcessName(this);
        i += 1;
      } while ((i < 3) && ("unknown".equals(str2)));
      String str1 = str2;
      if ("unknown".equals(str2)) {
        str1 = "com.tencent.mobileqq";
      }
      processName = str1;
    }
    return processName;
  }
  
  public String getProperty(String paramString)
  {
    return properties.getProperty(paramString);
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    switch (what)
    {
    }
    SharedPreferences localSharedPreferences;
    do
    {
      return true;
      int i = arg1;
      if (arg2 == 1) {}
      for (boolean bool = true;; bool = false)
      {
        dispatchAccountEvent(null, i, bool, (String)obj);
        return true;
      }
      monitor.setProcessName(processName);
      try
      {
        monitor.start();
        return true;
      }
      catch (Throwable paramMessage)
      {
        QLog.d("mqq", 1, "", paramMessage);
        return true;
      }
      paramMessage = (String)obj;
      localSharedPreferences = getSharedPreferences("Last_Login", 4);
    } while (localSharedPreferences.getString("uin", "").equals(paramMessage));
    localSharedPreferences.edit().putString("uin", paramMessage).commit();
    return true;
  }
  
  public abstract boolean isNeedMSF(String paramString);
  
  public boolean isRuntimeReady()
  {
    return mRuntimeState.get() == 3;
  }
  
  public boolean onActivityCreate(Object paramObject, Intent paramIntent)
  {
    return false;
  }
  
  public void onActivityFocusChanged(AppActivity paramAppActivity, boolean paramBoolean) {}
  
  public void onCreate()
  {
    sMobileQQ = this;
    super.onCreate();
  }
  
  public void otherProcessExit(boolean paramBoolean)
  {
    exit(paramBoolean, false);
  }
  
  public List<SimpleAccount> refreAccountList()
  {
    ArrayList localArrayList = MsfSdkUtils.getLoginedAccountList();
    if ((localArrayList != null) && (!localArrayList.isEmpty())) {
      sortAccountList = localArrayList;
    }
    if ((sortAccountList != null) && (sortAccountList.size() > 0))
    {
      Collections.sort(sortAccountList, new Comparator()
      {
        public int compare(SimpleAccount paramAnonymousSimpleAccount1, SimpleAccount paramAnonymousSimpleAccount2)
        {
          long l = string2Long(getProperty(paramAnonymousSimpleAccount1.getUin() + Constants.Key._logintime));
          if (string2Long(getProperty(paramAnonymousSimpleAccount2.getUin() + Constants.Key._logintime)) > l) {
            return 1;
          }
          return -1;
        }
      });
      return Collections.unmodifiableList(sortAccountList);
    }
    if (QLog.isColorLevel()) {
      QLog.d("mqq", 2, "refreAccountList Account list is NULL!");
    }
    return sortAccountList;
  }
  
  void removeActivity(BaseActivity paramBaseActivity)
  {
    activitys.remove(new WeakReference(paramBaseActivity));
  }
  
  public void removeOtherTypeActivity(Activity paramActivity) {}
  
  public void reportPCActive(String paramString, int paramInt) {}
  
  public void setAutoLogin(boolean paramBoolean)
  {
    if ((mAppRuntime != null) && (mAppRuntime.getAccount() != null) && (mAppRuntime.getAccount().length() > 0)) {
      mAppRuntime.setAutoLogin(paramBoolean);
    }
  }
  
  public void setProperty(String arg1, String paramString2)
  {
    properties.setProperty(???, paramString2);
    if (subHandler == null) {}
    synchronized (properties)
    {
      if (subHandler == null)
      {
        paramString2 = new HandlerThread("property-saver");
        paramString2.start();
        subHandler = new Handler(paramString2.getLooper());
      }
      subHandler.post(new Runnable()
      {
        public void run()
        {
          Object localObject3 = null;
          Object localObject1 = null;
          for (;;)
          {
            try
            {
              localFileOutputStream = openFileOutput("Properties", 0);
              localObject1 = localFileOutputStream;
              localObject3 = localFileOutputStream;
              properties.store(localFileOutputStream, null);
              localObject1 = localFileOutputStream;
              localObject3 = localFileOutputStream;
              localFileOutputStream.flush();
            }
            catch (Exception localException)
            {
              FileOutputStream localFileOutputStream;
              localObject3 = localIOException1;
              localException.printStackTrace();
              if (localIOException1 == null) {
                continue;
              }
              try
              {
                localIOException1.close();
                return;
              }
              catch (IOException localIOException2)
              {
                localIOException2.printStackTrace();
                return;
              }
            }
            finally
            {
              if (localObject3 == null) {
                break label85;
              }
            }
            try
            {
              localFileOutputStream.close();
              return;
            }
            catch (IOException localIOException1)
            {
              localIOException1.printStackTrace();
              return;
            }
          }
          try
          {
            localObject3.close();
            label85:
            throw localObject2;
          }
          catch (IOException localIOException3)
          {
            for (;;)
            {
              localIOException3.printStackTrace();
            }
          }
        }
      });
      return;
    }
  }
  
  public void setSortAccountList(List<SimpleAccount> paramList)
  {
    if ((paramList != null) && (!paramList.isEmpty()))
    {
      Collections.sort(paramList, new Comparator()
      {
        public int compare(SimpleAccount paramAnonymousSimpleAccount1, SimpleAccount paramAnonymousSimpleAccount2)
        {
          long l = string2Long(getProperty(paramAnonymousSimpleAccount1.getUin() + Constants.Key._logintime));
          if (string2Long(getProperty(paramAnonymousSimpleAccount2.getUin() + Constants.Key._logintime)) > l) {
            return 1;
          }
          return -1;
        }
      });
      sortAccountList = paramList;
    }
    if (QLog.isColorLevel()) {
      QLog.d("mqq", 2, "sort AccountList" + sortAccountList);
    }
  }
  
  public void startService()
  {
    if (mService != null) {
      mService.start();
    }
  }
  
  public void stopMsfOnCrash(boolean paramBoolean)
  {
    stopMsfOnCrash = paramBoolean;
    if (stopMsfOnCrash) {
      QLog.d("mqq", 1, "stop and kill msf stopMsfOnCrash=" + stopMsfOnCrash);
    }
    try
    {
      mService.msfSub.unRegisterMsfService();
    }
    catch (Throwable localThrowable1)
    {
      try
      {
        for (;;)
        {
          mService.msfSub.unbindMsfService();
          mService.msfSub.stopMsfService();
          try
          {
            killProcess(getContext(), "com.tencent.mobileqq:MSF");
            return;
          }
          catch (Throwable localThrowable3)
          {
            localThrowable3.printStackTrace();
          }
          localThrowable1 = localThrowable1;
          localThrowable1.printStackTrace();
        }
      }
      catch (Throwable localThrowable2)
      {
        for (;;)
        {
          localThrowable2.printStackTrace();
        }
      }
    }
  }
  
  public long string2Long(String paramString)
  {
    if (TextUtils.isEmpty(paramString))
    {
      if (QLog.isColorLevel()) {
        QLog.w("mqq", 2, "string2Long number is empty");
      }
      return 0L;
    }
    try
    {
      long l = Long.parseLong(paramString);
      return l;
    }
    catch (Exception paramString)
    {
      if (QLog.isColorLevel()) {
        QLog.w("mqq", 2, "string2Long catch exception");
      }
      paramString.printStackTrace();
    }
    return 0L;
  }
  
  public AppRuntime waitAppRuntime(BaseActivity arg1)
  {
    int i = mRuntimeState.get();
    if (i != 3) {
      if (i == 1)
      {
        QLog.e("mqq", 1, "waitInit when empty: ", new RuntimeException(""));
        doInit(true);
      }
    }
    synchronized (mRuntimeState)
    {
      i = mRuntimeState.get();
      if (i == 2) {}
      try
      {
        mRuntimeState.wait();
        return mAppRuntime;
      }
      catch (InterruptedException localInterruptedException)
      {
        for (;;)
        {
          localInterruptedException.printStackTrace();
          QLog.e("mqq", 1, "waitInit failed", localInterruptedException);
        }
      }
    }
  }
}
