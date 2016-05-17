package com.tencent.mobileqq.activity.richmedia;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.os.AsyncTask;
import android.os.SystemClock;
import android.widget.TextView;
import com.tencent.maxvideo.mediadevice.AVCodec;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoClipSpec;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoStateMgr;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoThumbGenMgr;
import com.tencent.mobileqq.activity.richmedia.state.RMVideoThumbGenMgr.ThumbGenItem;
import com.tencent.mobileqq.activity.shortvideo.SendVideoActivity;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.data.MessageForBlessPTV;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.shortvideo.VideoEnvironment;
import com.tencent.mobileqq.shortvideo.mediadevice.CodecParam;
import com.tencent.mobileqq.shortvideo.mediadevice.PreviewContext;
import com.tencent.mobileqq.shortvideo.mediadevice.RecordManager;
import com.tencent.mobileqq.shortvideo.tools.QzoneBaseThread;
import com.tencent.mobileqq.shortvideo.tools.QzoneHandlerThreadFactory;
import com.tencent.mobileqq.utils.FileUtils;
import com.tencent.mobileqq.widget.QQToast;
import com.tencent.qphone.base.util.QLog;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import mje;
import mjg;
import mqq.os.MqqHandler;

public class FlowSendTask
  extends AsyncTask
{
  static final int jdField_a_of_type_Int = 0;
  static final String jdField_a_of_type_JavaLangString = "FlowSendTask";
  private static AtomicLong jdField_a_of_type_JavaUtilConcurrentAtomicAtomicLong = new AtomicLong(0L);
  static final int jdField_b_of_type_Int = -1;
  static final int jdField_c_of_type_Int = -2;
  static final long jdField_c_of_type_Long = 20000L;
  static final int jdField_d_of_type_Int = -3;
  static final int jdField_e_of_type_Int = -4;
  static final int jdField_f_of_type_Int = -5;
  static final int jdField_g_of_type_Int = -6;
  static final int h = -7;
  double jdField_a_of_type_Double;
  float jdField_a_of_type_Float;
  long jdField_a_of_type_Long;
  public Activity a;
  ProgressDialog jdField_a_of_type_AndroidAppProgressDialog;
  TextView jdField_a_of_type_AndroidWidgetTextView;
  FlowComponentInterface jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowComponentInterface;
  public RMVideoStateMgr a;
  ArrayList jdField_a_of_type_JavaUtilArrayList = null;
  public boolean a;
  double jdField_b_of_type_Double;
  long jdField_b_of_type_Long = 0L;
  public String b;
  boolean jdField_b_of_type_Boolean;
  String jdField_c_of_type_JavaLangString;
  boolean jdField_c_of_type_Boolean = false;
  String jdField_d_of_type_JavaLangString;
  String jdField_e_of_type_JavaLangString;
  String jdField_f_of_type_JavaLangString;
  String jdField_g_of_type_JavaLangString;
  public String h = "";
  int i;
  int j;
  int k;
  int l;
  int m;
  int n;
  public int o;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public FlowSendTask(Activity paramActivity, RMVideoStateMgr paramRMVideoStateMgr, String paramString1, int paramInt, String paramString2, float paramFloat, boolean paramBoolean, double paramDouble1, double paramDouble2, FlowComponentInterface paramFlowComponentInterface)
  {
    jdField_a_of_type_AndroidAppActivity = paramActivity;
    jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr = paramRMVideoStateMgr;
    jdField_b_of_type_JavaLangString = jdField_a_of_type_JavaLangString;
    i = ((int)jdField_a_of_type_Double);
    j = jdField_a_of_type_ComTencentMobileqqShortvideoMediadevicePreviewContext.b();
    jdField_b_of_type_Long = jdField_a_of_type_JavaUtilConcurrentAtomicAtomicLong.getAndIncrement();
    h = ("FlowSendTask_[mSessionId=" + jdField_b_of_type_Long + "]");
    jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowComponentInterface = paramFlowComponentInterface;
    jdField_c_of_type_Boolean = false;
    jdField_c_of_type_JavaLangString = paramString1;
    k = paramInt;
    d = paramString2;
    jdField_a_of_type_Float = paramFloat;
    jdField_a_of_type_Boolean = paramBoolean;
    jdField_b_of_type_Boolean = false;
    n = ((i + 500) / 1000);
    l = 320;
    if ((RMVideoStateMgr.jdField_a_of_type_Boolean) && (!paramBoolean)) {
      l = jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoClipSpec.e;
    }
    if (paramBoolean)
    {
      l = 160;
      paramActivity = paramActivity.getIntent();
      jdField_a_of_type_JavaUtilArrayList = paramActivity.getStringArrayListExtra("uin_list");
      g = paramActivity.getStringExtra("bless_ptv_mp4_path");
    }
    if (QLog.isColorLevel()) {
      QLog.d(h, 2, "FlowSendTask() constructor : isPTV:" + jdField_a_of_type_Boolean + ", mVideoFileDir:" + jdField_b_of_type_JavaLangString + " recordTime=" + i + " mVideoRecordTime=" + n + " recordFrames=" + j);
    }
    m = ((int)(l / jdField_a_of_type_Float));
    if (m % 2 > 0) {
      m -= 1;
    }
    o = 0;
    if (VideoEnvironment.d()) {
      QzoneHandlerThreadFactory.a("Normal_HandlerThread", false).a(new mje(this));
    }
    for (;;)
    {
      if (!jdField_a_of_type_Boolean)
      {
        paramActivity = jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoThumbGenMgr.a();
        if ((paramActivity != null) && (jdField_c_of_type_JavaLangString != null) && (jdField_a_of_type_JavaUtilConcurrentAtomicAtomicInteger.get() == 3))
        {
          l = jdField_a_of_type_Int;
          m = b;
          e = jdField_c_of_type_JavaLangString;
          f = d;
          jdField_b_of_type_Boolean = true;
        }
      }
      paramRMVideoStateMgr.d();
      jdField_a_of_type_Double = paramDouble1;
      jdField_b_of_type_Double = paramDouble2;
      if (QLog.isColorLevel()) {
        QLog.d(h, 2, "FlowSendTask(): isPTV:" + paramBoolean + ", mVideoFileDir:" + jdField_b_of_type_JavaLangString + ",mVideoRecordTime: " + n + ", recordFrames: " + j + ",mThumbWidth: " + l + ", mThumbHeight:" + m + ", mLatitude:" + jdField_a_of_type_Double + ", mLongitude:" + jdField_b_of_type_Double + ", mThumbOK:" + jdField_b_of_type_Boolean);
      }
      return;
      try
      {
        RecordManager.a().a().recordSubmit();
      }
      catch (UnsatisfiedLinkError paramActivity)
      {
        paramActivity.printStackTrace();
        o = -6;
      }
    }
  }
  
  int a()
  {
    if (jdField_b_of_type_JavaLangString == null) {}
    File localFile;
    String[] arrayOfString;
    do
    {
      do
      {
        return -3;
        localFile = new File(jdField_b_of_type_JavaLangString);
      } while ((!localFile.exists()) || (!localFile.isDirectory()));
      arrayOfString = localFile.list();
    } while (arrayOfString == null);
    if (QLog.isColorLevel()) {
      QLog.d(h, 2, "checkVideoSourceValidate(), sourceDirFile =" + localFile.getAbsolutePath() + ",files = " + Arrays.toString(arrayOfString) + ",filse count = " + localFile.listFiles().length);
    }
    int i5 = arrayOfString.length;
    int i1 = 0;
    int i2 = 0;
    int i3 = 0;
    while (i1 < i5)
    {
      String str = arrayOfString[i1];
      if (QLog.isColorLevel()) {
        QLog.d(h, 2, "checkVideoSourceValidate(), current file = " + str);
      }
      if (str.endsWith(".af")) {
        i3 = 1;
      }
      int i4 = i2;
      if (str.endsWith(".vf"))
      {
        i4 = i2;
        if (FileUtils.a(localFile.getAbsolutePath() + "/" + str) > 0L) {
          i4 = 1;
        }
      }
      i1 += 1;
      i2 = i4;
    }
    if (i3 == 0) {
      return -4;
    }
    if (i2 == 0) {
      return -5;
    }
    return 0;
  }
  
  /* Error */
  protected Integer a(Void... paramVarArgs)
  {
    // Byte code:
    //   0: aconst_null
    //   1: astore_1
    //   2: aload_0
    //   3: invokestatic 350	android/os/SystemClock:elapsedRealtime	()J
    //   6: putfield 352	com/tencent/mobileqq/activity/richmedia/FlowSendTask:jdField_a_of_type_Long	J
    //   9: aload_0
    //   10: getfield 198	com/tencent/mobileqq/activity/richmedia/FlowSendTask:o	I
    //   13: ifeq +11 -> 24
    //   16: aload_0
    //   17: getfield 198	com/tencent/mobileqq/activity/richmedia/FlowSendTask:o	I
    //   20: invokestatic 358	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   23: areturn
    //   24: invokestatic 202	com/tencent/mobileqq/shortvideo/VideoEnvironment:d	()Z
    //   27: ifeq +271 -> 298
    //   30: invokestatic 175	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   33: ifeq +14 -> 47
    //   36: aload_0
    //   37: getfield 71	com/tencent/mobileqq/activity/richmedia/FlowSendTask:h	Ljava/lang/String;
    //   40: iconst_2
    //   41: ldc_w 360
    //   44: invokestatic 194	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   47: lconst_0
    //   48: lstore 7
    //   50: aload_0
    //   51: getfield 79	com/tencent/mobileqq/activity/richmedia/FlowSendTask:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoStateMgr;
    //   54: getfield 363	com/tencent/mobileqq/activity/richmedia/state/RMVideoStateMgr:jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean	Ljava/util/concurrent/atomic/AtomicBoolean;
    //   57: astore 10
    //   59: aload 10
    //   61: monitorenter
    //   62: aload_0
    //   63: getfield 79	com/tencent/mobileqq/activity/richmedia/FlowSendTask:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoStateMgr;
    //   66: getfield 363	com/tencent/mobileqq/activity/richmedia/state/RMVideoStateMgr:jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean	Ljava/util/concurrent/atomic/AtomicBoolean;
    //   69: invokevirtual 367	java/util/concurrent/atomic/AtomicBoolean:get	()Z
    //   72: istore 9
    //   74: lload 7
    //   76: lstore 5
    //   78: iload 9
    //   80: ifne +128 -> 208
    //   83: lload 7
    //   85: lstore_3
    //   86: invokestatic 175	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   89: ifeq +17 -> 106
    //   92: lload 7
    //   94: lstore_3
    //   95: aload_0
    //   96: getfield 71	com/tencent/mobileqq/activity/richmedia/FlowSendTask:h	Ljava/lang/String;
    //   99: iconst_2
    //   100: ldc_w 369
    //   103: invokestatic 194	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   106: lload 7
    //   108: lstore_3
    //   109: invokestatic 350	android/os/SystemClock:elapsedRealtime	()J
    //   112: lstore 5
    //   114: lload 7
    //   116: lstore_3
    //   117: aload_0
    //   118: getfield 77	com/tencent/mobileqq/activity/richmedia/FlowSendTask:jdField_a_of_type_AndroidAppActivity	Landroid/app/Activity;
    //   121: new 371	mjf
    //   124: dup
    //   125: aload_0
    //   126: invokespecial 372	mjf:<init>	(Lcom/tencent/mobileqq/activity/richmedia/FlowSendTask;)V
    //   129: invokevirtual 375	android/app/Activity:runOnUiThread	(Ljava/lang/Runnable;)V
    //   132: lload 7
    //   134: lstore_3
    //   135: aload_0
    //   136: getfield 79	com/tencent/mobileqq/activity/richmedia/FlowSendTask:jdField_a_of_type_ComTencentMobileqqActivityRichmediaStateRMVideoStateMgr	Lcom/tencent/mobileqq/activity/richmedia/state/RMVideoStateMgr;
    //   139: getfield 363	com/tencent/mobileqq/activity/richmedia/state/RMVideoStateMgr:jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean	Ljava/util/concurrent/atomic/AtomicBoolean;
    //   142: ldc2_w 17
    //   145: invokevirtual 380	java/lang/Object:wait	(J)V
    //   148: lload 7
    //   150: lstore_3
    //   151: invokestatic 350	android/os/SystemClock:elapsedRealtime	()J
    //   154: lload 5
    //   156: lsub
    //   157: lstore 7
    //   159: lload 7
    //   161: lstore 5
    //   163: lload 7
    //   165: lstore_3
    //   166: invokestatic 175	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   169: ifeq +39 -> 208
    //   172: lload 7
    //   174: lstore_3
    //   175: aload_0
    //   176: getfield 71	com/tencent/mobileqq/activity/richmedia/FlowSendTask:h	Ljava/lang/String;
    //   179: iconst_2
    //   180: new 105	java/lang/StringBuilder
    //   183: dup
    //   184: invokespecial 106	java/lang/StringBuilder:<init>	()V
    //   187: ldc_w 382
    //   190: invokevirtual 112	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   193: lload 7
    //   195: invokevirtual 115	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   198: invokevirtual 121	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   201: invokestatic 194	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   204: lload 7
    //   206: lstore 5
    //   208: aload 10
    //   210: monitorexit
    //   211: invokestatic 175	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   214: ifeq +14 -> 228
    //   217: aload_0
    //   218: getfield 71	com/tencent/mobileqq/activity/richmedia/FlowSendTask:h	Ljava/lang/String;
    //   221: iconst_2
    //   222: ldc_w 384
    //   225: invokestatic 194	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   228: lload 5
    //   230: ldc2_w 17
    //   233: lcmp
    //   234: iflt +64 -> 298
    //   237: bipush -7
    //   239: invokestatic 358	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   242: areturn
    //   243: astore 11
    //   245: lload_3
    //   246: lstore 5
    //   248: invokestatic 175	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   251: ifeq -43 -> 208
    //   254: aload_0
    //   255: getfield 71	com/tencent/mobileqq/activity/richmedia/FlowSendTask:h	Ljava/lang/String;
    //   258: iconst_2
    //   259: new 105	java/lang/StringBuilder
    //   262: dup
    //   263: invokespecial 106	java/lang/StringBuilder:<init>	()V
    //   266: ldc_w 386
    //   269: invokevirtual 112	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   272: aload 11
    //   274: invokevirtual 389	java/lang/InterruptedException:getMessage	()Ljava/lang/String;
    //   277: invokevirtual 112	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   280: invokevirtual 121	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   283: invokestatic 194	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   286: lload_3
    //   287: lstore 5
    //   289: goto -81 -> 208
    //   292: astore_1
    //   293: aload 10
    //   295: monitorexit
    //   296: aload_1
    //   297: athrow
    //   298: aload_0
    //   299: invokevirtual 391	com/tencent/mobileqq/activity/richmedia/FlowSendTask:a	()I
    //   302: istore_2
    //   303: iload_2
    //   304: ifeq +42 -> 346
    //   307: invokestatic 175	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   310: ifeq +31 -> 341
    //   313: aload_0
    //   314: getfield 71	com/tencent/mobileqq/activity/richmedia/FlowSendTask:h	Ljava/lang/String;
    //   317: iconst_2
    //   318: new 105	java/lang/StringBuilder
    //   321: dup
    //   322: invokespecial 106	java/lang/StringBuilder:<init>	()V
    //   325: ldc_w 393
    //   328: invokevirtual 112	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   331: iload_2
    //   332: invokevirtual 187	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   335: invokevirtual 121	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   338: invokestatic 194	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   341: iload_2
    //   342: invokestatic 358	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   345: areturn
    //   346: aload_0
    //   347: getfield 135	com/tencent/mobileqq/activity/richmedia/FlowSendTask:jdField_b_of_type_Boolean	Z
    //   350: ifeq +219 -> 569
    //   353: invokestatic 175	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   356: ifeq +14 -> 370
    //   359: aload_0
    //   360: getfield 71	com/tencent/mobileqq/activity/richmedia/FlowSendTask:h	Ljava/lang/String;
    //   363: iconst_2
    //   364: ldc_w 395
    //   367: invokestatic 194	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   370: aload_0
    //   371: getfield 244	com/tencent/mobileqq/activity/richmedia/FlowSendTask:e	Ljava/lang/String;
    //   374: aload_0
    //   375: getfield 249	com/tencent/mobileqq/activity/richmedia/FlowSendTask:jdField_a_of_type_Double	D
    //   378: aload_0
    //   379: getfield 251	com/tencent/mobileqq/activity/richmedia/FlowSendTask:jdField_b_of_type_Double	D
    //   382: invokestatic 400	com/tencent/mobileqq/utils/ImageUtil:a	(Ljava/lang/String;DD)Z
    //   385: ifeq +119 -> 504
    //   388: new 288	java/io/File
    //   391: dup
    //   392: aload_0
    //   393: getfield 244	com/tencent/mobileqq/activity/richmedia/FlowSendTask:e	Ljava/lang/String;
    //   396: invokespecial 291	java/io/File:<init>	(Ljava/lang/String;)V
    //   399: astore 10
    //   401: new 402	java/io/FileInputStream
    //   404: dup
    //   405: aload_0
    //   406: getfield 244	com/tencent/mobileqq/activity/richmedia/FlowSendTask:e	Ljava/lang/String;
    //   409: invokespecial 403	java/io/FileInputStream:<init>	(Ljava/lang/String;)V
    //   412: astore_1
    //   413: aload_0
    //   414: aload_1
    //   415: aload 10
    //   417: invokevirtual 406	java/io/File:length	()J
    //   420: invokestatic 412	com/tencent/qphone/base/util/MD5:toMD5Byte	(Ljava/io/InputStream;J)[B
    //   423: invokestatic 418	com/qq/taf/jce/HexUtil:bytes2HexStr	([B)Ljava/lang/String;
    //   426: putfield 247	com/tencent/mobileqq/activity/richmedia/FlowSendTask:f	Ljava/lang/String;
    //   429: aload_1
    //   430: ifnull +7 -> 437
    //   433: aload_1
    //   434: invokevirtual 421	java/io/FileInputStream:close	()V
    //   437: aload_0
    //   438: getfield 247	com/tencent/mobileqq/activity/richmedia/FlowSendTask:f	Ljava/lang/String;
    //   441: invokestatic 427	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   444: ifeq +33 -> 477
    //   447: invokestatic 175	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   450: ifeq +14 -> 464
    //   453: aload_0
    //   454: getfield 71	com/tencent/mobileqq/activity/richmedia/FlowSendTask:h	Ljava/lang/String;
    //   457: iconst_2
    //   458: ldc_w 429
    //   461: invokestatic 431	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   464: iconst_m1
    //   465: invokestatic 358	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   468: areturn
    //   469: astore_1
    //   470: aload_1
    //   471: invokevirtual 432	java/io/IOException:printStackTrace	()V
    //   474: goto -37 -> 437
    //   477: aload_0
    //   478: getfield 247	com/tencent/mobileqq/activity/richmedia/FlowSendTask:f	Ljava/lang/String;
    //   481: ldc_w 434
    //   484: invokestatic 439	com/tencent/mobileqq/shortvideo/ShortVideoUtils:a	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   487: astore_1
    //   488: aload_0
    //   489: getfield 244	com/tencent/mobileqq/activity/richmedia/FlowSendTask:e	Ljava/lang/String;
    //   492: aload_1
    //   493: invokestatic 442	com/tencent/mobileqq/utils/FileUtils:c	(Ljava/lang/String;Ljava/lang/String;)Z
    //   496: ifeq +13 -> 509
    //   499: aload_0
    //   500: aload_1
    //   501: putfield 244	com/tencent/mobileqq/activity/richmedia/FlowSendTask:e	Ljava/lang/String;
    //   504: iconst_0
    //   505: invokestatic 358	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   508: areturn
    //   509: aload_1
    //   510: invokestatic 444	com/tencent/mobileqq/utils/FileUtils:b	(Ljava/lang/String;)Z
    //   513: ifne -9 -> 504
    //   516: invokestatic 175	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   519: ifeq +44 -> 563
    //   522: aload_0
    //   523: getfield 71	com/tencent/mobileqq/activity/richmedia/FlowSendTask:h	Ljava/lang/String;
    //   526: iconst_2
    //   527: new 105	java/lang/StringBuilder
    //   530: dup
    //   531: invokespecial 106	java/lang/StringBuilder:<init>	()V
    //   534: ldc_w 446
    //   537: invokevirtual 112	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   540: aload_0
    //   541: getfield 244	com/tencent/mobileqq/activity/richmedia/FlowSendTask:e	Ljava/lang/String;
    //   544: invokevirtual 112	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   547: ldc_w 448
    //   550: invokevirtual 112	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   553: aload_1
    //   554: invokevirtual 112	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   557: invokevirtual 121	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   560: invokestatic 431	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   563: bipush -2
    //   565: invokestatic 358	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   568: areturn
    //   569: aload_0
    //   570: aload_0
    //   571: getfield 85	com/tencent/mobileqq/activity/richmedia/FlowSendTask:jdField_b_of_type_JavaLangString	Ljava/lang/String;
    //   574: aload_0
    //   575: getfield 139	com/tencent/mobileqq/activity/richmedia/FlowSendTask:l	I
    //   578: aload_0
    //   579: getfield 196	com/tencent/mobileqq/activity/richmedia/FlowSendTask:m	I
    //   582: invokestatic 453	com/tencent/mobileqq/shortvideo/cover/RecordThumbnailUtils:a	(Ljava/lang/String;II)Ljava/lang/String;
    //   585: putfield 244	com/tencent/mobileqq/activity/richmedia/FlowSendTask:e	Ljava/lang/String;
    //   588: aload_0
    //   589: getfield 244	com/tencent/mobileqq/activity/richmedia/FlowSendTask:e	Ljava/lang/String;
    //   592: invokestatic 427	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   595: ifeq +26 -> 621
    //   598: invokestatic 175	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   601: ifeq +14 -> 615
    //   604: aload_0
    //   605: getfield 71	com/tencent/mobileqq/activity/richmedia/FlowSendTask:h	Ljava/lang/String;
    //   608: iconst_2
    //   609: ldc_w 455
    //   612: invokestatic 431	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   615: bipush -2
    //   617: invokestatic 358	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   620: areturn
    //   621: aload_0
    //   622: getfield 244	com/tencent/mobileqq/activity/richmedia/FlowSendTask:e	Ljava/lang/String;
    //   625: aload_0
    //   626: getfield 249	com/tencent/mobileqq/activity/richmedia/FlowSendTask:jdField_a_of_type_Double	D
    //   629: aload_0
    //   630: getfield 251	com/tencent/mobileqq/activity/richmedia/FlowSendTask:jdField_b_of_type_Double	D
    //   633: invokestatic 400	com/tencent/mobileqq/utils/ImageUtil:a	(Ljava/lang/String;DD)Z
    //   636: pop
    //   637: new 288	java/io/File
    //   640: dup
    //   641: aload_0
    //   642: getfield 244	com/tencent/mobileqq/activity/richmedia/FlowSendTask:e	Ljava/lang/String;
    //   645: invokespecial 291	java/io/File:<init>	(Ljava/lang/String;)V
    //   648: astore 11
    //   650: aload 11
    //   652: invokevirtual 294	java/io/File:exists	()Z
    //   655: ifeq +470 -> 1125
    //   658: new 402	java/io/FileInputStream
    //   661: dup
    //   662: aload_0
    //   663: getfield 244	com/tencent/mobileqq/activity/richmedia/FlowSendTask:e	Ljava/lang/String;
    //   666: invokespecial 403	java/io/FileInputStream:<init>	(Ljava/lang/String;)V
    //   669: astore 10
    //   671: aload_0
    //   672: aload 10
    //   674: aload 11
    //   676: invokevirtual 406	java/io/File:length	()J
    //   679: invokestatic 412	com/tencent/qphone/base/util/MD5:toMD5Byte	(Ljava/io/InputStream;J)[B
    //   682: invokestatic 418	com/qq/taf/jce/HexUtil:bytes2HexStr	([B)Ljava/lang/String;
    //   685: putfield 247	com/tencent/mobileqq/activity/richmedia/FlowSendTask:f	Ljava/lang/String;
    //   688: aload 10
    //   690: ifnull +8 -> 698
    //   693: aload 10
    //   695: invokevirtual 421	java/io/FileInputStream:close	()V
    //   698: aload_0
    //   699: getfield 247	com/tencent/mobileqq/activity/richmedia/FlowSendTask:f	Ljava/lang/String;
    //   702: invokestatic 427	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   705: ifeq +33 -> 738
    //   708: invokestatic 175	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   711: ifeq +14 -> 725
    //   714: aload_0
    //   715: getfield 71	com/tencent/mobileqq/activity/richmedia/FlowSendTask:h	Ljava/lang/String;
    //   718: iconst_2
    //   719: ldc_w 429
    //   722: invokestatic 431	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   725: iconst_m1
    //   726: invokestatic 358	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   729: areturn
    //   730: astore_1
    //   731: aload_1
    //   732: invokevirtual 432	java/io/IOException:printStackTrace	()V
    //   735: goto -37 -> 698
    //   738: aload_0
    //   739: getfield 247	com/tencent/mobileqq/activity/richmedia/FlowSendTask:f	Ljava/lang/String;
    //   742: ldc_w 434
    //   745: invokestatic 439	com/tencent/mobileqq/shortvideo/ShortVideoUtils:a	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   748: astore_1
    //   749: aload_0
    //   750: getfield 244	com/tencent/mobileqq/activity/richmedia/FlowSendTask:e	Ljava/lang/String;
    //   753: aload_1
    //   754: invokestatic 442	com/tencent/mobileqq/utils/FileUtils:c	(Ljava/lang/String;Ljava/lang/String;)Z
    //   757: ifeq +13 -> 770
    //   760: aload_0
    //   761: aload_1
    //   762: putfield 244	com/tencent/mobileqq/activity/richmedia/FlowSendTask:e	Ljava/lang/String;
    //   765: iconst_0
    //   766: invokestatic 358	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   769: areturn
    //   770: aload_1
    //   771: invokestatic 444	com/tencent/mobileqq/utils/FileUtils:b	(Ljava/lang/String;)Z
    //   774: ifne -9 -> 765
    //   777: invokestatic 175	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   780: ifeq +44 -> 824
    //   783: aload_0
    //   784: getfield 71	com/tencent/mobileqq/activity/richmedia/FlowSendTask:h	Ljava/lang/String;
    //   787: iconst_2
    //   788: new 105	java/lang/StringBuilder
    //   791: dup
    //   792: invokespecial 106	java/lang/StringBuilder:<init>	()V
    //   795: ldc_w 446
    //   798: invokevirtual 112	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   801: aload_0
    //   802: getfield 244	com/tencent/mobileqq/activity/richmedia/FlowSendTask:e	Ljava/lang/String;
    //   805: invokevirtual 112	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   808: ldc_w 448
    //   811: invokevirtual 112	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   814: aload_1
    //   815: invokevirtual 112	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   818: invokevirtual 121	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   821: invokestatic 431	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   824: bipush -2
    //   826: invokestatic 358	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   829: areturn
    //   830: astore 10
    //   832: aload 10
    //   834: invokevirtual 456	java/io/FileNotFoundException:printStackTrace	()V
    //   837: aload_1
    //   838: ifnull +7 -> 845
    //   841: aload_1
    //   842: invokevirtual 421	java/io/FileInputStream:close	()V
    //   845: aload_0
    //   846: getfield 247	com/tencent/mobileqq/activity/richmedia/FlowSendTask:f	Ljava/lang/String;
    //   849: invokestatic 427	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   852: ifeq +33 -> 885
    //   855: invokestatic 175	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   858: ifeq +14 -> 872
    //   861: aload_0
    //   862: getfield 71	com/tencent/mobileqq/activity/richmedia/FlowSendTask:h	Ljava/lang/String;
    //   865: iconst_2
    //   866: ldc_w 429
    //   869: invokestatic 431	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   872: iconst_m1
    //   873: invokestatic 358	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   876: areturn
    //   877: astore_1
    //   878: aload_1
    //   879: invokevirtual 432	java/io/IOException:printStackTrace	()V
    //   882: goto -37 -> 845
    //   885: aload_0
    //   886: getfield 247	com/tencent/mobileqq/activity/richmedia/FlowSendTask:f	Ljava/lang/String;
    //   889: ldc_w 434
    //   892: invokestatic 439	com/tencent/mobileqq/shortvideo/ShortVideoUtils:a	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   895: astore_1
    //   896: aload_0
    //   897: getfield 244	com/tencent/mobileqq/activity/richmedia/FlowSendTask:e	Ljava/lang/String;
    //   900: aload_1
    //   901: invokestatic 442	com/tencent/mobileqq/utils/FileUtils:c	(Ljava/lang/String;Ljava/lang/String;)Z
    //   904: ifeq +11 -> 915
    //   907: aload_0
    //   908: aload_1
    //   909: putfield 244	com/tencent/mobileqq/activity/richmedia/FlowSendTask:e	Ljava/lang/String;
    //   912: goto -147 -> 765
    //   915: aload_1
    //   916: invokestatic 444	com/tencent/mobileqq/utils/FileUtils:b	(Ljava/lang/String;)Z
    //   919: ifne -154 -> 765
    //   922: invokestatic 175	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   925: ifeq +44 -> 969
    //   928: aload_0
    //   929: getfield 71	com/tencent/mobileqq/activity/richmedia/FlowSendTask:h	Ljava/lang/String;
    //   932: iconst_2
    //   933: new 105	java/lang/StringBuilder
    //   936: dup
    //   937: invokespecial 106	java/lang/StringBuilder:<init>	()V
    //   940: ldc_w 446
    //   943: invokevirtual 112	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   946: aload_0
    //   947: getfield 244	com/tencent/mobileqq/activity/richmedia/FlowSendTask:e	Ljava/lang/String;
    //   950: invokevirtual 112	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   953: ldc_w 448
    //   956: invokevirtual 112	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   959: aload_1
    //   960: invokevirtual 112	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   963: invokevirtual 121	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   966: invokestatic 431	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   969: bipush -2
    //   971: invokestatic 358	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   974: areturn
    //   975: astore_1
    //   976: aconst_null
    //   977: astore 10
    //   979: aload 10
    //   981: ifnull +8 -> 989
    //   984: aload 10
    //   986: invokevirtual 421	java/io/FileInputStream:close	()V
    //   989: aload_0
    //   990: getfield 247	com/tencent/mobileqq/activity/richmedia/FlowSendTask:f	Ljava/lang/String;
    //   993: invokestatic 427	android/text/TextUtils:isEmpty	(Ljava/lang/CharSequence;)Z
    //   996: ifeq +35 -> 1031
    //   999: invokestatic 175	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1002: ifeq +14 -> 1016
    //   1005: aload_0
    //   1006: getfield 71	com/tencent/mobileqq/activity/richmedia/FlowSendTask:h	Ljava/lang/String;
    //   1009: iconst_2
    //   1010: ldc_w 429
    //   1013: invokestatic 431	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   1016: iconst_m1
    //   1017: invokestatic 358	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   1020: areturn
    //   1021: astore 10
    //   1023: aload 10
    //   1025: invokevirtual 432	java/io/IOException:printStackTrace	()V
    //   1028: goto -39 -> 989
    //   1031: aload_0
    //   1032: getfield 247	com/tencent/mobileqq/activity/richmedia/FlowSendTask:f	Ljava/lang/String;
    //   1035: ldc_w 434
    //   1038: invokestatic 439	com/tencent/mobileqq/shortvideo/ShortVideoUtils:a	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   1041: astore 10
    //   1043: aload_0
    //   1044: getfield 244	com/tencent/mobileqq/activity/richmedia/FlowSendTask:e	Ljava/lang/String;
    //   1047: aload 10
    //   1049: invokestatic 442	com/tencent/mobileqq/utils/FileUtils:c	(Ljava/lang/String;Ljava/lang/String;)Z
    //   1052: ifeq +11 -> 1063
    //   1055: aload_0
    //   1056: aload 10
    //   1058: putfield 244	com/tencent/mobileqq/activity/richmedia/FlowSendTask:e	Ljava/lang/String;
    //   1061: aload_1
    //   1062: athrow
    //   1063: aload 10
    //   1065: invokestatic 444	com/tencent/mobileqq/utils/FileUtils:b	(Ljava/lang/String;)Z
    //   1068: ifne -7 -> 1061
    //   1071: invokestatic 175	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1074: ifeq +45 -> 1119
    //   1077: aload_0
    //   1078: getfield 71	com/tencent/mobileqq/activity/richmedia/FlowSendTask:h	Ljava/lang/String;
    //   1081: iconst_2
    //   1082: new 105	java/lang/StringBuilder
    //   1085: dup
    //   1086: invokespecial 106	java/lang/StringBuilder:<init>	()V
    //   1089: ldc_w 446
    //   1092: invokevirtual 112	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1095: aload_0
    //   1096: getfield 244	com/tencent/mobileqq/activity/richmedia/FlowSendTask:e	Ljava/lang/String;
    //   1099: invokevirtual 112	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1102: ldc_w 448
    //   1105: invokevirtual 112	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1108: aload 10
    //   1110: invokevirtual 112	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1113: invokevirtual 121	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1116: invokestatic 431	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   1119: bipush -2
    //   1121: invokestatic 358	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   1124: areturn
    //   1125: invokestatic 175	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   1128: ifeq +34 -> 1162
    //   1131: aload_0
    //   1132: getfield 71	com/tencent/mobileqq/activity/richmedia/FlowSendTask:h	Ljava/lang/String;
    //   1135: iconst_2
    //   1136: new 105	java/lang/StringBuilder
    //   1139: dup
    //   1140: invokespecial 106	java/lang/StringBuilder:<init>	()V
    //   1143: ldc_w 458
    //   1146: invokevirtual 112	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1149: aload_0
    //   1150: getfield 244	com/tencent/mobileqq/activity/richmedia/FlowSendTask:e	Ljava/lang/String;
    //   1153: invokevirtual 112	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1156: invokevirtual 121	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1159: invokestatic 431	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   1162: bipush -2
    //   1164: invokestatic 358	java/lang/Integer:valueOf	(I)Ljava/lang/Integer;
    //   1167: areturn
    //   1168: astore_1
    //   1169: goto -190 -> 979
    //   1172: astore 11
    //   1174: aload_1
    //   1175: astore 10
    //   1177: aload 11
    //   1179: astore_1
    //   1180: goto -201 -> 979
    //   1183: astore 11
    //   1185: aload 10
    //   1187: astore_1
    //   1188: aload 11
    //   1190: astore 10
    //   1192: goto -360 -> 832
    //   1195: astore_1
    //   1196: aconst_null
    //   1197: astore_1
    //   1198: goto -769 -> 429
    //   1201: astore 10
    //   1203: goto -774 -> 429
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	1206	0	this	FlowSendTask
    //   0	1206	1	paramVarArgs	Void[]
    //   302	40	2	i1	int
    //   85	202	3	l1	long
    //   76	212	5	l2	long
    //   48	157	7	l3	long
    //   72	7	9	bool	boolean
    //   57	637	10	localObject1	Object
    //   830	3	10	localFileNotFoundException1	java.io.FileNotFoundException
    //   977	8	10	localObject2	Object
    //   1021	3	10	localIOException	java.io.IOException
    //   1041	150	10	localObject3	Object
    //   1201	1	10	localFileNotFoundException2	java.io.FileNotFoundException
    //   243	30	11	localInterruptedException	InterruptedException
    //   648	27	11	localFile	File
    //   1172	6	11	localObject4	Object
    //   1183	6	11	localFileNotFoundException3	java.io.FileNotFoundException
    // Exception table:
    //   from	to	target	type
    //   86	92	243	java/lang/InterruptedException
    //   95	106	243	java/lang/InterruptedException
    //   109	114	243	java/lang/InterruptedException
    //   117	132	243	java/lang/InterruptedException
    //   135	148	243	java/lang/InterruptedException
    //   151	159	243	java/lang/InterruptedException
    //   166	172	243	java/lang/InterruptedException
    //   175	204	243	java/lang/InterruptedException
    //   62	74	292	finally
    //   86	92	292	finally
    //   95	106	292	finally
    //   109	114	292	finally
    //   117	132	292	finally
    //   135	148	292	finally
    //   151	159	292	finally
    //   166	172	292	finally
    //   175	204	292	finally
    //   208	211	292	finally
    //   248	286	292	finally
    //   293	296	292	finally
    //   433	437	469	java/io/IOException
    //   693	698	730	java/io/IOException
    //   658	671	830	java/io/FileNotFoundException
    //   841	845	877	java/io/IOException
    //   658	671	975	finally
    //   984	989	1021	java/io/IOException
    //   671	688	1168	finally
    //   832	837	1172	finally
    //   671	688	1183	java/io/FileNotFoundException
    //   401	413	1195	java/io/FileNotFoundException
    //   413	429	1201	java/io/FileNotFoundException
  }
  
  void a()
  {
    if (QLog.isColorLevel()) {
      QLog.e(h, 2, "cancleProgressDailog");
    }
    try
    {
      if (jdField_a_of_type_AndroidAppProgressDialog != null) {
        jdField_a_of_type_AndroidAppProgressDialog.cancel();
      }
      return;
    }
    catch (Exception localException) {}
  }
  
  public void a(Context paramContext, int paramInt)
  {
    if (QLog.isColorLevel()) {
      QLog.e(h, 2, "showProgressDialog");
    }
    try
    {
      if (jdField_a_of_type_AndroidAppProgressDialog != null) {
        a();
      }
      for (;;)
      {
        jdField_a_of_type_AndroidWidgetTextView.setText(paramInt);
        if (jdField_a_of_type_AndroidAppProgressDialog.isShowing()) {
          break;
        }
        jdField_a_of_type_AndroidAppProgressDialog.show();
        return;
        jdField_a_of_type_AndroidAppProgressDialog = new ProgressDialog(paramContext, 2131558942);
        jdField_a_of_type_AndroidAppProgressDialog.setCancelable(true);
        jdField_a_of_type_AndroidAppProgressDialog.show();
        jdField_a_of_type_AndroidAppProgressDialog.setContentView(2130903444);
        jdField_a_of_type_AndroidWidgetTextView = ((TextView)jdField_a_of_type_AndroidAppProgressDialog.findViewById(2131298581));
      }
      return;
    }
    catch (Throwable paramContext)
    {
      if (QLog.isColorLevel()) {
        QLog.e(h, 2, "showProgressDialog", paramContext);
      }
    }
  }
  
  void a(Intent paramIntent)
  {
    paramIntent.putExtra("file_video_source_dir", jdField_b_of_type_JavaLangString);
    paramIntent.putExtra("thumbfile_send_path", e);
    paramIntent.putExtra("thumbfile_send_width", l);
    paramIntent.putExtra("thumbfile_send_height", m);
    paramIntent.putExtra("thumbfile_md5", f);
    paramIntent.putExtra("file_send_duration", n);
    paramIntent.putExtra("sv_encode_max_bitrate", CodecParam.t);
    paramIntent.putExtra("sv_encode_min_bitrate", CodecParam.u);
    paramIntent.putExtra("sv_encode_qmax", CodecParam.v);
    paramIntent.putExtra("sv_encode_qmin", CodecParam.w);
    paramIntent.putExtra("sv_encode_qmaxdiff", CodecParam.x);
    paramIntent.putExtra("sv_encode_ref_frame", CodecParam.y);
    paramIntent.putExtra("sv_encode_smooth", CodecParam.z);
    paramIntent.putExtra("sv_total_frame_count", j);
    paramIntent.putExtra("sv_total_record_time", i);
  }
  
  protected void a(Integer paramInteger)
  {
    super.onPostExecute(paramInteger);
    a();
    if (paramInteger.intValue() == 0)
    {
      if ((VideoEnvironment.d()) && (!jdField_a_of_type_Boolean) && ((jdField_a_of_type_AndroidAppActivity instanceof FlowCameraActivity2)))
      {
        jdField_a_of_type_AndroidAppActivity.setResult(1001);
        jdField_a_of_type_AndroidAppActivity.finish();
      }
      paramInteger = new Intent();
      a(paramInteger);
      if (jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowComponentInterface != null)
      {
        jdField_a_of_type_ComTencentMobileqqActivityRichmediaFlowComponentInterface.a(jdField_a_of_type_AndroidAppActivity, paramInteger);
        return;
      }
      paramInteger.putExtra("uin", jdField_c_of_type_JavaLangString);
      paramInteger.putExtra("uintype", k);
      paramInteger.putExtra("troop_uin", d);
      if (!jdField_a_of_type_Boolean) {
        break label444;
      }
    }
    label444:
    for (int i1 = 3;; i1 = 2)
    {
      paramInteger.putExtra("file_send_business_type", i1);
      paramInteger.putExtra("ab_test_send_btn_click_time", jdField_a_of_type_AndroidAppActivity.getIntent().getLongExtra("ab_test_send_btn_click_time", 0L));
      paramInteger.putExtra("ab_test_generate_thumb_cost_time", SystemClock.elapsedRealtime() - jdField_a_of_type_Long);
      paramInteger.setClass(jdField_a_of_type_AndroidAppActivity, SendVideoActivity.class);
      if (QLog.isColorLevel()) {
        QLog.d(h, 2, "onPostExecute(), SendVideoTask is to start  SendVideoActivity,mVideoFileDir = " + jdField_b_of_type_JavaLangString);
      }
      if ((jdField_c_of_type_JavaLangString.equals(MessageForBlessPTV.BLESS_REQ_UIN)) && (jdField_a_of_type_JavaUtilArrayList != null))
      {
        paramInteger.putExtra("bless_uin_list", jdField_a_of_type_JavaUtilArrayList);
        paramInteger.putExtra("bless_ptv_mp4_path", g);
        jdField_a_of_type_AndroidAppActivity.startActivityForResult(paramInteger, 1001);
      }
      for (;;)
      {
        jdField_a_of_type_AndroidAppActivity = null;
        if (!jdField_c_of_type_Boolean) {
          break;
        }
        FileUtils.a(jdField_b_of_type_JavaLangString);
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.d(h, 2, "onPostExecute() delete cache...");
        return;
        jdField_a_of_type_AndroidAppActivity.startActivity(paramInteger);
      }
      QQToast.a(jdField_a_of_type_AndroidAppActivity, "系统处理超时,短视频发送失败", 0).b(jdField_a_of_type_AndroidAppActivity.getResources().getDimensionPixelSize(2131492908));
      if (QLog.isColorLevel()) {
        QLog.d(h, 2, "onPostExecute(), SendVideoTask error = " + paramInteger);
      }
      if (!VideoEnvironment.d()) {
        break;
      }
      if ((!jdField_a_of_type_Boolean) && ((jdField_a_of_type_AndroidAppActivity instanceof FlowCameraActivity2)))
      {
        ThreadManager.b().postDelayed(new mjg(this), 1000L);
        return;
      }
      jdField_a_of_type_AndroidAppActivity = null;
      return;
    }
  }
  
  public void a(boolean paramBoolean)
  {
    jdField_c_of_type_Boolean = paramBoolean;
  }
}
