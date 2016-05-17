package com.tencent.qphone.base.util;

import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.os.Build;
import android.os.Build.VERSION;
import android.os.Environment;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.os.Process;
import android.util.Log;
import com.tencent.commonsdk.pool.RecyclablePool;
import com.tencent.commonsdk.pool.RecyclablePool.Recyclable;
import com.tencent.mobileqq.msf.sdk.MsfSdkUtils;
import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashSet;

public class QLog
{
  public static final int CLR = 2;
  public static final int DEV = 4;
  private static final int[] INTERVAL_RETRY_INIT;
  private static final int MSG_INIT_WRITER = 1;
  private static final int MSG_WRITE = 2;
  private static final String QlogSpTag = "QLog";
  private static final String ReportLogSelfTimeTag = "";
  public static final String TAG_REPORTLEVEL_COLORUSER = "W";
  public static final String TAG_REPORTLEVEL_DEVELOPER = "D";
  public static final String TAG_REPORTLEVEL_USER = "E";
  private static int UIN_REPORTLOG_LEVEL = 0;
  public static final int USR = 1;
  protected static int _DEFAULT_REPORTLOG_LEVEL = 0;
  static long colorLogTime = 0L;
  static HashSet colorTags;
  private static long currentLogSecond = 0L;
  protected static final boolean isDebug = false;
  protected static boolean isLogToFile = true;
  private static long lastPrintMemeoryTime = 0L;
  public static final String logLevelHead = "LOGLEVEL_";
  public static final String logLevelTime = "LOGLEVELTIME";
  private static String logPath;
  public static final String logSaveTime = "LOGSAVETIME";
  private static String logTime;
  private static final int myProcessId;
  private static long nextHourTime = 0L;
  private static String oldLogPath;
  public static String packageName;
  private static String processName;
  private static int retryInitTimes = 0;
  static String sBuildNumber;
  private static StringBuilder sBuilder;
  private static b sHead = null;
  private static RecyclablePool sPool;
  private static b sTail = null;
  static Field sValueField;
  private static char[] sValues;
  static c sWriteHandler;
  private static final String tag = "MSF.D.QLog";
  private static BufferedWriter writer;
  
  static
  {
    sBuildNumber = "";
    sBuilder = new StringBuilder(10240);
    sValues = null;
    sValueField = null;
    _DEFAULT_REPORTLOG_LEVEL = 1;
    UIN_REPORTLOG_LEVEL = _DEFAULT_REPORTLOG_LEVEL;
    logPath = "";
    oldLogPath = "";
    processName = "";
    packageName = "";
    myProcessId = Process.myPid();
    lastPrintMemeoryTime = 0L;
    INTERVAL_RETRY_INIT = new int[] { 1, 1, 2, 2, 4, 4, 8, 16, 29 };
    retryInitTimes = 0;
    logTime = "";
    colorTags = new HashSet();
  }
  
  public QLog() {}
  
  private static void addLogItem(String arg0, int paramInt, String paramString2, Throwable paramThrowable)
  {
    long l = System.currentTimeMillis();
    if ((colorLogTime != 0L) && (l - colorLogTime > 1800000L))
    {
      colorLogTime = 0L;
      colorTags.clear();
    }
    b localB = (b)sPool.obtain(b.class);
    a = l;
    b = Thread.currentThread().getId();
    c = paramInt;
    d = ???;
    e = paramString2;
    f = paramThrowable;
    synchronized (processName)
    {
      if (sHead == null)
      {
        sHead = localB;
        sTail = localB;
        return;
      }
      sTail.changeNext(localB, true);
      sTail = localB;
    }
  }
  
  public static void d(String paramString1, int paramInt, String paramString2)
  {
    d(paramString1, paramInt, paramString2, null);
  }
  
  public static void d(String paramString1, int paramInt, String paramString2, Throwable paramThrowable)
  {
    String str;
    if ((UIN_REPORTLOG_LEVEL >= paramInt) || (colorTags.contains(paramString1)))
    {
      str = paramString2;
      if (paramString2 == null) {
        str = "";
      }
      if (paramThrowable != null) {
        break label48;
      }
      Log.d(paramString1, str);
    }
    for (;;)
    {
      addLogItem(paramString1, paramInt, str, paramThrowable);
      return;
      label48:
      Log.d(paramString1, str, paramThrowable);
    }
  }
  
  public static void d(String paramString, int paramInt, Throwable paramThrowable, Object... paramVarArgs)
  {
    int j = 0;
    int k = paramVarArgs.length;
    if (paramThrowable == null) {}
    StringBuilder localStringBuilder;
    for (int i = 0;; i = 128)
    {
      localStringBuilder = new StringBuilder(i + k * 30);
      i = j;
      while (i < paramVarArgs.length)
      {
        localStringBuilder.append(paramVarArgs[i].toString());
        i += 1;
      }
    }
    d(paramString, paramInt, localStringBuilder.toString(), paramThrowable);
  }
  
  public static void d(String paramString, int paramInt, Object... paramVarArgs)
  {
    d(paramString, paramInt, null, paramVarArgs);
  }
  
  public static void doReportLogSelf(int paramInt, String paramString1, String paramString2)
  {
    int i = 0;
    Object localObject = BaseApplication.getContext().getSharedPreferences("QLog", 0);
    long l = ((SharedPreferences)localObject).getLong("", -1L);
    if ((l == -1L) || (System.currentTimeMillis() - l > 3600000L))
    {
      localObject = ((SharedPreferences)localObject).edit();
      ((SharedPreferences.Editor)localObject).putLong("", System.currentTimeMillis());
      ((SharedPreferences.Editor)localObject).commit();
      i = 1;
    }
    if (i != 0)
    {
      paramString1 = new f(paramInt, paramString1, paramString2);
      paramString1.setName("doReportLogSelfThread");
      paramString1.start();
    }
  }
  
  public static void e(String paramString1, int paramInt, String paramString2)
  {
    e(paramString1, paramInt, paramString2, null);
  }
  
  public static void e(String paramString1, int paramInt, String paramString2, Throwable paramThrowable)
  {
    String str;
    if ((UIN_REPORTLOG_LEVEL >= paramInt) || (colorTags.contains(paramString1)))
    {
      str = paramString2;
      if (paramString2 == null) {
        str = "";
      }
      if (paramThrowable != null) {
        break label48;
      }
      Log.e(paramString1, str);
    }
    for (;;)
    {
      addLogItem(paramString1, paramInt, str, paramThrowable);
      return;
      label48:
      Log.e(paramString1, str, paramThrowable);
    }
  }
  
  public static void e(String paramString, int paramInt, Throwable paramThrowable, Object... paramVarArgs)
  {
    int j = 0;
    int k = paramVarArgs.length;
    if (paramThrowable == null) {}
    StringBuilder localStringBuilder;
    for (int i = 0;; i = 128)
    {
      localStringBuilder = new StringBuilder(i + k * 30);
      i = j;
      while (i < paramVarArgs.length)
      {
        localStringBuilder.append(paramVarArgs[i].toString());
        i += 1;
      }
    }
    e(paramString, paramInt, localStringBuilder.toString(), paramThrowable);
  }
  
  public static void e(String paramString, int paramInt, Object... paramVarArgs)
  {
    e(paramString, paramInt, null, paramVarArgs);
  }
  
  public static void endColorLog(String[] paramArrayOfString, int paramInt, boolean paramBoolean, String paramString)
  {
    int j = paramArrayOfString.length;
    int i = 0;
    while (i < j)
    {
      String str = paramArrayOfString[i];
      colorTags.remove(str);
      i += 1;
    }
    if (paramBoolean) {
      doReportLogSelf(paramInt, "mobileqq", paramString);
    }
  }
  
  public static void flushLog()
  {
    sWriteHandler.sendEmptyMessage(2);
    sWriteHandler.sendEmptyMessageDelayed(2, 20L);
    sWriteHandler.sendEmptyMessageDelayed(2, 80L);
    sWriteHandler.sendEmptyMessageDelayed(2, 160L);
    sWriteHandler.sendEmptyMessageDelayed(2, 320L);
  }
  
  public static SimpleDateFormat getLogFileFormatter()
  {
    return new SimpleDateFormat("yy.MM.dd.HH");
  }
  
  public static String getLogFileName(String paramString)
  {
    return processName.replace(":", "_") + "." + paramString + ".log";
  }
  
  public static String getLogPath()
  {
    return logPath;
  }
  
  public static String getOldLogPath()
  {
    return oldLogPath;
  }
  
  public static String getReportLevel(int paramInt)
  {
    switch (paramInt)
    {
    case 3: 
    default: 
      return "E";
    case 2: 
      return "W";
    case 4: 
      return "D";
    }
    return "E";
  }
  
  public static String getStackTraceString(Throwable paramThrowable)
  {
    return MsfSdkUtils.getStackTraceString(paramThrowable);
  }
  
  public static char[] getStringValue(StringBuilder paramStringBuilder)
  {
    try
    {
      if (sValueField == null)
      {
        sValueField = StringBuilder.class.getSuperclass().getDeclaredField("value");
        sValueField.setAccessible(true);
      }
      paramStringBuilder = (char[])sValueField.get(paramStringBuilder);
      return paramStringBuilder;
    }
    catch (NoSuchFieldException paramStringBuilder)
    {
      paramStringBuilder.printStackTrace();
      return null;
    }
    catch (IllegalArgumentException paramStringBuilder)
    {
      for (;;)
      {
        paramStringBuilder.printStackTrace();
      }
    }
    catch (IllegalAccessException paramStringBuilder)
    {
      for (;;)
      {
        paramStringBuilder.printStackTrace();
      }
    }
  }
  
  public static int getUIN_REPORTLOG_LEVEL()
  {
    return UIN_REPORTLOG_LEVEL;
  }
  
  public static void i(String paramString1, int paramInt, String paramString2)
  {
    i(paramString1, paramInt, paramString2, null);
  }
  
  public static void i(String paramString1, int paramInt, String paramString2, Throwable paramThrowable)
  {
    String str;
    if ((UIN_REPORTLOG_LEVEL >= paramInt) || (colorTags.contains(paramString1)))
    {
      str = paramString2;
      if (paramString2 == null) {
        str = "";
      }
      if (paramThrowable != null) {
        break label48;
      }
      Log.i(paramString1, str);
    }
    for (;;)
    {
      addLogItem(paramString1, paramInt, str, paramThrowable);
      return;
      label48:
      Log.i(paramString1, str, paramThrowable);
    }
  }
  
  public static void init(String paramString1, String paramString2, String paramString3, long paramLong)
  {
    int i;
    if (sWriteHandler == null)
    {
      processName = paramString2;
      packageName = paramString1;
      sBuildNumber = paramString3;
      paramString1 = new HandlerThread("logWriteThread");
      paramString1.start();
      sWriteHandler = new c(paramString1.getLooper());
      sWriteHandler.sendEmptyMessageDelayed(1, paramLong);
      if (!isDevelopLevel()) {
        break label82;
      }
      i = 512;
    }
    for (;;)
    {
      sPool = new RecyclablePool(b.class, i);
      return;
      label82:
      if (isColorLevel()) {
        i = 256;
      } else {
        i = 128;
      }
    }
  }
  
  static void initLogFile(long paramLong)
    throws IOException
  {
    logPath = Environment.getExternalStorageDirectory().getPath() + "/tencent/msflogs/" + packageName.replace(".", "/") + "/";
    oldLogPath = Environment.getExternalStorageDirectory().getPath() + "/tencent/" + packageName.replace(".", "/") + "/";
    localObject1 = Calendar.getInstance();
    ((Calendar)localObject1).setTimeInMillis(paramLong);
    Object localObject2 = new SimpleDateFormat("yy.MM.dd.HH");
    logTime = new SimpleDateFormat("yy-MM-dd HH:mm:ss").format(Long.valueOf(paramLong));
    localObject2 = ((SimpleDateFormat)localObject2).format(((Calendar)localObject1).getTime());
    ((Calendar)localObject1).set(14, 0);
    ((Calendar)localObject1).add(11, 1);
    ((Calendar)localObject1).set(12, 0);
    ((Calendar)localObject1).set(13, 0);
    nextHourTime = ((Calendar)localObject1).getTimeInMillis();
    localObject1 = logPath + getLogFileName((String)localObject2);
    for (localObject2 = new File(logPath);; localObject3 = localObject1) {
      try
      {
        if (!((File)localObject2).exists()) {
          ((File)localObject2).mkdirs();
        }
        localObject1 = new File((String)localObject1);
        try
        {
          if (!((File)localObject1).exists())
          {
            boolean bool = ((File)localObject1).createNewFile();
            localObject2 = localObject1;
            if (writer != null)
            {
              writer.write(logTime + "|" + processName + "|D|" + "|QQ_Version: " + sBuildNumber + "\r\n");
              writer.write(logTime + "|" + processName + "|D|" + "MSF.D.QLog" + "|" + Build.MODEL + " " + Build.VERSION.RELEASE + " create newLogFile " + ((File)localObject1).getName() + " " + bool + "\n");
              writer.flush();
              localObject2 = localObject1;
            }
          }
          for (;;)
          {
            writer = new BufferedWriter(new g((File)localObject2, true), 8192);
            if (writer != null)
            {
              writer.write(logTime + "|" + processName + "|D|" + "|QQ_Version: " + sBuildNumber + "\r\n");
              writer.flush();
            }
            return;
            localObject2 = localObject1;
            if (writer != null)
            {
              writer.write(logTime + "|" + processName + "|D|" + "|QQ_Version: " + sBuildNumber + "\r\n");
              writer.write(logTime + "|" + processName + "|E|" + "MSF.D.QLog" + "|" + Build.MODEL + " " + Build.VERSION.RELEASE + "|newLogFile " + ((File)localObject1).getName() + " is existed.\n");
              writer.flush();
              localObject2 = localObject1;
            }
          }
          localThrowable1.printStackTrace();
        }
        catch (Throwable localThrowable1) {}
      }
      catch (Throwable localThrowable2)
      {
        for (;;)
        {
          localObject1 = localObject3;
          Object localObject3 = localThrowable2;
        }
      }
    }
  }
  
  public static boolean isColorLevel()
  {
    return UIN_REPORTLOG_LEVEL > 1;
  }
  
  public static final boolean isDevelopLevel()
  {
    return UIN_REPORTLOG_LEVEL >= 4;
  }
  
  public static void p(String paramString1, String paramString2)
  {
    Log.d(paramString1, "[s]" + paramString2);
  }
  
  public static void setUIN_REPORTLOG_LEVEL(int paramInt)
  {
    UIN_REPORTLOG_LEVEL = paramInt;
    d("MSF.D.QLog", 1, "set UIN_REPORTLOG_LEVEL " + getUIN_REPORTLOG_LEVEL());
  }
  
  public static void startColorLog(String[] paramArrayOfString)
  {
    colorLogTime = System.currentTimeMillis();
    int j = paramArrayOfString.length;
    int i = 0;
    while (i < j)
    {
      String str = paramArrayOfString[i];
      colorTags.add(str);
      i += 1;
    }
  }
  
  public static void syncReportLogSelf(int paramInt, String paramString1, String paramString2, String paramString3)
  {
    String str = paramString1 + ".zip";
    File localFile = new File(str);
    localFile.delete();
    try
    {
      localFile.createNewFile();
      ArrayList localArrayList = new ArrayList();
      localArrayList.add(new a(paramString1));
      com.tencent.mobileqq.msf.core.f.a(localArrayList, str);
      com.tencent.mobileqq.msf.core.f.a(paramInt, str, paramString2, paramString3);
      localFile.delete();
      return;
    }
    catch (IOException paramString1)
    {
      paramString1.printStackTrace();
      d("MSF.D.QLog", 1, "doReportLogSelf error " + paramString1);
    }
  }
  
  public static void w(String paramString1, int paramInt, String paramString2)
  {
    w(paramString1, paramInt, paramString2, null);
  }
  
  public static void w(String paramString1, int paramInt, String paramString2, Throwable paramThrowable)
  {
    String str;
    if ((UIN_REPORTLOG_LEVEL >= paramInt) || (colorTags.contains(paramString1)))
    {
      str = paramString2;
      if (paramString2 == null) {
        str = "";
      }
      if (paramThrowable != null) {
        break label48;
      }
      Log.w(paramString1, str);
    }
    for (;;)
    {
      addLogItem(paramString1, paramInt, str, paramThrowable);
      return;
      label48:
      Log.w(paramString1, str, paramThrowable);
    }
  }
  
  /* Error */
  private static boolean writeLogToFile()
  {
    // Byte code:
    //   0: getstatic 509	com/tencent/qphone/base/util/QLog:writer	Ljava/io/BufferedWriter;
    //   3: ifnonnull +5 -> 8
    //   6: iconst_1
    //   7: ireturn
    //   8: invokestatic 254	com/tencent/qphone/base/util/BaseApplication:getContext	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   11: ifnull +125 -> 136
    //   14: invokestatic 175	java/lang/System:currentTimeMillis	()J
    //   17: getstatic 134	com/tencent/qphone/base/util/QLog:lastPrintMemeoryTime	J
    //   20: lsub
    //   21: ldc2_w 614
    //   24: lcmp
    //   25: ifle +111 -> 136
    //   28: invokestatic 432	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   31: ifeq +105 -> 136
    //   34: invokestatic 254	com/tencent/qphone/base/util/BaseApplication:getContext	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   37: ldc_w 617
    //   40: invokevirtual 621	com/tencent/qphone/base/util/BaseApplication:getSystemService	(Ljava/lang/String;)Ljava/lang/Object;
    //   43: checkcast 623	android/app/ActivityManager
    //   46: astore_2
    //   47: new 625	android/app/ActivityManager$MemoryInfo
    //   50: dup
    //   51: invokespecial 626	android/app/ActivityManager$MemoryInfo:<init>	()V
    //   54: astore_3
    //   55: aload_2
    //   56: aload_3
    //   57: invokevirtual 630	android/app/ActivityManager:getMemoryInfo	(Landroid/app/ActivityManager$MemoryInfo;)V
    //   60: ldc 88
    //   62: iconst_2
    //   63: new 102	java/lang/StringBuilder
    //   66: dup
    //   67: invokespecial 340	java/lang/StringBuilder:<init>	()V
    //   70: ldc_w 632
    //   73: invokevirtual 242	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   76: aload_3
    //   77: getfield 635	android/app/ActivityManager$MemoryInfo:availMem	J
    //   80: ldc2_w 636
    //   83: ldiv
    //   84: ldc2_w 636
    //   87: ldiv
    //   88: invokevirtual 640	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   91: ldc_w 642
    //   94: invokevirtual 242	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   97: ldc_w 644
    //   100: invokevirtual 242	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   103: aload_3
    //   104: getfield 647	android/app/ActivityManager$MemoryInfo:threshold	J
    //   107: ldc2_w 636
    //   110: ldiv
    //   111: ldc2_w 636
    //   114: ldiv
    //   115: invokevirtual 640	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   118: ldc_w 642
    //   121: invokevirtual 242	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   124: invokevirtual 243	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   127: invokestatic 577	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   130: invokestatic 175	java/lang/System:currentTimeMillis	()J
    //   133: putstatic 134	com/tencent/qphone/base/util/QLog:lastPrintMemeoryTime	J
    //   136: getstatic 98	com/tencent/qphone/base/util/QLog:sTail	Lcom/tencent/qphone/base/util/QLog$b;
    //   139: astore 4
    //   141: getstatic 96	com/tencent/qphone/base/util/QLog:sHead	Lcom/tencent/qphone/base/util/QLog$b;
    //   144: astore_3
    //   145: aload_3
    //   146: astore_2
    //   147: aload_3
    //   148: ifnonnull +5 -> 153
    //   151: iconst_0
    //   152: ireturn
    //   153: aload_2
    //   154: astore_3
    //   155: aload_3
    //   156: getfield 190	com/tencent/qphone/base/util/QLog$b:a	J
    //   159: getstatic 495	com/tencent/qphone/base/util/QLog:nextHourTime	J
    //   162: lcmp
    //   163: ifle +5 -> 168
    //   166: iconst_1
    //   167: ireturn
    //   168: aload_3
    //   169: getfield 190	com/tencent/qphone/base/util/QLog$b:a	J
    //   172: lstore_0
    //   173: lload_0
    //   174: getstatic 649	com/tencent/qphone/base/util/QLog:currentLogSecond	J
    //   177: ldc2_w 650
    //   180: ladd
    //   181: lcmp
    //   182: ifge +11 -> 193
    //   185: lload_0
    //   186: getstatic 649	com/tencent/qphone/base/util/QLog:currentLogSecond	J
    //   189: lcmp
    //   190: ifge +50 -> 240
    //   193: getstatic 655	com/tencent/mobileqq/msf/sdk/MsfSdkUtils:timeFormatter	Ljava/text/SimpleDateFormat;
    //   196: lload_0
    //   197: invokestatic 472	java/lang/Long:valueOf	(J)Ljava/lang/Long;
    //   200: invokevirtual 476	java/text/SimpleDateFormat:format	(Ljava/lang/Object;)Ljava/lang/String;
    //   203: putstatic 140	com/tencent/qphone/base/util/QLog:logTime	Ljava/lang/String;
    //   206: lload_0
    //   207: getstatic 649	com/tencent/qphone/base/util/QLog:currentLogSecond	J
    //   210: ldc2_w 650
    //   213: ladd
    //   214: lcmp
    //   215: iflt +259 -> 474
    //   218: lload_0
    //   219: getstatic 649	com/tencent/qphone/base/util/QLog:currentLogSecond	J
    //   222: ldc2_w 656
    //   225: ladd
    //   226: lcmp
    //   227: ifge +247 -> 474
    //   230: getstatic 649	com/tencent/qphone/base/util/QLog:currentLogSecond	J
    //   233: ldc2_w 650
    //   236: ladd
    //   237: putstatic 649	com/tencent/qphone/base/util/QLog:currentLogSecond	J
    //   240: getstatic 108	com/tencent/qphone/base/util/QLog:sBuilder	Ljava/lang/StringBuilder;
    //   243: iconst_0
    //   244: getstatic 108	com/tencent/qphone/base/util/QLog:sBuilder	Ljava/lang/StringBuilder;
    //   247: invokevirtual 660	java/lang/StringBuilder:length	()I
    //   250: invokevirtual 663	java/lang/StringBuilder:delete	(II)Ljava/lang/StringBuilder;
    //   253: astore_2
    //   254: aload_2
    //   255: getstatic 140	com/tencent/qphone/base/util/QLog:logTime	Ljava/lang/String;
    //   258: invokevirtual 242	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   261: bipush 124
    //   263: invokevirtual 666	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   266: aload_3
    //   267: getfield 190	com/tencent/qphone/base/util/QLog$b:a	J
    //   270: invokevirtual 640	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   273: bipush 91
    //   275: invokevirtual 666	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   278: getstatic 132	com/tencent/qphone/base/util/QLog:myProcessId	I
    //   281: invokevirtual 575	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   284: bipush 93
    //   286: invokevirtual 666	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   289: aload_3
    //   290: getfield 201	com/tencent/qphone/base/util/QLog$b:b	J
    //   293: invokevirtual 640	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   296: bipush 124
    //   298: invokevirtual 666	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   301: aload_3
    //   302: getfield 203	com/tencent/qphone/base/util/QLog$b:c	I
    //   305: invokestatic 668	com/tencent/qphone/base/util/QLog:getReportLevel	(I)Ljava/lang/String;
    //   308: invokevirtual 242	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   311: bipush 124
    //   313: invokevirtual 666	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   316: aload_3
    //   317: getfield 206	com/tencent/qphone/base/util/QLog$b:d	Ljava/lang/String;
    //   320: invokevirtual 242	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   323: bipush 124
    //   325: invokevirtual 666	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   328: aload_3
    //   329: getfield 209	com/tencent/qphone/base/util/QLog$b:e	Ljava/lang/String;
    //   332: invokevirtual 242	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   335: bipush 10
    //   337: invokevirtual 666	java/lang/StringBuilder:append	(C)Ljava/lang/StringBuilder;
    //   340: pop
    //   341: getstatic 110	com/tencent/qphone/base/util/QLog:sValues	[C
    //   344: ifnull +14 -> 358
    //   347: getstatic 110	com/tencent/qphone/base/util/QLog:sValues	[C
    //   350: arraylength
    //   351: aload_2
    //   352: invokevirtual 671	java/lang/StringBuilder:capacity	()I
    //   355: if_icmpeq +10 -> 365
    //   358: aload_2
    //   359: invokestatic 673	com/tencent/qphone/base/util/QLog:getStringValue	(Ljava/lang/StringBuilder;)[C
    //   362: putstatic 110	com/tencent/qphone/base/util/QLog:sValues	[C
    //   365: getstatic 110	com/tencent/qphone/base/util/QLog:sValues	[C
    //   368: ifnull +139 -> 507
    //   371: getstatic 509	com/tencent/qphone/base/util/QLog:writer	Ljava/io/BufferedWriter;
    //   374: getstatic 110	com/tencent/qphone/base/util/QLog:sValues	[C
    //   377: iconst_0
    //   378: aload_2
    //   379: invokevirtual 660	java/lang/StringBuilder:length	()I
    //   382: invokevirtual 676	java/io/BufferedWriter:write	([CII)V
    //   385: aload_3
    //   386: getfield 213	com/tencent/qphone/base/util/QLog$b:f	Ljava/lang/Throwable;
    //   389: ifnull +24 -> 413
    //   392: getstatic 509	com/tencent/qphone/base/util/QLog:writer	Ljava/io/BufferedWriter;
    //   395: aload_3
    //   396: getfield 213	com/tencent/qphone/base/util/QLog$b:f	Ljava/lang/Throwable;
    //   399: invokestatic 677	android/util/Log:getStackTraceString	(Ljava/lang/Throwable;)Ljava/lang/String;
    //   402: invokevirtual 522	java/io/BufferedWriter:write	(Ljava/lang/String;)V
    //   405: getstatic 509	com/tencent/qphone/base/util/QLog:writer	Ljava/io/BufferedWriter;
    //   408: bipush 10
    //   410: invokevirtual 679	java/io/BufferedWriter:write	(I)V
    //   413: aload_3
    //   414: invokevirtual 683	com/tencent/qphone/base/util/QLog$b:getNext	()Lcom/tencent/commonsdk/pool/RecyclablePool$Recyclable;
    //   417: checkcast 9	com/tencent/qphone/base/util/QLog$b
    //   420: astore_2
    //   421: aload_3
    //   422: aload 4
    //   424: if_acmpne +29 -> 453
    //   427: getstatic 122	com/tencent/qphone/base/util/QLog:processName	Ljava/lang/String;
    //   430: astore 5
    //   432: aload 5
    //   434: monitorenter
    //   435: aload_3
    //   436: getstatic 98	com/tencent/qphone/base/util/QLog:sTail	Lcom/tencent/qphone/base/util/QLog$b;
    //   439: if_acmpne +81 -> 520
    //   442: aconst_null
    //   443: putstatic 98	com/tencent/qphone/base/util/QLog:sTail	Lcom/tencent/qphone/base/util/QLog$b;
    //   446: aconst_null
    //   447: putstatic 96	com/tencent/qphone/base/util/QLog:sHead	Lcom/tencent/qphone/base/util/QLog$b;
    //   450: aload 5
    //   452: monitorexit
    //   453: getstatic 182	com/tencent/qphone/base/util/QLog:sPool	Lcom/tencent/commonsdk/pool/RecyclablePool;
    //   456: aload_3
    //   457: invokevirtual 687	com/tencent/commonsdk/pool/RecyclablePool:recycle	(Lcom/tencent/commonsdk/pool/RecyclablePool$Recyclable;)V
    //   460: aload_3
    //   461: aload 4
    //   463: if_acmpne -310 -> 153
    //   466: getstatic 509	com/tencent/qphone/base/util/QLog:writer	Ljava/io/BufferedWriter;
    //   469: invokevirtual 547	java/io/BufferedWriter:flush	()V
    //   472: iconst_0
    //   473: ireturn
    //   474: invokestatic 461	java/util/Calendar:getInstance	()Ljava/util/Calendar;
    //   477: astore_2
    //   478: aload_2
    //   479: lload_0
    //   480: invokevirtual 464	java/util/Calendar:setTimeInMillis	(J)V
    //   483: aload_2
    //   484: bipush 14
    //   486: iconst_0
    //   487: invokevirtual 487	java/util/Calendar:set	(II)V
    //   490: aload_2
    //   491: invokevirtual 493	java/util/Calendar:getTimeInMillis	()J
    //   494: putstatic 649	com/tencent/qphone/base/util/QLog:currentLogSecond	J
    //   497: goto -257 -> 240
    //   500: astore_2
    //   501: aload_2
    //   502: invokevirtual 562	java/lang/Throwable:printStackTrace	()V
    //   505: iconst_1
    //   506: ireturn
    //   507: getstatic 509	com/tencent/qphone/base/util/QLog:writer	Ljava/io/BufferedWriter;
    //   510: aload_2
    //   511: invokevirtual 243	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   514: invokevirtual 522	java/io/BufferedWriter:write	(Ljava/lang/String;)V
    //   517: goto -132 -> 385
    //   520: aload 4
    //   522: invokevirtual 683	com/tencent/qphone/base/util/QLog$b:getNext	()Lcom/tencent/commonsdk/pool/RecyclablePool$Recyclable;
    //   525: checkcast 9	com/tencent/qphone/base/util/QLog$b
    //   528: putstatic 96	com/tencent/qphone/base/util/QLog:sHead	Lcom/tencent/qphone/base/util/QLog$b;
    //   531: goto -81 -> 450
    //   534: astore_2
    //   535: aload 5
    //   537: monitorexit
    //   538: aload_2
    //   539: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   172	308	0	l	long
    //   46	445	2	localObject1	Object
    //   500	11	2	localThrowable	Throwable
    //   534	5	2	localObject2	Object
    //   54	407	3	localObject3	Object
    //   139	382	4	localB	b
    // Exception table:
    //   from	to	target	type
    //   0	6	500	java/lang/Throwable
    //   8	136	500	java/lang/Throwable
    //   136	145	500	java/lang/Throwable
    //   155	166	500	java/lang/Throwable
    //   168	193	500	java/lang/Throwable
    //   193	240	500	java/lang/Throwable
    //   240	358	500	java/lang/Throwable
    //   358	365	500	java/lang/Throwable
    //   365	385	500	java/lang/Throwable
    //   385	413	500	java/lang/Throwable
    //   413	421	500	java/lang/Throwable
    //   427	435	500	java/lang/Throwable
    //   453	460	500	java/lang/Throwable
    //   466	472	500	java/lang/Throwable
    //   474	497	500	java/lang/Throwable
    //   507	517	500	java/lang/Throwable
    //   538	540	500	java/lang/Throwable
    //   435	450	534	finally
    //   450	453	534	finally
    //   520	531	534	finally
    //   535	538	534	finally
  }
  
  public static class a
    extends File
  {
    public String a = "";
    
    public a(File paramFile, String paramString)
    {
      super(paramString);
    }
    
    public a(String paramString)
    {
      super();
    }
  }
  
  public static class b
    extends RecyclablePool.Recyclable
  {
    public long a;
    public long b;
    public int c;
    public String d;
    public String e;
    public Throwable f;
    
    public b() {}
    
    public void recycle()
    {
      super.recycle();
      a = 0L;
      b = 0L;
      c = 0;
      d = "";
      e = "";
      f = null;
    }
  }
  
  static class c
    extends Handler
  {
    public c(Looper paramLooper)
    {
      super();
    }
    
    public void handleMessage(Message paramMessage)
    {
      int i = 0;
      switch (what)
      {
      default: 
        return;
      }
      int j;
      try
      {
        Log.d("MSF.D.QLog", "QLog init");
        QLog.initLogFile(System.currentTimeMillis());
        QLog.access$002(0);
        if ((QLog.sHead != null) && (!QLog.sWriteHandler.hasMessages(2))) {
          QLog.sWriteHandler.sendEmptyMessage(2);
        }
        if (QLog.access$300())
        {
          QLog.sWriteHandler.removeMessages(1);
          QLog.sWriteHandler.sendEmptyMessageDelayed(1, 1000L);
          return;
        }
      }
      catch (Exception paramMessage)
      {
        paramMessage.printStackTrace();
        j = QLog.retryInitTimes;
        Log.d("MSF.D.QLog", "QLog init" + j + ", " + QLog.INTERVAL_RETRY_INIT[j]);
        QLog.sWriteHandler.removeMessages(1);
        QLog.sWriteHandler.sendEmptyMessageDelayed(1, QLog.INTERVAL_RETRY_INIT[j] * 60000);
        j += 1;
        if (j < QLog.INTERVAL_RETRY_INIT.length) {}
      }
      for (;;)
      {
        QLog.access$002(i);
        return;
        QLog.sWriteHandler.removeMessages(2);
        QLog.sWriteHandler.sendEmptyMessageDelayed(2, 1000L);
        return;
        i = j;
      }
    }
  }
}
