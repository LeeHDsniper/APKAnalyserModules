package com.tencent.mobileqq.msf.core;

import android.os.Build;
import android.os.Build.VERSION;
import android.os.Environment;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.SystemClock;
import android.text.TextUtils;
import com.qq.jce.wup.ObjectCreateException;
import com.qq.jce.wup.UniPacket;
import com.qq.taf.jce.HexUtil;
import com.tencent.mobileqq.msf.core.a.a.a;
import com.tencent.mobileqq.msf.core.b.i;
import com.tencent.mobileqq.msf.core.net.a.e;
import com.tencent.mobileqq.msf.core.net.f.b;
import com.tencent.mobileqq.msf.core.net.g;
import com.tencent.mobileqq.msf.sdk.MsfCommand;
import com.tencent.mobileqq.msf.sdk.MsfMsgUtil;
import com.tencent.mobileqq.msf.sdk.MsfSdkUtils;
import com.tencent.mobileqq.msf.sdk.k;
import com.tencent.mobileqq.msf.service.MsfService;
import com.tencent.mobileqq.pb.ByteStringMicro;
import com.tencent.mobileqq.pb.PBBoolField;
import com.tencent.mobileqq.pb.PBBytesField;
import com.tencent.mobileqq.pb.PBRepeatMessageField;
import com.tencent.mobileqq.pb.PBStringField;
import com.tencent.mobileqq.pb.PBUInt32Field;
import com.tencent.mobileqq.pb.PBUInt64Field;
import com.tencent.msf.service.protocol.e.c;
import com.tencent.msf.service.protocol.pb.SSOLoginMerge.BusiBuffData;
import com.tencent.msf.service.protocol.pb.SSOLoginMerge.BusiBuffItem;
import com.tencent.msf.service.protocol.pb.SSOReserveField.ReserveFields;
import com.tencent.qphone.base.BaseConstants;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.CodecWarpper;
import com.tencent.qphone.base.util.QLog;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map.Entry;
import java.util.Random;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.CopyOnWriteArraySet;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;

public class w
{
  public static String C;
  public static String D;
  public static int E = 0;
  public static long G = -1L;
  public static int J = 0;
  public static long O = 0L;
  static int P = -1;
  static AtomicBoolean Q = new AtomicBoolean();
  public static final String S = "GrayUinPro.Check";
  public static final String T = "res";
  public static final int W = -10008;
  public static final int X = -302;
  public static final int Y = 302;
  static CopyOnWriteArraySet Z = new CopyOnWriteArraySet();
  private static final AtomicInteger ah;
  private static boolean ai = false;
  private static int al = 0;
  private static String am;
  private static String[] an;
  private static AtomicBoolean av = new AtomicBoolean();
  public static final String b = "__extraTimeoutSeq";
  public static final String o = "MSF.C.NetConnTag";
  public static boolean p = false;
  public static ConcurrentHashMap q;
  public static ConcurrentHashMap r;
  public static long s;
  public static int v;
  public static int w;
  public static boolean x;
  public static long y;
  public static AtomicInteger z;
  public a A = new a();
  MsfCore B;
  public com.tencent.mobileqq.msf.core.net.a.f F = null;
  c H = new c();
  long I;
  AtomicBoolean K = new AtomicBoolean();
  int L = 0;
  long M = 0L;
  long N = 0L;
  HashSet R = new HashSet();
  public int U = -1;
  public AtomicBoolean V = new AtomicBoolean();
  public com.tencent.mobileqq.msf.core.net.h a;
  ArrayList aa = new ArrayList();
  boolean ab = false;
  private ConcurrentHashMap ac = new ConcurrentHashMap();
  private k ad = new k(1000);
  private k ae = new k();
  private ToServiceMsg af;
  private Handler ag;
  private int aj = 0;
  private String ak = "0";
  private HashSet ao = new HashSet();
  private volatile boolean ap = false;
  private Object aq = new Object();
  private long ar = 0L;
  private byte[] as = null;
  private long at = 0L;
  private Random au = new Random(System.currentTimeMillis());
  public ConcurrentHashMap c = new ConcurrentHashMap();
  public ConcurrentHashMap d = new ConcurrentHashMap();
  b e = new b();
  public int f = 10;
  public int g = 3072;
  public int h = 0;
  public int i = 500;
  public int j = 0;
  public int k = 300;
  public long l = 0L;
  public boolean m = false;
  public volatile boolean n = false;
  public final String t = Environment.getExternalStorageDirectory().getPath() + "/tencent/MobileQQ/data/wifi";
  public SimpleDateFormat u = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.getDefault());
  
  static
  {
    ah = new AtomicInteger();
    q = new ConcurrentHashMap();
    r = new ConcurrentHashMap();
    s = -1L;
    v = -1;
    w = 0;
    x = true;
    y = -1L;
    ai = false;
    z = new AtomicInteger(0);
    C = ":";
    D = "0";
    E = 0;
    al = 0;
    am = "";
    an = new String[] { "StreamSvr.UploadStreamMsg" };
  }
  
  public w(MsfCore paramMsfCore)
  {
    B = paramMsfCore;
    HandlerThread localHandlerThread = new HandlerThread("mergehandle", 5);
    localHandlerThread.start();
    ag = new Handler(localHandlerThread.getLooper());
    aj = paramMsfCore.getMsfAppid();
    a = new com.tencent.mobileqq.msf.core.net.h(paramMsfCore);
    H.setName("MsfCoreMsgSender");
    try
    {
      paramMsfCore = com.tencent.mobileqq.msf.core.a.a.c();
      if (paramMsfCore != null)
      {
        f = Integer.parseInt(paramMsfCore[0]);
        g = Integer.parseInt(paramMsfCore[1]);
        k = Integer.parseInt(paramMsfCore[2]);
        i = Integer.parseInt(paramMsfCore[3]);
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.NetConnTag", 2, "maxDelaySize: " + g + " noMergeSize: " + k + " globaldelayTime: " + i + " delayWaitSendCount: " + f);
        }
      }
      return;
    }
    catch (Exception paramMsfCore)
    {
      try
      {
        for (;;)
        {
          a(com.tencent.mobileqq.msf.core.a.a.d());
          try
          {
            j = Integer.parseInt(com.tencent.mobileqq.msf.core.a.a.e());
            if (QLog.isColorLevel()) {
              QLog.d("MSF.C.NetConnTag", 2, "mergeDuration: " + j);
            }
            return;
          }
          catch (Exception paramMsfCore)
          {
            QLog.d("MSF.C.NetConnTag", 1, " " + paramMsfCore, paramMsfCore);
          }
          paramMsfCore = paramMsfCore;
          QLog.d("MSF.C.NetConnTag", 1, " " + paramMsfCore, paramMsfCore);
        }
      }
      catch (Exception paramMsfCore)
      {
        for (;;)
        {
          QLog.d("MSF.C.NetConnTag", 1, " " + paramMsfCore, paramMsfCore);
        }
      }
    }
  }
  
  public static void a(String paramString, boolean paramBoolean)
  {
    if (paramBoolean)
    {
      Z.add(paramString);
      QLog.d("MSF.C.NetConnTag", 1, "use simple head for uin:" + MsfSdkUtils.getShortUin(paramString));
    }
    for (;;)
    {
      CodecWarpper.setUseSimpleHead(paramString, paramBoolean);
      return;
      Z.remove(paramString);
      QLog.d("MSF.C.NetConnTag", 1, "use full head for uin:" + MsfSdkUtils.getShortUin(paramString));
      if (q.containsKey(paramString))
      {
        q.remove(paramString);
        QLog.d("MSF.C.NetConnTag", 1, "clear storeSendSsoSeq tag for uin:" + MsfSdkUtils.getShortUin(paramString));
      }
    }
  }
  
  /* Error */
  private void b(android.content.Context paramContext)
  {
    // Byte code:
    //   0: getstatic 482	com/tencent/qphone/base/BaseConstants:XGloginMergeTSAddress	[Ljava/lang/String;
    //   3: ifnull +58 -> 61
    //   6: getstatic 482	com/tencent/qphone/base/BaseConstants:XGloginMergeTSAddress	[Ljava/lang/String;
    //   9: arraylength
    //   10: ifle +51 -> 61
    //   13: aload_0
    //   14: getfield 383	com/tencent/mobileqq/msf/core/w:a	Lcom/tencent/mobileqq/msf/core/net/h;
    //   17: getstatic 482	com/tencent/qphone/base/BaseConstants:XGloginMergeTSAddress	[Ljava/lang/String;
    //   20: invokevirtual 483	com/tencent/mobileqq/msf/core/net/h:a	([Ljava/lang/String;)V
    //   23: invokestatic 406	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   26: ifeq +34 -> 60
    //   29: ldc 63
    //   31: iconst_2
    //   32: new 248	java/lang/StringBuilder
    //   35: dup
    //   36: invokespecial 249	java/lang/StringBuilder:<init>	()V
    //   39: ldc_w 485
    //   42: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   45: getstatic 482	com/tencent/qphone/base/BaseConstants:XGloginMergeTSAddress	[Ljava/lang/String;
    //   48: invokestatic 490	java/util/Arrays:toString	([Ljava/lang/Object;)Ljava/lang/String;
    //   51: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   54: invokevirtual 270	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   57: invokestatic 420	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   60: return
    //   61: getstatic 493	com/tencent/qphone/base/BaseConstants:WiFiloginMergeTSAddress	[Ljava/lang/String;
    //   64: ifnull +58 -> 122
    //   67: getstatic 493	com/tencent/qphone/base/BaseConstants:WiFiloginMergeTSAddress	[Ljava/lang/String;
    //   70: arraylength
    //   71: ifle +51 -> 122
    //   74: aload_0
    //   75: getfield 383	com/tencent/mobileqq/msf/core/w:a	Lcom/tencent/mobileqq/msf/core/net/h;
    //   78: getstatic 493	com/tencent/qphone/base/BaseConstants:WiFiloginMergeTSAddress	[Ljava/lang/String;
    //   81: invokevirtual 495	com/tencent/mobileqq/msf/core/net/h:b	([Ljava/lang/String;)V
    //   84: invokestatic 406	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   87: ifeq -27 -> 60
    //   90: ldc 63
    //   92: iconst_2
    //   93: new 248	java/lang/StringBuilder
    //   96: dup
    //   97: invokespecial 249	java/lang/StringBuilder:<init>	()V
    //   100: ldc_w 485
    //   103: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   106: getstatic 482	com/tencent/qphone/base/BaseConstants:XGloginMergeTSAddress	[Ljava/lang/String;
    //   109: invokestatic 490	java/util/Arrays:toString	([Ljava/lang/Object;)Ljava/lang/String;
    //   112: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   115: invokevirtual 270	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   118: invokestatic 420	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   121: return
    //   122: aload_1
    //   123: invokevirtual 500	android/content/Context:getPackageName	()Ljava/lang/String;
    //   126: astore_1
    //   127: new 257	java/io/File
    //   130: dup
    //   131: new 248	java/lang/StringBuilder
    //   134: dup
    //   135: invokespecial 249	java/lang/StringBuilder:<init>	()V
    //   138: invokestatic 255	android/os/Environment:getExternalStorageDirectory	()Ljava/io/File;
    //   141: invokevirtual 261	java/io/File:getPath	()Ljava/lang/String;
    //   144: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   147: ldc_w 502
    //   150: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   153: aload_1
    //   154: ldc_w 504
    //   157: ldc_w 506
    //   160: invokevirtual 510	java/lang/String:replace	(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    //   163: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   166: ldc_w 512
    //   169: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   172: invokevirtual 270	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   175: invokespecial 514	java/io/File:<init>	(Ljava/lang/String;)V
    //   178: astore_1
    //   179: new 516	java/util/Properties
    //   182: dup
    //   183: invokespecial 517	java/util/Properties:<init>	()V
    //   186: astore_3
    //   187: new 519	java/io/FileInputStream
    //   190: dup
    //   191: aload_1
    //   192: invokespecial 522	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   195: astore_2
    //   196: aload_2
    //   197: astore_1
    //   198: aload_3
    //   199: aload_2
    //   200: invokevirtual 526	java/util/Properties:load	(Ljava/io/InputStream;)V
    //   203: aload_2
    //   204: astore_1
    //   205: aload_3
    //   206: ldc_w 528
    //   209: invokevirtual 531	java/util/Properties:getProperty	(Ljava/lang/String;)Ljava/lang/String;
    //   212: astore 4
    //   214: aload_2
    //   215: astore_1
    //   216: aload_3
    //   217: ldc_w 533
    //   220: invokevirtual 531	java/util/Properties:getProperty	(Ljava/lang/String;)Ljava/lang/String;
    //   223: astore_3
    //   224: aload_2
    //   225: astore_1
    //   226: aload 4
    //   228: ldc_w 535
    //   231: invokevirtual 539	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   234: putstatic 482	com/tencent/qphone/base/BaseConstants:XGloginMergeTSAddress	[Ljava/lang/String;
    //   237: aload_2
    //   238: astore_1
    //   239: aload_3
    //   240: ldc_w 535
    //   243: invokevirtual 539	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   246: putstatic 493	com/tencent/qphone/base/BaseConstants:WiFiloginMergeTSAddress	[Ljava/lang/String;
    //   249: aload_2
    //   250: astore_1
    //   251: aload_0
    //   252: getfield 383	com/tencent/mobileqq/msf/core/w:a	Lcom/tencent/mobileqq/msf/core/net/h;
    //   255: getstatic 482	com/tencent/qphone/base/BaseConstants:XGloginMergeTSAddress	[Ljava/lang/String;
    //   258: invokevirtual 483	com/tencent/mobileqq/msf/core/net/h:a	([Ljava/lang/String;)V
    //   261: aload_2
    //   262: astore_1
    //   263: invokestatic 406	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   266: ifeq +36 -> 302
    //   269: aload_2
    //   270: astore_1
    //   271: ldc 63
    //   273: iconst_2
    //   274: new 248	java/lang/StringBuilder
    //   277: dup
    //   278: invokespecial 249	java/lang/StringBuilder:<init>	()V
    //   281: ldc_w 541
    //   284: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   287: getstatic 482	com/tencent/qphone/base/BaseConstants:XGloginMergeTSAddress	[Ljava/lang/String;
    //   290: invokestatic 490	java/util/Arrays:toString	([Ljava/lang/Object;)Ljava/lang/String;
    //   293: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   296: invokevirtual 270	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   299: invokestatic 420	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   302: aload_2
    //   303: astore_1
    //   304: aload_0
    //   305: getfield 383	com/tencent/mobileqq/msf/core/w:a	Lcom/tencent/mobileqq/msf/core/net/h;
    //   308: getstatic 493	com/tencent/qphone/base/BaseConstants:WiFiloginMergeTSAddress	[Ljava/lang/String;
    //   311: invokevirtual 495	com/tencent/mobileqq/msf/core/net/h:b	([Ljava/lang/String;)V
    //   314: aload_2
    //   315: astore_1
    //   316: invokestatic 406	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   319: ifeq +36 -> 355
    //   322: aload_2
    //   323: astore_1
    //   324: ldc 63
    //   326: iconst_2
    //   327: new 248	java/lang/StringBuilder
    //   330: dup
    //   331: invokespecial 249	java/lang/StringBuilder:<init>	()V
    //   334: ldc_w 541
    //   337: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   340: getstatic 493	com/tencent/qphone/base/BaseConstants:WiFiloginMergeTSAddress	[Ljava/lang/String;
    //   343: invokestatic 490	java/util/Arrays:toString	([Ljava/lang/Object;)Ljava/lang/String;
    //   346: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   349: invokevirtual 270	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   352: invokestatic 420	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   355: aload_2
    //   356: ifnull -296 -> 60
    //   359: aload_2
    //   360: invokevirtual 544	java/io/FileInputStream:close	()V
    //   363: return
    //   364: astore_1
    //   365: aload_1
    //   366: invokevirtual 547	java/lang/Exception:printStackTrace	()V
    //   369: return
    //   370: astore_3
    //   371: aconst_null
    //   372: astore_2
    //   373: aload_2
    //   374: astore_1
    //   375: aload_3
    //   376: invokevirtual 547	java/lang/Exception:printStackTrace	()V
    //   379: aload_2
    //   380: ifnull -320 -> 60
    //   383: aload_2
    //   384: invokevirtual 544	java/io/FileInputStream:close	()V
    //   387: return
    //   388: astore_1
    //   389: goto -24 -> 365
    //   392: astore_2
    //   393: aconst_null
    //   394: astore_1
    //   395: aload_1
    //   396: ifnull +7 -> 403
    //   399: aload_1
    //   400: invokevirtual 544	java/io/FileInputStream:close	()V
    //   403: aload_2
    //   404: athrow
    //   405: astore_1
    //   406: aload_1
    //   407: invokevirtual 547	java/lang/Exception:printStackTrace	()V
    //   410: goto -7 -> 403
    //   413: astore_2
    //   414: goto -19 -> 395
    //   417: astore_3
    //   418: goto -45 -> 373
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	421	0	this	w
    //   0	421	1	paramContext	android.content.Context
    //   195	189	2	localFileInputStream	java.io.FileInputStream
    //   392	12	2	localObject1	Object
    //   413	1	2	localObject2	Object
    //   186	54	3	localObject3	Object
    //   370	6	3	localException1	Exception
    //   417	1	3	localException2	Exception
    //   212	15	4	str	String
    // Exception table:
    //   from	to	target	type
    //   359	363	364	java/lang/Exception
    //   187	196	370	java/lang/Exception
    //   383	387	388	java/lang/Exception
    //   187	196	392	finally
    //   399	403	405	java/lang/Exception
    //   198	203	413	finally
    //   205	214	413	finally
    //   216	224	413	finally
    //   226	237	413	finally
    //   239	249	413	finally
    //   251	261	413	finally
    //   263	269	413	finally
    //   271	302	413	finally
    //   304	314	413	finally
    //   316	322	413	finally
    //   324	355	413	finally
    //   375	379	413	finally
    //   198	203	417	java/lang/Exception
    //   205	214	417	java/lang/Exception
    //   216	224	417	java/lang/Exception
    //   226	237	417	java/lang/Exception
    //   239	249	417	java/lang/Exception
    //   251	261	417	java/lang/Exception
    //   263	269	417	java/lang/Exception
    //   271	302	417	java/lang/Exception
    //   304	314	417	java/lang/Exception
    //   316	322	417	java/lang/Exception
    //   324	355	417	java/lang/Exception
  }
  
  private void b(boolean paramBoolean)
  {
    if (a.b())
    {
      ToServiceMsg localToServiceMsg = new ToServiceMsg("", "0", "Heartbeat.Alive");
      localToServiceMsg.setMsfCommand(MsfCommand._msf_HeartbeatAlive);
      localToServiceMsg.setRequestSsoSeq(MsfCore.getNextSeq());
      localToServiceMsg.setAppId(B.getMsfAppid());
      localToServiceMsg.putWupBuffer(new byte[] { 0, 0, 0, 4 });
      if (paramBoolean) {
        localToServiceMsg.setTimeout(com.tencent.mobileqq.msf.core.a.a.y());
      }
      for (;;)
      {
        a(localToServiceMsg);
        L = com.tencent.mobileqq.msf.core.a.a.E();
        if (QLog.isDevelopLevel()) {
          QLog.d("MSF.C.NetConnTag", 4, "send fast net detect Heartbeat msg ok");
        }
        M = System.currentTimeMillis();
        K.set(true);
        return;
        localToServiceMsg.setTimeout(10000L);
      }
    }
    if (QLog.isDevelopLevel()) {
      QLog.d("MSF.C.NetConnTag", 4, "conn is also closed.not need send heartbeat msg");
    }
    q();
  }
  
  public static boolean b(String paramString)
  {
    return Z.contains(paramString);
  }
  
  public static byte[] b(byte[] paramArrayOfByte)
  {
    int i1 = paramArrayOfByte.length;
    ByteBuffer localByteBuffer = ByteBuffer.allocate(i1 + 4);
    localByteBuffer.putInt(i1 + 4).put(paramArrayOfByte).flip();
    return localByteBuffer.array();
  }
  
  /* Error */
  private void c(android.content.Context paramContext)
  {
    // Byte code:
    //   0: getstatic 643	com/tencent/qphone/base/BaseConstants:testServerAddress	Ljava/lang/String;
    //   3: ifnull +75 -> 78
    //   6: getstatic 643	com/tencent/qphone/base/BaseConstants:testServerAddress	Ljava/lang/String;
    //   9: ldc -80
    //   11: invokevirtual 646	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   14: ifne +64 -> 78
    //   17: getstatic 643	com/tencent/qphone/base/BaseConstants:testServerAddress	Ljava/lang/String;
    //   20: invokestatic 651	com/tencent/mobileqq/msf/core/d:a	(Ljava/lang/String;)Lcom/tencent/mobileqq/msf/core/d;
    //   23: astore_1
    //   24: aload_1
    //   25: invokevirtual 653	com/tencent/mobileqq/msf/core/d:c	()Ljava/lang/String;
    //   28: ifnull +10 -> 38
    //   31: aload_1
    //   32: invokevirtual 655	com/tencent/mobileqq/msf/core/d:d	()I
    //   35: ifgt +4 -> 39
    //   38: return
    //   39: aload_0
    //   40: getfield 383	com/tencent/mobileqq/msf/core/w:a	Lcom/tencent/mobileqq/msf/core/net/h;
    //   43: getstatic 643	com/tencent/qphone/base/BaseConstants:testServerAddress	Ljava/lang/String;
    //   46: invokevirtual 657	com/tencent/mobileqq/msf/core/net/h:a	(Ljava/lang/String;)V
    //   49: ldc 63
    //   51: iconst_1
    //   52: new 248	java/lang/StringBuilder
    //   55: dup
    //   56: invokespecial 249	java/lang/StringBuilder:<init>	()V
    //   59: ldc_w 659
    //   62: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   65: getstatic 643	com/tencent/qphone/base/BaseConstants:testServerAddress	Ljava/lang/String;
    //   68: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   71: invokevirtual 270	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   74: invokestatic 420	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   77: return
    //   78: aload_1
    //   79: invokevirtual 500	android/content/Context:getPackageName	()Ljava/lang/String;
    //   82: astore_1
    //   83: new 257	java/io/File
    //   86: dup
    //   87: new 248	java/lang/StringBuilder
    //   90: dup
    //   91: invokespecial 249	java/lang/StringBuilder:<init>	()V
    //   94: invokestatic 255	android/os/Environment:getExternalStorageDirectory	()Ljava/io/File;
    //   97: invokevirtual 261	java/io/File:getPath	()Ljava/lang/String;
    //   100: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   103: ldc_w 502
    //   106: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   109: aload_1
    //   110: ldc_w 504
    //   113: ldc_w 506
    //   116: invokevirtual 510	java/lang/String:replace	(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    //   119: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   122: ldc_w 661
    //   125: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   128: invokevirtual 270	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   131: invokespecial 514	java/io/File:<init>	(Ljava/lang/String;)V
    //   134: astore_1
    //   135: new 516	java/util/Properties
    //   138: dup
    //   139: invokespecial 517	java/util/Properties:<init>	()V
    //   142: astore 4
    //   144: aload_1
    //   145: invokevirtual 664	java/io/File:exists	()Z
    //   148: ifeq +242 -> 390
    //   151: new 519	java/io/FileInputStream
    //   154: dup
    //   155: aload_1
    //   156: invokespecial 522	java/io/FileInputStream:<init>	(Ljava/io/File;)V
    //   159: astore_2
    //   160: aload_2
    //   161: astore_1
    //   162: aload 4
    //   164: aload_2
    //   165: invokevirtual 526	java/util/Properties:load	(Ljava/io/InputStream;)V
    //   168: aload_2
    //   169: astore_1
    //   170: aload_2
    //   171: invokevirtual 544	java/io/FileInputStream:close	()V
    //   174: aload_2
    //   175: ifnull +7 -> 182
    //   178: aload_2
    //   179: invokevirtual 544	java/io/FileInputStream:close	()V
    //   182: iconst_0
    //   183: ifeq +11 -> 194
    //   186: new 666	java/lang/NullPointerException
    //   189: dup
    //   190: invokespecial 667	java/lang/NullPointerException:<init>	()V
    //   193: athrow
    //   194: aload 4
    //   196: ldc_w 669
    //   199: invokevirtual 531	java/util/Properties:getProperty	(Ljava/lang/String;)Ljava/lang/String;
    //   202: astore_1
    //   203: aload_1
    //   204: ifnull -166 -> 38
    //   207: aload_1
    //   208: invokevirtual 672	java/lang/String:trim	()Ljava/lang/String;
    //   211: invokevirtual 675	java/lang/String:length	()I
    //   214: ifle -176 -> 38
    //   217: aload_1
    //   218: invokestatic 651	com/tencent/mobileqq/msf/core/d:a	(Ljava/lang/String;)Lcom/tencent/mobileqq/msf/core/d;
    //   221: astore_2
    //   222: aload_2
    //   223: invokevirtual 653	com/tencent/mobileqq/msf/core/d:c	()Ljava/lang/String;
    //   226: ifnull -188 -> 38
    //   229: aload_2
    //   230: invokevirtual 655	com/tencent/mobileqq/msf/core/d:d	()I
    //   233: ifle -195 -> 38
    //   236: aload_1
    //   237: invokevirtual 672	java/lang/String:trim	()Ljava/lang/String;
    //   240: ldc_w 431
    //   243: ldc -80
    //   245: invokevirtual 510	java/lang/String:replace	(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;
    //   248: astore_1
    //   249: aload_0
    //   250: getfield 383	com/tencent/mobileqq/msf/core/w:a	Lcom/tencent/mobileqq/msf/core/net/h;
    //   253: aload_1
    //   254: invokevirtual 657	com/tencent/mobileqq/msf/core/net/h:a	(Ljava/lang/String;)V
    //   257: ldc 63
    //   259: iconst_1
    //   260: new 248	java/lang/StringBuilder
    //   263: dup
    //   264: invokespecial 249	java/lang/StringBuilder:<init>	()V
    //   267: ldc_w 677
    //   270: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   273: aload_1
    //   274: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   277: invokevirtual 270	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   280: invokestatic 420	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   283: return
    //   284: astore_3
    //   285: aconst_null
    //   286: astore_2
    //   287: aload_2
    //   288: astore_1
    //   289: aload_3
    //   290: invokevirtual 547	java/lang/Exception:printStackTrace	()V
    //   293: aload_2
    //   294: ifnull +7 -> 301
    //   297: aload_2
    //   298: invokevirtual 544	java/io/FileInputStream:close	()V
    //   301: iconst_0
    //   302: ifeq -108 -> 194
    //   305: new 666	java/lang/NullPointerException
    //   308: dup
    //   309: invokespecial 667	java/lang/NullPointerException:<init>	()V
    //   312: athrow
    //   313: astore_1
    //   314: aload_1
    //   315: invokevirtual 678	java/io/IOException:printStackTrace	()V
    //   318: goto -124 -> 194
    //   321: astore_2
    //   322: aconst_null
    //   323: astore_1
    //   324: aload_1
    //   325: ifnull +7 -> 332
    //   328: aload_1
    //   329: invokevirtual 544	java/io/FileInputStream:close	()V
    //   332: iconst_0
    //   333: ifeq +11 -> 344
    //   336: new 666	java/lang/NullPointerException
    //   339: dup
    //   340: invokespecial 667	java/lang/NullPointerException:<init>	()V
    //   343: athrow
    //   344: aload_2
    //   345: athrow
    //   346: astore_1
    //   347: aload_1
    //   348: invokevirtual 678	java/io/IOException:printStackTrace	()V
    //   351: goto -19 -> 332
    //   354: astore_1
    //   355: aload_1
    //   356: invokevirtual 678	java/io/IOException:printStackTrace	()V
    //   359: goto -15 -> 344
    //   362: astore_1
    //   363: aload_1
    //   364: invokevirtual 678	java/io/IOException:printStackTrace	()V
    //   367: goto -66 -> 301
    //   370: astore_1
    //   371: aload_1
    //   372: invokevirtual 678	java/io/IOException:printStackTrace	()V
    //   375: goto -193 -> 182
    //   378: astore_1
    //   379: goto -65 -> 314
    //   382: astore_2
    //   383: goto -59 -> 324
    //   386: astore_3
    //   387: goto -100 -> 287
    //   390: aconst_null
    //   391: astore_2
    //   392: goto -218 -> 174
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	395	0	this	w
    //   0	395	1	paramContext	android.content.Context
    //   159	139	2	localObject1	Object
    //   321	24	2	localObject2	Object
    //   382	1	2	localObject3	Object
    //   391	1	2	localObject4	Object
    //   284	6	3	localException1	Exception
    //   386	1	3	localException2	Exception
    //   142	53	4	localProperties	java.util.Properties
    // Exception table:
    //   from	to	target	type
    //   144	160	284	java/lang/Exception
    //   305	313	313	java/io/IOException
    //   144	160	321	finally
    //   328	332	346	java/io/IOException
    //   336	344	354	java/io/IOException
    //   297	301	362	java/io/IOException
    //   178	182	370	java/io/IOException
    //   186	194	378	java/io/IOException
    //   162	168	382	finally
    //   170	174	382	finally
    //   289	293	382	finally
    //   162	168	386	java/lang/Exception
    //   170	174	386	java/lang/Exception
  }
  
  public static void c(String paramString)
  {
    am = paramString;
  }
  
  public static void d()
  {
    Iterator localIterator = Z.iterator();
    while (localIterator.hasNext()) {
      CodecWarpper.setUseSimpleHead((String)localIterator.next(), false);
    }
    Z.clear();
  }
  
  public static void d(int paramInt)
  {
    al = paramInt;
  }
  
  private void d(String paramString)
  {
    QLog.setUIN_REPORTLOG_LEVEL(Integer.parseInt(paramString));
  }
  
  public static byte[] f(ToServiceMsg paramToServiceMsg)
  {
    try
    {
      int i2 = com.tencent.mobileqq.msf.core.a.a.aX();
      int i1 = i2;
      if (i2 < 1) {
        i1 = 1;
      }
      i2 = (int)(Math.random() * 100.0D);
      if ((paramToServiceMsg.getServiceCmd().equals("MessageSvc.PbGetMsg")) && (i2 % i1 == i1 - 1))
      {
        SSOReserveField.ReserveFields localReserveFields = new SSOReserveField.ReserveFields();
        paramToServiceMsg = (String)paramToServiceMsg.getAttribute("sso_push_timestamp");
        if (paramToServiceMsg != null)
        {
          String[] arrayOfString = paramToServiceMsg.split("\\|");
          String str1 = Build.MODEL.replace('\n', '-');
          i1 = Build.VERSION.SDK_INT;
          String str2 = Build.DISPLAY;
          String str3 = Build.MANUFACTURER;
          if (arrayOfString.length == 3)
          {
            StringBuilder localStringBuilder = new StringBuilder();
            localStringBuilder.append("model:" + str1 + ";");
            localStringBuilder.append("os:" + i1 + ";");
            localStringBuilder.append("version:v2");
            if (com.tencent.mobileqq.msf.core.a.a.bd())
            {
              localStringBuilder.append("man:" + str3);
              localStringBuilder.append("sys:" + str2);
            }
            sso_send.set(Long.parseLong(arrayOfString[0]));
            sdk_recv.set(Long.parseLong(arrayOfString[1]));
            app_recv.set(Long.parseLong(arrayOfString[2]));
            sdk_send.set(System.currentTimeMillis());
            type.set(v);
            extra.set(localStringBuilder.toString());
          }
          QLog.d("MSF.C.NetConnTag", 1, "msf get timestamp:" + paramToServiceMsg + ", length:" + arrayOfString.length + ", model:" + str1 + ", type:" + v);
          paramToServiceMsg = localReserveFields.toByteArray();
          return paramToServiceMsg;
        }
      }
    }
    catch (Exception paramToServiceMsg)
    {
      QLog.d("MSF.C.NetConnTag", 1, "failed to construct reserve field", paramToServiceMsg);
    }
    return null;
  }
  
  private int g(ToServiceMsg paramToServiceMsg)
  {
    Object localObject1;
    if (paramToServiceMsg.isNeedCallback())
    {
      c.put(Integer.valueOf(paramToServiceMsg.getRequestSsoSeq()), paramToServiceMsg);
      paramToServiceMsg.getAttributes().put("__extraTimeoutSeq", Integer.valueOf(ah.incrementAndGet()));
      if (paramToServiceMsg.getTimeout() == -1L)
      {
        paramToServiceMsg.setTimeout(30000L);
        localObject1 = B.msfAlarmer.a(paramToServiceMsg, paramToServiceMsg.getTimeout());
        if (("LongConn.OffPicUp".equalsIgnoreCase(paramToServiceMsg.getServiceCmd())) || ("ImgStore.GroupPicUp".equalsIgnoreCase(paramToServiceMsg.getServiceCmd()))) {
          QLog.d("MSF.C.NetConnTag", 1, "Sender PicUpMsg timer start, appSeq: " + paramToServiceMsg.getAppSeq() + ", delayMillis: " + paramToServiceMsg.getTimeout());
        }
        paramToServiceMsg.addAttribute("to_timeoutCallbacker", localObject1);
        if ((com.tencent.mobileqq.msf.core.a.a.U()) && (B.quicksender != null) && (B.quicksender.b(paramToServiceMsg)))
        {
          QLog.d("MSF.C.NetConnTag", 1, "add quick send timeout check " + paramToServiceMsg.getRequestSsoSeq());
          B.quicksender.c(paramToServiceMsg);
        }
      }
    }
    for (;;)
    {
      try
      {
        B.quicksender.c.a(paramToServiceMsg);
        if (ad.offer(paramToServiceMsg)) {
          break label515;
        }
        QLog.d("MSF.C.NetConnTag", 1, "error, add " + paramToServiceMsg + " to send queue is full! size: " + ad.size());
        if (paramToServiceMsg.getServiceCmd().equals("SSO.LoginMerge")) {
          break label430;
        }
        localObject1 = n.a(paramToServiceMsg);
        ((FromServiceMsg)localObject1).setBusinessFail(1008, "send queue is full!");
        B.addRespToQuque(paramToServiceMsg, (FromServiceMsg)localObject1);
        if ((!Q.get()) && (f.b))
        {
          Q.set(true);
          P = paramToServiceMsg.getRequestSsoSeq();
        }
        return paramToServiceMsg.getRequestSsoSeq();
        localObject1 = B.msfAlarmer.a(paramToServiceMsg, paramToServiceMsg.getTimeout());
      }
      catch (Throwable localThrowable)
      {
        localThrowable.printStackTrace();
        continue;
      }
      if (paramToServiceMsg.getServiceCmd().equals("SSO.LoginMerge"))
      {
        B.msfAlarmer.a(paramToServiceMsg.getRequestSsoSeq(), 30000L);
        continue;
        label430:
        Object localObject2 = (ArrayList)ac.remove(Integer.valueOf(paramToServiceMsg.getRequestSsoSeq()));
        if (localObject2 != null)
        {
          localObject2 = ((ArrayList)localObject2).iterator();
          while (((Iterator)localObject2).hasNext())
          {
            ToServiceMsg localToServiceMsg = (ToServiceMsg)((Iterator)localObject2).next();
            FromServiceMsg localFromServiceMsg = n.a(localToServiceMsg);
            localFromServiceMsg.setBusinessFail(1008, "send queue is full!");
            B.addRespToQuque(localToServiceMsg, localFromServiceMsg);
          }
          continue;
          label515:
          if (ac.contains(Integer.valueOf(paramToServiceMsg.getRequestSsoSeq()))) {
            ac.remove(Integer.valueOf(paramToServiceMsg.getRequestSsoSeq()));
          }
          if (QLog.isDevelopLevel()) {
            QLog.d("MSF.C.NetConnTag", 4, "add " + paramToServiceMsg + " to sendQueue");
          }
          long l1 = SystemClock.elapsedRealtime();
          if (l1 - ar >= 300000L)
          {
            ar = l1;
            if (QLog.isColorLevel()) {
              r();
            }
          }
        }
      }
    }
  }
  
  private void h(ToServiceMsg paramToServiceMsg)
  {
    if (paramToServiceMsg.getUin().equals("0")) {}
    int i1;
    do
    {
      return;
      int i2 = 0;
      i1 = i2;
      if (!R.contains(paramToServiceMsg.getUin()))
      {
        at += 1L;
        if (at >= 2L)
        {
          i1 = i2;
          if (au.nextInt(20) >= 2) {}
        }
        else
        {
          i1 = 1;
        }
      }
    } while (i1 == 0);
    a(paramToServiceMsg.getAppId(), paramToServiceMsg.getUin());
  }
  
  public static int i()
  {
    return al;
  }
  
  public static String j()
  {
    return am;
  }
  
  private void p()
  {
    if (a.b())
    {
      ToServiceMsg localToServiceMsg = new ToServiceMsg("", "0", "Heartbeat.Alive");
      localToServiceMsg.setMsfCommand(MsfCommand._msf_HeartbeatAlive);
      localToServiceMsg.setRequestSsoSeq(MsfCore.getNextSeq());
      localToServiceMsg.setAppId(B.getMsfAppid());
      localToServiceMsg.putWupBuffer(new byte[] { 0, 0, 0, 4 });
      localToServiceMsg.setTimeout(com.tencent.mobileqq.msf.core.a.a.w());
      a(localToServiceMsg);
      L += 1;
      if (QLog.isDevelopLevel()) {
        QLog.d("MSF.C.NetConnTag", 4, "send Heartbeat msg ok");
      }
      M = System.currentTimeMillis();
      K.set(true);
      return;
    }
    if (QLog.isDevelopLevel()) {
      QLog.d("MSF.C.NetConnTag", 4, "conn is also closed.not need send heartbeat msg");
    }
    q();
  }
  
  private void q()
  {
    L = 0;
    K.set(false);
  }
  
  private void r()
  {
    boolean bool2 = false;
    try
    {
      for (ThreadGroup localThreadGroup = Thread.currentThread().getThreadGroup(); localThreadGroup.getParent() != null; localThreadGroup = localThreadGroup.getParent()) {}
      Thread[] arrayOfThread = new Thread[localThreadGroup.activeCount()];
      localThreadGroup.enumerate(arrayOfThread);
      int i2 = ad.size();
      int i3 = arrayOfThread.length;
      int i1 = 0;
      for (;;)
      {
        boolean bool1 = bool2;
        if (i1 < i3)
        {
          localThreadGroup = arrayOfThread[i1];
          if ((localThreadGroup != null) && ("MsfCoreMsgSender".equals(localThreadGroup.getName()))) {
            bool1 = true;
          }
        }
        else
        {
          QLog.d("MSF.C.NetConnTag", 1, "sender alive:" + bool1 + " size: " + i2);
          return;
        }
        i1 += 1;
      }
      return;
    }
    catch (Exception localException)
    {
      QLog.d("MSF.C.NetConnTag", 1, "printCurrentThreads error", localException);
    }
  }
  
  public int a(ToServiceMsg paramToServiceMsg)
  {
    if (paramToServiceMsg.getRequestSsoSeq() == -1) {
      paramToServiceMsg.setRequestSsoSeq(MsfCore.getNextSeq());
    }
    paramToServiceMsg.addAttribute("__timestamp_addSendQueue", Long.valueOf(System.currentTimeMillis()));
    Runnable localRunnable;
    if (paramToServiceMsg.isNeedCallback())
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.NetConnTag", 2, "add " + paramToServiceMsg + " to send");
      }
      c.put(Integer.valueOf(paramToServiceMsg.getRequestSsoSeq()), paramToServiceMsg);
      paramToServiceMsg.getAttributes().put("__extraTimeoutSeq", Integer.valueOf(ah.incrementAndGet()));
      if (paramToServiceMsg.getTimeout() != -1L) {
        break label165;
      }
      paramToServiceMsg.setTimeout(30000L);
      localRunnable = B.msfAlarmer.a(paramToServiceMsg, paramToServiceMsg.getTimeout());
    }
    for (;;)
    {
      paramToServiceMsg.addAttribute("to_timeoutCallbacker", localRunnable);
      try
      {
        ad.a(paramToServiceMsg);
        return paramToServiceMsg.getRequestSsoSeq();
        label165:
        localRunnable = B.msfAlarmer.a(paramToServiceMsg, paramToServiceMsg.getTimeout());
      }
      catch (Exception localException)
      {
        for (;;)
        {
          QLog.d("MSF.C.NetConnTag", 1, "inset heartbeatMsg error. " + localException, localException);
        }
      }
    }
  }
  
  public Runnable a(int paramInt)
  {
    long l1 = com.tencent.mobileqq.msf.core.a.a.x();
    if (l1 > 0L) {
      return B.msfAlarmer.b(paramInt, l1);
    }
    b(paramInt);
    return null;
  }
  
  public void a(int paramInt, String paramString)
  {
    UniPacket localUniPacket = new UniPacket(true);
    localUniPacket.setRequestId(MsfCore.getNextSeq());
    localUniPacket.setServantName("KQQ.ConfigService.ConfigServantObj");
    localUniPacket.setFuncName("ClientReq");
    Object localObject = new c();
    a = paramInt;
    b = paramString;
    localUniPacket.put("req", localObject);
    localObject = new ToServiceMsg("", paramString, "GrayUinPro.Check");
    ((ToServiceMsg)localObject).setAppId(paramInt);
    ((ToServiceMsg)localObject).setRequestSsoSeq(MsfCore.getNextSeq());
    ((ToServiceMsg)localObject).putWupBuffer(localUniPacket.encode());
    ((ToServiceMsg)localObject).setTimeout(30000L);
    ((ToServiceMsg)localObject).setMsfCommand(MsfCommand.checkRole);
    b((ToServiceMsg)localObject);
    if (QLog.isColorLevel()) {
      QLog.d("MSF.C.NetConnTag", 2, "role send gray check for " + paramString + " use " + paramInt + " to:" + localObject);
    }
  }
  
  public void a(com.tencent.qphone.base.a paramA)
  {
    a.a(paramA);
  }
  
  public void a(FromServiceMsg paramFromServiceMsg)
  {
    if (paramFromServiceMsg.getResultCode() == 1000) {
      R.add(paramFromServiceMsg.getUin());
    }
    label331:
    for (;;)
    {
      try
      {
        Object localObject1 = paramFromServiceMsg.getWupBuffer();
        if ((localObject1.length <= 4) || (localObject1[0] != 0) || (localObject1[1] != 0) || (localObject1[2] != 0) || (localObject1[3] != 4)) {
          break label331;
        }
        Object localObject2 = new byte[localObject1.length - 4];
        System.arraycopy(localObject1, 4, localObject2, 0, localObject2.length);
        localObject1 = localObject2;
        QLog.d("MSF.C.NetConnTag", 1, "recv buf:" + HexUtil.bytes2HexStr((byte[])localObject1));
        localObject2 = new UniPacket();
        ((UniPacket)localObject2).decode((byte[])localObject1);
        localObject1 = (com.tencent.msf.service.protocol.e.d)((UniPacket)localObject2).getByClass("res", new com.tencent.msf.service.protocol.e.d());
        if (QLog.isDevelopLevel()) {
          QLog.d("MSF.C.NetConnTag", 4, "role received gray resp uin:" + paramFromServiceMsg.getUin() + " appid:" + paramFromServiceMsg.getAppId() + " status:" + a + " yyb:" + b + " msg:" + HexUtil.bytes2HexStr(c));
        }
        if (a == 1)
        {
          B.getSsoRespHandler();
          y.a.put(paramFromServiceMsg.getUin(), localObject1);
          B.getAccountCenter().m(paramFromServiceMsg.getUin());
          return;
        }
        y.a.remove(paramFromServiceMsg.getUin());
        return;
      }
      catch (ObjectCreateException paramFromServiceMsg)
      {
        if (!QLog.isDevelopLevel()) {
          break;
        }
      }
      QLog.d("MSF.C.NetConnTag", 4, "role gray check error", paramFromServiceMsg);
      return;
      if (!QLog.isDevelopLevel()) {
        break;
      }
      QLog.d("MSF.C.NetConnTag", 4, "role gray check fail " + paramFromServiceMsg);
      return;
    }
  }
  
  public void a(FromServiceMsg paramFromServiceMsg, ToServiceMsg paramToServiceMsg)
  {
    if (paramFromServiceMsg.getBusinessFailCode() == 1002)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.NetConnTag", 2, "handleHeartbeat wait " + paramToServiceMsg + " timeout.");
      }
      if (!a.b())
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.NetConnTag", 2, "conn is also closed.");
        }
        q();
      }
      do
      {
        return;
        if (L < com.tencent.mobileqq.msf.core.a.a.E()) {
          break;
        }
        try
        {
          if (QLog.isColorLevel()) {
            QLog.d("MSF.C.NetConnTag", 2, "Heartbeat continueTimeoutCount is " + L + ",try close conn");
          }
          B.sender.a.a(com.tencent.qphone.base.a.p);
          q();
          return;
        }
        catch (Exception paramFromServiceMsg) {}
      } while (!QLog.isColorLevel());
      QLog.d("MSF.C.NetConnTag", 2, paramFromServiceMsg.toString(), paramFromServiceMsg);
      return;
      long l1 = System.currentTimeMillis();
      if (l1 - M > com.tencent.mobileqq.msf.core.a.a.E() * com.tencent.mobileqq.msf.core.a.a.w())
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.NetConnTag", 2, "timenow - firstSendHeartBeatTime is " + (l1 - M) + ",try close conn");
        }
        B.sender.a.a(com.tencent.qphone.base.a.e);
        q();
        return;
      }
      p();
      return;
    }
    if (QLog.isColorLevel()) {
      QLog.d("MSF.C.NetConnTag", 2, "recv heart resp.now conn is alive.");
    }
    q();
  }
  
  public void a(ToServiceMsg paramToServiceMsg, int paramInt)
  {
    paramToServiceMsg.getAttributes().put("_attr_regprxy_socket_hashcode", new Integer(paramInt));
    af = paramToServiceMsg;
  }
  
  public void a(Runnable paramRunnable)
  {
    if (paramRunnable != null) {
      B.msfAlarmer.b(paramRunnable);
    }
  }
  
  public void a(String paramString)
  {
    CodecWarpper.nateiveRemoveAccountKey(paramString);
  }
  
  public void a(String paramString, long paramLong)
  {
    if (-1L == s) {
      s = System.currentTimeMillis();
    }
    String str2 = com.tencent.mobileqq.msf.core.a.d.c();
    String str1 = str2;
    if (TextUtils.isEmpty(str2)) {
      str1 = "unknown";
    }
    int i1;
    if (r.containsKey(str1))
    {
      i1 = ((Integer)r.get(str1)).intValue();
      if (i1 < com.tencent.mobileqq.msf.core.a.a.aR())
      {
        r.remove(str1);
        r.put(str1, Integer.valueOf(i1 + 1));
        i1 = 1;
      }
    }
    for (;;)
    {
      if (i1 != 0) {
        new d(paramString, str1, paramLong).run();
      }
      return;
      QLog.d("MSF.C.NetConnTag", 1, "single ssid " + str1 + " record times limited in " + i1);
      i1 = 0;
      continue;
      r.put(str1, Integer.valueOf(1));
      i1 = 1;
    }
  }
  
  public void a(HashMap paramHashMap)
  {
    aa.add(paramHashMap);
    ab = true;
    if (QLog.isColorLevel()) {
      QLog.d("MSF.C.NetConnTag", 2, "add waitReportData " + aa.size());
    }
  }
  
  public void a(byte[] paramArrayOfByte)
  {
    as = paramArrayOfByte;
  }
  
  public void a(String[] paramArrayOfString)
  {
    if (paramArrayOfString != null)
    {
      int i2 = paramArrayOfString.length;
      int i1 = 0;
      while (i1 < i2)
      {
        String str = paramArrayOfString[i1];
        ao.add(str);
        i1 += 1;
      }
    }
    ao.add("GrayUinPro.Check");
    ao.add("StatSvc.register");
    ao.add("StatSvc.get");
    ao.add("RegPrxySvc.infoLogin");
    ao.add("RegPrxySvc.infoSync");
    ao.add("wtlogin.login");
    ao.add("RegPrxySvc.getOffMsg");
    ao.add("login.auth");
    ao.add("wtlogin.exchange");
    ao.add("wtlogin.trans_emp");
    ao.add("MessageSvc.PbSendMsg");
    ao.add("LongConn.OffPicUp");
    ao.add("LongConn.OffPicDown");
    ao.add("ImgStore.GroupPicUp");
    ao.add("ImgStore.GroupPicDown");
    ao.add("StreamSvr.UploadStreamMsg");
    ao.add("StreamSvr.RespUploadStreamMsg");
    ao.add("StreamSvr.PushStreamMsg");
    ao.add("StreamSvr.RespPushStreamMsg");
    ao.add("OidbSvc.0x787_1");
    ao.add("OidbSvc.0x49d_107");
    ao.add("MultiMsg.ApplyUp");
    ao.add("MultiMsg.ApplyDown");
    ao.add("PttCenterSvr.ShortVideoUpReq");
    ao.add("PttCenterSvr.ShortVideoDownReq");
    ao.add("ImgStore.GroupPicUp#pttGu");
    ao.add("ImgStore.GroupPicDown#pttGd");
    ao.add("PttStore.GroupPttUp");
    ao.add("PttStore.GroupPttDown");
    ao.add("Heartbeat.Alive");
    ao.add("friendlist.getFriendGroupList");
    ao.add("VideoSvc.Send");
    ao.add("VideoSvc.Ack");
    ao.add("SharpSvr.c2s");
    ao.add("SharpSvr.c2sack");
    ao.add("SharpSvr.s2c");
    ao.add("SharpSvr.s2cack");
    ao.add("MultiVideo.c2s");
    ao.add("MultiVideo.c2sack");
    ao.add("MultiVideo.s2c");
    ao.add("MultiVideo.s2cack");
    ao.add("MessageSvc.PbGetMsg");
    ao.add("PttCenterSvr.pb_pttCenter_CMD_REQ_APPLY_DOWNLOAD-1200");
    ao.add("PttCenterSvr.pb_pttCenter_CMD_REQ_APPLY_UPLOAD-500");
    ao.add("OfflineFilleHandleSvr.pb_ftnPtt_CMD_REQ_APPLY_DOWNLOAD-1200");
    ao.add("cmd_openConn");
    ao.add("wtlogin.exchange_emp");
    ao.add("wtlogin.name2uin");
    ao.add("Client.CorrectTime");
  }
  
  public boolean a()
  {
    return c.isEmpty();
  }
  
  /* Error */
  public boolean a(android.content.Context paramContext)
  {
    // Byte code:
    //   0: invokestatic 1310	com/tencent/mobileqq/msf/core/a/a:aA	()Z
    //   3: ifeq +23 -> 26
    //   6: aload_0
    //   7: new 1312	com/tencent/mobileqq/msf/core/net/a/f
    //   10: dup
    //   11: aload_0
    //   12: getfield 350	com/tencent/mobileqq/msf/core/w:B	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   15: aload_1
    //   16: invokespecial 1315	com/tencent/mobileqq/msf/core/net/a/f:<init>	(Lcom/tencent/mobileqq/msf/core/MsfCore;Landroid/content/Context;)V
    //   19: putfield 296	com/tencent/mobileqq/msf/core/w:F	Lcom/tencent/mobileqq/msf/core/net/a/f;
    //   22: iconst_1
    //   23: putstatic 129	com/tencent/mobileqq/msf/core/w:p	Z
    //   26: ldc 63
    //   28: iconst_1
    //   29: ldc_w 1317
    //   32: invokestatic 420	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   35: aload_0
    //   36: getfield 290	com/tencent/mobileqq/msf/core/w:A	Lcom/tencent/mobileqq/msf/core/w$a;
    //   39: aload_1
    //   40: iconst_0
    //   41: invokevirtual 1321	com/tencent/mobileqq/msf/core/w$a:init	(Landroid/content/Context;Z)V
    //   44: aload_0
    //   45: getfield 350	com/tencent/mobileqq/msf/core/w:B	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   48: invokevirtual 1131	com/tencent/mobileqq/msf/core/MsfCore:getAccountCenter	()Lcom/tencent/mobileqq/msf/core/auth/b;
    //   51: invokevirtual 1323	com/tencent/mobileqq/msf/core/auth/b:f	()[B
    //   54: invokestatic 1326	com/tencent/qphone/base/util/CodecWarpper:setKsid	([B)V
    //   57: aload_0
    //   58: getfield 299	com/tencent/mobileqq/msf/core/w:H	Lcom/tencent/mobileqq/msf/core/w$c;
    //   61: invokevirtual 1327	com/tencent/mobileqq/msf/core/w$c:start	()V
    //   64: invokestatic 1333	com/tencent/mobileqq/msf/core/MsfStore:getNativeConfigStore	()Lcom/tencent/msf/boot/config/NativeConfigStore;
    //   67: ldc_w 1335
    //   70: invokevirtual 1340	com/tencent/msf/boot/config/NativeConfigStore:getConfig	(Ljava/lang/String;)Ljava/lang/String;
    //   73: astore_1
    //   74: aload_1
    //   75: ifnull +72 -> 147
    //   78: aload_1
    //   79: invokevirtual 675	java/lang/String:length	()I
    //   82: ifle +65 -> 147
    //   85: invokestatic 1333	com/tencent/mobileqq/msf/core/MsfStore:getNativeConfigStore	()Lcom/tencent/msf/boot/config/NativeConfigStore;
    //   88: ldc_w 1342
    //   91: invokevirtual 1340	com/tencent/msf/boot/config/NativeConfigStore:getConfig	(Ljava/lang/String;)Ljava/lang/String;
    //   94: astore 4
    //   96: aload 4
    //   98: ifnull +103 -> 201
    //   101: aload 4
    //   103: invokevirtual 675	java/lang/String:length	()I
    //   106: ifle +95 -> 201
    //   109: aload 4
    //   111: invokestatic 770	java/lang/Long:parseLong	(Ljava/lang/String;)J
    //   114: lstore_2
    //   115: invokestatic 332	java/lang/System:currentTimeMillis	()J
    //   118: lload_2
    //   119: lsub
    //   120: ldc2_w 1343
    //   123: lcmp
    //   124: ifle +41 -> 165
    //   127: new 1346	com/tencent/mobileqq/msf/core/x
    //   130: dup
    //   131: aload_0
    //   132: invokespecial 1347	com/tencent/mobileqq/msf/core/x:<init>	(Lcom/tencent/mobileqq/msf/core/w;)V
    //   135: astore_1
    //   136: aload_1
    //   137: ldc_w 1349
    //   140: invokevirtual 1350	java/lang/Thread:setName	(Ljava/lang/String;)V
    //   143: aload_1
    //   144: invokevirtual 1351	java/lang/Thread:start	()V
    //   147: iconst_1
    //   148: ireturn
    //   149: astore 4
    //   151: ldc 63
    //   153: iconst_1
    //   154: ldc_w 1353
    //   157: aload 4
    //   159: invokestatic 437	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   162: goto -136 -> 26
    //   165: aload_0
    //   166: aload_1
    //   167: invokespecial 1355	com/tencent/mobileqq/msf/core/w:d	(Ljava/lang/String;)V
    //   170: iconst_1
    //   171: ireturn
    //   172: astore_1
    //   173: ldc 63
    //   175: iconst_1
    //   176: new 248	java/lang/StringBuilder
    //   179: dup
    //   180: invokespecial 249	java/lang/StringBuilder:<init>	()V
    //   183: ldc_w 1357
    //   186: invokevirtual 265	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   189: aload_1
    //   190: invokevirtual 434	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   193: invokevirtual 270	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   196: invokestatic 420	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   199: iconst_1
    //   200: ireturn
    //   201: invokestatic 1333	com/tencent/mobileqq/msf/core/MsfStore:getNativeConfigStore	()Lcom/tencent/msf/boot/config/NativeConfigStore;
    //   204: ldc_w 1342
    //   207: invokestatic 332	java/lang/System:currentTimeMillis	()J
    //   210: invokestatic 1360	java/lang/String:valueOf	(J)Ljava/lang/String;
    //   213: invokevirtual 1364	com/tencent/msf/boot/config/NativeConfigStore:setConfig	(Ljava/lang/String;Ljava/lang/String;)V
    //   216: aload_0
    //   217: aload_1
    //   218: invokespecial 1355	com/tencent/mobileqq/msf/core/w:d	(Ljava/lang/String;)V
    //   221: iconst_1
    //   222: ireturn
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	223	0	this	w
    //   0	223	1	paramContext	android.content.Context
    //   114	5	2	l1	long
    //   94	16	4	str	String
    //   149	9	4	localThrowable	Throwable
    // Exception table:
    //   from	to	target	type
    //   0	26	149	java/lang/Throwable
    //   64	74	172	java/lang/Exception
    //   78	96	172	java/lang/Exception
    //   101	147	172	java/lang/Exception
    //   165	170	172	java/lang/Exception
    //   201	221	172	java/lang/Exception
  }
  
  public boolean a(ToServiceMsg paramToServiceMsg, FromServiceMsg paramFromServiceMsg)
  {
    if (paramToServiceMsg == null) {
      return false;
    }
    if (paramToServiceMsg.getMsfCommand() == MsfCommand.msf_ssoping)
    {
      B.sender.a.o().f();
      B.sender.a.a(com.tencent.qphone.base.a.B);
      return false;
    }
    if (paramToServiceMsg.getMsfCommand() == MsfCommand.msf_oshello)
    {
      QLog.d("MSF.C.NetConnTag", 1, "cannot get os hello response");
      return false;
    }
    if ((paramToServiceMsg != null) && (paramToServiceMsg.isNeedRemindSlowNetwork())) {
      com.tencent.mobileqq.msf.core.net.f.a(f.b.a);
    }
    paramToServiceMsg.addAttribute("_tag_socket_connerror", com.tencent.mobileqq.msf.core.net.h.G);
    paramFromServiceMsg.addAttribute("_tag_socket_connerror", com.tencent.mobileqq.msf.core.net.h.G);
    if (paramToServiceMsg.getAttributes().containsKey("_tag_socket")) {
      paramFromServiceMsg.addAttribute("_tag_socket", paramToServiceMsg.getAttribute("_tag_socket"));
    }
    if ((p) && (com.tencent.mobileqq.msf.core.net.a.f.a())) {}
    for (;;)
    {
      try
      {
        F.b().a(paramToServiceMsg.getRequestSsoSeq(), true);
        if (!paramToServiceMsg.getAttributes().containsKey("__timestamp_msf2net")) {
          break label1029;
        }
        l1 = ((Long)paramToServiceMsg.getAttribute("__timestamp_msf2net")).longValue();
        l3 = System.currentTimeMillis();
        if (!paramToServiceMsg.getAttributes().containsKey("__timestamp_addSendQueue")) {
          break label1023;
        }
        l2 = ((Long)paramToServiceMsg.getAttribute("__timestamp_addSendQueue")).longValue();
      }
      catch (Exception localException1)
      {
        try
        {
          long l3;
          if (paramToServiceMsg.getServiceCmd().equals("MessageSvc.PbGetMsg")) {
            B.statReporter.a("dim.Msf.PushSendFail", false, 0L, 0L, null, false, false);
          }
          if ((l2 == 0L) || (l3 - l2 <= paramToServiceMsg.getTimeout()) || (l3 - l2 <= B.pushManager.e()) || (paramToServiceMsg.getTimeout() >= B.pushManager.e())) {
            break label444;
          }
          if (l2 >= a.o().c())
          {
            if (QLog.isColorLevel()) {
              QLog.d("MSF.C.NetConnTag", 2, "xiaomi 2s: " + paramToServiceMsg.getRequestSsoSeq() + " msg timeout , addtoqueueTime is " + (l3 - l2) + ",try close conn");
            }
            B.sender.a.a(com.tencent.qphone.base.a.q);
            q();
            return true;
            localException1 = localException1;
            QLog.d("MSF.C.NetConnTag", 1, "adaptor recv timeout failed", localException1);
          }
        }
        catch (Exception localException2)
        {
          QLog.d("MSF.C.NetConnTag", 1, "", localException2);
          continue;
        }
      }
      return true;
      label444:
      if ((l1 == 0L) || (l1 > a.o().c()))
      {
        if (paramToServiceMsg.getMsfCommand() == MsfCommand._msf_HeartbeatAlive)
        {
          QLog.d("MSF.C.NetConnTag", 1, "found timeout heartalive msg " + paramToServiceMsg.getRequestSsoSeq());
          a(paramFromServiceMsg, paramToServiceMsg);
          return false;
        }
        if (paramToServiceMsg.getMsfCommand() == MsfCommand._msf_QuickHeartBeat)
        {
          QLog.d("MSF.C.NetConnTag", 1, "found timeout quickheartbeat msg " + paramToServiceMsg.getRequestSsoSeq());
          B.quicksender.a(paramToServiceMsg, paramFromServiceMsg, false);
          return false;
        }
        try
        {
          if ((K.get()) && (System.currentTimeMillis() - M < com.tencent.mobileqq.msf.core.a.a.K() + 120000)) {
            break label762;
          }
          l1 = System.currentTimeMillis();
          if (l1 - M <= com.tencent.mobileqq.msf.core.a.a.K()) {
            break label707;
          }
          if (paramToServiceMsg.getRequestSsoSeq() == P)
          {
            P = -1;
            QLog.d("MSF.C.NetConnTag", 1, "found first msg screen on timeout try close conn " + paramToServiceMsg);
            B.sender.a.a(com.tencent.qphone.base.a.t);
            q();
            return true;
          }
        }
        finally {}
        p();
      }
      for (;;)
      {
        if (paramToServiceMsg.getMsfCommand() != MsfCommand._msf_HeartbeatAlive) {
          break label841;
        }
        return false;
        label707:
        QLog.d("MSF.C.NetConnTag", 1, "found timeout msg check time: timenow = " + l1 + " firstSendHeartBeatTime = " + M + " ConfigManager.getHeartBeatTimeInterval() = " + com.tencent.mobileqq.msf.core.a.a.K());
        break;
        label762:
        if (!QLog.isColorLevel()) {
          break;
        }
        QLog.d("MSF.C.NetConnTag", 2, "sendingHeartBeat: " + K + "net detect has started, no need sendHeartbeat");
        break;
        QLog.d("MSF.C.NetConnTag", 1, "found timeout msg " + paramToServiceMsg + " before connSucc.");
      }
      label841:
      if (paramToServiceMsg.getMsfCommand() == MsfCommand._msf_QuickHeartBeat)
      {
        B.quicksender.a(paramToServiceMsg, paramFromServiceMsg, true);
        return false;
      }
      for (;;)
      {
        try
        {
          if (a.b())
          {
            int i3 = 1;
            paramFromServiceMsg = an;
            int i4 = paramFromServiceMsg.length;
            i1 = 0;
            int i2 = i3;
            if (i1 < i4)
            {
              CharSequence localCharSequence = paramFromServiceMsg[i1];
              if ((TextUtils.isEmpty(localCharSequence)) || (paramToServiceMsg == null) || (!localCharSequence.equals(paramToServiceMsg.getServiceCmd()))) {
                continue;
              }
              i2 = 0;
            }
            if ((i2 != 0) && (z.incrementAndGet() >= com.tencent.mobileqq.msf.core.a.a.F()))
            {
              QLog.d("MSF.C.NetConnTag", 1, "Continue wait resp for bus packets ,try close conn");
              z.set(0);
              B.sender.a.a(com.tencent.qphone.base.a.e);
              q();
            }
          }
        }
        catch (Exception paramToServiceMsg)
        {
          int i1;
          QLog.d("MSF.C.NetConnTag", 1, " Continue wait resp for bus packets ,try close conn failed: " + paramToServiceMsg);
          continue;
        }
        return true;
        i1 += 1;
      }
      label1023:
      long l2 = 0L;
      continue;
      label1029:
      long l1 = 0L;
    }
  }
  
  public int b(ToServiceMsg paramToServiceMsg)
  {
    if (paramToServiceMsg == null) {
      return -1;
    }
    if (B.isSuspended())
    {
      ??? = n.a(paramToServiceMsg);
      ((FromServiceMsg)???).setBusinessFail(2009, "MSF is suspeded.");
      B.addRespToQuque(paramToServiceMsg, (FromServiceMsg)???);
      return paramToServiceMsg.getRequestSsoSeq();
    }
    Object localObject2;
    String str;
    int i1;
    if (B.configManager.J != null)
    {
      Iterator localIterator = B.configManager.J.iterator();
      ??? = null;
      for (;;)
      {
        if (localIterator.hasNext())
        {
          localObject2 = (a.a)localIterator.next();
          if (a + b.b < System.currentTimeMillis() / 1000L)
          {
            if (QLog.isColorLevel()) {
              QLog.d("MSF.C.NetConnTag", 2, "OverloadPushNotify item expired sCmd = " + c);
            }
            B.configManager.J.remove(localObject2);
            ??? = localObject2;
          }
          else
          {
            str = paramToServiceMsg.getServiceCmd();
            if (c.charAt(c.length() - 1) == '*')
            {
              ??? = localObject2;
              if (!str.startsWith(c.substring(0, c.length() - 1))) {
                continue;
              }
              if (!QLog.isColorLevel()) {
                break label2095;
              }
              QLog.d("MSF.C.NetConnTag", 2, "OverloadPushNotify item matched strServiceCmd = " + str + " sCmd:" + c);
              i1 = 1;
              ??? = localObject2;
            }
          }
        }
      }
    }
    for (;;)
    {
      if ((i1 != 0) && (??? != null))
      {
        if (b.e == 1)
        {
          localObject2 = new FromServiceMsg();
          ((FromServiceMsg)localObject2).setUin("0");
          ((FromServiceMsg)localObject2).setMsfCommand(MsfCommand.onOverloadPushNotify);
          ((FromServiceMsg)localObject2).setAppId(B.getMsfAppid());
          ((FromServiceMsg)localObject2).setMsgSuccess();
          ((FromServiceMsg)localObject2).setRequestSsoSeq(MsfCore.getNextSeq());
          MsfSdkUtils.addFromMsgProcessName("*", (FromServiceMsg)localObject2);
          ((FromServiceMsg)localObject2).getAttributes().put("msg", new String(b.d));
          B.addRespToQuque(null, (FromServiceMsg)localObject2);
          b.e = 0;
        }
        localObject2 = n.a(paramToServiceMsg);
        ((FromServiceMsg)localObject2).setBusinessFail(b.c, new String(b.d));
        B.addRespToQuque(paramToServiceMsg, (FromServiceMsg)localObject2);
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.NetConnTag", 2, "OverloadPushNotify server overload block tomsg: " + paramToServiceMsg + " frommsg: " + localObject2);
        }
        return paramToServiceMsg.getRequestSsoSeq();
        ??? = localObject2;
        if (!c.equals(str)) {
          break;
        }
        if (!QLog.isColorLevel()) {
          break label2095;
        }
        QLog.d("MSF.C.NetConnTag", 2, "OverloadPushNotify item matched strServiceCmd = " + str + " sCmd:" + c);
        i1 = 1;
        ??? = localObject2;
        continue;
      }
      if ((paramToServiceMsg.getAppId() <= 0) && (paramToServiceMsg.getMsfCommand() != MsfCommand.openConn) && ((TextUtils.isEmpty(paramToServiceMsg.getServiceCmd())) || (!paramToServiceMsg.getServiceCmd().startsWith("wtlogin."))))
      {
        ??? = n.a(paramToServiceMsg);
        ((FromServiceMsg)???).setBusinessFail(1007, "msg appid is " + paramToServiceMsg.getAppId());
        B.addRespToQuque(paramToServiceMsg, (FromServiceMsg)???);
        return paramToServiceMsg.getRequestSsoSeq();
      }
      if (av.get())
      {
        ??? = n.a(paramToServiceMsg);
        ((FromServiceMsg)???).setBusinessFail(2014, "error");
        B.addRespToQuque(paramToServiceMsg, (FromServiceMsg)???);
        return paramToServiceMsg.getRequestSsoSeq();
      }
      localObject2 = (com.tencent.msf.service.protocol.e.d)y.a.get(paramToServiceMsg.getUin());
      ??? = localObject2;
      if (localObject2 != null)
      {
        ??? = localObject2;
        if (paramToServiceMsg.getServiceCmd().equals("wtlogin.login"))
        {
          R.remove(paramToServiceMsg.getUin());
          y.a.remove(paramToServiceMsg.getUin());
          ??? = null;
        }
      }
      if ((??? != null) && (!paramToServiceMsg.getServiceCmd().startsWith("login.")) && (!paramToServiceMsg.getServiceCmd().startsWith("wtlogin.login")) && (!paramToServiceMsg.getServiceCmd().equals("GrayUinPro.Check")))
      {
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.NetConnTag", 2, "error, " + paramToServiceMsg.getUin() + " not in gray list");
        }
        localObject2 = n.a(paramToServiceMsg);
        try
        {
          ((FromServiceMsg)localObject2).setBusinessFail(2008, new String(c, "UTF-8"));
          ((FromServiceMsg)localObject2).addAttribute(((FromServiceMsg)localObject2).getServiceCmd(), String.valueOf(b));
          B.addRespToQuque(paramToServiceMsg, (FromServiceMsg)localObject2);
          if (B.getAccountCenter().i(((FromServiceMsg)localObject2).getUin())) {
            B.getAccountCenter().m(((FromServiceMsg)localObject2).getUin());
          }
          return paramToServiceMsg.getRequestSsoSeq();
        }
        catch (Exception localException)
        {
          for (;;)
          {
            ((FromServiceMsg)localObject2).setBusinessFail(2008, paramToServiceMsg.getUin() + " not in gray list");
          }
        }
      }
      if ((B.standbyModeManager != null) && (B.standbyModeManager.b()))
      {
        if (!B.standbyModeManager.a(paramToServiceMsg.getServiceCmd()))
        {
          QLog.d("MSF.C.NetConnTag", 1, "refuse to send request cmd: " + paramToServiceMsg.getServiceCmd() + " ssoseq: " + paramToServiceMsg.getRequestSsoSeq() + " by standbyMode");
          B.getStandyModeManager().a(paramToServiceMsg);
          ??? = n.a(paramToServiceMsg);
          ((FromServiceMsg)???).setBusinessFail(2018, "standby mode force stop request");
          B.addRespToQuque(paramToServiceMsg, (FromServiceMsg)???);
          if (!a.b())
          {
            ??? = MsfMsgUtil.getConnOpenMsg("");
            MsfSdkUtils.addToMsgProcessName("", (ToServiceMsg)???);
            B.sendSsoMsg((ToServiceMsg)???);
          }
          return paramToServiceMsg.getRequestSsoSeq();
        }
        B.getStandyModeManager().b(paramToServiceMsg);
      }
      CodecWarpper.getFileStoreKey();
      ??? = B.getAccountCenter().k(paramToServiceMsg.getUin());
      if (??? != null) {
        paramToServiceMsg.setUin((String)???);
      }
      if ((!paramToServiceMsg.getUin().equals("0")) && (!ak.equals(paramToServiceMsg.getUin())))
      {
        ak = paramToServiceMsg.getUin();
        B.statReporter.a(ak);
        if (aj != paramToServiceMsg.getAppId()) {
          aj = paramToServiceMsg.getAppId();
        }
        if (paramToServiceMsg.getRequestSsoSeq() == -1) {
          paramToServiceMsg.setRequestSsoSeq(MsfCore.getNextSeq());
        }
        if (!paramToServiceMsg.getAttributes().containsKey("__timestamp_app2msf")) {
          paramToServiceMsg.addAttribute("__timestamp_app2msf", Long.valueOf(System.currentTimeMillis()));
        }
        paramToServiceMsg.addAttribute("__timestamp_addSendQueue", Long.valueOf(System.currentTimeMillis()));
        if ((!m) && (n))
        {
          l = SystemClock.elapsedRealtime();
          m = true;
        }
        if (((paramToServiceMsg.getServiceCmd().equals("StatSvc.register")) || (paramToServiceMsg.getServiceCmd().equals("StatSvc.get"))) && (paramToServiceMsg.getMsfCommand().equals(MsfCommand._msf_RegPush)) && (n))
        {
          l = SystemClock.elapsedRealtime();
          m = true;
          ??? = com.tencent.mobileqq.msf.core.a.a.d();
          if ((??? == null) || (ao.size() == ???.length)) {
            break label1702;
          }
          a((String[])???);
        }
        label1407:
        if ((!n) || (SystemClock.elapsedRealtime() - l >= j)) {
          break label2084;
        }
        if (ao.size() == 0) {
          a(null);
        }
        if ((!ao.contains(paramToServiceMsg.getServiceCmd())) && ((TextUtils.isEmpty(paramToServiceMsg.getServiceCmd())) || (!paramToServiceMsg.getServiceCmd().startsWith("wtlogin.")))) {
          break label1824;
        }
        if ((!paramToServiceMsg.getServiceCmd().equals("RegPrxySvc.infoLogin")) && (!paramToServiceMsg.getServiceCmd().equals("RegPrxySvc.infoSync"))) {
          break label1818;
        }
        ae.add(paramToServiceMsg);
        i1 = paramToServiceMsg.getWupBuffer().length;
      }
      for (;;)
      {
        synchronized (aq)
        {
          h = (i1 + h);
          if (!ap)
          {
            ag.post(e);
            ap = true;
          }
          if (QLog.isColorLevel())
          {
            QLog.d("MSF.C.NetConnTag", 2, "add " + paramToServiceMsg.getRequestSsoSeq() + " scmd: " + paramToServiceMsg.getServiceCmd() + " uin: " + paramToServiceMsg.getUin() + " len: " + paramToServiceMsg.getWupBuffer().length + " msg to SSO.LoginMerge delayWaitSendList");
            return paramToServiceMsg.getRequestSsoSeq();
            if ((!paramToServiceMsg.getUin().equals("0")) || (paramToServiceMsg.getAttributes().containsKey("__base_tag_isAppMsg")) || (paramToServiceMsg.getServiceCmd().equals("PhSigLcId.Check"))) {
              break;
            }
            paramToServiceMsg.setUin(e());
            break;
            label1702:
            if (??? != null) {
              break label1407;
            }
            a(null);
          }
        }
        QLog.d("MSF.C.NetConnTag", 1, "add " + paramToServiceMsg.getRequestSsoSeq() + " scmd: " + paramToServiceMsg.getServiceCmd().hashCode() + " uin: " + MsfSdkUtils.getShortUin(paramToServiceMsg.getUin()) + " len: " + paramToServiceMsg.getWupBuffer().length + " msg to " + "SSO.LoginMerge".hashCode() + " delayWaitSendList");
      }
      label1818:
      return g(paramToServiceMsg);
      label1824:
      I = SystemClock.elapsedRealtime();
      ae.add(paramToServiceMsg);
      i1 = paramToServiceMsg.getWupBuffer().length;
      for (;;)
      {
        synchronized (aq)
        {
          h = (i1 + h);
          if (!ap)
          {
            ag.postDelayed(e, i);
            ap = true;
          }
          if (QLog.isColorLevel())
          {
            QLog.d("MSF.C.NetConnTag", 2, "add " + paramToServiceMsg.getRequestSsoSeq() + " scmd: " + paramToServiceMsg.getServiceCmd() + " uin: " + paramToServiceMsg.getUin() + " len: " + paramToServiceMsg.getWupBuffer().length + " msg to SSO.LoginMerge delayWaitSendList");
            return paramToServiceMsg.getRequestSsoSeq();
          }
        }
        QLog.d("MSF.C.NetConnTag", 1, "add " + paramToServiceMsg.getRequestSsoSeq() + " scmd: " + paramToServiceMsg.getServiceCmd().hashCode() + " uin: " + MsfSdkUtils.getShortUin(paramToServiceMsg.getUin()) + " len: " + paramToServiceMsg.getWupBuffer().length + " msg to " + "SSO.LoginMerge".hashCode() + " delayWaitSendList");
      }
      label2084:
      return g(paramToServiceMsg);
      i1 = 0;
      continue;
      label2095:
      i1 = 1;
      ??? = localObject2;
    }
  }
  
  public void b(int paramInt)
  {
    try
    {
      if ((a.b()) && (a.o() != null) && (a.o().g != null) && (a.o().g.hashCode() == paramInt)) {
        b(true);
      }
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
    }
  }
  
  public void b(FromServiceMsg paramFromServiceMsg)
  {
    if ((af == null) || (!af.getAttributes().containsKey("_attr_regprxy_socket_hashcode")) || (!af.getAttributes().containsKey("_attr_regprxy_random_code")))
    {
      QLog.d("MSF.C.NetConnTag", 1, "not tag regprxysvc resp seq:" + paramFromServiceMsg.getRequestSsoSeq() + " by infoLogin error");
      return;
    }
    if ((!a.b()) || (a.o().g == null))
    {
      QLog.d("MSF.C.NetConnTag", 1, "not tag regprxysvc resp seq:" + paramFromServiceMsg.getRequestSsoSeq() + " by disconn");
      return;
    }
    if (a.o().g.hashCode() == ((Integer)af.getAttributes().get("_attr_regprxy_socket_hashcode")).intValue())
    {
      paramFromServiceMsg.getAttributes().put("_attr_regprxy_random_code", af.getAttributes().get("_attr_regprxy_random_code"));
      return;
    }
    QLog.d("MSF.C.NetConnTag", 1, "not tag regprxysvc resp seq:" + paramFromServiceMsg.getRequestSsoSeq() + " by socket changed");
  }
  
  public byte[] b()
  {
    return as;
  }
  
  public ToServiceMsg c(int paramInt)
  {
    ToServiceMsg localToServiceMsg = (ToServiceMsg)c.remove(Integer.valueOf(paramInt));
    if (localToServiceMsg != null)
    {
      Runnable localRunnable = (Runnable)localToServiceMsg.getAttributes().remove("to_timeoutCallbacker");
      B.msfAlarmer.b().removeCallbacks(localRunnable);
    }
    return localToServiceMsg;
  }
  
  public void c()
  {
    if (ak != "0") {
      B.getAccountCenter().a(false);
    }
  }
  
  public void c(ToServiceMsg paramToServiceMsg)
  {
    c.put(Integer.valueOf(paramToServiceMsg.getRequestSsoSeq()), paramToServiceMsg);
    paramToServiceMsg.getAttributes().put("__extraTimeoutSeq", Integer.valueOf(ah.incrementAndGet()));
    if (paramToServiceMsg.getTimeout() == -1L) {
      paramToServiceMsg.setTimeout(30000L);
    }
    for (Runnable localRunnable = B.msfAlarmer.a(paramToServiceMsg, paramToServiceMsg.getTimeout());; localRunnable = B.msfAlarmer.a(paramToServiceMsg, paramToServiceMsg.getTimeout()))
    {
      paramToServiceMsg.addAttribute("to_timeoutCallbacker", localRunnable);
      return;
    }
  }
  
  public void c(byte[] paramArrayOfByte)
  {
    A.onReceData(paramArrayOfByte);
  }
  
  public void d(ToServiceMsg paramToServiceMsg)
  {
    if (paramToServiceMsg != null)
    {
      paramToServiceMsg = (Runnable)paramToServiceMsg.getAttributes().remove("to_timeoutCallbacker");
      if (paramToServiceMsg != null) {
        B.msfAlarmer.b().removeCallbacks(paramToServiceMsg);
      }
    }
  }
  
  public String e()
  {
    return ak;
  }
  
  public byte[] e(ToServiceMsg paramToServiceMsg)
  {
    Object localObject1 = null;
    if (paramToServiceMsg != null) {}
    for (;;)
    {
      int i1;
      try
      {
        Object localObject2 = paramToServiceMsg.getServiceCmd();
        i1 = ((String)localObject2).indexOf("#");
        localObject1 = localObject2;
        if (i1 != -1) {
          localObject1 = ((String)localObject2).substring(0, i1);
        }
        if (paramToServiceMsg.getWupBuffer() != null)
        {
          b1 = 0;
          if (NetConnInfoCenterImpl.isWifiConn())
          {
            b1 = 1;
            localObject2 = f(paramToServiceMsg);
            d();
            if (591 == CodecWarpper.getSharedObjectVersion()) {
              return CodecWarpper.encodeRequest(paramToServiceMsg.getRequestSsoSeq(), n.d(), n.f(), n.g(), "", (String)localObject1, b(), paramToServiceMsg.getAppId(), B.getMsfAppid(), paramToServiceMsg.getUin(), (byte)0, b1, paramToServiceMsg.getWupBuffer(), false);
            }
          }
          else
          {
            if (!NetConnInfoCenterImpl.isMobileConn()) {
              continue;
            }
            int i2 = NetConnInfoCenterImpl.getMobileNetworkType() + 100;
            i1 = i2;
            if (i2 <= 254) {
              break label271;
            }
            i2 = 254;
            i1 = i2;
            if (!QLog.isColorLevel()) {
              break label271;
            }
            QLog.d("MSF.C.NetConnTag", 2, "error,netWorkType is " + 254);
            i1 = i2;
            break label271;
          }
          return CodecWarpper.encodeRequest(paramToServiceMsg.getRequestSsoSeq(), n.d(), n.f(), n.g(), "", (String)localObject1, b(), paramToServiceMsg.getAppId(), B.getMsfAppid(), paramToServiceMsg.getUin(), (byte)0, b1, (byte[])localObject2, paramToServiceMsg.getWupBuffer(), false);
        }
        return new byte[0];
      }
      catch (Throwable paramToServiceMsg)
      {
        paramToServiceMsg.printStackTrace();
        QLog.d("MSF.C.NetConnTag", 1, "encode packet failed", paramToServiceMsg);
        localObject1 = new byte[0];
      }
      return localObject1;
      label271:
      byte b1 = (byte)i1;
    }
  }
  
  public int f()
  {
    return aj;
  }
  
  public void g()
  {
    try
    {
      if (ab)
      {
        Iterator localIterator = aa.iterator();
        while (localIterator.hasNext())
        {
          HashMap localHashMap = (HashMap)localIterator.next();
          try
          {
            B.configManager.a(localHashMap, "");
          }
          catch (Exception localException2)
          {
            localException2.printStackTrace();
          }
        }
      }
      return;
    }
    catch (Exception localException1)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.NetConnTag", 2, "report waitReportData error " + localException1);
      }
    }
    if (QLog.isColorLevel()) {
      QLog.d("MSF.C.NetConnTag", 2, "report waitReportData succ " + aa.size());
    }
    aa.clear();
    ab = false;
  }
  
  public void h()
  {
    Iterator localIterator = c.entrySet().iterator();
    label217:
    for (;;)
    {
      Object localObject1;
      int i1;
      if (localIterator.hasNext())
      {
        localObject1 = (Map.Entry)localIterator.next();
        if (localObject1 == null) {
          continue;
        }
        localObject1 = (ToServiceMsg)((Map.Entry)localObject1).getValue();
        if ((localObject1 == null) || (ad.contains(localObject1))) {
          continue;
        }
        if (((ToServiceMsg)localObject1).isFastResendEnabled()) {
          i1 = 1;
        }
      }
      for (;;)
      {
        if (i1 == 0) {
          break label217;
        }
        Object localObject2 = MsfSdkUtils.constructResponse((ToServiceMsg)localObject1, 2901, "", null);
        ((FromServiceMsg)localObject2).setBusinessFail(2901);
        if ((localObject1 != null) && (B.quicksender != null) && (B.quicksender.b((ToServiceMsg)localObject1))) {
          B.quicksender.a((ToServiceMsg)localObject1, (FromServiceMsg)localObject2);
        }
        B.addRespToQuque((ToServiceMsg)localObject1, (FromServiceMsg)localObject2);
        localIterator.remove();
        break;
        localObject2 = BaseConstants.CMD_NeedResendCmds;
        int i2 = localObject2.length;
        i1 = 0;
        for (;;)
        {
          if (i1 < i2)
          {
            Object localObject3 = localObject2[i1];
            if (((ToServiceMsg)localObject1).getServiceCmd().equals(localObject3))
            {
              i1 = 1;
              break;
            }
            i1 += 1;
            continue;
            return;
          }
        }
        i1 = 0;
      }
    }
  }
  
  public void k()
  {
    if ((a != null) && (a.o() != null)) {
      a.o().d();
    }
  }
  
  public void l()
  {
    if (-1L == s) {}
    long l1;
    do
    {
      return;
      l1 = System.currentTimeMillis();
    } while (l1 - s <= com.tencent.mobileqq.msf.core.a.a.aS());
    try
    {
      new e().run();
      s = l1;
      return;
    }
    catch (Exception localException)
    {
      QLog.d("MSF.C.NetConnTag", 1, "failed to report connect wifi info " + localException.toString());
    }
  }
  
  class a
    extends CodecWarpper
  {
    a() {}
    
    private com.tencent.qphone.base.a a(int paramInt)
    {
      switch (paramInt)
      {
      default: 
        return com.tencent.qphone.base.a.u;
      case -2: 
        return com.tencent.qphone.base.a.v;
      case -3: 
        return com.tencent.qphone.base.a.w;
      case -4: 
        return com.tencent.qphone.base.a.x;
      case -5: 
        return com.tencent.qphone.base.a.j;
      case -6: 
        return com.tencent.qphone.base.a.r;
      case -7: 
        return com.tencent.qphone.base.a.s;
      }
      return com.tencent.qphone.base.a.y;
    }
    
    private void a(FromServiceMsg paramFromServiceMsg, int paramInt)
    {
      paramFromServiceMsg.addAttribute("__timestamp_net2msf", Long.valueOf(System.currentTimeMillis()));
      paramFromServiceMsg.addAttribute("__timestamp_net2msf_boot", Long.valueOf(SystemClock.elapsedRealtime()));
      Object localObject1 = paramFromServiceMsg.getMsgCookie();
      if ((localObject1 != null) && (localObject1.length > 0)) {
        B.sender.a((byte[])localObject1);
      }
      paramFromServiceMsg.setRequestSsoSeq(paramFromServiceMsg.getAppSeq());
      ToServiceMsg localToServiceMsg;
      label132:
      int i;
      Object localObject2;
      label224:
      long l2;
      if ((!paramFromServiceMsg.isSuccess()) && (paramFromServiceMsg.getBusinessFailCode() == 55528))
      {
        w.a(paramFromServiceMsg.getUin(), false);
        if (NetConnInfoCenterImpl.isNeedWifiAuth()) {
          NetConnInfoCenterImpl.setNeedWifiAuth(false);
        }
        localToServiceMsg = B.sender.c(paramFromServiceMsg.getRequestSsoSeq());
        if (localToServiceMsg == null) {
          break label1030;
        }
        localObject1 = localToServiceMsg.getServiceCmd();
        i = ((String)localObject1).indexOf("#");
        if (i == -1) {
          break label1039;
        }
        localObject2 = ((String)localObject1).substring(i + 1, ((String)localObject1).length()) + "_new";
        ((String)localObject1).substring(0, i);
        i.a(true, paramFromServiceMsg.getUin(), paramInt, (String)localObject2, 1, a.o().l, a.o().m);
        if ((localToServiceMsg == null) || (localToServiceMsg.getAttribute("__timestamp_msf2net") == null) || (paramFromServiceMsg == null) || (paramFromServiceMsg.getAttribute("__timestamp_net2msf") == null)) {
          break label1648;
        }
        l2 = ((Long)paramFromServiceMsg.getAttribute("__timestamp_net2msf")).longValue() - ((Long)localToServiceMsg.getAttribute("__timestamp_msf2net")).longValue();
        long l1 = l2;
        if (l2 < 0L) {
          l1 = 0L;
        }
        l2 = l1;
        if (l1 > 2147483647L) {
          l2 = 0L;
        }
        paramFromServiceMsg.addAttribute("__timestamp_msf2net", localToServiceMsg.getAttribute("__timestamp_msf2net"));
        paramFromServiceMsg.addAttribute("Signal_Strengths", NetConnInfoCenter.getSignalStrengthsLog());
      }
      for (;;)
      {
        localObject2 = new StringBuilder();
        if (QLog.isDevelopLevel()) {
          if (l2 == 0L)
          {
            localObject1 = String.valueOf(l2);
            label366:
            if (paramFromServiceMsg.getResultCode() == 1000) {
              break label1106;
            }
            QLog.d("MSF.C.NetConnTag", 1, "netRecv ssoSeq:" + paramFromServiceMsg.getRequestSsoSeq() + " uin:" + MsfSdkUtils.getShortUin(paramFromServiceMsg.getUin()) + " cmd:" + paramFromServiceMsg.getServiceCmd() + " len:" + paramInt + " costTime:" + (String)localObject1 + " code:" + paramFromServiceMsg.getResultCode() + " failMsg:" + paramFromServiceMsg.getBusinessFailMsg());
            label469:
            paramFromServiceMsg.addAttribute("_tag_LOGSTR", w.C + "|" + paramFromServiceMsg.getRequestSsoSeq() + "|" + paramFromServiceMsg.getServiceCmd() + "|");
            paramFromServiceMsg.addAttribute("_tag_socket", w.C);
            paramFromServiceMsg.addAttribute("_tag_localsocket", w.D);
            if (localToServiceMsg == null) {}
          }
        }
        try
        {
          a.a(paramFromServiceMsg, localToServiceMsg);
          if ((B.isReconnectSso.get()) && (B.sender.a()))
          {
            a.o().a(com.tencent.qphone.base.a.h);
            B.isReconnectSso.set(false);
          }
          if (localToServiceMsg != null)
          {
            paramFromServiceMsg.setAppSeq(localToServiceMsg.getAppSeq());
            paramFromServiceMsg.setMsfCommand(localToServiceMsg.getMsfCommand());
            paramFromServiceMsg.setAppId(localToServiceMsg.getAppId());
            if (!paramFromServiceMsg.isSuccess())
            {
              i = paramFromServiceMsg.getBusinessFailCode();
              paramInt = i;
              if (i == 302)
              {
                paramFromServiceMsg.setBusinessFail(65234);
                paramInt = 65234;
              }
              if (paramInt == 65234)
              {
                a.o().a(com.tencent.qphone.base.a.i);
                B.reSendMsg(localToServiceMsg);
                return;
                if ((paramFromServiceMsg.getUin() == null) || (paramFromServiceMsg.getUin().length() <= 4) || (w.Z.contains(paramFromServiceMsg.getUin())) || (!paramFromServiceMsg.isSuccess()) || (paramFromServiceMsg.getServiceCmd().startsWith("login.")) || (paramFromServiceMsg.getServiceCmd().startsWith("wtlogin.")) || (paramFromServiceMsg.getServiceCmd().equals("ConfigService.ClientReq")) || (paramFromServiceMsg.getServiceCmd().equals("GrayUinPro.Check")) || (paramFromServiceMsg.getServiceCmd().equals("account.RequestReBindMblWTLogin_emp")) || (paramFromServiceMsg.getServiceCmd().equals("account.RequestVerifyWTLogin_emp")) || (paramFromServiceMsg.getServiceCmd().equals("ConnAuthSvr.get_app_info_emp")) || (paramFromServiceMsg.getServiceCmd().equals("ConnAuthSvr.sdk_auth_api_emp")) || (paramFromServiceMsg.getServiceCmd().equals("ConnAuthSvr.get_auth_api_list_emp"))) {
                  break;
                }
                localObject1 = (ConcurrentLinkedQueue)w.q.get(paramFromServiceMsg.getUin());
                if ((localObject1 != null) && (((ConcurrentLinkedQueue)localObject1).contains(Integer.valueOf(paramFromServiceMsg.getRequestSsoSeq()))))
                {
                  w.q.remove(paramFromServiceMsg.getUin());
                  w.a(paramFromServiceMsg.getUin(), true);
                  QLog.d(tag, 1, "recv Packet removeItem setV9, ssoSeq:" + paramFromServiceMsg.getRequestSsoSeq() + ", uin:" + MsfSdkUtils.getShortUin(paramFromServiceMsg.getUin()));
                  break;
                }
                QLog.d(tag, 1, "recv Packet ssoSeq:" + paramFromServiceMsg.getRequestSsoSeq() + ", uin:" + MsfSdkUtils.getShortUin(paramFromServiceMsg.getUin()));
                break;
                label1030:
                localObject1 = paramFromServiceMsg.getServiceCmd();
                break label132;
                label1039:
                i.a(true, paramFromServiceMsg.getUin(), paramInt, (String)localObject1, 1, a.o().l, a.o().m);
                break label224;
                localObject1 = l2 + NetConnInfoCenter.getSignalStrengthsLog();
                break label366;
                label1106:
                QLog.d("MSF.C.NetConnTag", 1, "netRecv ssoSeq:" + paramFromServiceMsg.getRequestSsoSeq() + " uin:" + MsfSdkUtils.getShortUin(paramFromServiceMsg.getUin()) + " cmd:" + paramFromServiceMsg.getServiceCmd() + " len:" + paramInt + " costTime:" + (String)localObject1);
                break label469;
                if (paramFromServiceMsg.getResultCode() != 1000)
                {
                  QLog.d("MSF.C.NetConnTag", 1, "netRecv ssoSeq:" + paramFromServiceMsg.getRequestSsoSeq() + " uin:" + MsfSdkUtils.getShortUin(paramFromServiceMsg.getUin()) + " cmd:" + paramFromServiceMsg.getServiceCmd().hashCode() + new StringBuilder().append(" ").append(paramFromServiceMsg.getRequestSsoSeq() + paramInt).toString() + " code:" + paramFromServiceMsg.getResultCode() + " failMsg:" + paramFromServiceMsg.getBusinessFailMsg());
                  break label469;
                }
                QLog.d("MSF.C.NetConnTag", 1, "netRecv ssoSeq:" + paramFromServiceMsg.getRequestSsoSeq() + " uin:" + MsfSdkUtils.getShortUin(paramFromServiceMsg.getUin()) + " cmd:" + paramFromServiceMsg.getServiceCmd().hashCode() + new StringBuilder().append(" ").append(paramFromServiceMsg.getRequestSsoSeq() + paramInt).toString());
              }
            }
          }
        }
        catch (Exception localException)
        {
          for (;;)
          {
            a.d();
            QLog.d(tag, 1, "call firstResponseGetted error " + localException, localException);
          }
          if (paramInt == 55528)
          {
            if (!MsfMsgUtil.hasResendBy10008(localToServiceMsg))
            {
              localToServiceMsg.getAttributes().put("_attr_msg_has_resend_by_10008", Boolean.valueOf(true));
              B.reSendMsg(localToServiceMsg);
              return;
            }
            QLog.d(tag, 1, "This msg has already resend by -10008, won't resend again!");
          }
        }
        if (w.o().get()) {
          QLog.e(tag, 1, "invalidSign, " + paramFromServiceMsg + " is droped.");
        }
        for (;;)
        {
          B.getAccountCenter().g.a();
          paramFromServiceMsg = B.netConnICenter;
          NetConnInfoCenter.impl.checkRecordTime();
          g();
          l();
          return;
          if (paramFromServiceMsg.getMsfCommand() == MsfCommand._msf_HeartbeatAlive)
          {
            a(paramFromServiceMsg, localToServiceMsg);
          }
          else if (paramFromServiceMsg.getMsfCommand() == MsfCommand._msf_QuickHeartBeat)
          {
            B.quicksender.a(localToServiceMsg, paramFromServiceMsg, false);
          }
          else
          {
            w.z.set(0);
            B.getSsoRespHandler().c(localToServiceMsg, paramFromServiceMsg);
          }
        }
        label1648:
        l2 = 0L;
      }
    }
    
    public void a(int paramInt1, int paramInt2, int paramInt3)
    {
      QLog.d(tag, 1, "MSF.C.CodecWarpper loginMerge onInvalidData " + paramInt1 + " size is " + paramInt2 + ", try to closeConn");
      a.o().a(a(paramInt1));
      StringBuffer localStringBuffer = new StringBuffer();
      localStringBuffer.append(w.e(w.this)).append("|").append(MsfCore.mobileQQAppid).append("|").append(paramInt3).append("|").append(paramInt1).append("|").append(a.o().l + ":" + a.o().m);
      if (QLog.isDevelopLevel()) {
        QLog.d(tag, 4, "CodecStatHelper Report loginMerge_error " + localStringBuffer.toString());
      }
      HashMap localHashMap = new HashMap();
      localHashMap.put("loginMerge_failDetail", localStringBuffer.toString());
      MsfService.getCore().getStatReporter().a("loginMerge_error", true, 0L, 0L, localHashMap, false, false);
    }
    
    public void onInvalidData(int paramInt1, int paramInt2)
    {
      QLog.d(tag, 1, "MSF.C.CodecWarpper onInvalidData " + paramInt1 + " size is " + paramInt2 + ", try to closeConn");
      a.o().a(a(paramInt1));
      try
      {
        a.f();
        return;
      }
      catch (Exception localException)
      {
        QLog.d(tag, 1, "call findResponseDataError error " + localException);
      }
    }
    
    public void onInvalidSign()
    {
      QLog.d(tag, 1, "MSF.C.CodecWarpper onInvalidSign");
      FromServiceMsg localFromServiceMsg = new FromServiceMsg(B.getMsfAppid(), MsfCore.getNextSeq(), "0", "cmd_InvalidSign");
      localFromServiceMsg.setBusinessFail(2014, "onInvalidSign");
      localFromServiceMsg.setMsfCommand(MsfCommand.onInvalidSign);
      MsfSdkUtils.addFromMsgProcessName("*", localFromServiceMsg);
      B.addRespToQuque(null, localFromServiceMsg);
      w.o().set(true);
    }
    
    public void onResponse(int paramInt1, Object paramObject, int paramInt2)
    {
      Object localObject4 = null;
      if (paramObject != null) {}
      try
      {
        if (w.P != -1) {
          w.P = -1;
        }
        N = System.currentTimeMillis();
        w.O = N;
        localObject1 = (FromServiceMsg)paramObject;
        try
        {
          paramInt1 = ((FromServiceMsg)localObject1).getWupBuffer().length;
          if (!((FromServiceMsg)localObject1).getServiceCmd().equals("SSO.LoginMerge")) {
            break label386;
          }
          ((FromServiceMsg)localObject1).setRequestSsoSeq(((FromServiceMsg)localObject1).getAppSeq());
          if (((FromServiceMsg)localObject1).isSuccess()) {
            break label386;
          }
          QLog.d("MSF.C.NetConnTag", 1, "failed merge netRecv ssoSeq:" + ((FromServiceMsg)localObject1).getRequestSsoSeq() + " scmd: " + ((FromServiceMsg)localObject1).getServiceCmd() + " len: " + ((FromServiceMsg)localObject1).getWupBuffer().length);
          Object localObject2 = (ArrayList)d.remove(Integer.valueOf(((FromServiceMsg)localObject1).getRequestSsoSeq()));
          if (((FromServiceMsg)localObject1).getBusinessFailCode() == 55429)
          {
            if (n) {
              n = false;
            }
            QLog.d("MSF.C.NetConnTag", 1, "merge not support, " + Arrays.toString(((ArrayList)localObject2).toArray()) + "resend, close merge.");
          }
          if (localObject2 == null) {
            break label386;
          }
          localObject2 = ((ArrayList)localObject2).iterator();
          while (((Iterator)localObject2).hasNext())
          {
            paramInt1 = ((Integer)((Iterator)localObject2).next()).intValue();
            localObject4 = B.sender.c(paramInt1);
            if (localObject4 != null) {
              w.a(w.this, (ToServiceMsg)localObject4);
            }
          }
          if (!localThrowable1.toString().contains("InvalidProtocol")) {
            break label336;
          }
        }
        catch (Throwable localThrowable1) {}
      }
      catch (Throwable localThrowable2)
      {
        for (;;)
        {
          label336:
          Object localObject3;
          Object localObject1 = localException;
        }
      }
      if (localObject1 != null) {
        a(-8, paramInt2, ((FromServiceMsg)localObject1).getRequestSsoSeq());
      }
      if (QLog.isColorLevel()) {
        QLog.d(tag, 2, "handleSsoResp " + paramObject + " error " + localThrowable1.toString(), localThrowable1);
      }
      for (;;)
      {
        return;
        label386:
        int i;
        if ((((FromServiceMsg)localObject1).getFlag() & 0x1) != 0)
        {
          localObject3 = ((FromServiceMsg)localObject1).getWupBuffer();
          i = localObject3.length;
          if (i > 4) {
            i = (localObject3[0] & 0xFF) << 24 | 0x0 | (localObject3[1] & 0xFF) << 16 | (localObject3[2] & 0xFF) << 8 | localObject3[3] & 0xFF;
          }
        }
        else
        {
          try
          {
            localObject4 = new byte[i];
            System.arraycopy(localObject3, 4, localObject4, 0, i - 4);
            localObject4 = com.tencent.qphone.base.util.h.b((byte[])localObject4);
            Object localObject5 = new byte[localObject4.length + 4];
            localObject5[0] = ((byte)(localObject4.length + 4 >> 24 & 0xFF));
            localObject5[1] = ((byte)(localObject4.length + 4 >> 16 & 0xFF));
            localObject5[2] = ((byte)(localObject4.length + 4 >> 8 & 0xFF));
            localObject5[3] = ((byte)(localObject4.length + 4 & 0xFF));
            System.arraycopy(localObject4, 0, localObject5, 4, localObject4.length);
            ((FromServiceMsg)localObject1).putWupBuffer((byte[])localObject5);
            if ((!((FromServiceMsg)localObject1).isSuccess()) || (!((FromServiceMsg)localObject1).getServiceCmd().equals("SSO.LoginMerge"))) {
              break label971;
            }
            QLog.d("MSF.C.NetConnTag", 1, "netRecv Delay FromServiceMsg ssoSeq:" + ((FromServiceMsg)localObject1).getRequestSsoSeq() + " scmd: " + ((FromServiceMsg)localObject1).getServiceCmd() + " len: " + paramInt1 + " uncompressed len: " + ((FromServiceMsg)localObject1).getWupBuffer().length);
            localObject3 = new SSOLoginMerge.BusiBuffData();
            localObject4 = new byte[((FromServiceMsg)localObject1).getWupBuffer().length - 4];
            System.arraycopy(((FromServiceMsg)localObject1).getWupBuffer(), 4, localObject4, 0, localObject4.length);
            localObject3 = mergeFromBusiBuffVec.get().iterator();
            while (((Iterator)localObject3).hasNext())
            {
              localObject4 = (SSOLoginMerge.BusiBuffItem)((Iterator)localObject3).next();
              localObject5 = new FromServiceMsg();
              ((FromServiceMsg)localObject5).setServiceCmd(ServiceCmd.get());
              ((FromServiceMsg)localObject5).setRequestSsoSeq(SeqNo.get());
              ((FromServiceMsg)localObject5).putWupBuffer(BusiBuff.get().toByteArray());
              ((FromServiceMsg)localObject5).setAppSeq(((FromServiceMsg)localObject5).getRequestSsoSeq());
              ((FromServiceMsg)localObject5).setMsgSuccess();
              ((FromServiceMsg)localObject5).setUin(((FromServiceMsg)localObject1).getUin());
              ((FromServiceMsg)localObject5).putWupBuffer(w.b(((FromServiceMsg)localObject5).getWupBuffer()));
              a((FromServiceMsg)localObject5, ((FromServiceMsg)localObject5).getWupBuffer().length);
            }
            if (((FromServiceMsg)localObject1).getServiceCmd().equals("SSO.LoginMerge")) {
              break label956;
            }
          }
          catch (Exception localException)
          {
            if (QLog.isColorLevel()) {
              QLog.d(tag, 2, "uncompress data failed " + localException);
            }
            if (!((FromServiceMsg)localObject1).getServiceCmd().equals("SSO.LoginMerge"))
            {
              onInvalidData(-7, localObject3.length);
              return;
            }
            a(-7, localObject3.length, ((FromServiceMsg)localObject1).getRequestSsoSeq());
            return;
          }
        }
      }
      onInvalidData(-6, localObject3.length);
      return;
      label956:
      a(-6, localObject3.length, ((FromServiceMsg)localObject1).getRequestSsoSeq());
      return;
      label971:
      a((FromServiceMsg)localObject1, paramInt2);
    }
    
    public void onResponse(int paramInt1, Object paramObject, int paramInt2, byte[] paramArrayOfByte)
    {
      FromServiceMsg localFromServiceMsg2 = null;
      Object localObject1;
      if (paramObject != null)
      {
        localFromServiceMsg1 = localFromServiceMsg2;
        try
        {
          if (w.P != -1)
          {
            localFromServiceMsg1 = localFromServiceMsg2;
            w.P = -1;
          }
          localFromServiceMsg1 = localFromServiceMsg2;
          N = System.currentTimeMillis();
          localFromServiceMsg1 = localFromServiceMsg2;
          w.O = N;
          localFromServiceMsg1 = localFromServiceMsg2;
          localFromServiceMsg2 = (FromServiceMsg)paramObject;
          localFromServiceMsg1 = localFromServiceMsg2;
          paramInt1 = localFromServiceMsg2.getWupBuffer().length;
          localFromServiceMsg1 = localFromServiceMsg2;
          if (localFromServiceMsg2.getServiceCmd().equals("SSO.LoginMerge"))
          {
            localFromServiceMsg1 = localFromServiceMsg2;
            localFromServiceMsg2.setRequestSsoSeq(localFromServiceMsg2.getAppSeq());
            localFromServiceMsg1 = localFromServiceMsg2;
            if (!localFromServiceMsg2.isSuccess())
            {
              localFromServiceMsg1 = localFromServiceMsg2;
              QLog.d("MSF.C.NetConnTag", 1, "failed merge netRecv ssoSeq:" + localFromServiceMsg2.getRequestSsoSeq() + " scmd: " + localFromServiceMsg2.getServiceCmd() + " len: " + localFromServiceMsg2.getWupBuffer().length);
              localFromServiceMsg1 = localFromServiceMsg2;
              localObject1 = (ArrayList)d.remove(Integer.valueOf(localFromServiceMsg2.getRequestSsoSeq()));
              localFromServiceMsg1 = localFromServiceMsg2;
              if (localFromServiceMsg2.getBusinessFailCode() == 55429)
              {
                localFromServiceMsg1 = localFromServiceMsg2;
                if (n)
                {
                  localFromServiceMsg1 = localFromServiceMsg2;
                  n = false;
                }
                localFromServiceMsg1 = localFromServiceMsg2;
                QLog.d("MSF.C.NetConnTag", 1, "merge not support, " + Arrays.toString(((ArrayList)localObject1).toArray()) + "resend, close merge.");
              }
              if (localObject1 != null)
              {
                localFromServiceMsg1 = localFromServiceMsg2;
                paramArrayOfByte = ((ArrayList)localObject1).iterator();
                for (;;)
                {
                  localFromServiceMsg1 = localFromServiceMsg2;
                  if (!paramArrayOfByte.hasNext()) {
                    break;
                  }
                  localFromServiceMsg1 = localFromServiceMsg2;
                  paramInt1 = ((Integer)paramArrayOfByte.next()).intValue();
                  localFromServiceMsg1 = localFromServiceMsg2;
                  localObject1 = B.sender.c(paramInt1);
                  if (localObject1 != null)
                  {
                    localFromServiceMsg1 = localFromServiceMsg2;
                    w.a(w.this, (ToServiceMsg)localObject1);
                  }
                }
                return;
              }
            }
          }
        }
        catch (Throwable paramArrayOfByte)
        {
          if ((paramArrayOfByte.toString().contains("InvalidProtocol")) && (localFromServiceMsg1 != null)) {
            a(-8, paramInt2, localFromServiceMsg1.getRequestSsoSeq());
          }
          if (QLog.isColorLevel()) {
            QLog.d(tag, 2, "handleSsoResp " + paramObject + " error " + paramArrayOfByte.toString(), paramArrayOfByte);
          }
        }
      }
      FromServiceMsg localFromServiceMsg1 = localFromServiceMsg2;
      int i;
      if ((localFromServiceMsg2.getFlag() & 0x1) != 0)
      {
        localFromServiceMsg1 = localFromServiceMsg2;
        localObject1 = localFromServiceMsg2.getWupBuffer();
        localFromServiceMsg1 = localFromServiceMsg2;
        i = localObject1.length;
        if (i <= 4) {
          break label1353;
        }
        i = 0x0 | (localObject1[0] & 0xFF) << 24 | (localObject1[1] & 0xFF) << 16 | (localObject1[2] & 0xFF) << 8 | localObject1[3] & 0xFF;
        localFromServiceMsg1 = localFromServiceMsg2;
      }
      for (;;)
      {
        try
        {
          localObject2 = new byte[i];
          localFromServiceMsg1 = localFromServiceMsg2;
          System.arraycopy(localObject1, 4, localObject2, 0, i - 4);
          localFromServiceMsg1 = localFromServiceMsg2;
          localObject2 = com.tencent.qphone.base.util.h.b((byte[])localObject2);
          localFromServiceMsg1 = localFromServiceMsg2;
          byte[] arrayOfByte = new byte[localObject2.length + 4];
          localFromServiceMsg1 = localFromServiceMsg2;
          arrayOfByte[0] = ((byte)(localObject2.length + 4 >> 24 & 0xFF));
          localFromServiceMsg1 = localFromServiceMsg2;
          arrayOfByte[1] = ((byte)(localObject2.length + 4 >> 16 & 0xFF));
          localFromServiceMsg1 = localFromServiceMsg2;
          arrayOfByte[2] = ((byte)(localObject2.length + 4 >> 8 & 0xFF));
          localFromServiceMsg1 = localFromServiceMsg2;
          arrayOfByte[3] = ((byte)(localObject2.length + 4 & 0xFF));
          localFromServiceMsg1 = localFromServiceMsg2;
          System.arraycopy(localObject2, 0, arrayOfByte, 4, localObject2.length);
          localFromServiceMsg1 = localFromServiceMsg2;
          localFromServiceMsg2.putWupBuffer(arrayOfByte);
          if (paramArrayOfByte != null) {
            localFromServiceMsg1 = localFromServiceMsg2;
          }
        }
        catch (Exception paramArrayOfByte)
        {
          Object localObject2;
          localFromServiceMsg1 = localFromServiceMsg2;
          if (QLog.isColorLevel())
          {
            localFromServiceMsg1 = localFromServiceMsg2;
            QLog.d(tag, 2, "uncompress data failed " + paramArrayOfByte);
          }
          localFromServiceMsg1 = localFromServiceMsg2;
          if (!localFromServiceMsg2.getServiceCmd().equals("SSO.LoginMerge"))
          {
            localFromServiceMsg1 = localFromServiceMsg2;
            onInvalidData(-7, localObject1.length);
            return;
          }
          localFromServiceMsg1 = localFromServiceMsg2;
          a(-7, localObject1.length, localFromServiceMsg2.getRequestSsoSeq());
          return;
        }
        try
        {
          if (localFromServiceMsg2.getServiceCmd().equals("MessageSvc.PushNotify"))
          {
            localFromServiceMsg1 = localFromServiceMsg2;
            long l = SystemClock.elapsedRealtime();
            localFromServiceMsg1 = localFromServiceMsg2;
            w.v = com.tencent.mobileqq.msf.core.b.m.a(false, l - 5000L, l);
            localFromServiceMsg1 = localFromServiceMsg2;
            localObject1 = new SSOReserveField.ReserveFields();
            localFromServiceMsg1 = localFromServiceMsg2;
            ((SSOReserveField.ReserveFields)localObject1).mergeFrom(paramArrayOfByte);
            localFromServiceMsg1 = localFromServiceMsg2;
            paramArrayOfByte = new StringBuilder();
            localFromServiceMsg1 = localFromServiceMsg2;
            paramArrayOfByte.append(sso_send.get()).append("|").append(System.currentTimeMillis());
            localFromServiceMsg1 = localFromServiceMsg2;
            localFromServiceMsg2.addAttribute("sso_push_timestamp", paramArrayOfByte.toString());
            localFromServiceMsg1 = localFromServiceMsg2;
            QLog.d(tag, 1, "pushnotify add timestamp " + paramArrayOfByte.toString());
            localFromServiceMsg1 = localFromServiceMsg2;
            B.statReporter.a("dim.Msf.PushRecvEvent", true, 0L, 0L, null, false, false);
          }
        }
        catch (Exception paramArrayOfByte)
        {
          localFromServiceMsg1 = localFromServiceMsg2;
          QLog.d(tag, 1, "resolve sso reserve field failed", paramArrayOfByte);
          continue;
          localFromServiceMsg1 = localFromServiceMsg2;
          a(localFromServiceMsg2, paramInt2);
        }
      }
      localFromServiceMsg1 = localFromServiceMsg2;
      if (localFromServiceMsg2.isSuccess())
      {
        localFromServiceMsg1 = localFromServiceMsg2;
        if (localFromServiceMsg2.getServiceCmd().equals("SSO.LoginMerge"))
        {
          localFromServiceMsg1 = localFromServiceMsg2;
          QLog.d("MSF.C.NetConnTag", 1, "netRecv Delay FromServiceMsg ssoSeq:" + localFromServiceMsg2.getRequestSsoSeq() + " scmd: " + localFromServiceMsg2.getServiceCmd() + " len: " + paramInt1 + " uncompressed len: " + localFromServiceMsg2.getWupBuffer().length);
          localFromServiceMsg1 = localFromServiceMsg2;
          paramArrayOfByte = new SSOLoginMerge.BusiBuffData();
          localFromServiceMsg1 = localFromServiceMsg2;
          localObject1 = new byte[localFromServiceMsg2.getWupBuffer().length - 4];
          localFromServiceMsg1 = localFromServiceMsg2;
          System.arraycopy(localFromServiceMsg2.getWupBuffer(), 4, localObject1, 0, localObject1.length);
          localFromServiceMsg1 = localFromServiceMsg2;
          paramArrayOfByte = mergeFromBusiBuffVec.get().iterator();
          for (;;)
          {
            localFromServiceMsg1 = localFromServiceMsg2;
            if (!paramArrayOfByte.hasNext()) {
              break;
            }
            localFromServiceMsg1 = localFromServiceMsg2;
            localObject1 = (SSOLoginMerge.BusiBuffItem)paramArrayOfByte.next();
            localFromServiceMsg1 = localFromServiceMsg2;
            localObject2 = new FromServiceMsg();
            localFromServiceMsg1 = localFromServiceMsg2;
            ((FromServiceMsg)localObject2).setServiceCmd(ServiceCmd.get());
            localFromServiceMsg1 = localFromServiceMsg2;
            ((FromServiceMsg)localObject2).setRequestSsoSeq(SeqNo.get());
            localFromServiceMsg1 = localFromServiceMsg2;
            ((FromServiceMsg)localObject2).putWupBuffer(BusiBuff.get().toByteArray());
            localFromServiceMsg1 = localFromServiceMsg2;
            ((FromServiceMsg)localObject2).setAppSeq(((FromServiceMsg)localObject2).getRequestSsoSeq());
            localFromServiceMsg1 = localFromServiceMsg2;
            ((FromServiceMsg)localObject2).setMsgSuccess();
            localFromServiceMsg1 = localFromServiceMsg2;
            ((FromServiceMsg)localObject2).setUin(localFromServiceMsg2.getUin());
            localFromServiceMsg1 = localFromServiceMsg2;
            ((FromServiceMsg)localObject2).putWupBuffer(w.b(((FromServiceMsg)localObject2).getWupBuffer()));
            localFromServiceMsg1 = localFromServiceMsg2;
            a((FromServiceMsg)localObject2, ((FromServiceMsg)localObject2).getWupBuffer().length);
          }
          label1353:
          localFromServiceMsg1 = localFromServiceMsg2;
          if (!localFromServiceMsg2.getServiceCmd().equals("SSO.LoginMerge"))
          {
            localFromServiceMsg1 = localFromServiceMsg2;
            onInvalidData(-6, localObject1.length);
            return;
          }
          localFromServiceMsg1 = localFromServiceMsg2;
          a(-6, localObject1.length, localFromServiceMsg2.getRequestSsoSeq());
          return;
        }
      }
    }
    
    public void onSSOPingResponse(byte[] paramArrayOfByte)
    {
      if (paramArrayOfByte == null)
      {
        QLog.d(tag, 1, "MSF.C.CodecWarpper onSSOPingResponse error, data null");
        return;
      }
      if (paramArrayOfByte.length <= 4)
      {
        QLog.d(tag, 1, "MSF.C.CodecWarpper onSSOPingResponse error, length: " + paramArrayOfByte.length);
        return;
      }
      int i = paramArrayOfByte.length;
      Object localObject2;
      try
      {
        localObject1 = ByteBuffer.wrap(paramArrayOfByte);
        ((ByteBuffer)localObject1).getInt();
        ((ByteBuffer)localObject1).getInt();
        ((ByteBuffer)localObject1).getInt();
        j = ((ByteBuffer)localObject1).get();
        localObject2 = new byte[j];
        ((ByteBuffer)localObject1).get((byte[])localObject2, 0, j);
        if ((!new String((byte[])localObject2).equals("MSF")) && (com.tencent.mobileqq.msf.core.a.a.aI()))
        {
          boolean bool = com.tencent.mobileqq.msf.core.net.a.b.b();
          if (bool) {
            try
            {
              com.tencent.mobileqq.msf.core.net.a.b.b(paramArrayOfByte);
              return;
            }
            catch (Exception paramArrayOfByte)
            {
              QLog.d(tag, 1, "heartbeatproxy failed to process back msg ", paramArrayOfByte);
              return;
            }
          }
        }
        ((ByteBuffer)localObject1).position(((ByteBuffer)localObject1).get() + ((ByteBuffer)localObject1).position());
      }
      catch (Exception paramArrayOfByte)
      {
        paramArrayOfByte.printStackTrace();
        QLog.d(tag, 1, "MSF.C.CodecWarpper onSSOPingResponse error, exception : ", paramArrayOfByte);
        return;
      }
      int j = ((ByteBuffer)localObject1).getInt();
      new StringBuilder().append(j >> 24 & 0xFF).append('.').append(j >> 16 & 0xFF).append('.').append(j >> 8 & 0xFF).append('.').append(j & 0xFF).toString();
      Object localObject1 = a.o().f();
      a.a(true);
      long l1;
      if ((localObject1 != null) && (((ToServiceMsg)localObject1).getAttribute("__timestamp_msf2net") != null))
      {
        long l2 = SystemClock.elapsedRealtime() - ((Long)((ToServiceMsg)localObject1).getAttribute("__timestamp_msf2net")).longValue();
        l1 = l2;
        if (l2 >= 0L) {
          break label630;
        }
        l1 = 0L;
      }
      for (;;)
      {
        localObject2 = new StringBuilder();
        if (QLog.isDevelopLevel()) {
          if (l1 == 0L)
          {
            paramArrayOfByte = String.valueOf(l1);
            label366:
            QLog.d("MSF.C.NetConnTag", 1, "netRecv ssoSeq:" + ((ToServiceMsg)localObject1).getRequestSsoSeq() + " uin:" + MsfSdkUtils.getShortUin(((ToServiceMsg)localObject1).getUin()) + " cmd:" + ((ToServiceMsg)localObject1).getServiceCmd() + " len:" + i + " costTime:" + paramArrayOfByte);
          }
        }
        for (;;)
        {
          if (0L == l1) {
            break label619;
          }
          try
          {
            if (!NetConnInfoCenterImpl.isWifiConn()) {
              break;
            }
            a(u.format(Long.valueOf(System.currentTimeMillis())), l1);
            return;
          }
          catch (Exception paramArrayOfByte)
          {
            QLog.d(tag, 1, "failed to store connect wifi info " + paramArrayOfByte.toString());
            return;
          }
          paramArrayOfByte = l1 + NetConnInfoCenter.getSignalStrengthsLog();
          break label366;
          QLog.d("MSF.C.NetConnTag", 1, "netRecv ssoSeq:" + ((ToServiceMsg)localObject1).getRequestSsoSeq() + " uin:" + MsfSdkUtils.getShortUin(((ToServiceMsg)localObject1).getUin()) + " cmd:" + ((ToServiceMsg)localObject1).getServiceCmd().hashCode() + new StringBuilder().append(" ").append(i + ((ToServiceMsg)localObject1).getRequestSsoSeq()).toString());
        }
        label619:
        break;
        label630:
        do
        {
          break;
          l1 = 0L;
          break;
        } while (l1 <= 2147483647L);
        l1 = 0L;
      }
    }
  }
  
  class b
    implements Runnable
  {
    b() {}
    
    public void run()
    {
      int j;
      synchronized (w.a(w.this))
      {
        j = w.b(w.this).size();
        i = j;
        if (j > f) {
          i = f;
        }
        long l = SystemClock.elapsedRealtime();
        if (I >= l)
        {
          w.c(w.this).postDelayed(e, w.this.i);
          if ((!w.d(w.this)) && (w.b(w.this).size() - g > 0))
          {
            w.c(w.this).postDelayed(e, w.this.i);
            w.a(w.this, true);
          }
          if (QLog.isDevelopLevel()) {
            QLog.d("MSF.C.NetConnTag", 4, "delayWaitSendList size is " + w.b(w.this).size() + ", " + i + " sso package should be merged.");
          }
          if (i <= 0) {
            break label1538;
          }
          j = i;
        }
        try
        {
          if (i > w.b(w.this).size()) {
            j = w.b(w.this).size();
          }
          if (j != 1) {
            break label348;
          }
          ??? = (ToServiceMsg)w.b(w.this).peek();
          if ((??? == null) || (((ToServiceMsg)???).getWupBuffer().length >= w.this.k)) {
            break label348;
          }
          w localW = w.this;
          h -= ((ToServiceMsg)???).getWupBuffer().length;
          w.a(w.this, (ToServiceMsg)w.b(w.this).poll());
          return;
        }
        catch (Exception localException)
        {
          for (;;)
          {
            synchronized (w.a(w.this))
            {
              if ((h >= g) && (!w.d(w.this)))
              {
                w.a(w.this, true);
                w.c(w.this).post(e);
                if (m > 0)
                {
                  d.put(Integer.valueOf(((ToServiceMsg)???).getRequestSsoSeq()), localArrayList);
                  w.f(w.this).put(Integer.valueOf(((ToServiceMsg)???).getRequestSsoSeq()), localObject6);
                  localObject5 = ((SSOLoginMerge.BusiBuffData)localObject5).toByteArray();
                  localObject6 = new ByteArrayOutputStream();
                  com.tencent.qphone.base.util.h.a((byte[])localObject5, (OutputStream)localObject6);
                  localObject6 = w.b(((ByteArrayOutputStream)localObject6).toByteArray());
                  ((ToServiceMsg)???).putWupBuffer((byte[])localObject6);
                  if (QLog.isDevelopLevel()) {
                    QLog.d("MSF.C.NetConnTag", 4, "Delay ToServiceMsg ssoseq: " + ((ToServiceMsg)???).getRequestSsoSeq() + " delayWaitSendList buffer size is " + localObject5.length + ", zip size is " + localObject6.length);
                  }
                }
                if (??? == null) {
                  continue;
                }
                ((ToServiceMsg)???).addAttribute("__timestamp_addSendQueue", Long.valueOf(System.currentTimeMillis()));
                w.a(w.this, (ToServiceMsg)???);
                return;
                localException = localException;
                QLog.d("MSF.C.NetConnTag", 1, "add delayMsg to send error, close LoginMerge. " + localException, localException);
                n = false;
                if (w.b(w.this).size() <= 0) {
                  continue;
                }
                localToServiceMsg1 = (ToServiceMsg)w.b(w.this).poll();
                if (localToServiceMsg1 == null) {
                  continue;
                }
                w.a(w.this, localToServiceMsg1);
                continue;
                if ("RegPrxySvc.getOffMsg".equals(localToServiceMsg2.getServiceCmd()))
                {
                  localToServiceMsg1.getAttributes().put("infoLoginMsg", localToServiceMsg2);
                  continue;
                }
                if (!"RegPrxySvc.infoSync".equals(localToServiceMsg2.getServiceCmd())) {
                  continue;
                }
                localToServiceMsg1.getAttributes().put("infoLoginMsg", localToServiceMsg2);
                continue;
                ??? = w.this;
                h -= localToServiceMsg2.getWupBuffer().length;
                if (j == 0)
                {
                  localToServiceMsg1.setUin(localToServiceMsg2.getUin());
                  localBusiBuffItem = new SSOLoginMerge.BusiBuffItem();
                  SeqNo.set(localToServiceMsg2.getRequestSsoSeq());
                  ServiceCmd.set(localToServiceMsg2.getServiceCmd());
                  if (localToServiceMsg2.getWupBuffer().length < 4)
                  {
                    BusiBuffLen.set(w.b(localToServiceMsg2.getWupBuffer()).length);
                    if (localToServiceMsg2.getWupBuffer().length < 4) {
                      continue;
                    }
                    ??? = new byte[localToServiceMsg2.getWupBuffer().length - 4];
                    System.arraycopy(localToServiceMsg2.getWupBuffer(), 4, ???, 0, ???.length);
                    BusiBuff.set(ByteStringMicro.copyFrom((byte[])???));
                    NeedResp.set(localToServiceMsg2.isNeedCallback());
                    BusiBuffVec.add(localBusiBuffItem);
                    localArrayList.add(Integer.valueOf(localToServiceMsg2.getRequestSsoSeq()));
                    ((ArrayList)localObject6).add(localToServiceMsg2);
                    c.put(Integer.valueOf(localToServiceMsg2.getRequestSsoSeq()), localToServiceMsg2);
                    localToServiceMsg2.getAttributes().put("__extraTimeoutSeq", Integer.valueOf(w.m().incrementAndGet()));
                    if (localToServiceMsg2.getTimeout() != -1L) {
                      continue;
                    }
                    localToServiceMsg2.setTimeout(30000L);
                    ??? = B.msfAlarmer.a(localToServiceMsg2, localToServiceMsg2.getTimeout());
                    localToServiceMsg2.addAttribute("to_timeoutCallbacker", ???);
                    i.a(true, w.e(w.this), localToServiceMsg2.getWupBuffer().length, localToServiceMsg2.getServiceCmd(), 0, a.o().l, a.o().m);
                    break;
                  }
                }
                else
                {
                  if (localToServiceMsg1.getUin().equals(localToServiceMsg2.getUin())) {
                    continue;
                  }
                  w.b(w.this).a(localToServiceMsg2);
                  ??? = w.this;
                  h += localToServiceMsg2.getWupBuffer().length;
                  m = i;
                  continue;
                }
                BusiBuffLen.set(localToServiceMsg2.getWupBuffer().length);
                continue;
                ??? = localToServiceMsg2.getWupBuffer();
                continue;
                ??? = B.msfAlarmer.a(localToServiceMsg2, localToServiceMsg2.getTimeout());
                continue;
              }
              if ((!w.d(w.this)) && (w.b(w.this).size() >= f))
              {
                w.a(w.this, true);
                w.c(w.this).post(e);
              }
            }
            if ((!w.d(w.this)) && (!w.b(w.this).isEmpty()))
            {
              w.c(w.this).postDelayed(e, w.this.i);
              w.a(w.this, true);
            }
          }
        }
        w.a(w.this, false);
      }
      label348:
      ??? = new ToServiceMsg("MSF SSOPackageMerge", w.e(w.this), "SSO.LoginMerge");
      ((ToServiceMsg)???).setAppId(MsfCore.mobileQQAppid);
      ((ToServiceMsg)???).setMsfCommand(MsfCommand.unknown);
      if (((ToServiceMsg)???).getRequestSsoSeq() == -1) {
        ((ToServiceMsg)???).setRequestSsoSeq(MsfCore.getNextSeq());
      }
      ((ToServiceMsg)???).setTimeout(30000L);
      ((ToServiceMsg)???).setNeedCallback(false);
      ArrayList localArrayList = new ArrayList();
      Object localObject6 = new ArrayList();
      Object localObject5 = new SSOLoginMerge.BusiBuffData();
      int i = j;
      if (i > w.b(w.this).size()) {
        i = w.b(w.this).size();
      }
      for (;;)
      {
        int m = i;
        ToServiceMsg localToServiceMsg2;
        if (j < i)
        {
          localToServiceMsg2 = (ToServiceMsg)w.b(w.this).poll();
          if (localToServiceMsg2 == null) {
            break label1532;
          }
          if (!"RegPrxySvc.infoLogin".equals(localToServiceMsg2.getServiceCmd())) {
            break label893;
          }
          ((ToServiceMsg)???).getAttributes().put("infoLoginMsg", localToServiceMsg2);
          k += localToServiceMsg2.getWupBuffer().length;
          if ((k < g) || (j == 0)) {
            break label953;
          }
          w.b(w.this).a(localToServiceMsg2);
          m = j;
        }
        ToServiceMsg localToServiceMsg1;
        label893:
        label953:
        SSOLoginMerge.BusiBuffItem localBusiBuffItem;
        label1532:
        break label1560;
        break label1553;
        label1538:
        localObject5 = null;
        localObject6 = null;
        localArrayList = null;
        Object localObject3 = null;
        break;
        label1553:
        int k = 0;
        j = 0;
        continue;
        label1560:
        j += 1;
      }
    }
  }
  
  class c
    extends Thread
  {
    long a = 0L;
    
    c() {}
    
    private void a(ToServiceMsg paramToServiceMsg, String paramString1, String paramString2)
    {
      c(paramToServiceMsg.getRequestSsoSeq());
    }
    
    public void run()
    {
      ToServiceMsg localToServiceMsg;
      String str;
      int m;
      Object localObject2;
      long l1;
      long l2;
      int k;
      int i;
      for (;;)
      {
        try
        {
          localToServiceMsg = (ToServiceMsg)w.g(w.this).k();
          if (localToServiceMsg != null) {
            try
            {
              str = localToServiceMsg.getServiceCmd();
              m = str.indexOf("#");
              if (m == -1) {
                break label1928;
              }
              localObject2 = str.substring(m + 1, str.length()) + "_new";
              str = str.substring(0, m);
              l1 = ((Long)localToServiceMsg.getAttribute("__timestamp_addSendQueue", Long.valueOf(0L))).longValue();
              l2 = System.currentTimeMillis();
              B.configManager.a(localToServiceMsg, l2);
              if (localToServiceMsg.getWupBuffer() == null) {
                break label936;
              }
              k = 0;
              if (NetConnInfoCenterImpl.isWifiConn())
              {
                i = 1;
                label141:
                if (i != w.J)
                {
                  w.J = i;
                  w.d();
                  QLog.d("MSF.C.NetConnTag", 1, "resetUserSimpleHead network type changed");
                }
                if (com.tencent.mobileqq.msf.core.auth.d.f.containsKey(localToServiceMsg.getUin()))
                {
                  B.getAccountCenter().q(localToServiceMsg.getUin());
                  com.tencent.mobileqq.msf.core.auth.d.f.remove(localToServiceMsg.getUin());
                  QLog.d("MSF.C.NetConnTag", 1, "ReloadKey for uin:" + MsfSdkUtils.getShortUin(localToServiceMsg.getUin()) + " while ssoSeq=" + localToServiceMsg.getRequestSsoSeq());
                }
                if (!a.b())
                {
                  w.d();
                  QLog.d("MSF.C.NetConnTag", 1, "resetUserSimpleHead not connect network");
                }
                arrayOfByte1 = w.f(localToServiceMsg);
              }
            }
            catch (Throwable localThrowable1)
            {
              byte[] arrayOfByte1;
              label472:
              QLog.d("MSF.C.NetConnTag", 1, localThrowable1.toString(), localThrowable1);
              a(localToServiceMsg, "发送错误", localThrowable1.toString());
              w.g(w.this).remove(localToServiceMsg);
            }
          }
        }
        catch (Throwable localThrowable2)
        {
          QLog.d("MSF.C.NetConnTag", 1, localThrowable2.toString(), localThrowable2);
        }
        try
        {
          if (localToServiceMsg.getWupBuffer() == null)
          {
            HashMap localHashMap = new HashMap();
            localHashMap.put("cmd", localToServiceMsg.getServiceCmd());
            B.getStatReporter().a("dim.Msf.SendNullMsg", false, 0L, 0L, localHashMap, false, false);
          }
          if (!w.n())
          {
            if (CodecWarpper.getSharedObjectVersion() != 600) {
              B.getStatReporter().a("dim.Msf.SOReplaceFail", false, 0L, 0L, null, false, false);
            }
            w.a(true);
          }
        }
        catch (Exception localException3)
        {
          QLog.d("MSF.C.NetConnTag", 1, "failed to report send null msg event ", localException3);
          continue;
          arrayOfByte2 = CodecWarpper.encodeRequest(localToServiceMsg.getRequestSsoSeq(), n.d(), n.f(), n.g(), "", str, b(), localToServiceMsg.getAppId(), B.getMsfAppid(), localToServiceMsg.getUin(), (byte)0, i, localException1, localToServiceMsg.getWupBuffer(), false);
          continue;
        }
        if (591 != CodecWarpper.getSharedObjectVersion()) {
          break label873;
        }
        arrayOfByte1 = CodecWarpper.encodeRequest(localToServiceMsg.getRequestSsoSeq(), n.d(), n.f(), n.g(), "", str, b(), localToServiceMsg.getAppId(), B.getMsfAppid(), localToServiceMsg.getUin(), (byte)0, i, localToServiceMsg.getWupBuffer(), false);
        QLog.d("MSF.C.NetConnTag", 1, "pa ok: " + localToServiceMsg.getRequestSsoSeq());
        if (arrayOfByte1 != null) {
          break label944;
        }
        c(localToServiceMsg.getRequestSsoSeq());
      }
      label534:
      label873:
      label936:
      label944:
      label1455:
      label1514:
      label1928:
      label1940:
      label1944:
      for (;;)
      {
        Object localObject1 = localToServiceMsg.getMsfCommand();
        localObject2 = MsfCommand._msf_kickedAndCleanTokenResp;
        if (localObject1 == localObject2) {}
        boolean bool1;
        try
        {
          localObject1 = (FromServiceMsg)localToServiceMsg.getAttribute(localToServiceMsg.getServiceCmd());
          B.getAccountCenter().m(((FromServiceMsg)localObject1).getUin());
          ((FromServiceMsg)localObject1).setBusinessFail(2012, ((FromServiceMsg)localObject1).getBusinessFailMsg());
          bool1 = false;
          if (localToServiceMsg.getAttributes().containsKey("_attr_sameDevice")) {
            bool1 = ((Boolean)localToServiceMsg.getAttribute("_attr_sameDevice")).booleanValue();
          }
          ((FromServiceMsg)localObject1).addAttribute("_attr_sameDevice", Boolean.valueOf(bool1));
          MsfSdkUtils.addFromMsgProcessName("*", (FromServiceMsg)localObject1);
          B.addRespToQuque(null, (FromServiceMsg)localObject1);
          a.a(com.tencent.qphone.base.a.a);
        }
        catch (Exception localException2)
        {
          for (;;)
          {
            int n;
            byte[] arrayOfByte2;
            QLog.e("MSF.C.NetConnTag", 1, "send offlineMsg to app error " + localException2.toString());
          }
        }
        Thread.sleep(10L);
        break;
        break;
        if (NetConnInfoCenterImpl.isMobileConn())
        {
          n = NetConnInfoCenterImpl.getMobileNetworkType() + 100;
          m = n;
          if (n > 254)
          {
            n = 254;
            m = n;
            if (QLog.isColorLevel())
            {
              QLog.d("MSF.C.NetConnTag", 2, "error,netWorkType is " + 254);
              m = n;
            }
          }
        }
        else
        {
          if (a != 0L)
          {
            i = k;
            if (l2 - a <= 60000L) {
              break label141;
            }
          }
          a = l2;
          try
          {
            NetConnInfoCenter.checkConnInfo(BaseApplication.getContext(), true);
            i = k;
          }
          catch (Exception localException1)
          {
            QLog.d("MSF.C.NetConnTag", 1, "checkConnInfo " + localException1);
            i = k;
          }
          break label141;
          arrayOfByte2 = new byte[0];
          break label472;
          if ((localToServiceMsg.getUin().equals("0")) || (((Boolean)localToServiceMsg.getAttribute("grayCheck", Boolean.valueOf(false))).booleanValue()) || (localToServiceMsg.getAppId() == -1) || (localToServiceMsg.getAppId() == 100)) {
            break label1940;
          }
          w.b(w.this, localToServiceMsg);
          break label1940;
        }
        for (;;)
        {
          if (bool1) {
            break label1944;
          }
          l2 = System.currentTimeMillis();
          if (l2 - l1 > localToServiceMsg.getTimeout())
          {
            if (!QLog.isColorLevel()) {
              break label534;
            }
            QLog.d("MSF.C.NetConnTag", 2, localToServiceMsg + " is already sendTimeout,break.");
            break label534;
          }
          if ((w.O != 0L) && (l2 - w.O > com.tencent.mobileqq.msf.core.a.a.L()) && (a.b()))
          {
            if (w.O < a.o().c()) {
              break label1455;
            }
            w.O = 0L;
            if (QLog.isColorLevel()) {
              QLog.d("MSF.C.NetConnTag", 2, "lastMessageTimeTooLong Close socket now. System.currentTimeMillis() - lastRecvSsoRespTime :" + (System.currentTimeMillis() - w.O) + " getNetIdleTimeInterval()" + com.tencent.mobileqq.msf.core.a.a.L());
            }
            a(com.tencent.qphone.base.a.o);
          }
          for (;;)
          {
            if ((w.O != 0L) && (l2 - w.O > 360000L) && (a.b()) && (w.O >= a.o().c()) && (!K.get()))
            {
              if (QLog.isColorLevel()) {
                QLog.d("MSF.C.NetConnTag", 2, "no receive data for 5 minutes, start fast net detect now.");
              }
              w.b(w.this, false);
            }
            try
            {
              localToServiceMsg.addAttribute("__timestamp_msf2net_boot", Long.valueOf(SystemClock.elapsedRealtime()));
              localToServiceMsg.addAttribute("__timestamp_msf2net", Long.valueOf(0L));
              localToServiceMsg.addAttribute("_tag_socket", w.C);
              localToServiceMsg.addAttribute("_tag_localsocket", w.D);
              boolean bool2 = a.a(localToServiceMsg.getAppId(), localToServiceMsg.getAppSeq(), str, (String)localObject2, localToServiceMsg.getMsfCommand(), localToServiceMsg.getUin(), localToServiceMsg.getRequestSsoSeq(), arrayOfByte2, localToServiceMsg);
              bool1 = bool2;
            }
            catch (Throwable localThrowable3)
            {
              for (;;)
              {
                QLog.d("MSF.C.NetConnTag", 1, "send msg error " + localThrowable3, localThrowable3);
              }
            }
            if (bool1) {
              break label1514;
            }
            localToServiceMsg.getAttributes().remove("__timestamp_msf2net_boot");
            localToServiceMsg.getAttributes().remove("__timestamp_msf2net");
            localToServiceMsg.getAttributes().remove("_tag_socket");
            localToServiceMsg.getAttributes().remove("_tag_localsocket");
            a.a(com.tencent.qphone.base.a.d);
            try
            {
              Thread.sleep(BaseConstants.reSendIntrevTime);
            }
            catch (Exception localException4)
            {
              QLog.d("MSF.C.NetConnTag", 1, localException4.toString(), localException4);
            }
            w.O = 0L;
          }
          continue;
          if ((localToServiceMsg.getUin() != null) && (localToServiceMsg.getUin().length() > 4) && (!localToServiceMsg.getServiceCmd().startsWith("login.")) && (!localToServiceMsg.getServiceCmd().startsWith("wtlogin.")) && (!localToServiceMsg.getServiceCmd().equals("ConfigService.ClientReq")) && (!localToServiceMsg.getServiceCmd().equals("GrayUinPro.Check")) && (!localToServiceMsg.getServiceCmd().equals("account.RequestReBindMblWTLogin_emp")) && (!localToServiceMsg.getServiceCmd().equals("account.RequestVerifyWTLogin_emp")) && (!localToServiceMsg.getServiceCmd().equals("ConnAuthSvr.get_app_info_emp")) && (!localToServiceMsg.getServiceCmd().equals("ConnAuthSvr.sdk_auth_api_emp")) && (!localToServiceMsg.getServiceCmd().equals("ConnAuthSvr.get_auth_api_list_emp")) && (!w.Z.contains(localToServiceMsg.getUin())))
          {
            if (w.q.get(localToServiceMsg.getUin()) == null)
            {
              ConcurrentLinkedQueue localConcurrentLinkedQueue = new ConcurrentLinkedQueue();
              w.q.put(localToServiceMsg.getUin(), localConcurrentLinkedQueue);
            }
            ((ConcurrentLinkedQueue)w.q.get(localToServiceMsg.getUin())).offer(Integer.valueOf(localToServiceMsg.getRequestSsoSeq()));
            QLog.d("MSF.C.NetConnTag", 1, "send Packet addQueue, ssoSeq=" + localToServiceMsg.getRequestSsoSeq() + ", uin=" + MsfSdkUtils.getShortUin(localToServiceMsg.getUin()));
          }
          localToServiceMsg.addAttribute("__timestamp_msf2net", Long.valueOf(System.currentTimeMillis()));
          if (localToServiceMsg.getServiceCmd().startsWith("SharpSvr.c2s")) {
            w.G = SystemClock.elapsedRealtime();
          }
          if ((V.get()) && (U == -1))
          {
            U = localToServiceMsg.getRequestSsoSeq();
            QLog.d("MSF.C.NetConnTag", 1, "set afterReloadD2SendSeq " + U);
          }
          else
          {
            localObject2 = null;
            break;
            int j = (byte)m;
            break label141;
            bool1 = false;
          }
        }
      }
    }
  }
  
  public class d
    implements Runnable
  {
    String a;
    long b;
    String c;
    
    public d(String paramString1, String paramString2, long paramLong)
    {
      a = paramString1;
      c = paramString2;
      b = paramLong;
    }
    
    public void run()
    {
      try
      {
        StringBuilder localStringBuilder = new StringBuilder();
        localStringBuilder.append(a).append("+").append(b).append("+").append(c).append("\n");
        FileOutputStream localFileOutputStream = new FileOutputStream(new File(t), true);
        localFileOutputStream.write(localStringBuilder.toString().getBytes());
        localFileOutputStream.close();
        return;
      }
      catch (Exception localException)
      {
        QLog.d("MSF.C.NetConnTag", 1, "connect ssid file write failed");
      }
    }
  }
  
  class e
    implements Runnable
  {
    e() {}
    
    public void run()
    {
      boolean bool = false;
      try
      {
        HashMap localHashMap = new HashMap();
        File localFile = new File(t);
        if (localFile.isFile())
        {
          FileReader localFileReader = new FileReader(localFile);
          BufferedReader localBufferedReader = new BufferedReader(localFileReader);
          int i = 1;
          for (;;)
          {
            String str = localBufferedReader.readLine();
            if (str == null) {
              break;
            }
            localHashMap.put("SSID" + String.valueOf(i), str);
            i += 1;
          }
          localFileReader.close();
          if (localFile.delete())
          {
            if (QLog.isColorLevel()) {
              QLog.d("MSF.C.NetConnTag", 2, "reportConnectWiFiThread succ to delete file");
            }
            w.r.clear();
            bool = true;
          }
          MsfService.core.getStatReporter().a("dim.Msf.ConnectWiFiSSID", bool, 0L, 0L, localHashMap, false, false);
          return;
        }
        QLog.d("MSF.C.NetConnTag", 1, "reportConnectWiFiThread not a file");
        return;
      }
      catch (Exception localException)
      {
        QLog.d("MSF.C.NetConnTag", 1, "failed to report connect wifi info " + localException.toString());
      }
    }
  }
  
  class f
    implements Runnable
  {
    int a = 0;
    
    public f(int paramInt)
    {
      a = paramInt;
    }
    
    public void run()
    {
      try
      {
        long l = System.currentTimeMillis();
        Object localObject = Environment.getExternalStorageDirectory().getPath() + "/tencent/msflogs/com/tencent/mobileqq/" + "com.tencent.mobileqq_logcat_" + a + "_" + QLog.getLogFileFormatter().format(Long.valueOf(l)) + ".log";
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.NetConnTag", 2, "start to store logcat " + (String)localObject);
        }
        localObject = "logcat -b main -b system -b radio -b events -v time -f " + (String)localObject;
        if (QLog.isColorLevel()) {
          QLog.d("MSF.C.NetConnTag", 2, "start to execute command " + (String)localObject);
        }
        localObject = new BufferedReader(new InputStreamReader(Runtime.getRuntime().exec((String)localObject).getErrorStream()));
        for (;;)
        {
          String str = ((BufferedReader)localObject).readLine();
          if (str == null) {
            break;
          }
          QLog.d("MSF.C.NetConnTag", 1, "logcat storage error:" + str);
        }
        localException.close();
      }
      catch (Exception localException)
      {
        QLog.d("MSF.C.NetConnTag", 1, "failed to store logcat ", localException);
        return;
      }
    }
  }
}
