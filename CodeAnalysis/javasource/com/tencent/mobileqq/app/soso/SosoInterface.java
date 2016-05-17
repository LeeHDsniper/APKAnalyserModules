package com.tencent.mobileqq.app.soso;

import NearbyGroup.Attr;
import NearbyGroup.Cell;
import NearbyGroup.GPS;
import NearbyGroup.LBSInfo;
import NearbyGroup.Wifi;
import android.os.Bundle;
import android.os.SystemClock;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.map.geolocation.TencentLocation;
import com.tencent.map.geolocation.TencentLocationListener;
import com.tencent.map.geolocation.TencentLocationManager;
import com.tencent.map.geolocation.TencentLocationRequest;
import com.tencent.map.geolocation.internal.TencentExtraKeys;
import com.tencent.map.geolocation.internal.TencentLog;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.earlydownload.EarlyDownloadManager;
import com.tencent.mobileqq.highway.utils.HwNetworkUtil;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicInteger;
import mqq.os.MqqHandler;
import nme;
import nmg;
import nmh;
import nmi;
import nmj;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class SosoInterface
  implements TencentLog
{
  public static final int a = -10000;
  public static long a = 0L;
  private static TencentLocationListener jdField_a_of_type_ComTencentMapGeolocationTencentLocationListener = new nme();
  private static TencentLog jdField_a_of_type_ComTencentMapGeolocationInternalTencentLog;
  private static final SosoInterface.OnLocationListener jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$OnLocationListener = new nmg(0, false, false, 0L, false, false, "reqRawData");
  public static SosoInterface.SosoLbsInfo a;
  public static final Object a;
  public static final String a = "soso_lbs";
  private static final ArrayList jdField_a_of_type_JavaUtilArrayList;
  private static final AtomicInteger jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger;
  private static long[] jdField_a_of_type_ArrayOfLong;
  public static final int b = 30000;
  public static long b = 0L;
  public static final String b = "timeDenyPer";
  public static final int c = 2000;
  private static long c = 0L;
  public static final String c = "qq_";
  public static final int d = 0;
  public static final int e = 1;
  public static final int f = 2;
  private static int g;
  private static int h;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
    jdField_a_of_type_JavaLangObject = new Object();
    jdField_a_of_type_JavaUtilArrayList = new ArrayList();
    jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger = new AtomicInteger(0);
    jdField_a_of_type_ArrayOfLong = new long[] { 0L, 0L, 0L, 0L, 0L };
    g = 0;
    h = 0;
  }
  
  private SosoInterface() {}
  
  public static LBSInfo a()
  {
    return a(false, a());
  }
  
  public static LBSInfo a(boolean paramBoolean, SosoInterface.SosoLbsInfo paramSosoLbsInfo)
  {
    Attr localAttr = null;
    if (paramSosoLbsInfo == null) {
      return null;
    }
    ArrayList localArrayList = new ArrayList();
    Object localObject1;
    Object localObject2;
    if (jdField_a_of_type_JavaUtilArrayList != null)
    {
      localObject1 = jdField_a_of_type_JavaUtilArrayList.iterator();
      while (((Iterator)localObject1).hasNext())
      {
        localObject2 = (SosoInterface.SosoCell)((Iterator)localObject1).next();
        localArrayList.add(new Cell((short)jdField_a_of_type_Int, (short)jdField_b_of_type_Int, c, d, (short)e));
      }
    }
    for (;;)
    {
      try
      {
        if (jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation == null) {
          break label313;
        }
        if (!paramBoolean) {
          continue;
        }
        localObject1 = new GPS((int)(jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation.jdField_a_of_type_Double * 1000000.0D), (int)(jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation.jdField_b_of_type_Double * 1000000.0D), -1, 1);
      }
      catch (Exception localException)
      {
        Iterator localIterator;
        SosoInterface.SosoWifi localSosoWifi;
        localGPS = null;
        continue;
        if (jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoAttribute == null) {
          continue;
        }
        localAttr = new Attr(jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoAttribute.jdField_a_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoAttribute.jdField_b_of_type_JavaLangString, jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoAttribute.jdField_c_of_type_JavaLangString);
        return new LBSInfo(localGPS, (ArrayList)localObject2, localArrayList, localAttr);
      }
      localObject2 = new ArrayList();
      if (jdField_b_of_type_JavaUtilArrayList != null)
      {
        localIterator = jdField_b_of_type_JavaUtilArrayList.iterator();
        if (localIterator.hasNext())
        {
          localSosoWifi = (SosoInterface.SosoWifi)localIterator.next();
          if (localSosoWifi == null) {
            continue;
          }
          ((ArrayList)localObject2).add(new Wifi(jdField_a_of_type_Long, (short)jdField_a_of_type_Int));
          continue;
          localObject1 = new GPS((int)(jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation.jdField_c_of_type_Double * 1000000.0D), (int)(jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation.jdField_d_of_type_Double * 1000000.0D), -1, 0);
          continue;
        }
      }
      label313:
      GPS localGPS = null;
    }
  }
  
  public static SosoInterface.SosoLbsInfo a()
  {
    if (jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfo == null) {
      return null;
    }
    SosoInterface.SosoLbsInfo localSosoLbsInfo = new SosoInterface.SosoLbsInfo();
    jdField_a_of_type_ArrayOfByte = jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_ArrayOfByte;
    if (jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation != null) {
      jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation = jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation.a();
    }
    if (jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoAttribute != null) {
      jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoAttribute = jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoAttribute.a();
    }
    ArrayList localArrayList = new ArrayList();
    if (jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_JavaUtilArrayList != null) {
      localArrayList.addAll(jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_JavaUtilArrayList);
    }
    jdField_a_of_type_JavaUtilArrayList = localArrayList;
    localArrayList = new ArrayList();
    if (jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_b_of_type_JavaUtilArrayList != null) {
      localArrayList.addAll(jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_b_of_type_JavaUtilArrayList);
    }
    jdField_b_of_type_JavaUtilArrayList = localArrayList;
    jdField_a_of_type_Long = jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_Long;
    jdField_a_of_type_JavaLangString = jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_JavaLangString;
    jdField_b_of_type_JavaLangString = jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_b_of_type_JavaLangString;
    return localSosoLbsInfo;
  }
  
  public static void a()
  {
    
    synchronized (jdField_a_of_type_JavaLangObject)
    {
      jdField_a_of_type_JavaUtilArrayList.clear();
      return;
    }
  }
  
  /* Error */
  @Deprecated
  public static void a(long paramLong, String paramString)
  {
    // Byte code:
    //   0: invokestatic 232	com/tencent/mobileqq/app/ThreadManager:b	()Ljava/lang/Thread;
    //   3: invokestatic 237	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   6: if_acmpeq +15 -> 21
    //   9: invokestatic 237	java/lang/Thread:currentThread	()Ljava/lang/Thread;
    //   12: invokestatic 243	android/os/Looper:getMainLooper	()Landroid/os/Looper;
    //   15: invokevirtual 246	android/os/Looper:getThread	()Ljava/lang/Thread;
    //   18: if_acmpne +30 -> 48
    //   21: new 248	android/util/AndroidRuntimeException
    //   24: dup
    //   25: new 250	java/lang/StringBuilder
    //   28: dup
    //   29: invokespecial 251	java/lang/StringBuilder:<init>	()V
    //   32: ldc -3
    //   34: invokevirtual 257	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   37: aload_2
    //   38: invokevirtual 257	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   41: invokevirtual 261	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   44: invokespecial 264	android/util/AndroidRuntimeException:<init>	(Ljava/lang/String;)V
    //   47: athrow
    //   48: lload_0
    //   49: lconst_0
    //   50: lcmp
    //   51: ifle +122 -> 173
    //   54: invokestatic 269	android/os/SystemClock:elapsedRealtime	()J
    //   57: getstatic 270	com/tencent/mobileqq/app/soso/SosoInterface:jdField_a_of_type_Long	J
    //   60: lload_0
    //   61: ladd
    //   62: lcmp
    //   63: ifge +110 -> 173
    //   66: invokestatic 275	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   69: ifeq +30 -> 99
    //   72: ldc_w 277
    //   75: iconst_2
    //   76: new 250	java/lang/StringBuilder
    //   79: dup
    //   80: invokespecial 251	java/lang/StringBuilder:<init>	()V
    //   83: ldc_w 279
    //   86: invokevirtual 257	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   89: aload_2
    //   90: invokevirtual 257	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   93: invokevirtual 261	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   96: invokestatic 282	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   99: new 284	java/util/HashMap
    //   102: dup
    //   103: invokespecial 285	java/util/HashMap:<init>	()V
    //   106: astore 10
    //   108: aload_2
    //   109: ifnull +20 -> 129
    //   112: aload_2
    //   113: invokevirtual 290	java/lang/String:length	()I
    //   116: ifle +13 -> 129
    //   119: aload 10
    //   121: ldc_w 292
    //   124: aload_2
    //   125: invokevirtual 296	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   128: pop
    //   129: aload 10
    //   131: ldc_w 298
    //   134: getstatic 304	java/lang/Boolean:TRUE	Ljava/lang/Boolean;
    //   137: invokevirtual 307	java/lang/Boolean:booleanValue	()Z
    //   140: invokestatic 310	java/lang/Boolean:toString	(Z)Ljava/lang/String;
    //   143: invokevirtual 296	java/util/HashMap:put	(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    //   146: pop
    //   147: invokestatic 314	com/tencent/mobileqq/earlydownload/EarlyDownloadManager:a	()Ljava/lang/String;
    //   150: astore_2
    //   151: invokestatic 320	com/tencent/common/app/BaseApplicationImpl:getContext	()Lcom/tencent/qphone/base/util/BaseApplication;
    //   154: invokestatic 325	com/tencent/mobileqq/statistics/StatisticCollector:a	(Landroid/content/Context;)Lcom/tencent/mobileqq/statistics/StatisticCollector;
    //   157: aload_2
    //   158: ldc_w 327
    //   161: iconst_1
    //   162: lconst_0
    //   163: lconst_0
    //   164: aload 10
    //   166: ldc_w 329
    //   169: invokevirtual 332	com/tencent/mobileqq/statistics/StatisticCollector:a	(Ljava/lang/String;Ljava/lang/String;ZJJLjava/util/HashMap;Ljava/lang/String;)V
    //   172: return
    //   173: invokestatic 275	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   176: ifeq +40 -> 216
    //   179: ldc_w 277
    //   182: iconst_2
    //   183: new 250	java/lang/StringBuilder
    //   186: dup
    //   187: invokespecial 251	java/lang/StringBuilder:<init>	()V
    //   190: ldc_w 334
    //   193: invokevirtual 257	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   196: aload_2
    //   197: invokevirtual 257	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   200: ldc_w 336
    //   203: invokevirtual 257	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   206: lload_0
    //   207: invokevirtual 339	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   210: invokevirtual 261	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   213: invokestatic 282	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   216: getstatic 84	com/tencent/mobileqq/app/soso/SosoInterface:jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$OnLocationListener	Lcom/tencent/mobileqq/app/soso/SosoInterface$OnLocationListener;
    //   219: new 250	java/lang/StringBuilder
    //   222: dup
    //   223: invokespecial 251	java/lang/StringBuilder:<init>	()V
    //   226: ldc_w 341
    //   229: invokevirtual 257	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   232: aload_2
    //   233: invokevirtual 257	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   236: invokevirtual 261	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   239: putfield 344	com/tencent/mobileqq/app/soso/SosoInterface$OnLocationListener:jdField_b_of_type_JavaLangString	Ljava/lang/String;
    //   242: getstatic 84	com/tencent/mobileqq/app/soso/SosoInterface:jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$OnLocationListener	Lcom/tencent/mobileqq/app/soso/SosoInterface$OnLocationListener;
    //   245: invokestatic 347	com/tencent/mobileqq/app/soso/SosoInterface:a	(Lcom/tencent/mobileqq/app/soso/SosoInterface$OnLocationListener;)V
    //   248: invokestatic 269	android/os/SystemClock:elapsedRealtime	()J
    //   251: lstore_0
    //   252: iconst_0
    //   253: istore 9
    //   255: iconst_0
    //   256: istore 8
    //   258: iload 8
    //   260: istore 7
    //   262: getstatic 52	com/tencent/mobileqq/app/soso/SosoInterface:jdField_a_of_type_JavaLangObject	Ljava/lang/Object;
    //   265: astore 11
    //   267: iload 8
    //   269: istore 7
    //   271: aload 11
    //   273: monitorenter
    //   274: iload 9
    //   276: istore 8
    //   278: invokestatic 269	android/os/SystemClock:elapsedRealtime	()J
    //   281: lstore_3
    //   282: iload 9
    //   284: istore 8
    //   286: getstatic 270	com/tencent/mobileqq/app/soso/SosoInterface:jdField_a_of_type_Long	J
    //   289: lstore 5
    //   291: lload_3
    //   292: lload 5
    //   294: ldc2_w 348
    //   297: ladd
    //   298: lcmp
    //   299: ifge +80 -> 379
    //   302: iconst_1
    //   303: istore 7
    //   305: aload 11
    //   307: monitorexit
    //   308: invokestatic 275	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   311: ifeq -139 -> 172
    //   314: ldc_w 277
    //   317: iconst_2
    //   318: new 250	java/lang/StringBuilder
    //   321: dup
    //   322: invokespecial 251	java/lang/StringBuilder:<init>	()V
    //   325: ldc_w 351
    //   328: invokevirtual 257	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   331: getstatic 354	com/tencent/mobileqq/app/NearbyHandler:d	I
    //   334: invokevirtual 357	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   337: ldc_w 359
    //   340: invokevirtual 257	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   343: aload_2
    //   344: invokevirtual 257	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   347: ldc_w 361
    //   350: invokevirtual 257	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   353: iload 7
    //   355: invokevirtual 364	java/lang/StringBuilder:append	(Z)Ljava/lang/StringBuilder;
    //   358: ldc_w 366
    //   361: invokevirtual 257	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   364: invokestatic 269	android/os/SystemClock:elapsedRealtime	()J
    //   367: lload_0
    //   368: lsub
    //   369: invokevirtual 339	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   372: invokevirtual 261	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   375: invokestatic 282	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   378: return
    //   379: iload 9
    //   381: istore 8
    //   383: getstatic 52	com/tencent/mobileqq/app/soso/SosoInterface:jdField_a_of_type_JavaLangObject	Ljava/lang/Object;
    //   386: ldc2_w 367
    //   389: invokevirtual 372	java/lang/Object:wait	(J)V
    //   392: iconst_0
    //   393: istore 7
    //   395: goto -90 -> 305
    //   398: iload 7
    //   400: istore 8
    //   402: aload 11
    //   404: monitorexit
    //   405: aload 10
    //   407: athrow
    //   408: astore 10
    //   410: bipush -11
    //   412: putstatic 354	com/tencent/mobileqq/app/NearbyHandler:d	I
    //   415: goto -107 -> 308
    //   418: astore 10
    //   420: goto -22 -> 398
    //   423: astore 10
    //   425: iload 8
    //   427: istore 7
    //   429: goto -31 -> 398
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	432	0	paramLong	long
    //   0	432	2	paramString	String
    //   281	11	3	l1	long
    //   289	4	5	l2	long
    //   260	168	7	bool1	boolean
    //   256	170	8	bool2	boolean
    //   253	127	9	bool3	boolean
    //   106	300	10	localHashMap	HashMap
    //   408	1	10	localInterruptedException	InterruptedException
    //   418	1	10	localObject1	Object
    //   423	1	10	localObject2	Object
    //   265	138	11	localObject3	Object
    // Exception table:
    //   from	to	target	type
    //   262	267	408	java/lang/InterruptedException
    //   271	274	408	java/lang/InterruptedException
    //   405	408	408	java/lang/InterruptedException
    //   305	308	418	finally
    //   278	282	423	finally
    //   286	291	423	finally
    //   383	392	423	finally
    //   402	405	423	finally
  }
  
  public static void a(SosoInterface.OnLocationListener paramOnLocationListener)
  {
    boolean bool1 = true;
    if (paramOnLocationListener == null) {}
    int i;
    label39:
    label124:
    long l;
    for (;;)
    {
      return;
      try
      {
        if (SosoInterface.OnLocationListener.a(paramOnLocationListener)) {
          SosoInterface.OnLocationListener.a(paramOnLocationListener, false);
        }
        boolean bool2 = HwNetworkUtil.isNetworkAvailable(BaseApplicationImpl.getContext());
        if (bool2) {
          break label750;
        }
        i = 1;
        if (i == 0) {
          break label124;
        }
        if (QLog.isColorLevel()) {
          QLog.d("SOSO.LBS", 2, "startLocation() return. perCheckCode=" + i + " hasNet=" + bool2);
        }
        localObject = b();
        if (jdField_e_of_type_Boolean)
        {
          a(paramOnLocationListener, i, (SosoInterface.SosoLbsInfo)localObject);
          continue;
        }
      }
      finally {}
      paramOnLocationListener.a(i, (SosoInterface.SosoLbsInfo)localObject);
      continue;
      if (jdField_a_of_type_ComTencentMapGeolocationInternalTencentLog == null)
      {
        jdField_a_of_type_ComTencentMapGeolocationInternalTencentLog = new SosoInterface();
        TencentExtraKeys.setTencentLog(jdField_a_of_type_ComTencentMapGeolocationInternalTencentLog);
      }
      if (jdField_e_of_type_Long <= 0L) {
        break label745;
      }
      l = SystemClock.elapsedRealtime();
      if (!g) {
        break label295;
      }
      if ((jdField_a_of_type_ArrayOfLong[jdField_b_of_type_Int] <= 0L) || (l >= jdField_a_of_type_ArrayOfLong[jdField_b_of_type_Int] + jdField_e_of_type_Long)) {
        break label745;
      }
      localObject = b();
      if (!jdField_e_of_type_Boolean) {
        break;
      }
      a(paramOnLocationListener, 0, (SosoInterface.SosoLbsInfo)localObject);
      break label755;
      label221:
      if (i == 0) {
        break label355;
      }
      if (QLog.isColorLevel()) {
        QLog.d("SOSO.LBS", 2, "startLocation() lis=" + jdField_b_of_type_JavaLangString + " use cache and callback now");
      }
      ThreadManager.b().post(new nmi(paramOnLocationListener));
    }
    paramOnLocationListener.a(0, (SosoInterface.SosoLbsInfo)localObject);
    break label755;
    label295:
    label355:
    StringBuilder localStringBuilder;
    if ((jdField_a_of_type_Long > 0L) && (l < jdField_a_of_type_Long + jdField_e_of_type_Long) && (jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfo != null))
    {
      localObject = a();
      if (jdField_e_of_type_Boolean)
      {
        a(paramOnLocationListener, 0, (SosoInterface.SosoLbsInfo)localObject);
        break label760;
      }
      paramOnLocationListener.a(0, (SosoInterface.SosoLbsInfo)localObject);
      break label760;
      if (QLog.isColorLevel())
      {
        localStringBuilder = new StringBuilder().append("startLocation() reqLoc=").append(g).append(" askGPS=").append(h).append(" level=");
        if (jdField_b_of_type_Int != 3) {
          break label667;
        }
        localObject = "ADMIN_AREA";
        label415:
        localStringBuilder = localStringBuilder.append((String)localObject).append(" caller=").append(jdField_b_of_type_JavaLangString).append(" ui=").append(jdField_e_of_type_Boolean).append(" goon=").append(f);
        if (jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger.get() != 0) {
          break label773;
        }
      }
    }
    label521:
    label667:
    label740:
    label745:
    label750:
    label755:
    label760:
    label765:
    label773:
    for (Object localObject = " do startLocation";; localObject = " waitting...")
    {
      QLog.d("SOSO.LBS", 2, (String)localObject);
      c(paramOnLocationListener);
      if (jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger.get() != 0) {
        break;
      }
      if (paramOnLocationListener == jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$OnLocationListener)
      {
        jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger.set(1);
        d = SystemClock.elapsedRealtime();
        localObject = TencentLocationRequest.create();
        ((TencentLocationRequest)localObject).setInterval(2000L);
        ((TencentLocationRequest)localObject).setRequestLevel(jdField_b_of_type_Int);
        ((TencentLocationRequest)localObject).setAllowCache(true);
        if (h) {
          TencentExtraKeys.setAllowGps((TencentLocationRequest)localObject, true);
        }
        if (g) {
          break label740;
        }
      }
      for (;;)
      {
        TencentExtraKeys.setRequestRawData((TencentLocationRequest)localObject, bool1);
        ((TencentLocationRequest)localObject).getExtras().putInt("qq_level", jdField_b_of_type_Int);
        ((TencentLocationRequest)localObject).getExtras().putBoolean("qq_reqLocation", g);
        ((TencentLocationRequest)localObject).getExtras().putString("qq_caller", jdField_b_of_type_JavaLangString);
        ((TencentLocationRequest)localObject).getExtras().putBoolean("qq_goonListener", f);
        ThreadManager.b().post(new nmj(paramOnLocationListener, (TencentLocationRequest)localObject));
        break;
        if (jdField_b_of_type_Int == 5)
        {
          localObject = "FORMATTED_ADDRESS";
          break label415;
        }
        if (jdField_b_of_type_Int == 0)
        {
          localObject = "GEO";
          break label415;
        }
        if (jdField_b_of_type_Int == 1)
        {
          localObject = "NAME";
          break label415;
        }
        if (jdField_b_of_type_Int != 4) {
          break label765;
        }
        localObject = "POI";
        break label415;
        jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger.set(2);
        break label521;
        bool1 = false;
      }
      i = 0;
      break label221;
      i = 0;
      break label39;
      i = 1;
      break label221;
      i = 1;
      break label221;
      localObject = "unknown";
      break label415;
    }
  }
  
  public static void a(SosoInterface.OnLocationListener paramOnLocationListener, int paramInt, SosoInterface.SosoLbsInfo paramSosoLbsInfo)
  {
    if (paramOnLocationListener == null) {
      return;
    }
    ThreadManager.c().post(new nmh(paramOnLocationListener, paramInt, paramSosoLbsInfo));
  }
  
  public static SosoInterface.SosoLbsInfo b()
  {
    if ((jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfo == null) || (jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation == null)) {
      return null;
    }
    SosoInterface.SosoLbsInfo localSosoLbsInfo = new SosoInterface.SosoLbsInfo();
    jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation = jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation.a();
    return localSosoLbsInfo;
  }
  
  private static void b(int paramInt, TencentLocation paramTencentLocation)
  {
    if (paramTencentLocation == null) {
      return;
    }
    if (jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfo == null)
    {
      jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfo = new SosoInterface.SosoLbsInfo();
      jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation = new SosoInterface.SosoLocation(1, paramTencentLocation.getLatitude(), paramTencentLocation.getLongitude());
    }
    for (;;)
    {
      synchronized (jdField_a_of_type_JavaLangObject)
      {
        jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation.jdField_b_of_type_Double = paramTencentLocation.getLongitude();
        jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation.jdField_a_of_type_Double = paramTencentLocation.getLatitude();
        switch (paramInt)
        {
        case 2: 
          b = SystemClock.elapsedRealtime();
          return;
        }
      }
      jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation.jdField_a_of_type_JavaUtilList = paramTencentLocation.getPoiList();
      jdField_a_of_type_ArrayOfLong[4] = SystemClock.elapsedRealtime();
      jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation.jdField_c_of_type_JavaLangString = paramTencentLocation.getNation();
      jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation.jdField_d_of_type_JavaLangString = paramTencentLocation.getProvince();
      jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation.jdField_e_of_type_JavaLangString = paramTencentLocation.getCity();
      jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation.f = paramTencentLocation.getDistrict();
      jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation.g = paramTencentLocation.getTown();
      jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation.h = paramTencentLocation.getVillage();
      jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation.i = paramTencentLocation.getStreet();
      jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation.j = paramTencentLocation.getStreetNo();
      jdField_a_of_type_ArrayOfLong[3] = SystemClock.elapsedRealtime();
      if (paramInt == 1)
      {
        jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation.jdField_a_of_type_JavaLangString = paramTencentLocation.getName();
        jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation.jdField_b_of_type_JavaLangString = paramTencentLocation.getAddress();
        jdField_a_of_type_ArrayOfLong[1] = SystemClock.elapsedRealtime();
      }
      jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation.jdField_e_of_type_Double = paramTencentLocation.getAltitude();
      jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation.jdField_a_of_type_Float = paramTencentLocation.getAccuracy();
      jdField_a_of_type_ArrayOfLong[0] = SystemClock.elapsedRealtime();
    }
  }
  
  public static void b(SosoInterface.OnLocationListener paramOnLocationListener)
  {
    synchronized (jdField_a_of_type_JavaLangObject)
    {
      jdField_a_of_type_JavaUtilArrayList.remove(paramOnLocationListener);
      SosoInterface.OnLocationListener.a(paramOnLocationListener, true);
      SosoInterface.OnLocationListener.b(paramOnLocationListener, false);
      if (QLog.isColorLevel()) {
        QLog.d("SOSO.LBS", 2, "removeOnLocationListener() lis=" + jdField_b_of_type_JavaLangString + " removed.");
      }
      if (jdField_a_of_type_JavaUtilArrayList.size() == 0)
      {
        c();
        if (QLog.isColorLevel()) {
          QLog.d("SOSO.LBS", 2, "removeOnLocationListener() listener is empty. remveUpdate and stop LBS");
        }
      }
      return;
    }
  }
  
  private static void b(String paramString, byte[] paramArrayOfByte)
  {
    if (paramArrayOfByte == null) {
      return;
    }
    if (jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfo == null) {
      jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfo = new SosoInterface.SosoLbsInfo();
    }
    for (;;)
    {
      try
      {
        jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_ArrayOfByte = paramArrayOfByte;
        localJSONObject = new JSONObject(new String(paramArrayOfByte, "UTF-8"));
        d2 = 0.0D;
        d1 = d2;
      }
      catch (Exception paramString)
      {
        JSONObject localJSONObject;
        SosoInterface.SosoAttribute localSosoAttribute;
        ArrayList localArrayList1;
        int j;
        int i;
        ArrayList localArrayList2;
        return;
      }
      try
      {
        paramArrayOfByte = localJSONObject.getJSONObject("location");
        d1 = d2;
        d2 = paramArrayOfByte.getDouble("latitude");
        d1 = d2;
        d3 = paramArrayOfByte.getDouble("longitude");
        d1 = d3;
      }
      catch (JSONException paramArrayOfByte)
      {
        d3 = 0.0D;
        d2 = d1;
        d1 = d3;
        continue;
        bool = false;
        continue;
      }
      try
      {
        paramArrayOfByte = localJSONObject.getJSONObject("attribute");
        localSosoAttribute = new SosoInterface.SosoAttribute(paramArrayOfByte.getString("imei"), paramArrayOfByte.getString("imsi"), paramArrayOfByte.getString("phonenum"), paramArrayOfByte.getString("qq"), paramArrayOfByte.getBoolean("roaming"));
        localArrayList1 = new ArrayList();
        paramArrayOfByte = localJSONObject.getJSONArray("cells");
        j = paramArrayOfByte.length();
        i = 0;
        if (i < j)
        {
          ??? = paramArrayOfByte.getJSONObject(i);
          int k = ((JSONObject)???).getInt("mcc");
          int m = ((JSONObject)???).getInt("mnc");
          int n = ((JSONObject)???).getInt("lac");
          int i1 = ((JSONObject)???).getInt("cellid");
          int i2 = ((JSONObject)???).getInt("rss");
          if (i != 0) {
            break label569;
          }
          bool = true;
          localArrayList1.add(new SosoInterface.SosoCell(k, m, n, i1, i2, bool));
          i += 1;
          continue;
        }
      }
      catch (JSONException paramArrayOfByte)
      {
        localSosoAttribute = new SosoInterface.SosoAttribute("", "", "", "", false);
        continue;
        localArrayList2 = new ArrayList();
        paramArrayOfByte = localJSONObject.getJSONArray("wifis");
        i = 0;
        j = paramArrayOfByte.length();
        if (i < j)
        {
          ??? = paramArrayOfByte.getJSONObject(i);
          localArrayList2.add(new SosoInterface.SosoWifi(((JSONObject)???).getString("mac"), ((JSONObject)???).getInt("rssi")));
          i += 1;
          continue;
        }
        paramArrayOfByte = "";
        try
        {
          ??? = localJSONObject.getString("version");
          paramArrayOfByte = (byte[])???;
          l = localJSONObject.getLong("source");
          paramArrayOfByte = (byte[])???;
        }
        catch (JSONException localJSONException)
        {
          long l = 0L;
          continue;
          if (d2 == 0.0D) {
            break label537;
          }
          jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation.jdField_c_of_type_Double = d2;
          if (d1 == 0.0D) {
            continue;
          }
          jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation.jdField_d_of_type_Double = d1;
          continue;
        }
        synchronized (jdField_a_of_type_JavaLangObject)
        {
          if (jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation == null)
          {
            jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLocation = new SosoInterface.SosoLocation(0, d2, d1);
            jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoAttribute = localSosoAttribute;
            jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_JavaUtilArrayList = localArrayList1;
            jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_b_of_type_JavaUtilArrayList = localArrayList2;
            jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_Long = l;
            jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_a_of_type_JavaLangString = paramArrayOfByte;
            jdField_a_of_type_ComTencentMobileqqAppSosoSosoInterface$SosoLbsInfojdField_b_of_type_JavaLangString = paramString;
            jdField_a_of_type_Long = SystemClock.elapsedRealtime();
            return;
          }
        }
      }
    }
  }
  
  private static void b(boolean paramBoolean1, boolean paramBoolean2, long paramLong, int paramInt1, int paramInt2, String paramString1, String paramString2)
  {
    if ((String.valueOf(paramString2).equals("ERROR_NETWORK")) && ((paramInt2 == -4) || (paramInt2 == -17))) {}
    while (((paramBoolean1) || (!HwNetworkUtil.isNetworkAvailable(BaseApplicationImpl.getContext()))) && (!paramBoolean1)) {
      return;
    }
    HashMap localHashMap = new HashMap();
    localHashMap.put("param_FailCode", Integer.toString(paramInt1));
    if ((paramString1 != null) && (paramString1.length() > 0)) {
      localHashMap.put("param_caller", paramString1);
    }
    if ((paramString2 != null) && (paramString2.length() > 0)) {
      localHashMap.put("param_reason", paramString2);
    }
    localHashMap.put("param_detail", Integer.toString(paramInt2));
    localHashMap.put("param_useCache", Boolean.toString(Boolean.FALSE.booleanValue()));
    paramString2 = EarlyDownloadManager.a();
    StatisticCollector localStatisticCollector = StatisticCollector.a(BaseApplicationImpl.getContext());
    if (paramBoolean2) {}
    for (paramString1 = "actSosoLocation";; paramString1 = "actSosoRawData")
    {
      localStatisticCollector.a(paramString2, paramString1, paramBoolean1, paramLong, 0L, localHashMap, "");
      return;
    }
  }
  
  private static void c()
  {
    TencentLocationManager localTencentLocationManager = TencentLocationManager.getInstance(BaseApplicationImpl.getContext());
    if (jdField_a_of_type_ComTencentMapGeolocationTencentLocationListener != null) {
      localTencentLocationManager.removeUpdates(jdField_a_of_type_ComTencentMapGeolocationTencentLocationListener);
    }
    if (QLog.isColorLevel()) {
      QLog.d("SOSO.LBS", 2, "stopLocation() stop LBS");
    }
  }
  
  private static void c(SosoInterface.OnLocationListener paramOnLocationListener)
  {
    if (paramOnLocationListener == null) {
      return;
    }
    synchronized (jdField_a_of_type_JavaLangObject)
    {
      if (!jdField_a_of_type_JavaUtilArrayList.contains(paramOnLocationListener)) {
        jdField_a_of_type_JavaUtilArrayList.add(paramOnLocationListener);
      }
      return;
    }
  }
  
  public void println(String paramString1, int paramInt, String paramString2)
  {
    if ((QLog.isColorLevel()) && (paramString2 != null))
    {
      String str = paramString2;
      if (paramString2.length() > 100) {
        str = paramString2.substring(0, 100);
      }
      QLog.d(paramString1, 2, str);
    }
  }
}
