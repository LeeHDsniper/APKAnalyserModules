package com.tencent.mobileqq.statistics;

import android.os.Environment;
import android.os.Handler;
import android.os.Handler.Callback;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.os.SystemClock;
import android.text.TextUtils;
import com.tencent.common.app.BaseApplicationImpl;
import com.tencent.mobileqq.activity.SplashActivity;
import com.tencent.mobileqq.app.BaseActivity;
import com.tencent.mobileqq.app.DropFrameMonitor;
import com.tencent.mobileqq.app.LooperMonitorHelper;
import com.tencent.mobileqq.app.ProcessStats;
import com.tencent.mobileqq.app.ProcessStats.Stats;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import mqq.app.MainService;
import mqq.util.AbstractUnifiedMonitor;
import mqq.util.AbstractUnifiedMonitor.ThreadMonitorCallback;
import rez;
import rfa;
import rfb;

public class UnifiedMonitor
  extends AbstractUnifiedMonitor
  implements Handler.Callback
{
  static final int jdField_a_of_type_Int = 1;
  private static UnifiedMonitor jdField_a_of_type_ComTencentMobileqqStatisticsUnifiedMonitor = null;
  private static final String jdField_a_of_type_JavaLangString = "unifiedMonitor";
  static final int jdField_b_of_type_Int = 2;
  private static final String jdField_b_of_type_JavaLangString = "UnifiedMonitor";
  public static final boolean b = true;
  static final int jdField_c_of_type_Int = 3;
  static final int jdField_d_of_type_Int = 4;
  private static final String jdField_d_of_type_JavaLangString = "user_ratio_";
  static final int jdField_e_of_type_Int = 5;
  private static final String jdField_e_of_type_JavaLangString = "max_report_";
  static final int jdField_f_of_type_Int = 6;
  private static final String jdField_f_of_type_JavaLangString = "num_thresh_";
  static final int jdField_g_of_type_Int = 7;
  private static final String jdField_g_of_type_JavaLangString = "event_ratio_";
  static final int jdField_h_of_type_Int = 8;
  private static final String jdField_h_of_type_JavaLangString = "max_stackdep_";
  static final int jdField_i_of_type_Int = 9;
  private static final String jdField_i_of_type_JavaLangString = "max_stack_ts_";
  private static final int jdField_j_of_type_Int = 3000;
  private static final String jdField_j_of_type_JavaLangString = "max_monitor_time_";
  private static final String k = "max_log_num_";
  private Handler jdField_a_of_type_AndroidOsHandler = null;
  private HandlerThread jdField_a_of_type_AndroidOsHandlerThread = null;
  public volatile boolean a;
  private rez[] jdField_a_of_type_ArrayOfRez = { new rez(0.001F, 100, 10, 0.1F, 6, 0, 0, 0), new rez(), new rez(), new rez(), new rez(0.001F, 200, 10, 0.001F, 6, 0, 0, 0), new rez(0.001F, 200, 10, 0.001F, 6, 0, 0, 0), new rez(0.001F, 1000, 10, 0.001F, 0, 0, 0, 0), new rez(0.001F, 1000, 10, 0.1F, 6, 6, 0, 0), new rez(0.001F, 0, 10, 0.1F, 0, 0, 0, 0), new rez(0.001F, 100, 5, 0.01F, 0, 0, 0, 0), new rez(0.001F, 100, 10, 0.1F, 6, 0, 0, 0), new rfa(0.0F, 100100005, 1, 0.01F, 0, 0, 2, 300) };
  private Handler jdField_b_of_type_AndroidOsHandler;
  private String jdField_c_of_type_JavaLangString;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public UnifiedMonitor()
  {
    b = null;
    jdField_a_of_type_Boolean = false;
    c = null;
  }
  
  public static UnifiedMonitor a()
  {
    if (jdField_a_of_type_ComTencentMobileqqStatisticsUnifiedMonitor != null) {
      return jdField_a_of_type_ComTencentMobileqqStatisticsUnifiedMonitor;
    }
    try
    {
      if (jdField_a_of_type_ComTencentMobileqqStatisticsUnifiedMonitor == null) {
        jdField_a_of_type_ComTencentMobileqqStatisticsUnifiedMonitor = new UnifiedMonitor();
      }
      UnifiedMonitor localUnifiedMonitor = jdField_a_of_type_ComTencentMobileqqStatisticsUnifiedMonitor;
      return localUnifiedMonitor;
    }
    finally {}
  }
  
  public static Map a()
  {
    Object localObject = BaseActivity.sTopActivity;
    if (localObject != null)
    {
      String str = localObject.getClass().getName();
      if (((localObject instanceof SplashActivity)) && (SplashActivity.jdField_c_of_type_Int == 1)) {
        str = str + "_" + ((SplashActivity)localObject).a();
      }
      for (;;)
      {
        localObject = new HashMap(8);
        ((Map)localObject).put("act", str);
        return localObject;
      }
    }
    return null;
  }
  
  private void a(int paramInt)
  {
    jdField_a_of_type_ArrayOfRez[paramInt].jdField_a_of_type_Boolean = false;
    jdField_a_of_type_ArrayOfRez[paramInt].jdField_b_of_type_Boolean = false;
    jdField_a_of_type_ArrayOfRez[paramInt].jdField_a_of_type_Rfb = null;
    jdField_a_of_type_ArrayOfRez[paramInt].jdField_c_of_type_Boolean = false;
    if (jdField_a_of_type_ArrayOfRez[paramInt].jdField_a_of_type_MqqUtilAbstractUnifiedMonitor$ThreadMonitorCallback != null)
    {
      jdField_a_of_type_ArrayOfRez[paramInt].jdField_a_of_type_MqqUtilAbstractUnifiedMonitor$ThreadMonitorCallback.onThreadMonitorEnd(paramInt);
      jdField_a_of_type_ArrayOfRez[paramInt].jdField_a_of_type_MqqUtilAbstractUnifiedMonitor$ThreadMonitorCallback = null;
    }
  }
  
  private boolean a()
  {
    return new File(Environment.getExternalStorageDirectory().getPath() + "/looper").exists();
  }
  
  private boolean a(int paramInt, boolean paramBoolean)
  {
    float f1 = jdField_a_of_type_ArrayOfRez[paramInt].jdField_b_of_type_Float;
    if (jdField_a_of_type_ArrayOfRez[paramInt].g >= jdField_a_of_type_ArrayOfRez[paramInt].jdField_b_of_type_Int) {}
    while (Math.random() > f1) {
      return false;
    }
    return true;
  }
  
  private void c()
  {
    if (whetherReportDuringThisStartup(0)) {
      LooperMonitorHelper.a();
    }
    if (whetherReportDuringThisStartup(4)) {
      LooperMonitorHelper.b();
    }
    if (whetherReportDuringThisStartup(5)) {
      LooperMonitorHelper.c();
    }
    if (whetherReportDuringThisStartup(6)) {
      LooperMonitorHelper.d();
    }
    MainService.setUnifiedMonitorInstance(a());
    DropFrameMonitor.a().a();
    if (whetherReportDuringThisStartup(10)) {
      DropFrameMonitor.a().b();
    }
    d();
  }
  
  private final void d()
  {
    if ((whetherReportDuringThisStartup(11)) && (jdField_a_of_type_AndroidOsHandlerThread == null))
    {
      jdField_a_of_type_AndroidOsHandlerThread = ThreadManager.a("cpu-stats", 0);
      jdField_a_of_type_AndroidOsHandlerThread.start();
      Looper localLooper = jdField_a_of_type_AndroidOsHandlerThread.getLooper();
      if (localLooper != null)
      {
        b = new Handler(localLooper, this);
        b.sendEmptyMessage(4);
      }
    }
  }
  
  private final void e()
  {
    if (jdField_a_of_type_AndroidOsHandlerThread != null)
    {
      if (b != null) {
        b.removeCallbacksAndMessages(null);
      }
      jdField_a_of_type_AndroidOsHandlerThread = null;
    }
  }
  
  /* Error */
  private void f()
  {
    // Byte code:
    //   0: invokestatic 273	com/tencent/mobileqq/app/DeviceProfileManager:a	()Lcom/tencent/mobileqq/app/DeviceProfileManager;
    //   3: getstatic 279	com/tencent/mobileqq/app/DeviceProfileManager$DpcNames:unified_monitor_params	Lcom/tencent/mobileqq/app/DeviceProfileManager$DpcNames;
    //   6: invokevirtual 282	com/tencent/mobileqq/app/DeviceProfileManager$DpcNames:name	()Ljava/lang/String;
    //   9: invokevirtual 285	com/tencent/mobileqq/app/DeviceProfileManager:a	(Ljava/lang/String;)Ljava/lang/String;
    //   12: astore 7
    //   14: invokestatic 290	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   17: ifeq +30 -> 47
    //   20: ldc 17
    //   22: iconst_4
    //   23: new 120	java/lang/StringBuilder
    //   26: dup
    //   27: invokespecial 121	java/lang/StringBuilder:<init>	()V
    //   30: ldc_w 292
    //   33: invokevirtual 125	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   36: aload 7
    //   38: invokevirtual 125	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   41: invokevirtual 136	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   44: invokestatic 295	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   47: aload 7
    //   49: ifnull +530 -> 579
    //   52: aload 7
    //   54: ldc_w 297
    //   57: invokevirtual 303	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   60: astore 9
    //   62: aload 9
    //   64: ifnonnull +20 -> 84
    //   67: aload_0
    //   68: monitorenter
    //   69: aload_0
    //   70: iconst_1
    //   71: putfield 75	com/tencent/mobileqq/statistics/UnifiedMonitor:jdField_a_of_type_Boolean	Z
    //   74: aload_0
    //   75: monitorexit
    //   76: return
    //   77: astore 7
    //   79: aload_0
    //   80: monitorexit
    //   81: aload 7
    //   83: athrow
    //   84: aload 9
    //   86: arraylength
    //   87: istore 4
    //   89: iconst_0
    //   90: istore_1
    //   91: iload_1
    //   92: iload 4
    //   94: if_icmpge +485 -> 579
    //   97: aload 9
    //   99: iload_1
    //   100: aaload
    //   101: astore 7
    //   103: aload 7
    //   105: ldc_w 305
    //   108: invokevirtual 303	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   111: astore 10
    //   113: aload 10
    //   115: ifnull +624 -> 739
    //   118: aload 10
    //   120: arraylength
    //   121: iconst_2
    //   122: if_icmpne +617 -> 739
    //   125: aload 10
    //   127: iconst_0
    //   128: aaload
    //   129: invokestatic 311	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   132: ifne +607 -> 739
    //   135: aload 10
    //   137: iconst_1
    //   138: aaload
    //   139: invokestatic 311	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   142: ifne +597 -> 739
    //   145: aload 10
    //   147: iconst_0
    //   148: aaload
    //   149: bipush 95
    //   151: invokevirtual 315	java/lang/String:lastIndexOf	(I)I
    //   154: istore 5
    //   156: iload 5
    //   158: iconst_m1
    //   159: if_icmpeq +587 -> 746
    //   162: aload 10
    //   164: iconst_0
    //   165: aaload
    //   166: iconst_0
    //   167: iload 5
    //   169: iconst_1
    //   170: iadd
    //   171: invokevirtual 319	java/lang/String:substring	(II)Ljava/lang/String;
    //   174: astore 7
    //   176: iload 5
    //   178: iconst_m1
    //   179: if_icmpeq +573 -> 752
    //   182: iload 5
    //   184: aload 10
    //   186: iconst_0
    //   187: aaload
    //   188: invokevirtual 322	java/lang/String:length	()I
    //   191: iconst_1
    //   192: isub
    //   193: if_icmpge +559 -> 752
    //   196: aload 10
    //   198: iconst_0
    //   199: aaload
    //   200: iload 5
    //   202: iconst_1
    //   203: iadd
    //   204: invokevirtual 325	java/lang/String:substring	(I)Ljava/lang/String;
    //   207: astore 8
    //   209: iconst_m1
    //   210: istore_2
    //   211: aload 8
    //   213: invokestatic 331	java/lang/Integer:valueOf	(Ljava/lang/String;)Ljava/lang/Integer;
    //   216: invokevirtual 334	java/lang/Integer:intValue	()I
    //   219: istore_3
    //   220: iload_3
    //   221: istore_2
    //   222: invokestatic 290	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   225: ifeq +66 -> 291
    //   228: ldc 17
    //   230: iconst_4
    //   231: new 120	java/lang/StringBuilder
    //   234: dup
    //   235: invokespecial 121	java/lang/StringBuilder:<init>	()V
    //   238: ldc_w 336
    //   241: invokevirtual 125	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   244: iload_2
    //   245: invokevirtual 133	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   248: ldc_w 338
    //   251: invokevirtual 125	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   254: aload 7
    //   256: invokevirtual 125	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   259: ldc_w 340
    //   262: invokevirtual 125	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   265: aload 10
    //   267: iconst_0
    //   268: aaload
    //   269: invokevirtual 125	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   272: ldc_w 342
    //   275: invokevirtual 125	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   278: aload 10
    //   280: iconst_1
    //   281: aaload
    //   282: invokevirtual 125	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   285: invokevirtual 136	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   288: invokestatic 295	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   291: aload 7
    //   293: ifnull +446 -> 739
    //   296: iload 5
    //   298: iconst_m1
    //   299: if_icmpeq +440 -> 739
    //   302: iload_2
    //   303: iconst_m1
    //   304: if_icmpeq +435 -> 739
    //   307: aload 8
    //   309: ifnull +430 -> 739
    //   312: iload_2
    //   313: bipush 12
    //   315: if_icmpge +424 -> 739
    //   318: ldc 24
    //   320: aload 7
    //   322: invokevirtual 346	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   325: ifeq +25 -> 350
    //   328: aload_0
    //   329: getfield 90	com/tencent/mobileqq/statistics/UnifiedMonitor:jdField_a_of_type_ArrayOfRez	[Lrez;
    //   332: iload_2
    //   333: aaload
    //   334: aload 10
    //   336: iconst_1
    //   337: aaload
    //   338: invokestatic 351	java/lang/Float:valueOf	(Ljava/lang/String;)Ljava/lang/Float;
    //   341: invokevirtual 355	java/lang/Float:floatValue	()F
    //   344: putfield 357	rez:jdField_a_of_type_Float	F
    //   347: goto +392 -> 739
    //   350: ldc 28
    //   352: aload 7
    //   354: invokevirtual 346	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   357: ifeq +71 -> 428
    //   360: aload_0
    //   361: getfield 90	com/tencent/mobileqq/statistics/UnifiedMonitor:jdField_a_of_type_ArrayOfRez	[Lrez;
    //   364: iload_2
    //   365: aaload
    //   366: aload 10
    //   368: iconst_1
    //   369: aaload
    //   370: invokestatic 331	java/lang/Integer:valueOf	(Ljava/lang/String;)Ljava/lang/Integer;
    //   373: invokevirtual 334	java/lang/Integer:intValue	()I
    //   376: putfield 196	rez:jdField_b_of_type_Int	I
    //   379: goto +360 -> 739
    //   382: astore 7
    //   384: invokestatic 290	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   387: ifeq +352 -> 739
    //   390: aload 7
    //   392: invokevirtual 360	java/lang/Throwable:printStackTrace	()V
    //   395: goto +344 -> 739
    //   398: astore 7
    //   400: invokestatic 290	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   403: ifeq +8 -> 411
    //   406: aload 7
    //   408: invokevirtual 360	java/lang/Throwable:printStackTrace	()V
    //   411: aload_0
    //   412: monitorenter
    //   413: aload_0
    //   414: iconst_1
    //   415: putfield 75	com/tencent/mobileqq/statistics/UnifiedMonitor:jdField_a_of_type_Boolean	Z
    //   418: aload_0
    //   419: monitorexit
    //   420: return
    //   421: astore 7
    //   423: aload_0
    //   424: monitorexit
    //   425: aload 7
    //   427: athrow
    //   428: ldc 32
    //   430: aload 7
    //   432: invokevirtual 346	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   435: ifeq +39 -> 474
    //   438: aload_0
    //   439: getfield 90	com/tencent/mobileqq/statistics/UnifiedMonitor:jdField_a_of_type_ArrayOfRez	[Lrez;
    //   442: iload_2
    //   443: aaload
    //   444: aload 10
    //   446: iconst_1
    //   447: aaload
    //   448: invokestatic 331	java/lang/Integer:valueOf	(Ljava/lang/String;)Ljava/lang/Integer;
    //   451: invokevirtual 334	java/lang/Integer:intValue	()I
    //   454: putfield 362	rez:jdField_a_of_type_Int	I
    //   457: goto +282 -> 739
    //   460: astore 7
    //   462: aload_0
    //   463: monitorenter
    //   464: aload_0
    //   465: iconst_1
    //   466: putfield 75	com/tencent/mobileqq/statistics/UnifiedMonitor:jdField_a_of_type_Boolean	Z
    //   469: aload_0
    //   470: monitorexit
    //   471: aload 7
    //   473: athrow
    //   474: ldc 36
    //   476: aload 7
    //   478: invokevirtual 346	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   481: ifeq +26 -> 507
    //   484: aload_0
    //   485: getfield 90	com/tencent/mobileqq/statistics/UnifiedMonitor:jdField_a_of_type_ArrayOfRez	[Lrez;
    //   488: iload_2
    //   489: aaload
    //   490: aload 10
    //   492: iconst_1
    //   493: aaload
    //   494: invokestatic 331	java/lang/Integer:valueOf	(Ljava/lang/String;)Ljava/lang/Integer;
    //   497: invokevirtual 334	java/lang/Integer:intValue	()I
    //   500: i2f
    //   501: putfield 192	rez:jdField_b_of_type_Float	F
    //   504: goto +235 -> 739
    //   507: ldc 40
    //   509: aload 7
    //   511: invokevirtual 346	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   514: ifeq +33 -> 547
    //   517: getstatic 367	android/os/Build$VERSION:SDK_INT	I
    //   520: bipush 17
    //   522: if_icmpeq +217 -> 739
    //   525: aload_0
    //   526: getfield 90	com/tencent/mobileqq/statistics/UnifiedMonitor:jdField_a_of_type_ArrayOfRez	[Lrez;
    //   529: iload_2
    //   530: aaload
    //   531: aload 10
    //   533: iconst_1
    //   534: aaload
    //   535: invokestatic 331	java/lang/Integer:valueOf	(Ljava/lang/String;)Ljava/lang/Integer;
    //   538: invokevirtual 334	java/lang/Integer:intValue	()I
    //   541: putfield 368	rez:jdField_c_of_type_Int	I
    //   544: goto +195 -> 739
    //   547: ldc 44
    //   549: aload 7
    //   551: invokevirtual 346	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   554: ifeq +185 -> 739
    //   557: aload_0
    //   558: getfield 90	com/tencent/mobileqq/statistics/UnifiedMonitor:jdField_a_of_type_ArrayOfRez	[Lrez;
    //   561: iload_2
    //   562: aaload
    //   563: aload 10
    //   565: iconst_1
    //   566: aaload
    //   567: invokestatic 331	java/lang/Integer:valueOf	(Ljava/lang/String;)Ljava/lang/Integer;
    //   570: invokevirtual 334	java/lang/Integer:intValue	()I
    //   573: putfield 370	rez:d	I
    //   576: goto +163 -> 739
    //   579: iconst_0
    //   580: istore_1
    //   581: iload_1
    //   582: aload_0
    //   583: getfield 90	com/tencent/mobileqq/statistics/UnifiedMonitor:jdField_a_of_type_ArrayOfRez	[Lrez;
    //   586: arraylength
    //   587: if_icmpge +45 -> 632
    //   590: aload_0
    //   591: getfield 90	com/tencent/mobileqq/statistics/UnifiedMonitor:jdField_a_of_type_ArrayOfRez	[Lrez;
    //   594: iload_1
    //   595: aaload
    //   596: astore 7
    //   598: invokestatic 202	java/lang/Math:random	()D
    //   601: aload_0
    //   602: getfield 90	com/tencent/mobileqq/statistics/UnifiedMonitor:jdField_a_of_type_ArrayOfRez	[Lrez;
    //   605: iload_1
    //   606: aaload
    //   607: getfield 357	rez:jdField_a_of_type_Float	F
    //   610: f2d
    //   611: dcmpg
    //   612: ifgt +146 -> 758
    //   615: iconst_1
    //   616: istore 6
    //   618: aload 7
    //   620: iload 6
    //   622: putfield 150	rez:jdField_a_of_type_Boolean	Z
    //   625: iload_1
    //   626: iconst_1
    //   627: iadd
    //   628: istore_1
    //   629: goto -48 -> 581
    //   632: aload_0
    //   633: getfield 90	com/tencent/mobileqq/statistics/UnifiedMonitor:jdField_a_of_type_ArrayOfRez	[Lrez;
    //   636: bipush 10
    //   638: aaload
    //   639: iconst_0
    //   640: putfield 150	rez:jdField_a_of_type_Boolean	Z
    //   643: invokestatic 373	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   646: ifeq +53 -> 699
    //   649: aload_0
    //   650: getfield 90	com/tencent/mobileqq/statistics/UnifiedMonitor:jdField_a_of_type_ArrayOfRez	[Lrez;
    //   653: iconst_0
    //   654: aaload
    //   655: iconst_1
    //   656: putfield 150	rez:jdField_a_of_type_Boolean	Z
    //   659: aload_0
    //   660: getfield 90	com/tencent/mobileqq/statistics/UnifiedMonitor:jdField_a_of_type_ArrayOfRez	[Lrez;
    //   663: iconst_0
    //   664: aaload
    //   665: ldc_w 374
    //   668: putfield 196	rez:jdField_b_of_type_Int	I
    //   671: aload_0
    //   672: getfield 90	com/tencent/mobileqq/statistics/UnifiedMonitor:jdField_a_of_type_ArrayOfRez	[Lrez;
    //   675: iconst_0
    //   676: aaload
    //   677: fconst_1
    //   678: putfield 192	rez:jdField_b_of_type_Float	F
    //   681: invokestatic 373	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   684: ifeq +15 -> 699
    //   687: aload_0
    //   688: getfield 90	com/tencent/mobileqq/statistics/UnifiedMonitor:jdField_a_of_type_ArrayOfRez	[Lrez;
    //   691: iconst_0
    //   692: aaload
    //   693: sipush 400
    //   696: putfield 362	rez:jdField_a_of_type_Int	I
    //   699: aload_0
    //   700: getfield 90	com/tencent/mobileqq/statistics/UnifiedMonitor:jdField_a_of_type_ArrayOfRez	[Lrez;
    //   703: bipush 11
    //   705: aaload
    //   706: iconst_0
    //   707: putfield 150	rez:jdField_a_of_type_Boolean	Z
    //   710: aload_0
    //   711: monitorenter
    //   712: aload_0
    //   713: iconst_1
    //   714: putfield 75	com/tencent/mobileqq/statistics/UnifiedMonitor:jdField_a_of_type_Boolean	Z
    //   717: aload_0
    //   718: monitorexit
    //   719: return
    //   720: astore 7
    //   722: aload_0
    //   723: monitorexit
    //   724: aload 7
    //   726: athrow
    //   727: astore 7
    //   729: aload_0
    //   730: monitorexit
    //   731: aload 7
    //   733: athrow
    //   734: astore 11
    //   736: goto -514 -> 222
    //   739: iload_1
    //   740: iconst_1
    //   741: iadd
    //   742: istore_1
    //   743: goto -652 -> 91
    //   746: aconst_null
    //   747: astore 7
    //   749: goto -573 -> 176
    //   752: aconst_null
    //   753: astore 8
    //   755: goto -546 -> 209
    //   758: iconst_0
    //   759: istore 6
    //   761: goto -143 -> 618
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	764	0	this	UnifiedMonitor
    //   90	653	1	m	int
    //   210	352	2	n	int
    //   219	2	3	i1	int
    //   87	8	4	i2	int
    //   154	146	5	i3	int
    //   616	144	6	bool	boolean
    //   12	41	7	str1	String
    //   77	5	7	localObject1	Object
    //   101	252	7	str2	String
    //   382	9	7	localThrowable1	Throwable
    //   398	9	7	localThrowable2	Throwable
    //   421	10	7	localObject2	Object
    //   460	90	7	localObject3	Object
    //   596	23	7	localRez	rez
    //   720	5	7	localObject4	Object
    //   727	5	7	localObject5	Object
    //   747	1	7	localObject6	Object
    //   207	547	8	str3	String
    //   60	38	9	arrayOfString1	String[]
    //   111	453	10	arrayOfString2	String[]
    //   734	1	11	localNumberFormatException	NumberFormatException
    // Exception table:
    //   from	to	target	type
    //   69	76	77	finally
    //   79	81	77	finally
    //   103	113	382	java/lang/Throwable
    //   118	156	382	java/lang/Throwable
    //   162	176	382	java/lang/Throwable
    //   182	209	382	java/lang/Throwable
    //   211	220	382	java/lang/Throwable
    //   222	291	382	java/lang/Throwable
    //   318	347	382	java/lang/Throwable
    //   350	379	382	java/lang/Throwable
    //   428	457	382	java/lang/Throwable
    //   474	504	382	java/lang/Throwable
    //   507	544	382	java/lang/Throwable
    //   547	576	382	java/lang/Throwable
    //   0	47	398	java/lang/Throwable
    //   52	62	398	java/lang/Throwable
    //   84	89	398	java/lang/Throwable
    //   384	395	398	java/lang/Throwable
    //   581	615	398	java/lang/Throwable
    //   618	625	398	java/lang/Throwable
    //   632	699	398	java/lang/Throwable
    //   699	710	398	java/lang/Throwable
    //   413	420	421	finally
    //   423	425	421	finally
    //   0	47	460	finally
    //   52	62	460	finally
    //   84	89	460	finally
    //   103	113	460	finally
    //   118	156	460	finally
    //   162	176	460	finally
    //   182	209	460	finally
    //   211	220	460	finally
    //   222	291	460	finally
    //   318	347	460	finally
    //   350	379	460	finally
    //   384	395	460	finally
    //   400	411	460	finally
    //   428	457	460	finally
    //   474	504	460	finally
    //   507	544	460	finally
    //   547	576	460	finally
    //   581	615	460	finally
    //   618	625	460	finally
    //   632	699	460	finally
    //   699	710	460	finally
    //   712	719	720	finally
    //   722	724	720	finally
    //   464	471	727	finally
    //   729	731	727	finally
    //   211	220	734	java/lang/NumberFormatException
  }
  
  public void a()
  {
    if (!jdField_a_of_type_Boolean)
    {
      Object localObject = ThreadManager.a("unified-monitor", 0);
      ((HandlerThread)localObject).start();
      localObject = ((HandlerThread)localObject).getLooper();
      if (localObject != null)
      {
        jdField_a_of_type_AndroidOsHandler = new Handler((Looper)localObject, this);
        jdField_a_of_type_AndroidOsHandler.sendEmptyMessage(3);
      }
    }
  }
  
  public void a(String paramString)
  {
    if (jdField_a_of_type_ArrayOfRez[11]).d)
    {
      b.removeCallbacksAndMessages(null);
      b.obtainMessage(7, paramString).sendToTarget();
    }
  }
  
  public void a(String paramString, long paramLong)
  {
    if ((jdField_a_of_type_ArrayOfRez[11]).d) && (b.hasMessages(8)))
    {
      b.removeMessages(8);
      paramString = b.obtainMessage(8, paramString);
      b.sendMessageDelayed(paramString, paramLong);
    }
  }
  
  public void a(int[] paramArrayOfInt) {}
  
  public int[] a()
  {
    return new int[4];
  }
  
  public void addEvent(int paramInt1, String paramString, int paramInt2, int paramInt3, Map paramMap)
  {
    if ((!jdField_a_of_type_Boolean) || (!whetherReportDuringThisStartup(paramInt1))) {}
    String str;
    do
    {
      return;
      str = jdField_a_of_type_ArrayOfRez[paramInt1].jdField_a_of_type_JavaLangString;
    } while ((jdField_a_of_type_ArrayOfRez[paramInt1].jdField_c_of_type_Boolean) && (TextUtils.isEmpty(str)));
    Object localObject = paramMap;
    if (paramMap == null) {
      localObject = new HashMap(10);
    }
    ((Map)localObject).put("family", String.valueOf(paramInt1));
    if (paramString != null)
    {
      ((Map)localObject).put("event", paramString);
      ((Map)localObject).put("revision", "201932");
      if (c == null)
      {
        c = "dbg";
        c = "pub";
      }
      ((Map)localObject).put("build_type", c);
      if (SystemClock.uptimeMillis() - ProcessStats.jdField_a_of_type_Long < 60000L)
      {
        ((Map)localObject).put("totalCpu", String.valueOf(ProcessStats.jdField_a_of_type_Int));
        ((Map)localObject).put("appCpu", String.valueOf(jdField_a_of_type_ComTencentMobileqqAppProcessStats$StatsjdField_a_of_type_Int));
        ((Map)localObject).put("cpu_update_time", String.valueOf((SystemClock.uptimeMillis() - ProcessStats.jdField_a_of_type_Long) / 1000L));
      }
      if (!QLog.isColorLevel()) {
        break label320;
      }
      paramString = "-1";
      label234:
      ((Map)localObject).put("not_reported", paramString);
      if (str != null)
      {
        if (str.length() > 950) {
          break label329;
        }
        ((Map)localObject).put("stack", str);
      }
    }
    for (;;)
    {
      jdField_a_of_type_AndroidOsHandler.sendMessage(Message.obtain(jdField_a_of_type_AndroidOsHandler, 1, paramInt2, 0, localObject));
      paramString = jdField_a_of_type_ArrayOfRez[paramInt1];
      g += 1;
      return;
      paramString = "";
      break;
      label320:
      paramString = String.valueOf(paramInt3);
      break label234;
      label329:
      ((Map)localObject).put("stack", str.substring(0, 950));
      ((Map)localObject).put("stack1", str.substring(950));
    }
  }
  
  public void b() {}
  
  public int getThreshold(int paramInt)
  {
    return jdField_a_of_type_ArrayOfRez[paramInt].jdField_a_of_type_Int;
  }
  
  public boolean handleMessage(Message paramMessage)
  {
    switch (what)
    {
    }
    for (;;)
    {
      return true;
      if (obj == null) {
        continue;
      }
      Object localObject;
      try
      {
        localObject = (HashMap)obj;
        int m = arg1;
        StatisticCollector.a(BaseApplicationImpl.a()).a(null, "unifiedMonitor", true, m, 0L, (HashMap)localObject, null);
        return true;
      }
      catch (Throwable paramMessage) {}
      if (!QLog.isColorLevel()) {
        continue;
      }
      paramMessage.printStackTrace();
      return true;
      addEvent(arg1, "", 3000, -1, a());
      jdField_a_of_type_ArrayOfRez[arg1].jdField_a_of_type_JavaLangString = null;
      return true;
      f();
      c();
      return true;
      jdField_a_of_type_ArrayOfRez[11].jdField_a_of_type_Long = SystemClock.uptimeMillis();
      b.sendEmptyMessageDelayed(5, 2000L);
      return true;
      ProcessStats.a(false);
      if (b.hasMessages(7)) {
        continue;
      }
      b.sendEmptyMessageDelayed(6, 1500L);
      return true;
      ProcessStats.b(false);
      paramMessage = (rfa)jdField_a_of_type_ArrayOfRez[11];
      if (a(11, true))
      {
        localObject = new HashMap(10);
        ((Map)localObject).put("total_cpu", String.valueOf(ProcessStats.jdField_a_of_type_Int));
        ((Map)localObject).put("app_cpu", String.valueOf(jdField_a_of_type_ComTencentMobileqqAppProcessStats$StatsjdField_a_of_type_Int));
        a().addEvent(11, null, 0, 0, (Map)localObject);
      }
      if ((ProcessStats.jdField_a_of_type_Int >= j) || (jdField_a_of_type_ComTencentMobileqqAppProcessStats$StatsjdField_a_of_type_Int >= k)) {
        if ((QLog.isColorLevel()) && (SystemClock.uptimeMillis() - c > 60000L))
        {
          QLog.d("UnifiedMonitor", 2, "totalCpu exceed: " + ProcessStats.jdField_a_of_type_Int + ", appCpu: " + jdField_a_of_type_ComTencentMobileqqAppProcessStats$StatsjdField_a_of_type_Int);
          ProcessStats.a(true);
        }
      }
      try
      {
        Thread.sleep(2000L);
        ProcessStats.b(true);
        localObject = ProcessStats.a(l, true).iterator();
        while (((Iterator)localObject).hasNext()) {
          QLog.d("UnifiedMonitor", 2, (String)((Iterator)localObject).next());
        }
        QLog.d("UnifiedMonitor", 2, ProcessStats.a(10));
        localObject = ProcessStats.a(l, true).iterator();
        while (((Iterator)localObject).hasNext()) {
          QLog.d("UnifiedMonitor", 2, (String)((Iterator)localObject).next());
        }
        c = SystemClock.uptimeMillis();
        label491:
        h += 1;
        while ((h < e) && (SystemClock.uptimeMillis() - jdField_a_of_type_Long < f * 1000L))
        {
          b.sendEmptyMessageDelayed(5, 2000L);
          return true;
          QLog.d("UnifiedMonitor", 1, "totalCpu exceed: " + ProcessStats.jdField_a_of_type_Int + ", appCpu: " + jdField_a_of_type_ComTencentMobileqqAppProcessStats$StatsjdField_a_of_type_Int);
          break label491;
          if (QLog.isColorLevel()) {
            QLog.d("UnifiedMonitor", 2, "totalCpu: " + ProcessStats.jdField_a_of_type_Int + ", appCpu: " + jdField_a_of_type_ComTencentMobileqqAppProcessStats$StatsjdField_a_of_type_Int);
          }
          m = 1;
        }
        b.removeCallbacksAndMessages(null);
        ProcessStats.a(true);
        b.sendEmptyMessageDelayed(8, 10000L);
        return true;
        ProcessStats.b(true);
        localObject = (rfa)jdField_a_of_type_ArrayOfRez[11];
        if (!QLog.isColorLevel()) {
          continue;
        }
        localObject = ProcessStats.a(l, true);
        QLog.d("UnifiedMonitor", 2, "trace " + obj + "'s cpu end(" + ProcessStats.jdField_a_of_type_Int + ", " + jdField_a_of_type_ComTencentMobileqqAppProcessStats$StatsjdField_a_of_type_Int + ")");
        paramMessage = ((List)localObject).iterator();
        while (paramMessage.hasNext()) {
          QLog.d("UnifiedMonitor", 2, (String)paramMessage.next());
        }
      }
      catch (InterruptedException localInterruptedException)
      {
        for (;;) {}
      }
    }
  }
  
  public void notifyNotTimeout(int paramInt)
  {
    jdField_a_of_type_ArrayOfRez[paramInt].jdField_b_of_type_Long = 0L;
    jdField_a_of_type_ArrayOfRez[paramInt].jdField_a_of_type_JavaLangString = null;
    if ((paramInt == 0) || (paramInt == 10)) {
      jdField_a_of_type_AndroidOsHandler.removeMessages(2);
    }
  }
  
  public void reportStackIfTimeout(int paramInt)
  {
    jdField_a_of_type_ArrayOfRez[paramInt].jdField_b_of_type_Long = SystemClock.uptimeMillis();
    jdField_a_of_type_ArrayOfRez[paramInt].jdField_a_of_type_JavaLangString = null;
    jdField_a_of_type_ArrayOfRez[paramInt].jdField_b_of_type_Boolean = false;
  }
  
  public boolean setMonitoredThread(int paramInt, Thread paramThread, AbstractUnifiedMonitor.ThreadMonitorCallback arg3)
  {
    if ((paramThread == null) || (!jdField_a_of_type_ArrayOfRez[paramInt].jdField_a_of_type_Boolean) || (jdField_a_of_type_ArrayOfRez[paramInt].jdField_a_of_type_Rfb != null) || (jdField_a_of_type_ArrayOfRez[paramInt].jdField_c_of_type_Int <= 0)) {
      return false;
    }
    if (QLog.isDevelopLevel()) {
      QLog.d("UnifiedMonitor", 4, "setMonitoredThread for family=" + paramInt);
    }
    synchronized (jdField_a_of_type_ArrayOfRez[paramInt])
    {
      if (jdField_a_of_type_ArrayOfRez[paramInt].jdField_a_of_type_Rfb == null)
      {
        jdField_a_of_type_ArrayOfRez[paramInt].jdField_a_of_type_Rfb = new rfb(this, paramInt, paramThread);
        ThreadManager.a(jdField_a_of_type_ArrayOfRez[paramInt].jdField_a_of_type_Rfb, "um-stack-fetcher-" + paramInt, 5).start();
        jdField_a_of_type_ArrayOfRez[paramInt].jdField_c_of_type_Boolean = true;
        return true;
      }
    }
    return false;
  }
  
  public boolean whetherReportDuringThisStartup(int paramInt)
  {
    if (paramInt >= 12) {
      return false;
    }
    return jdField_a_of_type_ArrayOfRez[paramInt].jdField_a_of_type_Boolean;
  }
  
  public boolean whetherReportThisTime(int paramInt)
  {
    if ((!jdField_a_of_type_Boolean) || (!jdField_a_of_type_ArrayOfRez[paramInt].jdField_a_of_type_Boolean)) {
      return false;
    }
    if (jdField_a_of_type_ArrayOfRez[paramInt].jdField_c_of_type_Boolean) {
      return jdField_a_of_type_ArrayOfRez[paramInt].jdField_b_of_type_Boolean;
    }
    return a(paramInt, false);
  }
  
  public boolean whetherStackEnabled(int paramInt)
  {
    return jdField_a_of_type_ArrayOfRez[paramInt].jdField_c_of_type_Boolean;
  }
}
