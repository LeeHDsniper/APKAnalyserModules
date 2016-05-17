package com.tencent.mobileqq.utils.httputils;

import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build.VERSION;
import android.os.HandlerThread;
import android.os.SystemClock;
import android.text.TextUtils;
import android.util.Log;
import com.tencent.mobileqq.app.ThreadManager;
import com.tencent.mobileqq.hotpatch.NotVerifyClass;
import com.tencent.mobileqq.msf.sdk.MsfSdkUtils;
import com.tencent.mobileqq.statistics.StatisticCollector;
import com.tencent.mobileqq.transfile.BaseTransProcessor;
import com.tencent.mobileqq.transfile.NetworkCenter;
import com.tencent.mobileqq.transfile.RichMediaStrategy;
import com.tencent.mobileqq.transfile.RichMediaStrategy.NetPolicy;
import com.tencent.mobileqq.transfile.RichMediaStrategy.OldEngineDPCProfile.TimeoutParam;
import com.tencent.mobileqq.transfile.RichMediaUtil;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import com.tencent.wstt.SSCM.SSCMTimer.SSCMTimerObserver;
import java.io.EOFException;
import java.io.IOException;
import java.io.InterruptedIOException;
import java.net.ConnectException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.NoRouteToHostException;
import java.net.PortUnreachableException;
import java.net.SocketException;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.locks.ReentrantLock;
import mqq.os.MqqHandler;
import spb;
import spc;

public class HttpCommunicator
  implements SSCMTimer.SSCMTimerObserver
{
  public static final int a = 5;
  private static long jdField_a_of_type_Long = 0L;
  public static final boolean a = true;
  public static final int b = 500;
  private static long jdField_b_of_type_Long = 1L;
  private static final String jdField_b_of_type_JavaLangString = "Q.richmedia.HttpCommunicator";
  public static final int c = 5;
  private static final String jdField_c_of_type_JavaLangString = "content-length zero";
  public static final int d = 0;
  public static final int e = 1;
  public static final int f = 2;
  public static final int g = 3;
  public static final int h = 4;
  public static final int i = 5;
  public static final int j = 6;
  private HttpCommunicator.PriorityQueue jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpCommunicator$PriorityQueue = new HttpCommunicator.PriorityQueue();
  private IHttpCommunicatorFlowCount jdField_a_of_type_ComTencentMobileqqUtilsHttputilsIHttpCommunicatorFlowCount;
  private Object jdField_a_of_type_JavaLangObject = new ReentrantLock();
  String jdField_a_of_type_JavaLangString = null;
  private AtomicBoolean jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean = new AtomicBoolean(false);
  private MqqHandler jdField_a_of_type_MqqOsMqqHandler = null;
  private spc[] jdField_a_of_type_ArrayOfSpc;
  boolean jdField_b_of_type_Boolean = true;
  private volatile boolean jdField_c_of_type_Boolean;
  private volatile boolean d = false;
  private boolean e;
  private int k = 0;
  private final int l = 4;
  private final int m;
  private int n;
  private int o;
  
  static
  {
    boolean bool = NotVerifyClass.DO_VERIFY_CLASS;
  }
  
  public HttpCommunicator(IHttpCommunicatorFlowCount paramIHttpCommunicatorFlowCount, int paramInt)
  {
    c = false;
    jdField_a_of_type_ComTencentMobileqqUtilsHttputilsIHttpCommunicatorFlowCount = paramIHttpCommunicatorFlowCount;
    if (QLog.isColorLevel()) {
      QLog.d("Q.richmedia.HttpCommunicator", 2, "construct HTTPcomm");
    }
    m = paramInt;
    n = 4;
    o = 0;
    if (Integer.parseInt(Build.VERSION.SDK) < 8) {
      System.setProperty("http.keepAlive", "false");
    }
    System.setProperty("http.maxConnections", "2");
  }
  
  public static long a()
  {
    return jdField_a_of_type_Long;
  }
  
  private HttpURLConnection a(HttpMsg paramHttpMsg)
  {
    Object localObject1 = paramHttpMsg.a();
    String str1 = (String)jdField_a_of_type_JavaUtilHashMap.remove("mType");
    String str2;
    int i6;
    int i2;
    int i1;
    label51:
    Object localObject2;
    if (str1 != null)
    {
      str1 = MsfSdkUtils.insertMtype(str1, (String)localObject1);
      localObject1 = null;
      str2 = android.net.Proxy.getDefaultHost();
      i6 = android.net.Proxy.getDefaultPort();
      i2 = 0;
      i1 = 0;
      if ((i1 != 0) || (i2 >= 2)) {
        break label840;
      }
      localObject2 = ((ConnectivityManager)BaseApplication.getContext().getSystemService("connectivity")).getActiveNetworkInfo();
      localObject1 = null;
      if (localObject2 == null) {
        break label849;
      }
      i1 = ((NetworkInfo)localObject2).getType();
      localObject1 = ((NetworkInfo)localObject2).getExtraInfo();
    }
    for (;;)
    {
      String str3 = PkgTools.f((String)localObject1);
      if (!str3.equals(jdField_a_of_type_JavaLangString))
      {
        if ((i1 == 1) || (str3.equals(PkgTools.d))) {
          jdField_b_of_type_Boolean = false;
        }
      }
      else
      {
        label137:
        if ((i1 == 1) && (("10.0.0.172".equals(str2)) || ("10.0.0.200".equals(str2)))) {
          jdField_b_of_type_Boolean = true;
        }
        if ((str2 == null) || (i6 <= 0)) {
          break label843;
        }
      }
      label236:
      label239:
      label566:
      label575:
      label840:
      label843:
      for (int i3 = 1;; i3 = 0)
      {
        int i4;
        int i7;
        Object localObject3;
        int i5;
        if ((!jdField_b_of_type_Boolean) && (i3 != 0)) {
          if ((str3.equals(PkgTools.d)) || (str3.equals(PkgTools.f)) || (str3.equals(PkgTools.h)))
          {
            localObject1 = PkgTools.b(str1, str2, i6);
            i4 = 1;
            jdField_f_of_type_Int = i1;
            i7 = NetworkCenter.a().a();
            if (jdField_a_of_type_ComTencentMobileqqTransfileRichMediaStrategy$OldEngineDPCProfile$TimeoutParam != null) {
              break label575;
            }
            localObject3 = RichMediaStrategy.a(i7);
            i5 = ((RichMediaStrategy.NetPolicy)localObject3).d();
            if (!"POST".equals(paramHttpMsg.e())) {
              break label566;
            }
            i1 = 89500;
          }
        }
        for (;;)
        {
          ((HttpURLConnection)localObject1).setConnectTimeout(i5);
          ((HttpURLConnection)localObject1).setReadTimeout(i1);
          a(paramHttpMsg, "gettingConn", "getConnection type:" + i7 + " activeNetworkInfo: " + localObject2 + " defaultHost:" + str2 + " defaultPort: " + i6 + " last apnType:" + jdField_a_of_type_JavaLangString + " forceDirect:" + jdField_b_of_type_Boolean + ",connectTimeOut:" + i5 + ",readTimeout:" + i1);
          ((HttpURLConnection)localObject1).setInstanceFollowRedirects(false);
          localObject2 = jdField_a_of_type_JavaUtilHashMap.entrySet().iterator();
          while (((Iterator)localObject2).hasNext())
          {
            localObject3 = (Map.Entry)((Iterator)localObject2).next();
            ((HttpURLConnection)localObject1).setRequestProperty((String)((Map.Entry)localObject3).getKey(), (String)((Map.Entry)localObject3).getValue());
          }
          str1 = MsfSdkUtils.insertMtype("Other", (String)localObject1);
          break;
          jdField_b_of_type_Boolean = true;
          break label137;
          if (str3.equals(PkgTools.b))
          {
            localObject1 = PkgTools.a(str1, str2, i6);
            break label236;
          }
          localObject1 = PkgTools.a(str1, str2, i6);
          break label236;
          localObject1 = (HttpURLConnection)new URL(str1).openConnection(java.net.Proxy.NO_PROXY);
          i4 = 0;
          break label239;
          i1 = ((RichMediaStrategy.NetPolicy)localObject3).e();
          continue;
          i5 = jdField_a_of_type_ComTencentMobileqqTransfileRichMediaStrategy$OldEngineDPCProfile$TimeoutParam.b(i7);
          i1 = jdField_a_of_type_ComTencentMobileqqTransfileRichMediaStrategy$OldEngineDPCProfile$TimeoutParam.a(i7);
        }
        if (paramHttpMsg.e().equals("POST"))
        {
          ((HttpURLConnection)localObject1).setDoOutput(true);
          if (paramHttpMsg.b() != null) {
            ((HttpURLConnection)localObject1).setFixedLengthStreamingMode(paramHttpMsg.b().length);
          }
        }
        al = ((HttpURLConnection)localObject1).getRequestProperties().toString();
        try
        {
          ((HttpURLConnection)localObject1).connect();
          i1 = 1;
        }
        catch (Exception localException)
        {
          while (i3 != 0) {
            if ((i4 != 0) && (i3 != 0))
            {
              i1 = 0;
              jdField_b_of_type_Boolean = true;
            }
            else if ((i3 != 0) && (i4 == 0))
            {
              i1 = 0;
              jdField_b_of_type_Boolean = false;
            }
            else
            {
              throw localException;
            }
          }
          throw localException;
        }
        catch (AssertionError localAssertionError)
        {
          String str4;
          for (;;)
          {
            str4 = localAssertionError.getMessage();
            if (QLog.isColorLevel()) {
              QLog.d("Q.richmedia.HttpCommunicator", 2, "assertion:" + str4);
            }
            if (i3 == 0) {
              break;
            }
            if ((i4 != 0) && (i3 != 0))
            {
              i1 = 0;
              jdField_b_of_type_Boolean = true;
            }
            else if ((i3 != 0) && (i4 == 0))
            {
              i1 = 0;
              jdField_b_of_type_Boolean = false;
            }
            else
            {
              i1 = 1;
            }
          }
          throw new SocketException("AssertionError : " + str4);
        }
        jdField_a_of_type_JavaLangString = str3;
        i2 += 1;
        break label51;
        return localObject1;
      }
      label849:
      i1 = -1;
    }
  }
  
  private void a(HttpMsg paramHttpMsg1, HttpMsg paramHttpMsg2, int paramInt, boolean paramBoolean)
  {
    if (!paramBoolean)
    {
      if (QLog.isColorLevel()) {
        QLog.d("SSCM", 2, "msg statuschanged: " + paramInt);
      }
      paramHttpMsg1.a().a(paramHttpMsg1, paramHttpMsg2, paramInt);
    }
  }
  
  public static long b()
  {
    return jdField_b_of_type_Long;
  }
  
  public int a()
  {
    return m;
  }
  
  int a(int paramInt)
  {
    switch (paramInt % 5)
    {
    case 0: 
    default: 
      return 404;
    case 1: 
      return 416;
    case 2: 
      return 302;
    case 3: 
      return 501;
    }
    return 400;
  }
  
  public int a(HttpMsg paramHttpMsg)
  {
    int i1 = -1;
    int i3 = m;
    int i2 = 1;
    if (d)
    {
      if (QLog.isColorLevel()) {
        QLog.e("Q.richmedia.HttpCommunicator", 2, "sendMsg closed");
      }
      if ((paramHttpMsg != null) && (paramHttpMsg.a() != null))
      {
        paramHttpMsg.a(9366, -1, "close");
        paramHttpMsg.a().b(paramHttpMsg, paramHttpMsg);
        i3 = i1;
        return i3;
      }
    }
    for (;;)
    {
      synchronized (jdField_a_of_type_JavaLangObject)
      {
        if (jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpCommunicator$PriorityQueue.a() < i3)
        {
          i1 = k + 1;
          k = i1;
          paramHttpMsg.a(i1);
          jdField_f_of_type_Long = SystemClock.uptimeMillis();
          jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpCommunicator$PriorityQueue.a(paramHttpMsg);
          paramHttpMsg.a().a(paramHttpMsg, null, 0);
          i1 = k;
          i3 = i1;
          if (i2 == 0) {
            break;
          }
          a("sendMsg");
          return i1;
        }
        if (QLog.isColorLevel()) {
          QLog.e("Q.richmedia.HttpCommunicator", 2, "exceed queue limit");
        }
        if ((paramHttpMsg != null) && (paramHttpMsg.a() != null))
        {
          paramHttpMsg.a(9367, -1, "queen full");
          paramHttpMsg.a().b(paramHttpMsg, paramHttpMsg);
        }
      }
      i2 = 0;
    }
  }
  
  Exception a(int paramInt)
  {
    switch (paramInt % 10)
    {
    default: 
      return new Exception("inject Exception");
    case 0: 
      return new SocketTimeoutException("inject sockettimeout");
    case 1: 
      return new PortUnreachableException("inject PortUnreachableException");
    case 2: 
      return new ConnectException("inject ConnectException");
    case 3: 
      return new NoRouteToHostException("inject NoRouteToHostException");
    case 4: 
      return new IllegalArgumentException("inject IllegalArgumentException");
    case 5: 
      return new IllegalStateException("inject IllegalStateException");
    case 6: 
      return new IOException("inject IOException");
    case 7: 
      return new IOException("preempted by higher msg");
    case 8: 
      return new IOException("HttpCommunicator closed or msg caceled!");
    }
    return new IOException("content-length zero");
  }
  
  public void a()
  {
    int i1 = 0;
    if ((d) || (c)) {
      throw new IllegalStateException("HttpCommunicator already in using or disposed!");
    }
    synchronized (jdField_a_of_type_JavaLangObject)
    {
      c = true;
      o = 0;
      jdField_a_of_type_MqqOsMqqHandler = ThreadManager.b();
      jdField_a_of_type_ArrayOfSpc = new spc[4];
      while (i1 < 4)
      {
        HandlerThread localHandlerThread = new HandlerThread("httpcommunicator_norm_" + i1, 5);
        localHandlerThread.start();
        jdField_a_of_type_ArrayOfSpc[i1] = new spc(this, localHandlerThread.getLooper());
        jdField_a_of_type_ArrayOfSpc[i1].jdField_a_of_type_Int = i1;
        i1 += 1;
      }
      i1 = NetworkCenter.a().a();
      if ((i1 == 2) || (i1 == 3))
      {
        n = 3;
        return;
      }
      n = 4;
    }
  }
  
  public void a(int paramInt)
  {
    localObject1 = jdField_a_of_type_JavaLangObject;
    if (paramInt == 1) {}
    for (;;)
    {
      try
      {
        n = 4;
        jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.set(false);
        if (QLog.isColorLevel()) {
          QLog.d("Q.richmedia.HttpCommunicator", 2, "netType:" + paramInt + " concurrent:" + n);
        }
        a("netChange");
        return;
      }
      finally {}
      n = 3;
      jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.set(true);
    }
  }
  
  void a(int paramInt, HttpURLConnection paramHttpURLConnection, HttpMsg paramHttpMsg)
  {
    if ((paramHttpURLConnection == null) || (paramHttpMsg == null)) {
      return;
    }
    paramHttpMsg.c(paramInt);
    paramHttpMsg.b("Content-Type", paramHttpURLConnection.getContentType());
    am = paramHttpURLConnection.getHeaderFields().toString();
    if (paramHttpURLConnection.getHeaderField("User-ReturnCode") != null) {
      paramHttpMsg.b("User-ReturnCode", paramHttpURLConnection.getHeaderField("User-ReturnCode"));
    }
    if (paramHttpURLConnection.getHeaderField("X-User-ReturnCode") != null) {
      paramHttpMsg.b("X-User-ReturnCode", paramHttpURLConnection.getHeaderField("X-User-ReturnCode"));
    }
    if (paramHttpURLConnection.getHeaderField("content-range") != null) {
      paramHttpMsg.b("content-range", paramHttpURLConnection.getHeaderField("content-range"));
    }
    if (paramHttpURLConnection.getHeaderField("Range") != null) {
      paramHttpMsg.b("Range", paramHttpURLConnection.getHeaderField("Range"));
    }
    if (paramHttpURLConnection.getHeaderField("X-Range") != null) {
      paramHttpMsg.b("X-Range", paramHttpURLConnection.getHeaderField("X-Range"));
    }
    if (paramHttpURLConnection.getHeaderField("Content-Encoding") != null) {
      paramHttpMsg.b("Content-Encoding", paramHttpURLConnection.getHeaderField("Content-Encoding"));
    }
    if (paramHttpURLConnection.getHeaderField("Transfer-Encoding") != null) {
      paramHttpMsg.b("Transfer-Encoding", paramHttpURLConnection.getHeaderField("Transfer-Encoding"));
    }
    if (paramHttpURLConnection.getHeaderField("X-RtFlag") != null) {
      paramHttpMsg.b("X-RtFlag", paramHttpURLConnection.getHeaderField("X-RtFlag"));
    }
    if (paramHttpURLConnection.getHeaderField("X-httime") != null) {
      paramHttpMsg.b("X-httime", paramHttpURLConnection.getHeaderField("X-httime"));
    }
    if (paramHttpURLConnection.getHeaderField("X-piccachetime") != null) {
      paramHttpMsg.b("X-piccachetime", paramHttpURLConnection.getHeaderField("X-piccachetime"));
    }
    jdField_a_of_type_Long = -1L;
    String str = paramHttpURLConnection.getHeaderField("content-range");
    int i1;
    if (str != null) {
      i1 = str.lastIndexOf("/");
    }
    for (;;)
    {
      try
      {
        jdField_a_of_type_Long = Long.valueOf(str.substring(i1 + 1)).longValue();
        jdField_b_of_type_Long = paramHttpURLConnection.getContentLength();
        a(paramHttpMsg, "copyRespHeader", "resultCode:" + paramInt + " totalLen:" + jdField_a_of_type_Long + ",totalBlockLen:" + jdField_b_of_type_Long);
        return;
      }
      catch (Exception localException)
      {
        localException.printStackTrace();
        continue;
      }
      jdField_a_of_type_Long = paramHttpURLConnection.getContentLength();
      jdField_b_of_type_Long = jdField_a_of_type_Long;
    }
  }
  
  void a(long paramLong, int paramInt)
  {
    int i1 = 4;
    int i2 = (int)(2L * paramLong / 90000L);
    if (i2 > 4) {}
    for (;;)
    {
      HashMap localHashMap = new HashMap();
      localHashMap.put("param_FailCode", String.valueOf(i1 + 9400));
      localHashMap.put("param_PostSize", String.valueOf(paramInt));
      StatisticCollector.a(BaseApplication.getContext()).a(null, "LongHttpRespTime", false, paramLong, 0L, localHashMap, "");
      return;
      i1 = i2;
    }
  }
  
  public void a(HttpMsg paramHttpMsg)
  {
    if (paramHttpMsg == null) {
      return;
    }
    synchronized (jdField_a_of_type_JavaLangObject)
    {
      jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpCommunicator$PriorityQueue.a(paramHttpMsg);
      jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.set(true);
      return;
    }
  }
  
  public void a(HttpMsg paramHttpMsg, String paramString1, String paramString2)
  {
    RichMediaUtil.a(RichMediaUtil.b(jdField_e_of_type_Int), paramHttpMsg.e().equals("POST"), RichMediaUtil.c(jdField_d_of_type_Int), ai, paramString1, paramString2);
  }
  
  public void a(HttpMsg paramHttpMsg, spc paramSpc)
  {
    int i1 = 0;
    if ((paramHttpMsg != null) && (paramSpc != null)) {
      try
      {
        a(paramHttpMsg, "responseTimeout", "");
        if (paramHttpMsg.b() == null) {}
        for (;;)
        {
          a(90000L, i1);
          a(paramSpc);
          paramHttpMsg.a(9014, 0, "response timeout");
          paramHttpMsg.a().b(paramHttpMsg, paramHttpMsg);
          return;
          i1 = paramHttpMsg.b().length;
        }
        return;
      }
      catch (Exception paramHttpMsg)
      {
        if (QLog.isColorLevel()) {
          QLog.e("Q.richmedia.HttpCommunicator", 2, "onResponseTimeout", paramHttpMsg);
        }
      }
    }
  }
  
  /* Error */
  public void a(HttpMsg paramHttpMsg, spc paramSpc, boolean paramBoolean)
  {
    // Byte code:
    //   0: aload_1
    //   1: invokevirtual 401	com/tencent/mobileqq/utils/httputils/HttpMsg:a	()Lcom/tencent/mobileqq/utils/httputils/IHttpCommunicatorListener;
    //   4: astore 48
    //   6: aconst_null
    //   7: astore 42
    //   9: aconst_null
    //   10: astore 46
    //   12: aconst_null
    //   13: astore 45
    //   15: aconst_null
    //   16: astore 43
    //   18: aconst_null
    //   19: astore 47
    //   21: aconst_null
    //   22: astore 44
    //   24: lconst_0
    //   25: lstore 22
    //   27: iconst_0
    //   28: istore 14
    //   30: iconst_0
    //   31: istore 8
    //   33: iconst_0
    //   34: istore 11
    //   36: iconst_0
    //   37: istore 10
    //   39: iconst_0
    //   40: istore 12
    //   42: iconst_0
    //   43: istore 13
    //   45: aload_0
    //   46: aload_1
    //   47: aconst_null
    //   48: iconst_1
    //   49: iload_3
    //   50: invokespecial 668	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;Lcom/tencent/mobileqq/utils/httputils/HttpMsg;IZ)V
    //   53: iconst_0
    //   54: istore 7
    //   56: iconst_0
    //   57: istore 14
    //   59: aconst_null
    //   60: astore 35
    //   62: iconst_m1
    //   63: istore 4
    //   65: aconst_null
    //   66: astore 30
    //   68: aconst_null
    //   69: astore 34
    //   71: lconst_0
    //   72: lstore 16
    //   74: aload_0
    //   75: aload_1
    //   76: ldc_w 670
    //   79: ldc_w 625
    //   82: invokevirtual 299	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;Ljava/lang/String;Ljava/lang/String;)V
    //   85: aload_0
    //   86: aload_2
    //   87: aload_1
    //   88: invokevirtual 673	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lspc;Lcom/tencent/mobileqq/utils/httputils/HttpMsg;)V
    //   91: aload_0
    //   92: aload_1
    //   93: invokespecial 675	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;)Ljava/net/HttpURLConnection;
    //   96: astore 31
    //   98: aload 31
    //   100: astore 30
    //   102: aload_1
    //   103: aload 30
    //   105: putfield 678	com/tencent/mobileqq/utils/httputils/HttpMsg:jdField_a_of_type_JavaNetHttpURLConnection	Ljava/net/HttpURLConnection;
    //   108: aload_1
    //   109: invokestatic 427	android/os/SystemClock:uptimeMillis	()J
    //   112: putfield 680	com/tencent/mobileqq/utils/httputils/HttpMsg:jdField_d_of_type_Long	J
    //   115: aload_0
    //   116: aload_1
    //   117: ldc_w 682
    //   120: ldc_w 625
    //   123: invokevirtual 299	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;Ljava/lang/String;Ljava/lang/String;)V
    //   126: iconst_1
    //   127: istore 14
    //   129: aload 35
    //   131: astore 40
    //   133: iload 4
    //   135: istore 5
    //   137: lload 22
    //   139: lstore 26
    //   141: lload 16
    //   143: lstore 28
    //   145: aload 34
    //   147: astore 41
    //   149: aload 35
    //   151: astore 36
    //   153: iload 13
    //   155: istore 6
    //   157: iload 4
    //   159: istore 9
    //   161: lload 22
    //   163: lstore 20
    //   165: lload 16
    //   167: lstore 24
    //   169: aload 44
    //   171: astore 37
    //   173: aload 34
    //   175: astore 38
    //   177: aload 45
    //   179: astore 39
    //   181: invokestatic 685	java/lang/System:currentTimeMillis	()J
    //   184: pop2
    //   185: aload 35
    //   187: astore 33
    //   189: lload 16
    //   191: lstore 18
    //   193: aload 34
    //   195: astore 32
    //   197: aload 35
    //   199: astore 40
    //   201: iload 4
    //   203: istore 5
    //   205: lload 22
    //   207: lstore 26
    //   209: lload 16
    //   211: lstore 28
    //   213: aload 34
    //   215: astore 41
    //   217: aload 35
    //   219: astore 36
    //   221: iload 13
    //   223: istore 6
    //   225: iload 4
    //   227: istore 9
    //   229: lload 22
    //   231: lstore 20
    //   233: lload 16
    //   235: lstore 24
    //   237: aload 44
    //   239: astore 37
    //   241: aload 34
    //   243: astore 38
    //   245: aload 45
    //   247: astore 39
    //   249: aload_1
    //   250: invokevirtual 249	com/tencent/mobileqq/utils/httputils/HttpMsg:e	()Ljava/lang/String;
    //   253: ldc -9
    //   255: invokevirtual 211	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   258: ifeq +240 -> 498
    //   261: aload 35
    //   263: astore 40
    //   265: iload 4
    //   267: istore 5
    //   269: lload 22
    //   271: lstore 26
    //   273: lload 16
    //   275: lstore 28
    //   277: aload 34
    //   279: astore 41
    //   281: aload 35
    //   283: astore 36
    //   285: iload 13
    //   287: istore 6
    //   289: iload 4
    //   291: istore 9
    //   293: lload 22
    //   295: lstore 20
    //   297: lload 16
    //   299: lstore 24
    //   301: aload 44
    //   303: astore 37
    //   305: aload 34
    //   307: astore 38
    //   309: aload 45
    //   311: astore 39
    //   313: new 687	spa
    //   316: dup
    //   317: aload_0
    //   318: aload_1
    //   319: aload_2
    //   320: invokespecial 690	spa:<init>	(Lcom/tencent/mobileqq/utils/httputils/HttpCommunicator;Lcom/tencent/mobileqq/utils/httputils/HttpMsg;Lspc;)V
    //   323: astore 31
    //   325: aload_0
    //   326: getfield 70	com/tencent/mobileqq/utils/httputils/HttpCommunicator:jdField_a_of_type_MqqOsMqqHandler	Lmqq/os/MqqHandler;
    //   329: aload 31
    //   331: ldc2_w 604
    //   334: invokevirtual 696	mqq/os/MqqHandler:postDelayed	(Ljava/lang/Runnable;J)Z
    //   337: pop
    //   338: aload_1
    //   339: invokevirtual 369	com/tencent/mobileqq/utils/httputils/HttpMsg:b	()[B
    //   342: astore 33
    //   344: aload 30
    //   346: invokevirtual 700	java/net/HttpURLConnection:getOutputStream	()Ljava/io/OutputStream;
    //   349: astore 32
    //   351: aload_0
    //   352: aload_1
    //   353: ldc_w 702
    //   356: new 263	java/lang/StringBuilder
    //   359: dup
    //   360: invokespecial 264	java/lang/StringBuilder:<init>	()V
    //   363: ldc_w 704
    //   366: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   369: aload 33
    //   371: arraylength
    //   372: invokevirtual 273	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   375: invokevirtual 296	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   378: invokevirtual 299	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;Ljava/lang/String;Ljava/lang/String;)V
    //   381: iconst_0
    //   382: istore 5
    //   384: iload 5
    //   386: aload 33
    //   388: arraylength
    //   389: if_icmpge +46 -> 435
    //   392: aload_0
    //   393: aload_2
    //   394: aload_1
    //   395: invokevirtual 673	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lspc;Lcom/tencent/mobileqq/utils/httputils/HttpMsg;)V
    //   398: aload 32
    //   400: aload 33
    //   402: iload 5
    //   404: sipush 10240
    //   407: aload 33
    //   409: arraylength
    //   410: iload 5
    //   412: isub
    //   413: invokestatic 710	java/lang/Math:min	(II)I
    //   416: invokevirtual 716	java/io/OutputStream:write	([BII)V
    //   419: aload 32
    //   421: invokevirtual 719	java/io/OutputStream:flush	()V
    //   424: iload 5
    //   426: sipush 10240
    //   429: iadd
    //   430: istore 5
    //   432: goto -48 -> 384
    //   435: aload_2
    //   436: ifnull +13 -> 449
    //   439: aload_2
    //   440: getfield 721	spc:jdField_b_of_type_JavaUtilConcurrentAtomicAtomicBoolean	Ljava/util/concurrent/atomic/AtomicBoolean;
    //   443: invokevirtual 724	java/util/concurrent/atomic/AtomicBoolean:get	()Z
    //   446: ifne +14 -> 460
    //   449: aload_0
    //   450: aload_1
    //   451: ldc_w 726
    //   454: ldc_w 625
    //   457: invokevirtual 299	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;Ljava/lang/String;Ljava/lang/String;)V
    //   460: aload 30
    //   462: invokevirtual 730	java/net/HttpURLConnection:getURL	()Ljava/net/URL;
    //   465: invokevirtual 731	java/net/URL:toString	()Ljava/lang/String;
    //   468: invokevirtual 734	java/lang/String:length	()I
    //   471: i2l
    //   472: lstore 18
    //   474: aload 33
    //   476: arraylength
    //   477: istore 5
    //   479: lload 16
    //   481: ldc2_w 735
    //   484: lload 18
    //   486: ladd
    //   487: iload 5
    //   489: i2l
    //   490: ladd
    //   491: ladd
    //   492: lstore 18
    //   494: aload 31
    //   496: astore 33
    //   498: aload 33
    //   500: astore 40
    //   502: iload 4
    //   504: istore 5
    //   506: lload 22
    //   508: lstore 26
    //   510: lload 18
    //   512: lstore 28
    //   514: aload 32
    //   516: astore 41
    //   518: aload 33
    //   520: astore 36
    //   522: iload 13
    //   524: istore 6
    //   526: iload 4
    //   528: istore 9
    //   530: lload 22
    //   532: lstore 20
    //   534: lload 18
    //   536: lstore 24
    //   538: aload 44
    //   540: astore 37
    //   542: aload 32
    //   544: astore 38
    //   546: aload 45
    //   548: astore 39
    //   550: aload_0
    //   551: aload_2
    //   552: aload_1
    //   553: invokevirtual 673	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lspc;Lcom/tencent/mobileqq/utils/httputils/HttpMsg;)V
    //   556: aload 33
    //   558: astore 40
    //   560: iload 4
    //   562: istore 5
    //   564: lload 22
    //   566: lstore 26
    //   568: lload 18
    //   570: lstore 28
    //   572: aload 32
    //   574: astore 41
    //   576: aload 33
    //   578: astore 36
    //   580: iload 13
    //   582: istore 6
    //   584: iload 4
    //   586: istore 9
    //   588: lload 22
    //   590: lstore 20
    //   592: lload 18
    //   594: lstore 24
    //   596: aload 44
    //   598: astore 37
    //   600: aload 32
    //   602: astore 38
    //   604: aload 45
    //   606: astore 39
    //   608: aload 30
    //   610: invokevirtual 739	java/net/HttpURLConnection:getResponseCode	()I
    //   613: istore 4
    //   615: aload 33
    //   617: astore 40
    //   619: iload 4
    //   621: istore 5
    //   623: lload 22
    //   625: lstore 26
    //   627: lload 18
    //   629: lstore 28
    //   631: aload 32
    //   633: astore 41
    //   635: aload 33
    //   637: astore 36
    //   639: iload 13
    //   641: istore 6
    //   643: iload 4
    //   645: istore 9
    //   647: lload 22
    //   649: lstore 20
    //   651: lload 18
    //   653: lstore 24
    //   655: aload 44
    //   657: astore 37
    //   659: aload 32
    //   661: astore 38
    //   663: aload 45
    //   665: astore 39
    //   667: aload_0
    //   668: iload 4
    //   670: aload 30
    //   672: aload_1
    //   673: invokevirtual 741	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(ILjava/net/HttpURLConnection;Lcom/tencent/mobileqq/utils/httputils/HttpMsg;)V
    //   676: aload_2
    //   677: ifnull +283 -> 960
    //   680: aload 33
    //   682: astore 40
    //   684: iload 4
    //   686: istore 5
    //   688: lload 22
    //   690: lstore 26
    //   692: lload 18
    //   694: lstore 28
    //   696: aload 32
    //   698: astore 41
    //   700: aload 33
    //   702: astore 36
    //   704: iload 13
    //   706: istore 6
    //   708: iload 4
    //   710: istore 9
    //   712: lload 22
    //   714: lstore 20
    //   716: lload 18
    //   718: lstore 24
    //   720: aload 44
    //   722: astore 37
    //   724: aload 32
    //   726: astore 38
    //   728: aload 45
    //   730: astore 39
    //   732: aload_2
    //   733: getfield 721	spc:jdField_b_of_type_JavaUtilConcurrentAtomicAtomicBoolean	Ljava/util/concurrent/atomic/AtomicBoolean;
    //   736: invokevirtual 724	java/util/concurrent/atomic/AtomicBoolean:get	()Z
    //   739: istore 15
    //   741: iload 15
    //   743: ifeq +217 -> 960
    //   746: iload 4
    //   748: sipush 200
    //   751: if_icmpeq +11 -> 762
    //   754: iload 4
    //   756: sipush 206
    //   759: if_icmpne +31 -> 790
    //   762: aload_0
    //   763: aload_1
    //   764: ldc_w 743
    //   767: new 263	java/lang/StringBuilder
    //   770: dup
    //   771: invokespecial 264	java/lang/StringBuilder:<init>	()V
    //   774: ldc_w 745
    //   777: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   780: iconst_0
    //   781: invokevirtual 273	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   784: invokevirtual 296	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   787: invokevirtual 299	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;Ljava/lang/String;Ljava/lang/String;)V
    //   790: aload_2
    //   791: ifnull +13 -> 804
    //   794: aload_2
    //   795: getfield 721	spc:jdField_b_of_type_JavaUtilConcurrentAtomicAtomicBoolean	Ljava/util/concurrent/atomic/AtomicBoolean;
    //   798: invokevirtual 724	java/util/concurrent/atomic/AtomicBoolean:get	()Z
    //   801: ifne +47 -> 848
    //   804: aload_0
    //   805: aload_1
    //   806: ldc_w 747
    //   809: new 263	java/lang/StringBuilder
    //   812: dup
    //   813: invokespecial 264	java/lang/StringBuilder:<init>	()V
    //   816: ldc_w 749
    //   819: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   822: aload_1
    //   823: invokevirtual 751	com/tencent/mobileqq/utils/httputils/HttpMsg:d	()Ljava/lang/String;
    //   826: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   829: ldc_w 753
    //   832: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   835: aload_1
    //   836: invokevirtual 755	com/tencent/mobileqq/utils/httputils/HttpMsg:c	()Ljava/lang/String;
    //   839: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   842: invokevirtual 296	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   845: invokevirtual 299	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;Ljava/lang/String;Ljava/lang/String;)V
    //   848: aload_0
    //   849: getfield 70	com/tencent/mobileqq/utils/httputils/HttpCommunicator:jdField_a_of_type_MqqOsMqqHandler	Lmqq/os/MqqHandler;
    //   852: ifnull +17 -> 869
    //   855: aload 33
    //   857: ifnull +12 -> 869
    //   860: aload_0
    //   861: getfield 70	com/tencent/mobileqq/utils/httputils/HttpCommunicator:jdField_a_of_type_MqqOsMqqHandler	Lmqq/os/MqqHandler;
    //   864: aload 33
    //   866: invokevirtual 759	mqq/os/MqqHandler:removeCallbacks	(Ljava/lang/Runnable;)V
    //   869: lload 18
    //   871: lconst_0
    //   872: ladd
    //   873: lstore 16
    //   875: lload 16
    //   877: lconst_0
    //   878: lcmp
    //   879: ifeq +25 -> 904
    //   882: aload_1
    //   883: invokevirtual 249	com/tencent/mobileqq/utils/httputils/HttpMsg:e	()Ljava/lang/String;
    //   886: ldc -9
    //   888: invokevirtual 211	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   891: ifeq +58 -> 949
    //   894: iconst_1
    //   895: istore_3
    //   896: aload_0
    //   897: aload_1
    //   898: iload_3
    //   899: lload 16
    //   901: invokevirtual 762	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;ZJ)V
    //   904: iconst_0
    //   905: ifeq +11 -> 916
    //   908: new 764	java/lang/NullPointerException
    //   911: dup
    //   912: invokespecial 765	java/lang/NullPointerException:<init>	()V
    //   915: athrow
    //   916: iconst_0
    //   917: ifeq +11 -> 928
    //   920: new 764	java/lang/NullPointerException
    //   923: dup
    //   924: invokespecial 765	java/lang/NullPointerException:<init>	()V
    //   927: athrow
    //   928: aload 32
    //   930: ifnull +8 -> 938
    //   933: aload 32
    //   935: invokevirtual 767	java/io/OutputStream:close	()V
    //   938: aload 30
    //   940: ifnull +8 -> 948
    //   943: aload 30
    //   945: invokevirtual 770	java/net/HttpURLConnection:disconnect	()V
    //   948: return
    //   949: iconst_0
    //   950: istore_3
    //   951: goto -55 -> 896
    //   954: astore_1
    //   955: aload_1
    //   956: invokevirtual 600	java/lang/Exception:printStackTrace	()V
    //   959: return
    //   960: aload 33
    //   962: astore 40
    //   964: iload 4
    //   966: istore 5
    //   968: lload 22
    //   970: lstore 26
    //   972: lload 18
    //   974: lstore 28
    //   976: aload 32
    //   978: astore 41
    //   980: aload 33
    //   982: astore 36
    //   984: iload 13
    //   986: istore 6
    //   988: iload 4
    //   990: istore 9
    //   992: lload 22
    //   994: lstore 20
    //   996: lload 18
    //   998: lstore 24
    //   1000: aload 44
    //   1002: astore 37
    //   1004: aload 32
    //   1006: astore 38
    //   1008: aload 45
    //   1010: astore 39
    //   1012: aload_0
    //   1013: getfield 70	com/tencent/mobileqq/utils/httputils/HttpCommunicator:jdField_a_of_type_MqqOsMqqHandler	Lmqq/os/MqqHandler;
    //   1016: ifnull +69 -> 1085
    //   1019: aload 33
    //   1021: ifnull +64 -> 1085
    //   1024: aload 33
    //   1026: astore 40
    //   1028: iload 4
    //   1030: istore 5
    //   1032: lload 22
    //   1034: lstore 26
    //   1036: lload 18
    //   1038: lstore 28
    //   1040: aload 32
    //   1042: astore 41
    //   1044: aload 33
    //   1046: astore 36
    //   1048: iload 13
    //   1050: istore 6
    //   1052: iload 4
    //   1054: istore 9
    //   1056: lload 22
    //   1058: lstore 20
    //   1060: lload 18
    //   1062: lstore 24
    //   1064: aload 44
    //   1066: astore 37
    //   1068: aload 32
    //   1070: astore 38
    //   1072: aload 45
    //   1074: astore 39
    //   1076: aload_0
    //   1077: getfield 70	com/tencent/mobileqq/utils/httputils/HttpCommunicator:jdField_a_of_type_MqqOsMqqHandler	Lmqq/os/MqqHandler;
    //   1080: aload 33
    //   1082: invokevirtual 759	mqq/os/MqqHandler:removeCallbacks	(Ljava/lang/Runnable;)V
    //   1085: aload 33
    //   1087: astore 40
    //   1089: iload 4
    //   1091: istore 5
    //   1093: lload 22
    //   1095: lstore 26
    //   1097: lload 18
    //   1099: lstore 28
    //   1101: aload 32
    //   1103: astore 41
    //   1105: aload 33
    //   1107: astore 36
    //   1109: iload 13
    //   1111: istore 6
    //   1113: iload 4
    //   1115: istore 9
    //   1117: lload 22
    //   1119: lstore 20
    //   1121: lload 18
    //   1123: lstore 24
    //   1125: aload 44
    //   1127: astore 37
    //   1129: aload 32
    //   1131: astore 38
    //   1133: aload 45
    //   1135: astore 39
    //   1137: aload_0
    //   1138: aload_1
    //   1139: ldc_w 772
    //   1142: new 263	java/lang/StringBuilder
    //   1145: dup
    //   1146: invokespecial 264	java/lang/StringBuilder:<init>	()V
    //   1149: ldc_w 774
    //   1152: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1155: iload 4
    //   1157: invokevirtual 273	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1160: invokevirtual 296	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1163: invokevirtual 299	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;Ljava/lang/String;Ljava/lang/String;)V
    //   1166: iload 4
    //   1168: sipush 302
    //   1171: if_icmpeq +11 -> 1182
    //   1174: iload 4
    //   1176: sipush 301
    //   1179: if_icmpne +1650 -> 2829
    //   1182: iload 7
    //   1184: iconst_5
    //   1185: if_icmpge +1283 -> 2468
    //   1188: aload 33
    //   1190: astore 40
    //   1192: iload 4
    //   1194: istore 5
    //   1196: lload 22
    //   1198: lstore 26
    //   1200: lload 18
    //   1202: lstore 28
    //   1204: aload 32
    //   1206: astore 41
    //   1208: aload 33
    //   1210: astore 36
    //   1212: iload 13
    //   1214: istore 6
    //   1216: iload 4
    //   1218: istore 9
    //   1220: lload 22
    //   1222: lstore 20
    //   1224: lload 18
    //   1226: lstore 24
    //   1228: aload 44
    //   1230: astore 37
    //   1232: aload 32
    //   1234: astore 38
    //   1236: aload 45
    //   1238: astore 39
    //   1240: aload_0
    //   1241: aload_1
    //   1242: ldc_w 776
    //   1245: new 263	java/lang/StringBuilder
    //   1248: dup
    //   1249: invokespecial 264	java/lang/StringBuilder:<init>	()V
    //   1252: ldc_w 778
    //   1255: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1258: aload_1
    //   1259: getfield 380	com/tencent/mobileqq/utils/httputils/HttpMsg:al	Ljava/lang/String;
    //   1262: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1265: ldc_w 780
    //   1268: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1271: aload_1
    //   1272: getfield 538	com/tencent/mobileqq/utils/httputils/HttpMsg:am	Ljava/lang/String;
    //   1275: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1278: invokevirtual 296	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1281: invokevirtual 299	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;Ljava/lang/String;Ljava/lang/String;)V
    //   1284: aload 33
    //   1286: astore 40
    //   1288: iload 4
    //   1290: istore 5
    //   1292: lload 22
    //   1294: lstore 26
    //   1296: lload 18
    //   1298: lstore 28
    //   1300: aload 32
    //   1302: astore 41
    //   1304: aload 33
    //   1306: astore 36
    //   1308: iload 13
    //   1310: istore 6
    //   1312: iload 4
    //   1314: istore 9
    //   1316: lload 22
    //   1318: lstore 20
    //   1320: lload 18
    //   1322: lstore 24
    //   1324: aload 44
    //   1326: astore 37
    //   1328: aload 32
    //   1330: astore 38
    //   1332: aload 45
    //   1334: astore 39
    //   1336: aload 30
    //   1338: ldc_w 782
    //   1341: invokevirtual 543	java/net/HttpURLConnection:getHeaderField	(Ljava/lang/String;)Ljava/lang/String;
    //   1344: astore 31
    //   1346: aload 31
    //   1348: ifnull +620 -> 1968
    //   1351: aload 32
    //   1353: ifnull +40 -> 1393
    //   1356: aload 33
    //   1358: astore 36
    //   1360: iload 13
    //   1362: istore 6
    //   1364: iload 4
    //   1366: istore 9
    //   1368: lload 22
    //   1370: lstore 20
    //   1372: lload 18
    //   1374: lstore 24
    //   1376: aload 44
    //   1378: astore 37
    //   1380: aload 32
    //   1382: astore 38
    //   1384: aload 45
    //   1386: astore 39
    //   1388: aload 32
    //   1390: invokevirtual 767	java/io/OutputStream:close	()V
    //   1393: aload 33
    //   1395: astore 36
    //   1397: iload 13
    //   1399: istore 6
    //   1401: iload 4
    //   1403: istore 9
    //   1405: lload 22
    //   1407: lstore 20
    //   1409: lload 18
    //   1411: lstore 24
    //   1413: aload 44
    //   1415: astore 37
    //   1417: aload 32
    //   1419: astore 38
    //   1421: aload 45
    //   1423: astore 39
    //   1425: aload 30
    //   1427: invokevirtual 770	java/net/HttpURLConnection:disconnect	()V
    //   1430: aload 33
    //   1432: astore 40
    //   1434: iload 4
    //   1436: istore 5
    //   1438: lload 22
    //   1440: lstore 26
    //   1442: lload 18
    //   1444: lstore 28
    //   1446: aload 32
    //   1448: astore 41
    //   1450: aload 33
    //   1452: astore 36
    //   1454: iload 13
    //   1456: istore 6
    //   1458: iload 4
    //   1460: istore 9
    //   1462: lload 22
    //   1464: lstore 20
    //   1466: lload 18
    //   1468: lstore 24
    //   1470: aload 44
    //   1472: astore 37
    //   1474: aload 32
    //   1476: astore 38
    //   1478: aload 45
    //   1480: astore 39
    //   1482: aload_1
    //   1483: invokevirtual 784	com/tencent/mobileqq/utils/httputils/HttpMsg:b	()Z
    //   1486: ifne +278 -> 1764
    //   1489: aload 33
    //   1491: astore 40
    //   1493: iload 4
    //   1495: istore 5
    //   1497: lload 22
    //   1499: lstore 26
    //   1501: lload 18
    //   1503: lstore 28
    //   1505: aload 32
    //   1507: astore 41
    //   1509: aload 33
    //   1511: astore 36
    //   1513: iload 13
    //   1515: istore 6
    //   1517: iload 4
    //   1519: istore 9
    //   1521: lload 22
    //   1523: lstore 20
    //   1525: lload 18
    //   1527: lstore 24
    //   1529: aload 44
    //   1531: astore 37
    //   1533: aload 32
    //   1535: astore 38
    //   1537: aload 45
    //   1539: astore 39
    //   1541: aload 48
    //   1543: aload 31
    //   1545: invokeinterface 785 2 0
    //   1550: iload 4
    //   1552: sipush 200
    //   1555: if_icmpeq +11 -> 1566
    //   1558: iload 4
    //   1560: sipush 206
    //   1563: if_icmpne +31 -> 1594
    //   1566: aload_0
    //   1567: aload_1
    //   1568: ldc_w 743
    //   1571: new 263	java/lang/StringBuilder
    //   1574: dup
    //   1575: invokespecial 264	java/lang/StringBuilder:<init>	()V
    //   1578: ldc_w 745
    //   1581: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1584: iconst_0
    //   1585: invokevirtual 273	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1588: invokevirtual 296	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1591: invokevirtual 299	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;Ljava/lang/String;Ljava/lang/String;)V
    //   1594: aload_2
    //   1595: ifnull +13 -> 1608
    //   1598: aload_2
    //   1599: getfield 721	spc:jdField_b_of_type_JavaUtilConcurrentAtomicAtomicBoolean	Ljava/util/concurrent/atomic/AtomicBoolean;
    //   1602: invokevirtual 724	java/util/concurrent/atomic/AtomicBoolean:get	()Z
    //   1605: ifne +47 -> 1652
    //   1608: aload_0
    //   1609: aload_1
    //   1610: ldc_w 747
    //   1613: new 263	java/lang/StringBuilder
    //   1616: dup
    //   1617: invokespecial 264	java/lang/StringBuilder:<init>	()V
    //   1620: ldc_w 749
    //   1623: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1626: aload_1
    //   1627: invokevirtual 751	com/tencent/mobileqq/utils/httputils/HttpMsg:d	()Ljava/lang/String;
    //   1630: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1633: ldc_w 753
    //   1636: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1639: aload_1
    //   1640: invokevirtual 755	com/tencent/mobileqq/utils/httputils/HttpMsg:c	()Ljava/lang/String;
    //   1643: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1646: invokevirtual 296	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1649: invokevirtual 299	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;Ljava/lang/String;Ljava/lang/String;)V
    //   1652: aload_0
    //   1653: getfield 70	com/tencent/mobileqq/utils/httputils/HttpCommunicator:jdField_a_of_type_MqqOsMqqHandler	Lmqq/os/MqqHandler;
    //   1656: ifnull +17 -> 1673
    //   1659: aload 33
    //   1661: ifnull +12 -> 1673
    //   1664: aload_0
    //   1665: getfield 70	com/tencent/mobileqq/utils/httputils/HttpCommunicator:jdField_a_of_type_MqqOsMqqHandler	Lmqq/os/MqqHandler;
    //   1668: aload 33
    //   1670: invokevirtual 759	mqq/os/MqqHandler:removeCallbacks	(Ljava/lang/Runnable;)V
    //   1673: lload 18
    //   1675: lconst_0
    //   1676: ladd
    //   1677: lstore 16
    //   1679: lload 16
    //   1681: lconst_0
    //   1682: lcmp
    //   1683: ifeq +25 -> 1708
    //   1686: aload_1
    //   1687: invokevirtual 249	com/tencent/mobileqq/utils/httputils/HttpMsg:e	()Ljava/lang/String;
    //   1690: ldc -9
    //   1692: invokevirtual 211	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   1695: ifeq +64 -> 1759
    //   1698: iconst_1
    //   1699: istore_3
    //   1700: aload_0
    //   1701: aload_1
    //   1702: iload_3
    //   1703: lload 16
    //   1705: invokevirtual 762	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;ZJ)V
    //   1708: iconst_0
    //   1709: ifeq +11 -> 1720
    //   1712: new 764	java/lang/NullPointerException
    //   1715: dup
    //   1716: invokespecial 765	java/lang/NullPointerException:<init>	()V
    //   1719: athrow
    //   1720: iconst_0
    //   1721: ifeq +11 -> 1732
    //   1724: new 764	java/lang/NullPointerException
    //   1727: dup
    //   1728: invokespecial 765	java/lang/NullPointerException:<init>	()V
    //   1731: athrow
    //   1732: aload 32
    //   1734: ifnull +8 -> 1742
    //   1737: aload 32
    //   1739: invokevirtual 767	java/io/OutputStream:close	()V
    //   1742: aload 30
    //   1744: ifnull -796 -> 948
    //   1747: aload 30
    //   1749: invokevirtual 770	java/net/HttpURLConnection:disconnect	()V
    //   1752: return
    //   1753: astore_1
    //   1754: aload_1
    //   1755: invokevirtual 600	java/lang/Exception:printStackTrace	()V
    //   1758: return
    //   1759: iconst_0
    //   1760: istore_3
    //   1761: goto -61 -> 1700
    //   1764: aload 33
    //   1766: astore 40
    //   1768: iload 4
    //   1770: istore 5
    //   1772: lload 22
    //   1774: lstore 26
    //   1776: lload 18
    //   1778: lstore 28
    //   1780: aload 32
    //   1782: astore 41
    //   1784: aload 33
    //   1786: astore 36
    //   1788: iload 13
    //   1790: istore 6
    //   1792: iload 4
    //   1794: istore 9
    //   1796: lload 22
    //   1798: lstore 20
    //   1800: lload 18
    //   1802: lstore 24
    //   1804: aload 44
    //   1806: astore 37
    //   1808: aload 32
    //   1810: astore 38
    //   1812: aload 45
    //   1814: astore 39
    //   1816: aload_1
    //   1817: ldc_w 787
    //   1820: aload_1
    //   1821: invokevirtual 149	com/tencent/mobileqq/utils/httputils/HttpMsg:a	()Ljava/lang/String;
    //   1824: invokevirtual 789	com/tencent/mobileqq/utils/httputils/HttpMsg:a	(Ljava/lang/String;Ljava/lang/String;)V
    //   1827: aload 33
    //   1829: astore 40
    //   1831: iload 4
    //   1833: istore 5
    //   1835: lload 22
    //   1837: lstore 26
    //   1839: lload 18
    //   1841: lstore 28
    //   1843: aload 32
    //   1845: astore 41
    //   1847: aload 33
    //   1849: astore 36
    //   1851: iload 13
    //   1853: istore 6
    //   1855: iload 4
    //   1857: istore 9
    //   1859: lload 22
    //   1861: lstore 20
    //   1863: lload 18
    //   1865: lstore 24
    //   1867: aload 44
    //   1869: astore 37
    //   1871: aload 32
    //   1873: astore 38
    //   1875: aload 45
    //   1877: astore 39
    //   1879: aload_1
    //   1880: aload 31
    //   1882: invokevirtual 790	com/tencent/mobileqq/utils/httputils/HttpMsg:a	(Ljava/lang/String;)V
    //   1885: aload 33
    //   1887: astore 40
    //   1889: iload 4
    //   1891: istore 5
    //   1893: lload 22
    //   1895: lstore 26
    //   1897: lload 18
    //   1899: lstore 28
    //   1901: aload 32
    //   1903: astore 41
    //   1905: aload 33
    //   1907: astore 36
    //   1909: iload 13
    //   1911: istore 6
    //   1913: iload 4
    //   1915: istore 9
    //   1917: lload 22
    //   1919: lstore 20
    //   1921: lload 18
    //   1923: lstore 24
    //   1925: aload 44
    //   1927: astore 37
    //   1929: aload 32
    //   1931: astore 38
    //   1933: aload 45
    //   1935: astore 39
    //   1937: aload_1
    //   1938: ldc_w 792
    //   1941: invokevirtual 794	com/tencent/mobileqq/utils/httputils/HttpMsg:c	(Ljava/lang/String;)V
    //   1944: iload 7
    //   1946: iconst_1
    //   1947: iadd
    //   1948: istore 7
    //   1950: iconst_1
    //   1951: istore 14
    //   1953: aload 33
    //   1955: astore 35
    //   1957: lload 18
    //   1959: lstore 16
    //   1961: aload 32
    //   1963: astore 34
    //   1965: goto -1891 -> 74
    //   1968: aload 33
    //   1970: astore 40
    //   1972: iload 4
    //   1974: istore 5
    //   1976: lload 22
    //   1978: lstore 26
    //   1980: lload 18
    //   1982: lstore 28
    //   1984: aload 32
    //   1986: astore 41
    //   1988: aload 33
    //   1990: astore 36
    //   1992: iload 13
    //   1994: istore 6
    //   1996: iload 4
    //   1998: istore 9
    //   2000: lload 22
    //   2002: lstore 20
    //   2004: lload 18
    //   2006: lstore 24
    //   2008: aload 44
    //   2010: astore 37
    //   2012: aload 32
    //   2014: astore 38
    //   2016: aload 45
    //   2018: astore 39
    //   2020: new 476	java/io/IOException
    //   2023: dup
    //   2024: ldc_w 796
    //   2027: invokespecial 479	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   2030: athrow
    //   2031: astore 35
    //   2033: aconst_null
    //   2034: astore 34
    //   2036: aconst_null
    //   2037: astore 32
    //   2039: aload 41
    //   2041: astore 33
    //   2043: lload 28
    //   2045: lstore 18
    //   2047: lload 26
    //   2049: lstore 16
    //   2051: iconst_0
    //   2052: istore 6
    //   2054: aload 40
    //   2056: astore 31
    //   2058: iload 5
    //   2060: istore 4
    //   2062: iconst_1
    //   2063: istore_3
    //   2064: iload 6
    //   2066: istore 5
    //   2068: iconst_1
    //   2069: istore 6
    //   2071: aload 35
    //   2073: instanceof 476
    //   2076: istore 14
    //   2078: iload 14
    //   2080: ifeq +57 -> 2137
    //   2083: aload 30
    //   2085: ifnull +52 -> 2137
    //   2088: aconst_null
    //   2089: astore 37
    //   2091: aload 30
    //   2093: invokevirtual 800	java/net/HttpURLConnection:getErrorStream	()Ljava/io/InputStream;
    //   2096: astore 36
    //   2098: aload 36
    //   2100: astore 37
    //   2102: sipush 10240
    //   2105: newarray byte
    //   2107: astore 38
    //   2109: aload 36
    //   2111: astore 37
    //   2113: aload 36
    //   2115: aload 38
    //   2117: invokevirtual 806	java/io/InputStream:read	([B)I
    //   2120: istore 7
    //   2122: iload 7
    //   2124: ifgt -15 -> 2109
    //   2127: aload 36
    //   2129: ifnull +8 -> 2137
    //   2132: aload 36
    //   2134: invokevirtual 807	java/io/InputStream:close	()V
    //   2137: aload_0
    //   2138: iload_3
    //   2139: iload 4
    //   2141: aload 30
    //   2143: aload_1
    //   2144: aload 35
    //   2146: invokevirtual 810	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(ZILjava/net/HttpURLConnection;Lcom/tencent/mobileqq/utils/httputils/HttpMsg;Ljava/lang/Throwable;)V
    //   2149: iload_3
    //   2150: ifeq +48 -> 2198
    //   2153: iload 4
    //   2155: sipush 200
    //   2158: if_icmpeq +11 -> 2169
    //   2161: iload 4
    //   2163: sipush 206
    //   2166: if_icmpne +32 -> 2198
    //   2169: aload_0
    //   2170: aload_1
    //   2171: ldc_w 743
    //   2174: new 263	java/lang/StringBuilder
    //   2177: dup
    //   2178: invokespecial 264	java/lang/StringBuilder:<init>	()V
    //   2181: ldc_w 745
    //   2184: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2187: iload 5
    //   2189: invokevirtual 273	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   2192: invokevirtual 296	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2195: invokevirtual 299	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;Ljava/lang/String;Ljava/lang/String;)V
    //   2198: aload_2
    //   2199: ifnull +13 -> 2212
    //   2202: aload_2
    //   2203: getfield 721	spc:jdField_b_of_type_JavaUtilConcurrentAtomicAtomicBoolean	Ljava/util/concurrent/atomic/AtomicBoolean;
    //   2206: invokevirtual 724	java/util/concurrent/atomic/AtomicBoolean:get	()Z
    //   2209: ifne +101 -> 2310
    //   2212: aload_0
    //   2213: aload_1
    //   2214: ldc_w 747
    //   2217: new 263	java/lang/StringBuilder
    //   2220: dup
    //   2221: invokespecial 264	java/lang/StringBuilder:<init>	()V
    //   2224: ldc_w 749
    //   2227: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2230: aload_1
    //   2231: invokevirtual 751	com/tencent/mobileqq/utils/httputils/HttpMsg:d	()Ljava/lang/String;
    //   2234: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2237: ldc_w 753
    //   2240: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2243: aload_1
    //   2244: invokevirtual 755	com/tencent/mobileqq/utils/httputils/HttpMsg:c	()Ljava/lang/String;
    //   2247: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2250: invokevirtual 296	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2253: invokevirtual 299	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;Ljava/lang/String;Ljava/lang/String;)V
    //   2256: aload_1
    //   2257: getfield 812	com/tencent/mobileqq/utils/httputils/HttpMsg:h	I
    //   2260: sipush 56009
    //   2263: if_icmpne +47 -> 2310
    //   2266: aload_0
    //   2267: aload_1
    //   2268: ldc_w 814
    //   2271: new 263	java/lang/StringBuilder
    //   2274: dup
    //   2275: invokespecial 264	java/lang/StringBuilder:<init>	()V
    //   2278: ldc_w 778
    //   2281: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2284: aload_1
    //   2285: getfield 380	com/tencent/mobileqq/utils/httputils/HttpMsg:al	Ljava/lang/String;
    //   2288: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2291: ldc_w 780
    //   2294: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2297: aload_1
    //   2298: getfield 538	com/tencent/mobileqq/utils/httputils/HttpMsg:am	Ljava/lang/String;
    //   2301: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2304: invokevirtual 296	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2307: invokevirtual 299	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;Ljava/lang/String;Ljava/lang/String;)V
    //   2310: aload_0
    //   2311: getfield 70	com/tencent/mobileqq/utils/httputils/HttpCommunicator:jdField_a_of_type_MqqOsMqqHandler	Lmqq/os/MqqHandler;
    //   2314: ifnull +17 -> 2331
    //   2317: aload 31
    //   2319: ifnull +12 -> 2331
    //   2322: aload_0
    //   2323: getfield 70	com/tencent/mobileqq/utils/httputils/HttpCommunicator:jdField_a_of_type_MqqOsMqqHandler	Lmqq/os/MqqHandler;
    //   2326: aload 31
    //   2328: invokevirtual 759	mqq/os/MqqHandler:removeCallbacks	(Ljava/lang/Runnable;)V
    //   2331: lload 18
    //   2333: lload 16
    //   2335: ladd
    //   2336: lstore 16
    //   2338: lload 16
    //   2340: lconst_0
    //   2341: lcmp
    //   2342: ifeq +25 -> 2367
    //   2345: aload_1
    //   2346: invokevirtual 249	com/tencent/mobileqq/utils/httputils/HttpMsg:e	()Ljava/lang/String;
    //   2349: ldc -9
    //   2351: invokevirtual 211	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   2354: ifeq +4230 -> 6584
    //   2357: iconst_1
    //   2358: istore_3
    //   2359: aload_0
    //   2360: aload_1
    //   2361: iload_3
    //   2362: lload 16
    //   2364: invokevirtual 762	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;ZJ)V
    //   2367: aload 32
    //   2369: ifnull +8 -> 2377
    //   2372: aload 32
    //   2374: invokevirtual 817	java/io/ByteArrayOutputStream:close	()V
    //   2377: aload 34
    //   2379: ifnull +8 -> 2387
    //   2382: aload 34
    //   2384: invokevirtual 807	java/io/InputStream:close	()V
    //   2387: aload 33
    //   2389: ifnull +8 -> 2397
    //   2392: aload 33
    //   2394: invokevirtual 767	java/io/OutputStream:close	()V
    //   2397: iload 6
    //   2399: istore 4
    //   2401: aload 30
    //   2403: ifnull +12 -> 2415
    //   2406: aload 30
    //   2408: invokevirtual 770	java/net/HttpURLConnection:disconnect	()V
    //   2411: iload 6
    //   2413: istore 4
    //   2415: aload_2
    //   2416: ifnull +13 -> 2429
    //   2419: aload_2
    //   2420: getfield 721	spc:jdField_b_of_type_JavaUtilConcurrentAtomicAtomicBoolean	Ljava/util/concurrent/atomic/AtomicBoolean;
    //   2423: invokevirtual 724	java/util/concurrent/atomic/AtomicBoolean:get	()Z
    //   2426: ifne -1478 -> 948
    //   2429: aload_1
    //   2430: getfield 632	com/tencent/mobileqq/utils/httputils/HttpMsg:jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean	Ljava/util/concurrent/atomic/AtomicBoolean;
    //   2433: invokevirtual 724	java/util/concurrent/atomic/AtomicBoolean:get	()Z
    //   2436: ifne -1488 -> 948
    //   2439: iload 4
    //   2441: ifeq +4175 -> 6616
    //   2444: aload 48
    //   2446: aload_1
    //   2447: aload_1
    //   2448: invokeinterface 419 3 0
    //   2453: return
    //   2454: astore_2
    //   2455: aload_0
    //   2456: aload_1
    //   2457: ldc_w 819
    //   2460: aload_2
    //   2461: invokestatic 825	android/util/Log:getStackTraceString	(Ljava/lang/Throwable;)Ljava/lang/String;
    //   2464: invokevirtual 299	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;Ljava/lang/String;Ljava/lang/String;)V
    //   2467: return
    //   2468: aload 33
    //   2470: astore 40
    //   2472: iload 4
    //   2474: istore 5
    //   2476: lload 22
    //   2478: lstore 26
    //   2480: lload 18
    //   2482: lstore 28
    //   2484: aload 32
    //   2486: astore 41
    //   2488: aload 33
    //   2490: astore 36
    //   2492: iload 13
    //   2494: istore 6
    //   2496: iload 4
    //   2498: istore 9
    //   2500: lload 22
    //   2502: lstore 20
    //   2504: lload 18
    //   2506: lstore 24
    //   2508: aload 44
    //   2510: astore 37
    //   2512: aload 32
    //   2514: astore 38
    //   2516: aload 45
    //   2518: astore 39
    //   2520: new 142	java/lang/Exception
    //   2523: dup
    //   2524: ldc_w 827
    //   2527: invokespecial 444	java/lang/Exception:<init>	(Ljava/lang/String;)V
    //   2530: athrow
    //   2531: astore 31
    //   2533: iconst_0
    //   2534: istore 4
    //   2536: aload 39
    //   2538: astore 34
    //   2540: aload 38
    //   2542: astore 32
    //   2544: aload 37
    //   2546: astore 35
    //   2548: lload 24
    //   2550: lstore 16
    //   2552: iload 9
    //   2554: istore 5
    //   2556: iload 14
    //   2558: istore_3
    //   2559: aload 36
    //   2561: astore 33
    //   2563: iload_3
    //   2564: ifeq +48 -> 2612
    //   2567: iload 5
    //   2569: sipush 200
    //   2572: if_icmpeq +11 -> 2583
    //   2575: iload 5
    //   2577: sipush 206
    //   2580: if_icmpne +32 -> 2612
    //   2583: aload_0
    //   2584: aload_1
    //   2585: ldc_w 743
    //   2588: new 263	java/lang/StringBuilder
    //   2591: dup
    //   2592: invokespecial 264	java/lang/StringBuilder:<init>	()V
    //   2595: ldc_w 745
    //   2598: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2601: iload 6
    //   2603: invokevirtual 273	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   2606: invokevirtual 296	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2609: invokevirtual 299	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;Ljava/lang/String;Ljava/lang/String;)V
    //   2612: aload_2
    //   2613: ifnull +13 -> 2626
    //   2616: aload_2
    //   2617: getfield 721	spc:jdField_b_of_type_JavaUtilConcurrentAtomicAtomicBoolean	Ljava/util/concurrent/atomic/AtomicBoolean;
    //   2620: invokevirtual 724	java/util/concurrent/atomic/AtomicBoolean:get	()Z
    //   2623: ifne +106 -> 2729
    //   2626: aload_0
    //   2627: aload_1
    //   2628: ldc_w 747
    //   2631: new 263	java/lang/StringBuilder
    //   2634: dup
    //   2635: invokespecial 264	java/lang/StringBuilder:<init>	()V
    //   2638: ldc_w 749
    //   2641: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2644: aload_1
    //   2645: invokevirtual 751	com/tencent/mobileqq/utils/httputils/HttpMsg:d	()Ljava/lang/String;
    //   2648: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2651: ldc_w 753
    //   2654: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2657: aload_1
    //   2658: invokevirtual 755	com/tencent/mobileqq/utils/httputils/HttpMsg:c	()Ljava/lang/String;
    //   2661: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2664: invokevirtual 296	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2667: invokevirtual 299	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;Ljava/lang/String;Ljava/lang/String;)V
    //   2670: iload 4
    //   2672: ifeq +57 -> 2729
    //   2675: aload_1
    //   2676: getfield 812	com/tencent/mobileqq/utils/httputils/HttpMsg:h	I
    //   2679: sipush 56009
    //   2682: if_icmpne +47 -> 2729
    //   2685: aload_0
    //   2686: aload_1
    //   2687: ldc_w 814
    //   2690: new 263	java/lang/StringBuilder
    //   2693: dup
    //   2694: invokespecial 264	java/lang/StringBuilder:<init>	()V
    //   2697: ldc_w 778
    //   2700: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2703: aload_1
    //   2704: getfield 380	com/tencent/mobileqq/utils/httputils/HttpMsg:al	Ljava/lang/String;
    //   2707: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2710: ldc_w 780
    //   2713: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2716: aload_1
    //   2717: getfield 538	com/tencent/mobileqq/utils/httputils/HttpMsg:am	Ljava/lang/String;
    //   2720: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   2723: invokevirtual 296	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   2726: invokevirtual 299	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;Ljava/lang/String;Ljava/lang/String;)V
    //   2729: aload_0
    //   2730: getfield 70	com/tencent/mobileqq/utils/httputils/HttpCommunicator:jdField_a_of_type_MqqOsMqqHandler	Lmqq/os/MqqHandler;
    //   2733: ifnull +17 -> 2750
    //   2736: aload 33
    //   2738: ifnull +12 -> 2750
    //   2741: aload_0
    //   2742: getfield 70	com/tencent/mobileqq/utils/httputils/HttpCommunicator:jdField_a_of_type_MqqOsMqqHandler	Lmqq/os/MqqHandler;
    //   2745: aload 33
    //   2747: invokevirtual 759	mqq/os/MqqHandler:removeCallbacks	(Ljava/lang/Runnable;)V
    //   2750: lload 16
    //   2752: lload 20
    //   2754: ladd
    //   2755: lstore 16
    //   2757: lload 16
    //   2759: lconst_0
    //   2760: lcmp
    //   2761: ifeq +25 -> 2786
    //   2764: aload_1
    //   2765: invokevirtual 249	com/tencent/mobileqq/utils/httputils/HttpMsg:e	()Ljava/lang/String;
    //   2768: ldc -9
    //   2770: invokevirtual 211	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   2773: ifeq +3830 -> 6603
    //   2776: iconst_1
    //   2777: istore_3
    //   2778: aload_0
    //   2779: aload_1
    //   2780: iload_3
    //   2781: lload 16
    //   2783: invokevirtual 762	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;ZJ)V
    //   2786: aload 35
    //   2788: ifnull +8 -> 2796
    //   2791: aload 35
    //   2793: invokevirtual 817	java/io/ByteArrayOutputStream:close	()V
    //   2796: aload 34
    //   2798: ifnull +8 -> 2806
    //   2801: aload 34
    //   2803: invokevirtual 807	java/io/InputStream:close	()V
    //   2806: aload 32
    //   2808: ifnull +8 -> 2816
    //   2811: aload 32
    //   2813: invokevirtual 767	java/io/OutputStream:close	()V
    //   2816: aload 30
    //   2818: ifnull +8 -> 2826
    //   2821: aload 30
    //   2823: invokevirtual 770	java/net/HttpURLConnection:disconnect	()V
    //   2826: aload 31
    //   2828: athrow
    //   2829: aload 33
    //   2831: astore 40
    //   2833: iload 4
    //   2835: istore 5
    //   2837: lload 22
    //   2839: lstore 26
    //   2841: lload 18
    //   2843: lstore 28
    //   2845: aload 32
    //   2847: astore 41
    //   2849: aload 33
    //   2851: astore 36
    //   2853: iload 13
    //   2855: istore 6
    //   2857: iload 4
    //   2859: istore 9
    //   2861: lload 22
    //   2863: lstore 20
    //   2865: lload 18
    //   2867: lstore 24
    //   2869: aload 44
    //   2871: astore 37
    //   2873: aload 32
    //   2875: astore 38
    //   2877: aload 45
    //   2879: astore 39
    //   2881: aload_0
    //   2882: aload_1
    //   2883: aconst_null
    //   2884: iconst_2
    //   2885: iload_3
    //   2886: invokespecial 668	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;Lcom/tencent/mobileqq/utils/httputils/HttpMsg;IZ)V
    //   2889: iload 4
    //   2891: sipush 200
    //   2894: if_icmpeq +11 -> 2905
    //   2897: iload 4
    //   2899: sipush 206
    //   2902: if_icmpne +3541 -> 6443
    //   2905: aload 33
    //   2907: astore 40
    //   2909: iload 4
    //   2911: istore 5
    //   2913: lload 22
    //   2915: lstore 26
    //   2917: lload 18
    //   2919: lstore 28
    //   2921: aload 32
    //   2923: astore 41
    //   2925: aload 33
    //   2927: astore 36
    //   2929: iload 13
    //   2931: istore 6
    //   2933: iload 4
    //   2935: istore 9
    //   2937: lload 22
    //   2939: lstore 20
    //   2941: lload 18
    //   2943: lstore 24
    //   2945: aload 44
    //   2947: astore 37
    //   2949: aload 32
    //   2951: astore 38
    //   2953: aload 45
    //   2955: astore 39
    //   2957: aload 30
    //   2959: invokevirtual 530	java/net/HttpURLConnection:getContentType	()Ljava/lang/String;
    //   2962: astore 31
    //   2964: aload 31
    //   2966: ifnonnull +644 -> 3610
    //   2969: ldc_w 625
    //   2972: astore 31
    //   2974: iload_3
    //   2975: ifne +697 -> 3672
    //   2978: aload 33
    //   2980: astore 40
    //   2982: iload 4
    //   2984: istore 5
    //   2986: lload 22
    //   2988: lstore 26
    //   2990: lload 18
    //   2992: lstore 28
    //   2994: aload 32
    //   2996: astore 41
    //   2998: aload 33
    //   3000: astore 36
    //   3002: iload 13
    //   3004: istore 6
    //   3006: iload 4
    //   3008: istore 9
    //   3010: lload 22
    //   3012: lstore 20
    //   3014: lload 18
    //   3016: lstore 24
    //   3018: aload 44
    //   3020: astore 37
    //   3022: aload 32
    //   3024: astore 38
    //   3026: aload 45
    //   3028: astore 39
    //   3030: aload_1
    //   3031: getfield 828	com/tencent/mobileqq/utils/httputils/HttpMsg:jdField_b_of_type_Boolean	Z
    //   3034: ifeq +638 -> 3672
    //   3037: aload 33
    //   3039: astore 40
    //   3041: iload 4
    //   3043: istore 5
    //   3045: lload 22
    //   3047: lstore 26
    //   3049: lload 18
    //   3051: lstore 28
    //   3053: aload 32
    //   3055: astore 41
    //   3057: aload 33
    //   3059: astore 36
    //   3061: iload 13
    //   3063: istore 6
    //   3065: iload 4
    //   3067: istore 9
    //   3069: lload 22
    //   3071: lstore 20
    //   3073: lload 18
    //   3075: lstore 24
    //   3077: aload 44
    //   3079: astore 37
    //   3081: aload 32
    //   3083: astore 38
    //   3085: aload 45
    //   3087: astore 39
    //   3089: aload 31
    //   3091: ldc_w 830
    //   3094: invokevirtual 833	java/lang/String:indexOf	(Ljava/lang/String;)I
    //   3097: iconst_m1
    //   3098: if_icmpne +67 -> 3165
    //   3101: aload 33
    //   3103: astore 40
    //   3105: iload 4
    //   3107: istore 5
    //   3109: lload 22
    //   3111: lstore 26
    //   3113: lload 18
    //   3115: lstore 28
    //   3117: aload 32
    //   3119: astore 41
    //   3121: aload 33
    //   3123: astore 36
    //   3125: iload 13
    //   3127: istore 6
    //   3129: iload 4
    //   3131: istore 9
    //   3133: lload 22
    //   3135: lstore 20
    //   3137: lload 18
    //   3139: lstore 24
    //   3141: aload 44
    //   3143: astore 37
    //   3145: aload 32
    //   3147: astore 38
    //   3149: aload 45
    //   3151: astore 39
    //   3153: aload 31
    //   3155: ldc_w 835
    //   3158: invokevirtual 833	java/lang/String:indexOf	(Ljava/lang/String;)I
    //   3161: iconst_m1
    //   3162: if_icmpeq +510 -> 3672
    //   3165: aload 33
    //   3167: astore 40
    //   3169: iload 4
    //   3171: istore 5
    //   3173: lload 22
    //   3175: lstore 26
    //   3177: lload 18
    //   3179: lstore 28
    //   3181: aload 32
    //   3183: astore 41
    //   3185: aload 33
    //   3187: astore 36
    //   3189: iload 13
    //   3191: istore 6
    //   3193: iload 4
    //   3195: istore 9
    //   3197: lload 22
    //   3199: lstore 20
    //   3201: lload 18
    //   3203: lstore 24
    //   3205: aload 44
    //   3207: astore 37
    //   3209: aload 32
    //   3211: astore 38
    //   3213: aload 45
    //   3215: astore 39
    //   3217: invokestatic 100	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   3220: ifeq +122 -> 3342
    //   3223: aload 33
    //   3225: astore 40
    //   3227: iload 4
    //   3229: istore 5
    //   3231: lload 22
    //   3233: lstore 26
    //   3235: lload 18
    //   3237: lstore 28
    //   3239: aload 32
    //   3241: astore 41
    //   3243: aload 33
    //   3245: astore 36
    //   3247: iload 13
    //   3249: istore 6
    //   3251: iload 4
    //   3253: istore 9
    //   3255: lload 22
    //   3257: lstore 20
    //   3259: lload 18
    //   3261: lstore 24
    //   3263: aload 44
    //   3265: astore 37
    //   3267: aload 32
    //   3269: astore 38
    //   3271: aload 45
    //   3273: astore 39
    //   3275: invokestatic 100	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   3278: ifeq +64 -> 3342
    //   3281: aload 33
    //   3283: astore 40
    //   3285: iload 4
    //   3287: istore 5
    //   3289: lload 22
    //   3291: lstore 26
    //   3293: lload 18
    //   3295: lstore 28
    //   3297: aload 32
    //   3299: astore 41
    //   3301: aload 33
    //   3303: astore 36
    //   3305: iload 13
    //   3307: istore 6
    //   3309: iload 4
    //   3311: istore 9
    //   3313: lload 22
    //   3315: lstore 20
    //   3317: lload 18
    //   3319: lstore 24
    //   3321: aload 44
    //   3323: astore 37
    //   3325: aload 32
    //   3327: astore 38
    //   3329: aload 45
    //   3331: astore 39
    //   3333: ldc 19
    //   3335: iconst_2
    //   3336: ldc_w 837
    //   3339: invokestatic 411	com/tencent/qphone/base/util/QLog:e	(Ljava/lang/String;ILjava/lang/String;)V
    //   3342: aload 33
    //   3344: astore 40
    //   3346: iload 4
    //   3348: istore 5
    //   3350: lload 22
    //   3352: lstore 26
    //   3354: lload 18
    //   3356: lstore 28
    //   3358: aload 32
    //   3360: astore 41
    //   3362: aload 33
    //   3364: astore 36
    //   3366: iload 13
    //   3368: istore 6
    //   3370: iload 4
    //   3372: istore 9
    //   3374: lload 22
    //   3376: lstore 20
    //   3378: lload 18
    //   3380: lstore 24
    //   3382: aload 44
    //   3384: astore 37
    //   3386: aload 32
    //   3388: astore 38
    //   3390: aload 45
    //   3392: astore 39
    //   3394: aload_0
    //   3395: aload_1
    //   3396: aload_2
    //   3397: iconst_1
    //   3398: invokevirtual 839	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;Lspc;Z)V
    //   3401: iload 4
    //   3403: sipush 200
    //   3406: if_icmpeq +11 -> 3417
    //   3409: iload 4
    //   3411: sipush 206
    //   3414: if_icmpne +31 -> 3445
    //   3417: aload_0
    //   3418: aload_1
    //   3419: ldc_w 743
    //   3422: new 263	java/lang/StringBuilder
    //   3425: dup
    //   3426: invokespecial 264	java/lang/StringBuilder:<init>	()V
    //   3429: ldc_w 745
    //   3432: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3435: iconst_0
    //   3436: invokevirtual 273	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   3439: invokevirtual 296	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3442: invokevirtual 299	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;Ljava/lang/String;Ljava/lang/String;)V
    //   3445: aload_2
    //   3446: ifnull +13 -> 3459
    //   3449: aload_2
    //   3450: getfield 721	spc:jdField_b_of_type_JavaUtilConcurrentAtomicAtomicBoolean	Ljava/util/concurrent/atomic/AtomicBoolean;
    //   3453: invokevirtual 724	java/util/concurrent/atomic/AtomicBoolean:get	()Z
    //   3456: ifne +47 -> 3503
    //   3459: aload_0
    //   3460: aload_1
    //   3461: ldc_w 747
    //   3464: new 263	java/lang/StringBuilder
    //   3467: dup
    //   3468: invokespecial 264	java/lang/StringBuilder:<init>	()V
    //   3471: ldc_w 749
    //   3474: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3477: aload_1
    //   3478: invokevirtual 751	com/tencent/mobileqq/utils/httputils/HttpMsg:d	()Ljava/lang/String;
    //   3481: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3484: ldc_w 753
    //   3487: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3490: aload_1
    //   3491: invokevirtual 755	com/tencent/mobileqq/utils/httputils/HttpMsg:c	()Ljava/lang/String;
    //   3494: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3497: invokevirtual 296	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3500: invokevirtual 299	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;Ljava/lang/String;Ljava/lang/String;)V
    //   3503: aload_0
    //   3504: getfield 70	com/tencent/mobileqq/utils/httputils/HttpCommunicator:jdField_a_of_type_MqqOsMqqHandler	Lmqq/os/MqqHandler;
    //   3507: ifnull +17 -> 3524
    //   3510: aload 33
    //   3512: ifnull +12 -> 3524
    //   3515: aload_0
    //   3516: getfield 70	com/tencent/mobileqq/utils/httputils/HttpCommunicator:jdField_a_of_type_MqqOsMqqHandler	Lmqq/os/MqqHandler;
    //   3519: aload 33
    //   3521: invokevirtual 759	mqq/os/MqqHandler:removeCallbacks	(Ljava/lang/Runnable;)V
    //   3524: lload 18
    //   3526: lconst_0
    //   3527: ladd
    //   3528: lstore 16
    //   3530: lload 16
    //   3532: lconst_0
    //   3533: lcmp
    //   3534: ifeq +25 -> 3559
    //   3537: aload_1
    //   3538: invokevirtual 249	com/tencent/mobileqq/utils/httputils/HttpMsg:e	()Ljava/lang/String;
    //   3541: ldc -9
    //   3543: invokevirtual 211	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   3546: ifeq +3717 -> 7263
    //   3549: iconst_1
    //   3550: istore_3
    //   3551: aload_0
    //   3552: aload_1
    //   3553: iload_3
    //   3554: lload 16
    //   3556: invokevirtual 762	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;ZJ)V
    //   3559: iconst_0
    //   3560: ifeq +11 -> 3571
    //   3563: new 764	java/lang/NullPointerException
    //   3566: dup
    //   3567: invokespecial 765	java/lang/NullPointerException:<init>	()V
    //   3570: athrow
    //   3571: iconst_0
    //   3572: ifeq +11 -> 3583
    //   3575: new 764	java/lang/NullPointerException
    //   3578: dup
    //   3579: invokespecial 765	java/lang/NullPointerException:<init>	()V
    //   3582: athrow
    //   3583: aload 32
    //   3585: ifnull +8 -> 3593
    //   3588: aload 32
    //   3590: invokevirtual 767	java/io/OutputStream:close	()V
    //   3593: aload 30
    //   3595: ifnull -2647 -> 948
    //   3598: aload 30
    //   3600: invokevirtual 770	java/net/HttpURLConnection:disconnect	()V
    //   3603: return
    //   3604: astore_1
    //   3605: aload_1
    //   3606: invokevirtual 600	java/lang/Exception:printStackTrace	()V
    //   3609: return
    //   3610: aload 33
    //   3612: astore 40
    //   3614: iload 4
    //   3616: istore 5
    //   3618: lload 22
    //   3620: lstore 26
    //   3622: lload 18
    //   3624: lstore 28
    //   3626: aload 32
    //   3628: astore 41
    //   3630: aload 33
    //   3632: astore 36
    //   3634: iload 13
    //   3636: istore 6
    //   3638: iload 4
    //   3640: istore 9
    //   3642: lload 22
    //   3644: lstore 20
    //   3646: lload 18
    //   3648: lstore 24
    //   3650: aload 44
    //   3652: astore 37
    //   3654: aload 32
    //   3656: astore 38
    //   3658: aload 45
    //   3660: astore 39
    //   3662: aload 31
    //   3664: invokevirtual 842	java/lang/String:toLowerCase	()Ljava/lang/String;
    //   3667: astore 31
    //   3669: goto -695 -> 2974
    //   3672: aload 33
    //   3674: astore 40
    //   3676: iload 4
    //   3678: istore 5
    //   3680: lload 22
    //   3682: lstore 26
    //   3684: lload 18
    //   3686: lstore 28
    //   3688: aload 32
    //   3690: astore 41
    //   3692: aload 33
    //   3694: astore 36
    //   3696: iload 13
    //   3698: istore 6
    //   3700: iload 4
    //   3702: istore 9
    //   3704: lload 22
    //   3706: lstore 20
    //   3708: lload 18
    //   3710: lstore 24
    //   3712: aload 44
    //   3714: astore 37
    //   3716: aload 32
    //   3718: astore 38
    //   3720: aload 45
    //   3722: astore 39
    //   3724: aload_1
    //   3725: getfield 845	com/tencent/mobileqq/utils/httputils/HttpMsg:aj	Ljava/lang/String;
    //   3728: ifnull +435 -> 4163
    //   3731: aload 33
    //   3733: astore 40
    //   3735: iload 4
    //   3737: istore 5
    //   3739: lload 22
    //   3741: lstore 26
    //   3743: lload 18
    //   3745: lstore 28
    //   3747: aload 32
    //   3749: astore 41
    //   3751: aload 33
    //   3753: astore 36
    //   3755: iload 13
    //   3757: istore 6
    //   3759: iload 4
    //   3761: istore 9
    //   3763: lload 22
    //   3765: lstore 20
    //   3767: lload 18
    //   3769: lstore 24
    //   3771: aload 44
    //   3773: astore 37
    //   3775: aload 32
    //   3777: astore 38
    //   3779: aload 45
    //   3781: astore 39
    //   3783: aload_1
    //   3784: getfield 845	com/tencent/mobileqq/utils/httputils/HttpMsg:aj	Ljava/lang/String;
    //   3787: invokevirtual 848	java/lang/String:isEmpty	()Z
    //   3790: ifne +373 -> 4163
    //   3793: aload 33
    //   3795: astore 40
    //   3797: iload 4
    //   3799: istore 5
    //   3801: lload 22
    //   3803: lstore 26
    //   3805: lload 18
    //   3807: lstore 28
    //   3809: aload 32
    //   3811: astore 41
    //   3813: aload 33
    //   3815: astore 36
    //   3817: iload 13
    //   3819: istore 6
    //   3821: iload 4
    //   3823: istore 9
    //   3825: lload 22
    //   3827: lstore 20
    //   3829: lload 18
    //   3831: lstore 24
    //   3833: aload 44
    //   3835: astore 37
    //   3837: aload 32
    //   3839: astore 38
    //   3841: aload 45
    //   3843: astore 39
    //   3845: aload 31
    //   3847: invokevirtual 848	java/lang/String:isEmpty	()Z
    //   3850: ifne +313 -> 4163
    //   3853: aload 33
    //   3855: astore 40
    //   3857: iload 4
    //   3859: istore 5
    //   3861: lload 22
    //   3863: lstore 26
    //   3865: lload 18
    //   3867: lstore 28
    //   3869: aload 32
    //   3871: astore 41
    //   3873: aload 33
    //   3875: astore 36
    //   3877: iload 13
    //   3879: istore 6
    //   3881: iload 4
    //   3883: istore 9
    //   3885: lload 22
    //   3887: lstore 20
    //   3889: lload 18
    //   3891: lstore 24
    //   3893: aload 44
    //   3895: astore 37
    //   3897: aload 32
    //   3899: astore 38
    //   3901: aload 45
    //   3903: astore 39
    //   3905: aload 31
    //   3907: aload_1
    //   3908: getfield 845	com/tencent/mobileqq/utils/httputils/HttpMsg:aj	Ljava/lang/String;
    //   3911: invokevirtual 852	java/lang/String:contains	(Ljava/lang/CharSequence;)Z
    //   3914: ifne +249 -> 4163
    //   3917: aload 33
    //   3919: astore 40
    //   3921: iload 4
    //   3923: istore 5
    //   3925: lload 22
    //   3927: lstore 26
    //   3929: lload 18
    //   3931: lstore 28
    //   3933: aload 32
    //   3935: astore 41
    //   3937: aload 33
    //   3939: astore 36
    //   3941: iload 13
    //   3943: istore 6
    //   3945: iload 4
    //   3947: istore 9
    //   3949: lload 22
    //   3951: lstore 20
    //   3953: lload 18
    //   3955: lstore 24
    //   3957: aload 44
    //   3959: astore 37
    //   3961: aload 32
    //   3963: astore 38
    //   3965: aload 45
    //   3967: astore 39
    //   3969: invokestatic 100	com/tencent/qphone/base/util/QLog:isColorLevel	()Z
    //   3972: ifeq +97 -> 4069
    //   3975: aload 33
    //   3977: astore 40
    //   3979: iload 4
    //   3981: istore 5
    //   3983: lload 22
    //   3985: lstore 26
    //   3987: lload 18
    //   3989: lstore 28
    //   3991: aload 32
    //   3993: astore 41
    //   3995: aload 33
    //   3997: astore 36
    //   3999: iload 13
    //   4001: istore 6
    //   4003: iload 4
    //   4005: istore 9
    //   4007: lload 22
    //   4009: lstore 20
    //   4011: lload 18
    //   4013: lstore 24
    //   4015: aload 44
    //   4017: astore 37
    //   4019: aload 32
    //   4021: astore 38
    //   4023: aload 45
    //   4025: astore 39
    //   4027: aload_0
    //   4028: aload_1
    //   4029: ldc_w 854
    //   4032: new 263	java/lang/StringBuilder
    //   4035: dup
    //   4036: invokespecial 264	java/lang/StringBuilder:<init>	()V
    //   4039: ldc_w 856
    //   4042: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4045: aload 31
    //   4047: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4050: ldc_w 858
    //   4053: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4056: aload_1
    //   4057: getfield 845	com/tencent/mobileqq/utils/httputils/HttpMsg:aj	Ljava/lang/String;
    //   4060: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4063: invokevirtual 296	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4066: invokevirtual 299	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;Ljava/lang/String;Ljava/lang/String;)V
    //   4069: aload 33
    //   4071: astore 40
    //   4073: iload 4
    //   4075: istore 5
    //   4077: lload 22
    //   4079: lstore 26
    //   4081: lload 18
    //   4083: lstore 28
    //   4085: aload 32
    //   4087: astore 41
    //   4089: aload 33
    //   4091: astore 36
    //   4093: iload 13
    //   4095: istore 6
    //   4097: iload 4
    //   4099: istore 9
    //   4101: lload 22
    //   4103: lstore 20
    //   4105: lload 18
    //   4107: lstore 24
    //   4109: aload 44
    //   4111: astore 37
    //   4113: aload 32
    //   4115: astore 38
    //   4117: aload 45
    //   4119: astore 39
    //   4121: new 476	java/io/IOException
    //   4124: dup
    //   4125: new 263	java/lang/StringBuilder
    //   4128: dup
    //   4129: invokespecial 264	java/lang/StringBuilder:<init>	()V
    //   4132: ldc_w 860
    //   4135: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4138: aload_1
    //   4139: getfield 845	com/tencent/mobileqq/utils/httputils/HttpMsg:aj	Ljava/lang/String;
    //   4142: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4145: ldc_w 862
    //   4148: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4151: aload 31
    //   4153: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4156: invokevirtual 296	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4159: invokespecial 479	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   4162: athrow
    //   4163: aload 33
    //   4165: astore 40
    //   4167: iload 4
    //   4169: istore 5
    //   4171: lload 22
    //   4173: lstore 26
    //   4175: lload 18
    //   4177: lstore 28
    //   4179: aload 32
    //   4181: astore 41
    //   4183: aload 33
    //   4185: astore 36
    //   4187: iload 13
    //   4189: istore 6
    //   4191: iload 4
    //   4193: istore 9
    //   4195: lload 22
    //   4197: lstore 20
    //   4199: lload 18
    //   4201: lstore 24
    //   4203: aload 44
    //   4205: astore 37
    //   4207: aload 32
    //   4209: astore 38
    //   4211: aload 45
    //   4213: astore 39
    //   4215: aload_1
    //   4216: getfield 564	com/tencent/mobileqq/utils/httputils/HttpMsg:jdField_a_of_type_Long	J
    //   4219: lconst_0
    //   4220: lcmp
    //   4221: ifne +129 -> 4350
    //   4224: aload 33
    //   4226: astore 40
    //   4228: iload 4
    //   4230: istore 5
    //   4232: lload 22
    //   4234: lstore 26
    //   4236: lload 18
    //   4238: lstore 28
    //   4240: aload 32
    //   4242: astore 41
    //   4244: aload 33
    //   4246: astore 36
    //   4248: iload 13
    //   4250: istore 6
    //   4252: iload 4
    //   4254: istore 9
    //   4256: lload 22
    //   4258: lstore 20
    //   4260: lload 18
    //   4262: lstore 24
    //   4264: aload 44
    //   4266: astore 37
    //   4268: aload 32
    //   4270: astore 38
    //   4272: aload 45
    //   4274: astore 39
    //   4276: aload_1
    //   4277: invokevirtual 249	com/tencent/mobileqq/utils/httputils/HttpMsg:e	()Ljava/lang/String;
    //   4280: ldc -9
    //   4282: invokevirtual 211	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   4285: ifne +65 -> 4350
    //   4288: aload 33
    //   4290: astore 40
    //   4292: iload 4
    //   4294: istore 5
    //   4296: lload 22
    //   4298: lstore 26
    //   4300: lload 18
    //   4302: lstore 28
    //   4304: aload 32
    //   4306: astore 41
    //   4308: aload 33
    //   4310: astore 36
    //   4312: iload 13
    //   4314: istore 6
    //   4316: iload 4
    //   4318: istore 9
    //   4320: lload 22
    //   4322: lstore 20
    //   4324: lload 18
    //   4326: lstore 24
    //   4328: aload 44
    //   4330: astore 37
    //   4332: aload 32
    //   4334: astore 38
    //   4336: aload 45
    //   4338: astore 39
    //   4340: new 476	java/io/IOException
    //   4343: dup
    //   4344: ldc 22
    //   4346: invokespecial 479	java/io/IOException:<init>	(Ljava/lang/String;)V
    //   4349: athrow
    //   4350: aload 33
    //   4352: astore 40
    //   4354: iload 4
    //   4356: istore 5
    //   4358: lload 22
    //   4360: lstore 26
    //   4362: lload 18
    //   4364: lstore 28
    //   4366: aload 32
    //   4368: astore 41
    //   4370: aload 33
    //   4372: astore 36
    //   4374: iload 13
    //   4376: istore 6
    //   4378: iload 4
    //   4380: istore 9
    //   4382: lload 22
    //   4384: lstore 20
    //   4386: lload 18
    //   4388: lstore 24
    //   4390: aload 44
    //   4392: astore 37
    //   4394: aload 32
    //   4396: astore 38
    //   4398: aload 45
    //   4400: astore 39
    //   4402: aload_0
    //   4403: aload_1
    //   4404: ldc_w 864
    //   4407: new 263	java/lang/StringBuilder
    //   4410: dup
    //   4411: invokespecial 264	java/lang/StringBuilder:<init>	()V
    //   4414: ldc_w 866
    //   4417: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   4420: aload_1
    //   4421: getfield 564	com/tencent/mobileqq/utils/httputils/HttpMsg:jdField_a_of_type_Long	J
    //   4424: invokevirtual 595	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   4427: invokevirtual 296	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   4430: invokevirtual 299	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;Ljava/lang/String;Ljava/lang/String;)V
    //   4433: aload 33
    //   4435: astore 40
    //   4437: iload 4
    //   4439: istore 5
    //   4441: lload 22
    //   4443: lstore 26
    //   4445: lload 18
    //   4447: lstore 28
    //   4449: aload 32
    //   4451: astore 41
    //   4453: aload 33
    //   4455: astore 36
    //   4457: iload 13
    //   4459: istore 6
    //   4461: iload 4
    //   4463: istore 9
    //   4465: lload 22
    //   4467: lstore 20
    //   4469: lload 18
    //   4471: lstore 24
    //   4473: aload 44
    //   4475: astore 37
    //   4477: aload 32
    //   4479: astore 38
    //   4481: aload 45
    //   4483: astore 39
    //   4485: aload_1
    //   4486: getfield 680	com/tencent/mobileqq/utils/httputils/HttpMsg:jdField_d_of_type_Long	J
    //   4489: lconst_0
    //   4490: lcmp
    //   4491: ifeq +67 -> 4558
    //   4494: aload 33
    //   4496: astore 40
    //   4498: iload 4
    //   4500: istore 5
    //   4502: lload 22
    //   4504: lstore 26
    //   4506: lload 18
    //   4508: lstore 28
    //   4510: aload 32
    //   4512: astore 41
    //   4514: aload 33
    //   4516: astore 36
    //   4518: iload 13
    //   4520: istore 6
    //   4522: iload 4
    //   4524: istore 9
    //   4526: lload 22
    //   4528: lstore 20
    //   4530: lload 18
    //   4532: lstore 24
    //   4534: aload 44
    //   4536: astore 37
    //   4538: aload 32
    //   4540: astore 38
    //   4542: aload 45
    //   4544: astore 39
    //   4546: aload_1
    //   4547: invokestatic 427	android/os/SystemClock:uptimeMillis	()J
    //   4550: aload_1
    //   4551: getfield 680	com/tencent/mobileqq/utils/httputils/HttpMsg:jdField_d_of_type_Long	J
    //   4554: lsub
    //   4555: putfield 868	com/tencent/mobileqq/utils/httputils/HttpMsg:jdField_e_of_type_Long	J
    //   4558: aload 33
    //   4560: astore 40
    //   4562: iload 4
    //   4564: istore 5
    //   4566: lload 22
    //   4568: lstore 26
    //   4570: lload 18
    //   4572: lstore 28
    //   4574: aload 32
    //   4576: astore 41
    //   4578: aload 33
    //   4580: astore 36
    //   4582: iload 13
    //   4584: istore 6
    //   4586: iload 4
    //   4588: istore 9
    //   4590: lload 22
    //   4592: lstore 20
    //   4594: lload 18
    //   4596: lstore 24
    //   4598: aload 44
    //   4600: astore 37
    //   4602: aload 32
    //   4604: astore 38
    //   4606: aload 45
    //   4608: astore 39
    //   4610: aload 48
    //   4612: aload_1
    //   4613: aload_1
    //   4614: iconst_3
    //   4615: invokeinterface 406 4 0
    //   4620: ifeq +2627 -> 7247
    //   4623: lconst_0
    //   4624: ldc2_w 735
    //   4627: ladd
    //   4628: lstore 16
    //   4630: aload 33
    //   4632: astore 40
    //   4634: iload 4
    //   4636: istore 5
    //   4638: lload 16
    //   4640: lstore 26
    //   4642: lload 18
    //   4644: lstore 28
    //   4646: aload 32
    //   4648: astore 41
    //   4650: aload 33
    //   4652: astore 36
    //   4654: iload 13
    //   4656: istore 6
    //   4658: iload 4
    //   4660: istore 9
    //   4662: lload 16
    //   4664: lstore 20
    //   4666: lload 18
    //   4668: lstore 24
    //   4670: aload 44
    //   4672: astore 37
    //   4674: aload 32
    //   4676: astore 38
    //   4678: aload 45
    //   4680: astore 39
    //   4682: aload 30
    //   4684: invokevirtual 871	java/net/HttpURLConnection:getInputStream	()Ljava/io/InputStream;
    //   4687: astore 31
    //   4689: aload 33
    //   4691: astore 36
    //   4693: iload 13
    //   4695: istore 6
    //   4697: iload 4
    //   4699: istore 9
    //   4701: lload 16
    //   4703: lstore 20
    //   4705: lload 18
    //   4707: lstore 24
    //   4709: aload 44
    //   4711: astore 37
    //   4713: aload 32
    //   4715: astore 38
    //   4717: aload 31
    //   4719: astore 39
    //   4721: invokestatic 877	com/tencent/commonsdk/pool/ByteArrayPool:getGenericInstance	()Lcom/tencent/commonsdk/pool/ByteArrayPool;
    //   4724: astore 40
    //   4726: aload 33
    //   4728: astore 36
    //   4730: iload 13
    //   4732: istore 6
    //   4734: iload 4
    //   4736: istore 9
    //   4738: lload 16
    //   4740: lstore 20
    //   4742: lload 18
    //   4744: lstore 24
    //   4746: aload 44
    //   4748: astore 37
    //   4750: aload 32
    //   4752: astore 38
    //   4754: aload 31
    //   4756: astore 39
    //   4758: invokestatic 880	com/tencent/commonsdk/pool/ByteArrayPool:getMaxBufInstance	()Lcom/tencent/commonsdk/pool/ByteArrayPool;
    //   4761: astore 34
    //   4763: aload 33
    //   4765: astore 36
    //   4767: iload 13
    //   4769: istore 6
    //   4771: iload 4
    //   4773: istore 9
    //   4775: lload 16
    //   4777: lstore 20
    //   4779: lload 18
    //   4781: lstore 24
    //   4783: aload 44
    //   4785: astore 37
    //   4787: aload 32
    //   4789: astore 38
    //   4791: aload 31
    //   4793: astore 39
    //   4795: aload_1
    //   4796: getfield 882	com/tencent/mobileqq/utils/httputils/HttpMsg:jdField_e_of_type_Boolean	Z
    //   4799: ifeq +536 -> 5335
    //   4802: aload 33
    //   4804: astore 36
    //   4806: iload 13
    //   4808: istore 6
    //   4810: iload 4
    //   4812: istore 9
    //   4814: lload 16
    //   4816: lstore 20
    //   4818: lload 18
    //   4820: lstore 24
    //   4822: aload 44
    //   4824: astore 37
    //   4826: aload 32
    //   4828: astore 38
    //   4830: aload 31
    //   4832: astore 39
    //   4834: aload_1
    //   4835: invokevirtual 884	com/tencent/mobileqq/utils/httputils/HttpMsg:a	()Z
    //   4838: ifne +497 -> 5335
    //   4841: aload 33
    //   4843: astore 36
    //   4845: iload 13
    //   4847: istore 6
    //   4849: iload 4
    //   4851: istore 9
    //   4853: lload 16
    //   4855: lstore 20
    //   4857: lload 18
    //   4859: lstore 24
    //   4861: aload 44
    //   4863: astore 37
    //   4865: aload 32
    //   4867: astore 38
    //   4869: aload 31
    //   4871: astore 39
    //   4873: new 886	com/tencent/mobileqq/utils/PoolingByteArrayOutputStream
    //   4876: dup
    //   4877: aload 34
    //   4879: aload_1
    //   4880: getfield 564	com/tencent/mobileqq/utils/httputils/HttpMsg:jdField_a_of_type_Long	J
    //   4883: l2i
    //   4884: invokespecial 889	com/tencent/mobileqq/utils/PoolingByteArrayOutputStream:<init>	(Lcom/tencent/commonsdk/pool/ByteArrayPool;I)V
    //   4887: astore 34
    //   4889: aload 33
    //   4891: astore 36
    //   4893: iload 13
    //   4895: istore 6
    //   4897: iload 4
    //   4899: istore 9
    //   4901: lload 16
    //   4903: lstore 20
    //   4905: lload 18
    //   4907: lstore 24
    //   4909: aload 34
    //   4911: astore 37
    //   4913: aload 32
    //   4915: astore 38
    //   4917: aload 31
    //   4919: astore 39
    //   4921: iload 12
    //   4923: istore 7
    //   4925: lload 16
    //   4927: lstore 22
    //   4929: aload_1
    //   4930: getfield 882	com/tencent/mobileqq/utils/httputils/HttpMsg:jdField_e_of_type_Boolean	Z
    //   4933: ifeq +446 -> 5379
    //   4936: aload 33
    //   4938: astore 36
    //   4940: iload 13
    //   4942: istore 6
    //   4944: iload 4
    //   4946: istore 9
    //   4948: lload 16
    //   4950: lstore 20
    //   4952: lload 18
    //   4954: lstore 24
    //   4956: aload 34
    //   4958: astore 37
    //   4960: aload 32
    //   4962: astore 38
    //   4964: aload 31
    //   4966: astore 39
    //   4968: iload 12
    //   4970: istore 7
    //   4972: lload 16
    //   4974: lstore 22
    //   4976: aload 40
    //   4978: sipush 10240
    //   4981: invokevirtual 893	com/tencent/commonsdk/pool/ByteArrayPool:getBuf	(I)[B
    //   4984: astore 35
    //   4986: goto +2282 -> 7268
    //   4989: aload 33
    //   4991: astore 36
    //   4993: iload 5
    //   4995: istore 6
    //   4997: iload 4
    //   4999: istore 9
    //   5001: lload 16
    //   5003: lstore 20
    //   5005: lload 18
    //   5007: lstore 24
    //   5009: aload 34
    //   5011: astore 37
    //   5013: aload 32
    //   5015: astore 38
    //   5017: aload 31
    //   5019: astore 39
    //   5021: iload 5
    //   5023: istore 7
    //   5025: lload 16
    //   5027: lstore 22
    //   5029: aload 31
    //   5031: aload 35
    //   5033: iload 8
    //   5035: aload 35
    //   5037: arraylength
    //   5038: iload 8
    //   5040: isub
    //   5041: invokevirtual 896	java/io/InputStream:read	([BII)I
    //   5044: istore 10
    //   5046: iload 10
    //   5048: ifle +442 -> 5490
    //   5051: aload 33
    //   5053: astore 36
    //   5055: iload 5
    //   5057: istore 6
    //   5059: iload 4
    //   5061: istore 9
    //   5063: lload 16
    //   5065: lstore 20
    //   5067: lload 18
    //   5069: lstore 24
    //   5071: aload 34
    //   5073: astore 37
    //   5075: aload 32
    //   5077: astore 38
    //   5079: aload 31
    //   5081: astore 39
    //   5083: iload 5
    //   5085: istore 7
    //   5087: lload 16
    //   5089: lstore 22
    //   5091: aload_0
    //   5092: aload_2
    //   5093: aload_1
    //   5094: invokevirtual 673	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lspc;Lcom/tencent/mobileqq/utils/httputils/HttpMsg;)V
    //   5097: lload 16
    //   5099: iload 10
    //   5101: i2l
    //   5102: ladd
    //   5103: lstore 26
    //   5105: iload 8
    //   5107: iload 10
    //   5109: iadd
    //   5110: istore 11
    //   5112: iload 5
    //   5114: iload 10
    //   5116: iadd
    //   5117: istore 10
    //   5119: aload 33
    //   5121: astore 36
    //   5123: iload 10
    //   5125: istore 6
    //   5127: iload 4
    //   5129: istore 9
    //   5131: lload 26
    //   5133: lstore 20
    //   5135: lload 18
    //   5137: lstore 24
    //   5139: aload 34
    //   5141: astore 37
    //   5143: aload 32
    //   5145: astore 38
    //   5147: aload 31
    //   5149: astore 39
    //   5151: iload 10
    //   5153: istore 5
    //   5155: iload 11
    //   5157: istore 8
    //   5159: lload 26
    //   5161: lstore 16
    //   5163: iload 10
    //   5165: istore 7
    //   5167: lload 26
    //   5169: lstore 22
    //   5171: iload 11
    //   5173: aload 35
    //   5175: arraylength
    //   5176: if_icmplt -187 -> 4989
    //   5179: aload 33
    //   5181: astore 36
    //   5183: iload 10
    //   5185: istore 6
    //   5187: iload 4
    //   5189: istore 9
    //   5191: lload 26
    //   5193: lstore 20
    //   5195: lload 18
    //   5197: lstore 24
    //   5199: aload 34
    //   5201: astore 37
    //   5203: aload 32
    //   5205: astore 38
    //   5207: aload 31
    //   5209: astore 39
    //   5211: iload 10
    //   5213: istore 7
    //   5215: lload 26
    //   5217: lstore 22
    //   5219: aload_1
    //   5220: invokevirtual 884	com/tencent/mobileqq/utils/httputils/HttpMsg:a	()Z
    //   5223: ifeq +206 -> 5429
    //   5226: aload 33
    //   5228: astore 36
    //   5230: iload 10
    //   5232: istore 6
    //   5234: iload 4
    //   5236: istore 9
    //   5238: lload 26
    //   5240: lstore 20
    //   5242: lload 18
    //   5244: lstore 24
    //   5246: aload 34
    //   5248: astore 37
    //   5250: aload 32
    //   5252: astore 38
    //   5254: aload 31
    //   5256: astore 39
    //   5258: iload 10
    //   5260: istore 7
    //   5262: lload 26
    //   5264: lstore 22
    //   5266: aload_1
    //   5267: aload 35
    //   5269: invokevirtual 899	com/tencent/mobileqq/utils/httputils/HttpMsg:a	([B)V
    //   5272: aload 33
    //   5274: astore 36
    //   5276: iload 10
    //   5278: istore 6
    //   5280: iload 4
    //   5282: istore 9
    //   5284: lload 26
    //   5286: lstore 20
    //   5288: lload 18
    //   5290: lstore 24
    //   5292: aload 34
    //   5294: astore 37
    //   5296: aload 32
    //   5298: astore 38
    //   5300: aload 31
    //   5302: astore 39
    //   5304: iload 10
    //   5306: istore 7
    //   5308: lload 26
    //   5310: lstore 22
    //   5312: aload 48
    //   5314: aload_1
    //   5315: aload_1
    //   5316: invokeinterface 901 3 0
    //   5321: iconst_0
    //   5322: istore 8
    //   5324: iload 10
    //   5326: istore 5
    //   5328: lload 26
    //   5330: lstore 16
    //   5332: goto -343 -> 4989
    //   5335: aload 33
    //   5337: astore 36
    //   5339: iload 13
    //   5341: istore 6
    //   5343: iload 4
    //   5345: istore 9
    //   5347: lload 16
    //   5349: lstore 20
    //   5351: lload 18
    //   5353: lstore 24
    //   5355: aload 44
    //   5357: astore 37
    //   5359: aload 32
    //   5361: astore 38
    //   5363: aload 31
    //   5365: astore 39
    //   5367: new 816	java/io/ByteArrayOutputStream
    //   5370: dup
    //   5371: invokespecial 902	java/io/ByteArrayOutputStream:<init>	()V
    //   5374: astore 34
    //   5376: goto -487 -> 4889
    //   5379: aload 33
    //   5381: astore 36
    //   5383: iload 13
    //   5385: istore 6
    //   5387: iload 4
    //   5389: istore 9
    //   5391: lload 16
    //   5393: lstore 20
    //   5395: lload 18
    //   5397: lstore 24
    //   5399: aload 34
    //   5401: astore 37
    //   5403: aload 32
    //   5405: astore 38
    //   5407: aload 31
    //   5409: astore 39
    //   5411: iload 12
    //   5413: istore 7
    //   5415: lload 16
    //   5417: lstore 22
    //   5419: sipush 10240
    //   5422: newarray byte
    //   5424: astore 35
    //   5426: goto +1842 -> 7268
    //   5429: aload 33
    //   5431: astore 36
    //   5433: iload 10
    //   5435: istore 6
    //   5437: iload 4
    //   5439: istore 9
    //   5441: lload 26
    //   5443: lstore 20
    //   5445: lload 18
    //   5447: lstore 24
    //   5449: aload 34
    //   5451: astore 37
    //   5453: aload 32
    //   5455: astore 38
    //   5457: aload 31
    //   5459: astore 39
    //   5461: iload 10
    //   5463: istore 7
    //   5465: lload 26
    //   5467: lstore 22
    //   5469: aload 34
    //   5471: aload 35
    //   5473: invokevirtual 904	java/io/ByteArrayOutputStream:write	([B)V
    //   5476: iconst_0
    //   5477: istore 8
    //   5479: iload 10
    //   5481: istore 5
    //   5483: lload 26
    //   5485: lstore 16
    //   5487: goto -498 -> 4989
    //   5490: aload 33
    //   5492: astore 36
    //   5494: iload 5
    //   5496: istore 6
    //   5498: iload 4
    //   5500: istore 9
    //   5502: lload 16
    //   5504: lstore 20
    //   5506: lload 18
    //   5508: lstore 24
    //   5510: aload 34
    //   5512: astore 37
    //   5514: aload 32
    //   5516: astore 38
    //   5518: aload 31
    //   5520: astore 39
    //   5522: iload 5
    //   5524: istore 7
    //   5526: lload 16
    //   5528: lstore 22
    //   5530: aload_1
    //   5531: invokevirtual 884	com/tencent/mobileqq/utils/httputils/HttpMsg:a	()Z
    //   5534: ifeq +669 -> 6203
    //   5537: iload 8
    //   5539: ifle +195 -> 5734
    //   5542: aload 33
    //   5544: astore 36
    //   5546: iload 5
    //   5548: istore 6
    //   5550: iload 4
    //   5552: istore 9
    //   5554: lload 16
    //   5556: lstore 20
    //   5558: lload 18
    //   5560: lstore 24
    //   5562: aload 34
    //   5564: astore 37
    //   5566: aload 32
    //   5568: astore 38
    //   5570: aload 31
    //   5572: astore 39
    //   5574: iload 5
    //   5576: istore 7
    //   5578: lload 16
    //   5580: lstore 22
    //   5582: iload 8
    //   5584: newarray byte
    //   5586: astore 41
    //   5588: aload 33
    //   5590: astore 36
    //   5592: iload 5
    //   5594: istore 6
    //   5596: iload 4
    //   5598: istore 9
    //   5600: lload 16
    //   5602: lstore 20
    //   5604: lload 18
    //   5606: lstore 24
    //   5608: aload 34
    //   5610: astore 37
    //   5612: aload 32
    //   5614: astore 38
    //   5616: aload 31
    //   5618: astore 39
    //   5620: iload 5
    //   5622: istore 7
    //   5624: lload 16
    //   5626: lstore 22
    //   5628: aload 35
    //   5630: iconst_0
    //   5631: aload 41
    //   5633: iconst_0
    //   5634: iload 8
    //   5636: invokestatic 908	java/lang/System:arraycopy	(Ljava/lang/Object;ILjava/lang/Object;II)V
    //   5639: aload 33
    //   5641: astore 36
    //   5643: iload 5
    //   5645: istore 6
    //   5647: iload 4
    //   5649: istore 9
    //   5651: lload 16
    //   5653: lstore 20
    //   5655: lload 18
    //   5657: lstore 24
    //   5659: aload 34
    //   5661: astore 37
    //   5663: aload 32
    //   5665: astore 38
    //   5667: aload 31
    //   5669: astore 39
    //   5671: iload 5
    //   5673: istore 7
    //   5675: lload 16
    //   5677: lstore 22
    //   5679: aload_1
    //   5680: aload 41
    //   5682: invokevirtual 899	com/tencent/mobileqq/utils/httputils/HttpMsg:a	([B)V
    //   5685: aload 33
    //   5687: astore 36
    //   5689: iload 5
    //   5691: istore 6
    //   5693: iload 4
    //   5695: istore 9
    //   5697: lload 16
    //   5699: lstore 20
    //   5701: lload 18
    //   5703: lstore 24
    //   5705: aload 34
    //   5707: astore 37
    //   5709: aload 32
    //   5711: astore 38
    //   5713: aload 31
    //   5715: astore 39
    //   5717: iload 5
    //   5719: istore 7
    //   5721: lload 16
    //   5723: lstore 22
    //   5725: aload 48
    //   5727: aload_1
    //   5728: aload_1
    //   5729: invokeinterface 901 3 0
    //   5734: aload 33
    //   5736: astore 36
    //   5738: iload 5
    //   5740: istore 6
    //   5742: iload 4
    //   5744: istore 9
    //   5746: lload 16
    //   5748: lstore 20
    //   5750: lload 18
    //   5752: lstore 24
    //   5754: aload 34
    //   5756: astore 37
    //   5758: aload 32
    //   5760: astore 38
    //   5762: aload 31
    //   5764: astore 39
    //   5766: iload 5
    //   5768: istore 7
    //   5770: lload 16
    //   5772: lstore 22
    //   5774: aload_1
    //   5775: getfield 882	com/tencent/mobileqq/utils/httputils/HttpMsg:jdField_e_of_type_Boolean	Z
    //   5778: ifeq +50 -> 5828
    //   5781: aload 33
    //   5783: astore 36
    //   5785: iload 5
    //   5787: istore 6
    //   5789: iload 4
    //   5791: istore 9
    //   5793: lload 16
    //   5795: lstore 20
    //   5797: lload 18
    //   5799: lstore 24
    //   5801: aload 34
    //   5803: astore 37
    //   5805: aload 32
    //   5807: astore 38
    //   5809: aload 31
    //   5811: astore 39
    //   5813: iload 5
    //   5815: istore 7
    //   5817: lload 16
    //   5819: lstore 22
    //   5821: aload 40
    //   5823: aload 35
    //   5825: invokevirtual 911	com/tencent/commonsdk/pool/ByteArrayPool:returnBuf	([B)V
    //   5828: aload 33
    //   5830: astore 36
    //   5832: iload 5
    //   5834: istore 6
    //   5836: iload 4
    //   5838: istore 9
    //   5840: lload 16
    //   5842: lstore 20
    //   5844: lload 18
    //   5846: lstore 24
    //   5848: aload 34
    //   5850: astore 37
    //   5852: aload 32
    //   5854: astore 38
    //   5856: aload 31
    //   5858: astore 39
    //   5860: iload 5
    //   5862: istore 7
    //   5864: lload 16
    //   5866: lstore 22
    //   5868: aload 34
    //   5870: invokevirtual 817	java/io/ByteArrayOutputStream:close	()V
    //   5873: aload 34
    //   5875: astore 35
    //   5877: aload 31
    //   5879: astore 34
    //   5881: aload 35
    //   5883: astore 31
    //   5885: aload 48
    //   5887: aload_1
    //   5888: aload_1
    //   5889: iconst_4
    //   5890: invokeinterface 406 4 0
    //   5895: pop
    //   5896: iconst_0
    //   5897: istore 7
    //   5899: aload 31
    //   5901: astore 35
    //   5903: iload 5
    //   5905: istore 6
    //   5907: iload 7
    //   5909: istore 5
    //   5911: aload 34
    //   5913: astore 31
    //   5915: aload 35
    //   5917: astore 34
    //   5919: iload 4
    //   5921: sipush 200
    //   5924: if_icmpeq +11 -> 5935
    //   5927: iload 4
    //   5929: sipush 206
    //   5932: if_icmpne +32 -> 5964
    //   5935: aload_0
    //   5936: aload_1
    //   5937: ldc_w 743
    //   5940: new 263	java/lang/StringBuilder
    //   5943: dup
    //   5944: invokespecial 264	java/lang/StringBuilder:<init>	()V
    //   5947: ldc_w 745
    //   5950: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5953: iload 6
    //   5955: invokevirtual 273	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   5958: invokevirtual 296	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   5961: invokevirtual 299	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;Ljava/lang/String;Ljava/lang/String;)V
    //   5964: aload_2
    //   5965: ifnull +13 -> 5978
    //   5968: aload_2
    //   5969: getfield 721	spc:jdField_b_of_type_JavaUtilConcurrentAtomicAtomicBoolean	Ljava/util/concurrent/atomic/AtomicBoolean;
    //   5972: invokevirtual 724	java/util/concurrent/atomic/AtomicBoolean:get	()Z
    //   5975: ifne +106 -> 6081
    //   5978: aload_0
    //   5979: aload_1
    //   5980: ldc_w 747
    //   5983: new 263	java/lang/StringBuilder
    //   5986: dup
    //   5987: invokespecial 264	java/lang/StringBuilder:<init>	()V
    //   5990: ldc_w 749
    //   5993: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   5996: aload_1
    //   5997: invokevirtual 751	com/tencent/mobileqq/utils/httputils/HttpMsg:d	()Ljava/lang/String;
    //   6000: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   6003: ldc_w 753
    //   6006: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   6009: aload_1
    //   6010: invokevirtual 755	com/tencent/mobileqq/utils/httputils/HttpMsg:c	()Ljava/lang/String;
    //   6013: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   6016: invokevirtual 296	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   6019: invokevirtual 299	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;Ljava/lang/String;Ljava/lang/String;)V
    //   6022: iload 5
    //   6024: ifeq +57 -> 6081
    //   6027: aload_1
    //   6028: getfield 812	com/tencent/mobileqq/utils/httputils/HttpMsg:h	I
    //   6031: sipush 56009
    //   6034: if_icmpne +47 -> 6081
    //   6037: aload_0
    //   6038: aload_1
    //   6039: ldc_w 814
    //   6042: new 263	java/lang/StringBuilder
    //   6045: dup
    //   6046: invokespecial 264	java/lang/StringBuilder:<init>	()V
    //   6049: ldc_w 778
    //   6052: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   6055: aload_1
    //   6056: getfield 380	com/tencent/mobileqq/utils/httputils/HttpMsg:al	Ljava/lang/String;
    //   6059: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   6062: ldc_w 780
    //   6065: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   6068: aload_1
    //   6069: getfield 538	com/tencent/mobileqq/utils/httputils/HttpMsg:am	Ljava/lang/String;
    //   6072: invokevirtual 270	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   6075: invokevirtual 296	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   6078: invokevirtual 299	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;Ljava/lang/String;Ljava/lang/String;)V
    //   6081: aload_0
    //   6082: getfield 70	com/tencent/mobileqq/utils/httputils/HttpCommunicator:jdField_a_of_type_MqqOsMqqHandler	Lmqq/os/MqqHandler;
    //   6085: ifnull +17 -> 6102
    //   6088: aload 33
    //   6090: ifnull +12 -> 6102
    //   6093: aload_0
    //   6094: getfield 70	com/tencent/mobileqq/utils/httputils/HttpCommunicator:jdField_a_of_type_MqqOsMqqHandler	Lmqq/os/MqqHandler;
    //   6097: aload 33
    //   6099: invokevirtual 759	mqq/os/MqqHandler:removeCallbacks	(Ljava/lang/Runnable;)V
    //   6102: lload 18
    //   6104: lload 16
    //   6106: ladd
    //   6107: lstore 16
    //   6109: lload 16
    //   6111: lconst_0
    //   6112: lcmp
    //   6113: ifeq +25 -> 6138
    //   6116: aload_1
    //   6117: invokevirtual 249	com/tencent/mobileqq/utils/httputils/HttpMsg:e	()Ljava/lang/String;
    //   6120: ldc -9
    //   6122: invokevirtual 211	java/lang/String:equals	(Ljava/lang/Object;)Z
    //   6125: ifeq +372 -> 6497
    //   6128: iconst_1
    //   6129: istore_3
    //   6130: aload_0
    //   6131: aload_1
    //   6132: iload_3
    //   6133: lload 16
    //   6135: invokevirtual 762	com/tencent/mobileqq/utils/httputils/HttpCommunicator:a	(Lcom/tencent/mobileqq/utils/httputils/HttpMsg;ZJ)V
    //   6138: aload 34
    //   6140: ifnull +8 -> 6148
    //   6143: aload 34
    //   6145: invokevirtual 817	java/io/ByteArrayOutputStream:close	()V
    //   6148: aload 31
    //   6150: ifnull +8 -> 6158
    //   6153: aload 31
    //   6155: invokevirtual 807	java/io/InputStream:close	()V
    //   6158: aload 32
    //   6160: ifnull +8 -> 6168
    //   6163: aload 32
    //   6165: invokevirtual 767	java/io/OutputStream:close	()V
    //   6168: iload 5
    //   6170: istore 4
    //   6172: aload 30
    //   6174: ifnull -3759 -> 2415
    //   6177: aload 30
    //   6179: invokevirtual 770	java/net/HttpURLConnection:disconnect	()V
    //   6182: iload 5
    //   6184: istore 4
    //   6186: goto -3771 -> 2415
    //   6189: astore 30
    //   6191: aload 30
    //   6193: invokevirtual 600	java/lang/Exception:printStackTrace	()V
    //   6196: iload 5
    //   6198: istore 4
    //   6200: goto -3785 -> 2415
    //   6203: iload 8
    //   6205: ifle +53 -> 6258
    //   6208: aload 33
    //   6210: astore 36
    //   6212: iload 5
    //   6214: istore 6
    //   6216: iload 4
    //   6218: istore 9
    //   6220: lload 16
    //   6222: lstore 20
    //   6224: lload 18
    //   6226: lstore 24
    //   6228: aload 34
    //   6230: astore 37
    //   6232: aload 32
    //   6234: astore 38
    //   6236: aload 31
    //   6238: astore 39
    //   6240: iload 5
    //   6242: istore 7
    //   6244: lload 16
    //   6246: lstore 22
    //   6248: aload 34
    //   6250: aload 35
    //   6252: iconst_0
    //   6253: iload 8
    //   6255: invokevirtual 912	java/io/ByteArrayOutputStream:write	([BII)V
    //   6258: aload 33
    //   6260: astore 36
    //   6262: iload 5
    //   6264: istore 6
    //   6266: iload 4
    //   6268: istore 9
    //   6270: lload 16
    //   6272: lstore 20
    //   6274: lload 18
    //   6276: lstore 24
    //   6278: aload 34
    //   6280: astore 37
    //   6282: aload 32
    //   6284: astore 38
    //   6286: aload 31
    //   6288: astore 39
    //   6290: iload 5
    //   6292: istore 7
    //   6294: lload 16
    //   6296: lstore 22
    //   6298: aload 34
    //   6300: invokevirtual 913	java/io/ByteArrayOutputStream:flush	()V
    //   6303: aload 33
    //   6305: astore 36
    //   6307: iload 5
    //   6309: istore 6
    //   6311: iload 4
    //   6313: istore 9
    //   6315: lload 16
    //   6317: lstore 20
    //   6319: lload 18
    //   6321: lstore 24
    //   6323: aload 34
    //   6325: astore 37
    //   6327: aload 32
    //   6329: astore 38
    //   6331: aload 31
    //   6333: astore 39
    //   6335: iload 5
    //   6337: istore 7
    //   6339: lload 16
    //   6341: lstore 22
    //   6343: aload_1
    //   6344: aload 34
    //   6346: invokevirtual 916	java/io/ByteArrayOutputStream:toByteArray	()[B
    //   6349: invokevirtual 899	com/tencent/mobileqq/utils/httputils/HttpMsg:a	([B)V
    //   6352: aload 33
    //   6354: astore 36
    //   6356: iload 5
    //   6358: istore 6
    //   6360: iload 4
    //   6362: istore 9
    //   6364: lload 16
    //   6366: lstore 20
    //   6368: lload 18
    //   6370: lstore 24
    //   6372: aload 34
    //   6374: astore 37
    //   6376: aload 32
    //   6378: astore 38
    //   6380: aload 31
    //   6382: astore 39
    //   6384: iload 5
    //   6386: istore 7
    //   6388: lload 16
    //   6390: lstore 22
    //   6392: aload 48
    //   6394: aload_1
    //   6395: aload_1
    //   6396: invokeinterface 901 3 0
    //   6401: goto -667 -> 5734
    //   6404: astore 35
    //   6406: aload 31
    //   6408: astore 36
    //   6410: aload 32
    //   6412: astore 37
    //   6414: lload 22
    //   6416: lstore 16
    //   6418: iload 7
    //   6420: istore 5
    //   6422: aload 33
    //   6424: astore 31
    //   6426: iconst_1
    //   6427: istore_3
    //   6428: aload 34
    //   6430: astore 32
    //   6432: aload 37
    //   6434: astore 33
    //   6436: aload 36
    //   6438: astore 34
    //   6440: goto -4372 -> 2068
    //   6443: iconst_1
    //   6444: istore 7
    //   6446: aload 33
    //   6448: astore 40
    //   6450: iload 4
    //   6452: istore 5
    //   6454: lload 22
    //   6456: lstore 26
    //   6458: lload 18
    //   6460: lstore 28
    //   6462: aload 32
    //   6464: astore 41
    //   6466: aload_0
    //   6467: iload 4
    //   6469: aload 30
    //   6471: aload_1
    //   6472: invokevirtual 918	com/tencent/mobileqq/utils/httputils/HttpCommunicator:b	(ILjava/net/HttpURLConnection;Lcom/tencent/mobileqq/utils/httputils/HttpMsg;)V
    //   6475: iconst_1
    //   6476: istore 5
    //   6478: iload 10
    //   6480: istore 6
    //   6482: lload 22
    //   6484: lstore 16
    //   6486: aload 47
    //   6488: astore 34
    //   6490: aload 46
    //   6492: astore 31
    //   6494: goto -575 -> 5919
    //   6497: iconst_0
    //   6498: istore_3
    //   6499: goto -369 -> 6130
    //   6502: astore 36
    //   6504: aload 37
    //   6506: ifnull -4369 -> 2137
    //   6509: aload 37
    //   6511: invokevirtual 807	java/io/InputStream:close	()V
    //   6514: goto -4377 -> 2137
    //   6517: astore 36
    //   6519: goto -4382 -> 2137
    //   6522: astore 35
    //   6524: aconst_null
    //   6525: astore 36
    //   6527: aload 36
    //   6529: ifnull +8 -> 6537
    //   6532: aload 36
    //   6534: invokevirtual 807	java/io/InputStream:close	()V
    //   6537: aload 35
    //   6539: athrow
    //   6540: astore 36
    //   6542: iconst_1
    //   6543: istore 7
    //   6545: aload 32
    //   6547: astore 35
    //   6549: aload 33
    //   6551: astore 32
    //   6553: aload 31
    //   6555: astore 33
    //   6557: aload 36
    //   6559: astore 31
    //   6561: iload 5
    //   6563: istore 6
    //   6565: iload 4
    //   6567: istore 5
    //   6569: iload 7
    //   6571: istore 4
    //   6573: lload 16
    //   6575: lstore 20
    //   6577: lload 18
    //   6579: lstore 16
    //   6581: goto -4018 -> 2563
    //   6584: iconst_0
    //   6585: istore_3
    //   6586: goto -4227 -> 2359
    //   6589: astore 30
    //   6591: aload 30
    //   6593: invokevirtual 600	java/lang/Exception:printStackTrace	()V
    //   6596: iload 6
    //   6598: istore 4
    //   6600: goto -4185 -> 2415
    //   6603: iconst_0
    //   6604: istore_3
    //   6605: goto -3827 -> 2778
    //   6608: astore_1
    //   6609: aload_1
    //   6610: invokevirtual 600	java/lang/Exception:printStackTrace	()V
    //   6613: goto -3787 -> 2826
    //   6616: aload 48
    //   6618: aload_1
    //   6619: aload_1
    //   6620: iconst_5
    //   6621: invokeinterface 406 4 0
    //   6626: pop
    //   6627: return
    //   6628: astore_1
    //   6629: goto -5713 -> 916
    //   6632: astore_1
    //   6633: goto -5705 -> 928
    //   6636: astore_1
    //   6637: goto -5699 -> 938
    //   6640: astore_1
    //   6641: goto -4921 -> 1720
    //   6644: astore_1
    //   6645: goto -4913 -> 1732
    //   6648: astore_1
    //   6649: goto -4907 -> 1742
    //   6652: astore_1
    //   6653: goto -3082 -> 3571
    //   6656: astore_1
    //   6657: goto -3074 -> 3583
    //   6660: astore_1
    //   6661: goto -3068 -> 3593
    //   6664: astore 33
    //   6666: goto -518 -> 6148
    //   6669: astore 31
    //   6671: goto -513 -> 6158
    //   6674: astore 31
    //   6676: goto -508 -> 6168
    //   6679: astore 36
    //   6681: goto -4544 -> 2137
    //   6684: astore 36
    //   6686: goto -149 -> 6537
    //   6689: astore 31
    //   6691: goto -4314 -> 2377
    //   6694: astore 31
    //   6696: goto -4309 -> 2387
    //   6699: astore 31
    //   6701: goto -4304 -> 2397
    //   6704: astore_1
    //   6705: goto -3909 -> 2796
    //   6708: astore_1
    //   6709: goto -3903 -> 2806
    //   6712: astore_1
    //   6713: goto -3897 -> 2816
    //   6716: astore 31
    //   6718: aconst_null
    //   6719: astore 30
    //   6721: aconst_null
    //   6722: astore 32
    //   6724: aconst_null
    //   6725: astore 33
    //   6727: iconst_0
    //   6728: istore 4
    //   6730: lconst_0
    //   6731: lstore 16
    //   6733: iconst_0
    //   6734: istore_3
    //   6735: iconst_m1
    //   6736: istore 5
    //   6738: iload 8
    //   6740: istore 6
    //   6742: lload 22
    //   6744: lstore 20
    //   6746: aload 43
    //   6748: astore 35
    //   6750: aload 42
    //   6752: astore 34
    //   6754: goto -4191 -> 2563
    //   6757: astore 34
    //   6759: aload 31
    //   6761: astore 33
    //   6763: aload 34
    //   6765: astore 31
    //   6767: iconst_0
    //   6768: istore 7
    //   6770: iload 8
    //   6772: istore 6
    //   6774: iload 14
    //   6776: istore_3
    //   6777: iload 4
    //   6779: istore 5
    //   6781: iload 7
    //   6783: istore 4
    //   6785: lload 22
    //   6787: lstore 20
    //   6789: aload 43
    //   6791: astore 35
    //   6793: aload 42
    //   6795: astore 34
    //   6797: goto -4234 -> 2563
    //   6800: astore 31
    //   6802: iload 14
    //   6804: istore_3
    //   6805: iconst_0
    //   6806: istore 7
    //   6808: aload 35
    //   6810: astore 33
    //   6812: iload 8
    //   6814: istore 6
    //   6816: iload 4
    //   6818: istore 5
    //   6820: iload 7
    //   6822: istore 4
    //   6824: lload 22
    //   6826: lstore 20
    //   6828: aload 43
    //   6830: astore 35
    //   6832: aload 34
    //   6834: astore 32
    //   6836: aload 42
    //   6838: astore 34
    //   6840: goto -4277 -> 2563
    //   6843: astore 31
    //   6845: iconst_0
    //   6846: istore 7
    //   6848: iload 14
    //   6850: istore_3
    //   6851: aload 35
    //   6853: astore 33
    //   6855: iload 8
    //   6857: istore 6
    //   6859: iload 4
    //   6861: istore 5
    //   6863: iload 7
    //   6865: istore 4
    //   6867: lload 22
    //   6869: lstore 20
    //   6871: aload 43
    //   6873: astore 35
    //   6875: aload 34
    //   6877: astore 32
    //   6879: aload 42
    //   6881: astore 34
    //   6883: goto -4320 -> 2563
    //   6886: astore 32
    //   6888: iconst_0
    //   6889: istore 7
    //   6891: aload 31
    //   6893: astore 33
    //   6895: aload 32
    //   6897: astore 31
    //   6899: iload 8
    //   6901: istore 6
    //   6903: iload 14
    //   6905: istore_3
    //   6906: iload 4
    //   6908: istore 5
    //   6910: iload 7
    //   6912: istore 4
    //   6914: lload 22
    //   6916: lstore 20
    //   6918: aload 43
    //   6920: astore 35
    //   6922: aload 34
    //   6924: astore 32
    //   6926: aload 42
    //   6928: astore 34
    //   6930: goto -4367 -> 2563
    //   6933: astore 36
    //   6935: aload 31
    //   6937: astore 35
    //   6939: aload 36
    //   6941: astore 31
    //   6943: iconst_0
    //   6944: istore 7
    //   6946: iload 5
    //   6948: istore 6
    //   6950: iload 14
    //   6952: istore_3
    //   6953: iload 4
    //   6955: istore 5
    //   6957: iload 7
    //   6959: istore 4
    //   6961: lload 16
    //   6963: lstore 20
    //   6965: lload 18
    //   6967: lstore 16
    //   6969: goto -4406 -> 2563
    //   6972: astore 31
    //   6974: iload 8
    //   6976: istore 6
    //   6978: iload 14
    //   6980: istore_3
    //   6981: iload 4
    //   6983: istore 5
    //   6985: iload 7
    //   6987: istore 4
    //   6989: lload 22
    //   6991: lstore 20
    //   6993: lload 18
    //   6995: lstore 16
    //   6997: aload 43
    //   6999: astore 35
    //   7001: aload 42
    //   7003: astore 34
    //   7005: goto -4442 -> 2563
    //   7008: astore 35
    //   7010: goto -483 -> 6527
    //   7013: astore 35
    //   7015: aconst_null
    //   7016: astore 33
    //   7018: aconst_null
    //   7019: astore 34
    //   7021: aconst_null
    //   7022: astore 32
    //   7024: aconst_null
    //   7025: astore 30
    //   7027: lconst_0
    //   7028: lstore 18
    //   7030: aconst_null
    //   7031: astore 31
    //   7033: iconst_0
    //   7034: istore 5
    //   7036: iconst_m1
    //   7037: istore 4
    //   7039: lconst_0
    //   7040: lstore 16
    //   7042: iload 14
    //   7044: istore_3
    //   7045: goto -4977 -> 2068
    //   7048: astore 35
    //   7050: aconst_null
    //   7051: astore 34
    //   7053: aconst_null
    //   7054: astore 36
    //   7056: lload 16
    //   7058: lstore 18
    //   7060: lconst_0
    //   7061: lstore 16
    //   7063: iconst_0
    //   7064: istore 5
    //   7066: iconst_1
    //   7067: istore_3
    //   7068: aload 32
    //   7070: astore 33
    //   7072: aload 36
    //   7074: astore 32
    //   7076: goto -5008 -> 2068
    //   7079: astore 36
    //   7081: aload 34
    //   7083: astore 33
    //   7085: aconst_null
    //   7086: astore 34
    //   7088: aconst_null
    //   7089: astore 32
    //   7091: lload 16
    //   7093: lstore 18
    //   7095: lconst_0
    //   7096: lstore 16
    //   7098: aload 35
    //   7100: astore 31
    //   7102: iconst_0
    //   7103: istore 5
    //   7105: iload 14
    //   7107: istore_3
    //   7108: aload 36
    //   7110: astore 35
    //   7112: goto -5044 -> 2068
    //   7115: astore 37
    //   7117: aconst_null
    //   7118: astore 36
    //   7120: aconst_null
    //   7121: astore 32
    //   7123: aload 34
    //   7125: astore 33
    //   7127: lload 16
    //   7129: lstore 18
    //   7131: lconst_0
    //   7132: lstore 16
    //   7134: aload 35
    //   7136: astore 31
    //   7138: iconst_0
    //   7139: istore 5
    //   7141: iload 14
    //   7143: istore_3
    //   7144: aload 37
    //   7146: astore 35
    //   7148: aload 36
    //   7150: astore 34
    //   7152: goto -5084 -> 2068
    //   7155: astore 35
    //   7157: iconst_1
    //   7158: istore_3
    //   7159: aconst_null
    //   7160: astore 36
    //   7162: aconst_null
    //   7163: astore 32
    //   7165: aload 34
    //   7167: astore 33
    //   7169: lload 16
    //   7171: lstore 18
    //   7173: lconst_0
    //   7174: lstore 16
    //   7176: iconst_0
    //   7177: istore 5
    //   7179: aload 36
    //   7181: astore 34
    //   7183: goto -5115 -> 2068
    //   7186: astore 35
    //   7188: aload 31
    //   7190: astore 34
    //   7192: aconst_null
    //   7193: astore 37
    //   7195: aload 32
    //   7197: astore 36
    //   7199: iconst_0
    //   7200: istore 5
    //   7202: aload 33
    //   7204: astore 31
    //   7206: iconst_1
    //   7207: istore_3
    //   7208: aload 37
    //   7210: astore 32
    //   7212: aload 36
    //   7214: astore 33
    //   7216: goto -5148 -> 2068
    //   7219: astore 35
    //   7221: aload 31
    //   7223: astore 36
    //   7225: aload 33
    //   7227: astore 31
    //   7229: iconst_1
    //   7230: istore_3
    //   7231: aload 32
    //   7233: astore 33
    //   7235: aload 36
    //   7237: astore 32
    //   7239: goto -5171 -> 2068
    //   7242: astore 34
    //   7244: goto -5814 -> 1430
    //   7247: iconst_0
    //   7248: istore 5
    //   7250: aconst_null
    //   7251: astore 31
    //   7253: aconst_null
    //   7254: astore 34
    //   7256: lload 22
    //   7258: lstore 16
    //   7260: goto -1375 -> 5885
    //   7263: iconst_0
    //   7264: istore_3
    //   7265: goto -3714 -> 3551
    //   7268: iconst_0
    //   7269: istore 8
    //   7271: iload 11
    //   7273: istore 5
    //   7275: goto -2286 -> 4989
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	7278	0	this	HttpCommunicator
    //   0	7278	1	paramHttpMsg	HttpMsg
    //   0	7278	2	paramSpc	spc
    //   0	7278	3	paramBoolean	boolean
    //   63	6975	4	i1	int
    //   135	7139	5	i2	int
    //   155	6822	6	i3	int
    //   54	6932	7	i4	int
    //   31	7239	8	i5	int
    //   159	6204	9	i6	int
    //   37	6442	10	i7	int
    //   34	7238	11	i8	int
    //   40	5372	12	i9	int
    //   43	5341	13	i10	int
    //   28	7114	14	bool1	boolean
    //   739	3	15	bool2	boolean
    //   72	7187	16	l1	long
    //   191	6981	18	l2	long
    //   163	6829	20	l3	long
    //   25	7232	22	l4	long
    //   167	6204	24	l5	long
    //   139	6318	26	l6	long
    //   143	6318	28	l7	long
    //   66	6112	30	localObject1	Object
    //   6189	281	30	localException1	Exception
    //   6589	3	30	localException2	Exception
    //   6719	307	30	localObject2	Object
    //   96	2231	31	localObject3	Object
    //   2531	296	31	localObject4	Object
    //   2962	3598	31	localObject5	Object
    //   6669	1	31	localIOException1	IOException
    //   6674	1	31	localIOException2	IOException
    //   6689	1	31	localIOException3	IOException
    //   6694	1	31	localIOException4	IOException
    //   6699	1	31	localIOException5	IOException
    //   6716	44	31	localObject6	Object
    //   6765	1	31	localObject7	Object
    //   6800	1	31	localObject8	Object
    //   6843	49	31	localObject9	Object
    //   6897	45	31	localObject10	Object
    //   6972	1	31	localObject11	Object
    //   7031	221	31	localObject12	Object
    //   195	6683	32	localObject13	Object
    //   6886	10	32	localObject14	Object
    //   6924	314	32	localObject15	Object
    //   187	6369	33	localObject16	Object
    //   6664	1	33	localIOException6	IOException
    //   6725	509	33	localObject17	Object
    //   69	6684	34	localObject18	Object
    //   6757	7	34	localObject19	Object
    //   6795	396	34	localObject20	Object
    //   7242	1	34	localThrowable1	Throwable
    //   7254	1	34	localObject21	Object
    //   60	1896	35	localObject22	Object
    //   2031	114	35	localThrowable2	Throwable
    //   2546	3705	35	localObject23	Object
    //   6404	1	35	localThrowable3	Throwable
    //   6522	16	35	localObject24	Object
    //   6547	453	35	localObject25	Object
    //   7008	1	35	localObject26	Object
    //   7013	1	35	localThrowable4	Throwable
    //   7048	51	35	localThrowable5	Throwable
    //   7110	37	35	localObject27	Object
    //   7155	1	35	localThrowable6	Throwable
    //   7186	1	35	localThrowable7	Throwable
    //   7219	1	35	localThrowable8	Throwable
    //   151	6286	36	localObject28	Object
    //   6502	1	36	localException3	Exception
    //   6517	1	36	localIOException7	IOException
    //   6525	8	36	localObject29	Object
    //   6540	18	36	localObject30	Object
    //   6679	1	36	localIOException8	IOException
    //   6684	1	36	localIOException9	IOException
    //   6933	7	36	localObject31	Object
    //   7054	19	36	localObject32	Object
    //   7079	30	36	localThrowable9	Throwable
    //   7118	118	36	localObject33	Object
    //   171	6339	37	localObject34	Object
    //   7115	30	37	localThrowable10	Throwable
    //   7193	16	37	localObject35	Object
    //   175	6204	38	localObject36	Object
    //   179	6204	39	localObject37	Object
    //   131	6318	40	localObject38	Object
    //   147	6318	41	localObject39	Object
    //   7	6995	42	localObject40	Object
    //   16	6982	43	localObject41	Object
    //   22	5334	44	localObject42	Object
    //   13	4666	45	localObject43	Object
    //   10	6481	46	localObject44	Object
    //   19	6468	47	localObject45	Object
    //   4	6613	48	localIHttpCommunicatorListener	IHttpCommunicatorListener
    // Exception table:
    //   from	to	target	type
    //   848	855	954	java/lang/Exception
    //   860	869	954	java/lang/Exception
    //   882	894	954	java/lang/Exception
    //   896	904	954	java/lang/Exception
    //   908	916	954	java/lang/Exception
    //   920	928	954	java/lang/Exception
    //   933	938	954	java/lang/Exception
    //   943	948	954	java/lang/Exception
    //   1652	1659	1753	java/lang/Exception
    //   1664	1673	1753	java/lang/Exception
    //   1686	1698	1753	java/lang/Exception
    //   1700	1708	1753	java/lang/Exception
    //   1712	1720	1753	java/lang/Exception
    //   1724	1732	1753	java/lang/Exception
    //   1737	1742	1753	java/lang/Exception
    //   1747	1752	1753	java/lang/Exception
    //   181	185	2031	java/lang/Throwable
    //   249	261	2031	java/lang/Throwable
    //   313	325	2031	java/lang/Throwable
    //   550	556	2031	java/lang/Throwable
    //   608	615	2031	java/lang/Throwable
    //   667	676	2031	java/lang/Throwable
    //   732	741	2031	java/lang/Throwable
    //   1012	1019	2031	java/lang/Throwable
    //   1076	1085	2031	java/lang/Throwable
    //   1137	1166	2031	java/lang/Throwable
    //   1240	1284	2031	java/lang/Throwable
    //   1336	1346	2031	java/lang/Throwable
    //   1482	1489	2031	java/lang/Throwable
    //   1541	1550	2031	java/lang/Throwable
    //   1816	1827	2031	java/lang/Throwable
    //   1879	1885	2031	java/lang/Throwable
    //   1937	1944	2031	java/lang/Throwable
    //   2020	2031	2031	java/lang/Throwable
    //   2520	2531	2031	java/lang/Throwable
    //   2881	2889	2031	java/lang/Throwable
    //   2957	2964	2031	java/lang/Throwable
    //   3030	3037	2031	java/lang/Throwable
    //   3089	3101	2031	java/lang/Throwable
    //   3153	3165	2031	java/lang/Throwable
    //   3217	3223	2031	java/lang/Throwable
    //   3275	3281	2031	java/lang/Throwable
    //   3333	3342	2031	java/lang/Throwable
    //   3394	3401	2031	java/lang/Throwable
    //   3662	3669	2031	java/lang/Throwable
    //   3724	3731	2031	java/lang/Throwable
    //   3783	3793	2031	java/lang/Throwable
    //   3845	3853	2031	java/lang/Throwable
    //   3905	3917	2031	java/lang/Throwable
    //   3969	3975	2031	java/lang/Throwable
    //   4027	4069	2031	java/lang/Throwable
    //   4121	4163	2031	java/lang/Throwable
    //   4215	4224	2031	java/lang/Throwable
    //   4276	4288	2031	java/lang/Throwable
    //   4340	4350	2031	java/lang/Throwable
    //   4402	4433	2031	java/lang/Throwable
    //   4485	4494	2031	java/lang/Throwable
    //   4546	4558	2031	java/lang/Throwable
    //   4610	4623	2031	java/lang/Throwable
    //   4682	4689	2031	java/lang/Throwable
    //   6466	6475	2031	java/lang/Throwable
    //   2444	2453	2454	java/lang/Exception
    //   6616	6627	2454	java/lang/Exception
    //   181	185	2531	finally
    //   249	261	2531	finally
    //   313	325	2531	finally
    //   550	556	2531	finally
    //   608	615	2531	finally
    //   667	676	2531	finally
    //   732	741	2531	finally
    //   1012	1019	2531	finally
    //   1076	1085	2531	finally
    //   1137	1166	2531	finally
    //   1240	1284	2531	finally
    //   1336	1346	2531	finally
    //   1388	1393	2531	finally
    //   1425	1430	2531	finally
    //   1482	1489	2531	finally
    //   1541	1550	2531	finally
    //   1816	1827	2531	finally
    //   1879	1885	2531	finally
    //   1937	1944	2531	finally
    //   2020	2031	2531	finally
    //   2520	2531	2531	finally
    //   2881	2889	2531	finally
    //   2957	2964	2531	finally
    //   3030	3037	2531	finally
    //   3089	3101	2531	finally
    //   3153	3165	2531	finally
    //   3217	3223	2531	finally
    //   3275	3281	2531	finally
    //   3333	3342	2531	finally
    //   3394	3401	2531	finally
    //   3662	3669	2531	finally
    //   3724	3731	2531	finally
    //   3783	3793	2531	finally
    //   3845	3853	2531	finally
    //   3905	3917	2531	finally
    //   3969	3975	2531	finally
    //   4027	4069	2531	finally
    //   4121	4163	2531	finally
    //   4215	4224	2531	finally
    //   4276	4288	2531	finally
    //   4340	4350	2531	finally
    //   4402	4433	2531	finally
    //   4485	4494	2531	finally
    //   4546	4558	2531	finally
    //   4610	4623	2531	finally
    //   4682	4689	2531	finally
    //   4721	4726	2531	finally
    //   4758	4763	2531	finally
    //   4795	4802	2531	finally
    //   4834	4841	2531	finally
    //   4873	4889	2531	finally
    //   4929	4936	2531	finally
    //   4976	4986	2531	finally
    //   5029	5046	2531	finally
    //   5091	5097	2531	finally
    //   5171	5179	2531	finally
    //   5219	5226	2531	finally
    //   5266	5272	2531	finally
    //   5312	5321	2531	finally
    //   5367	5376	2531	finally
    //   5419	5426	2531	finally
    //   5469	5476	2531	finally
    //   5530	5537	2531	finally
    //   5582	5588	2531	finally
    //   5628	5639	2531	finally
    //   5679	5685	2531	finally
    //   5725	5734	2531	finally
    //   5774	5781	2531	finally
    //   5821	5828	2531	finally
    //   5868	5873	2531	finally
    //   6248	6258	2531	finally
    //   6298	6303	2531	finally
    //   6343	6352	2531	finally
    //   6392	6401	2531	finally
    //   3503	3510	3604	java/lang/Exception
    //   3515	3524	3604	java/lang/Exception
    //   3537	3549	3604	java/lang/Exception
    //   3551	3559	3604	java/lang/Exception
    //   3563	3571	3604	java/lang/Exception
    //   3575	3583	3604	java/lang/Exception
    //   3588	3593	3604	java/lang/Exception
    //   3598	3603	3604	java/lang/Exception
    //   6081	6088	6189	java/lang/Exception
    //   6093	6102	6189	java/lang/Exception
    //   6116	6128	6189	java/lang/Exception
    //   6130	6138	6189	java/lang/Exception
    //   6143	6148	6189	java/lang/Exception
    //   6153	6158	6189	java/lang/Exception
    //   6163	6168	6189	java/lang/Exception
    //   6177	6182	6189	java/lang/Exception
    //   4929	4936	6404	java/lang/Throwable
    //   4976	4986	6404	java/lang/Throwable
    //   5029	5046	6404	java/lang/Throwable
    //   5091	5097	6404	java/lang/Throwable
    //   5171	5179	6404	java/lang/Throwable
    //   5219	5226	6404	java/lang/Throwable
    //   5266	5272	6404	java/lang/Throwable
    //   5312	5321	6404	java/lang/Throwable
    //   5419	5426	6404	java/lang/Throwable
    //   5469	5476	6404	java/lang/Throwable
    //   5530	5537	6404	java/lang/Throwable
    //   5582	5588	6404	java/lang/Throwable
    //   5628	5639	6404	java/lang/Throwable
    //   5679	5685	6404	java/lang/Throwable
    //   5725	5734	6404	java/lang/Throwable
    //   5774	5781	6404	java/lang/Throwable
    //   5821	5828	6404	java/lang/Throwable
    //   5868	5873	6404	java/lang/Throwable
    //   6248	6258	6404	java/lang/Throwable
    //   6298	6303	6404	java/lang/Throwable
    //   6343	6352	6404	java/lang/Throwable
    //   6392	6401	6404	java/lang/Throwable
    //   2091	2098	6502	java/lang/Exception
    //   2102	2109	6502	java/lang/Exception
    //   2113	2122	6502	java/lang/Exception
    //   6509	6514	6517	java/io/IOException
    //   2091	2098	6522	finally
    //   2071	2078	6540	finally
    //   2132	2137	6540	finally
    //   2137	2149	6540	finally
    //   6509	6514	6540	finally
    //   6532	6537	6540	finally
    //   6537	6540	6540	finally
    //   2310	2317	6589	java/lang/Exception
    //   2322	2331	6589	java/lang/Exception
    //   2345	2357	6589	java/lang/Exception
    //   2359	2367	6589	java/lang/Exception
    //   2372	2377	6589	java/lang/Exception
    //   2382	2387	6589	java/lang/Exception
    //   2392	2397	6589	java/lang/Exception
    //   2406	2411	6589	java/lang/Exception
    //   2729	2736	6608	java/lang/Exception
    //   2741	2750	6608	java/lang/Exception
    //   2764	2776	6608	java/lang/Exception
    //   2778	2786	6608	java/lang/Exception
    //   2791	2796	6608	java/lang/Exception
    //   2801	2806	6608	java/lang/Exception
    //   2811	2816	6608	java/lang/Exception
    //   2821	2826	6608	java/lang/Exception
    //   908	916	6628	java/io/IOException
    //   920	928	6632	java/io/IOException
    //   933	938	6636	java/io/IOException
    //   1712	1720	6640	java/io/IOException
    //   1724	1732	6644	java/io/IOException
    //   1737	1742	6648	java/io/IOException
    //   3563	3571	6652	java/io/IOException
    //   3575	3583	6656	java/io/IOException
    //   3588	3593	6660	java/io/IOException
    //   6143	6148	6664	java/io/IOException
    //   6153	6158	6669	java/io/IOException
    //   6163	6168	6674	java/io/IOException
    //   2132	2137	6679	java/io/IOException
    //   6532	6537	6684	java/io/IOException
    //   2372	2377	6689	java/io/IOException
    //   2382	2387	6694	java/io/IOException
    //   2392	2397	6699	java/io/IOException
    //   2791	2796	6704	java/io/IOException
    //   2801	2806	6708	java/io/IOException
    //   2811	2816	6712	java/io/IOException
    //   45	53	6716	finally
    //   351	381	6757	finally
    //   384	424	6757	finally
    //   439	449	6757	finally
    //   449	460	6757	finally
    //   460	479	6757	finally
    //   74	98	6800	finally
    //   102	126	6843	finally
    //   325	351	6886	finally
    //   5885	5896	6933	finally
    //   6466	6475	6972	finally
    //   2102	2109	7008	finally
    //   2113	2122	7008	finally
    //   45	53	7013	java/lang/Throwable
    //   351	381	7048	java/lang/Throwable
    //   384	424	7048	java/lang/Throwable
    //   439	449	7048	java/lang/Throwable
    //   449	460	7048	java/lang/Throwable
    //   460	479	7048	java/lang/Throwable
    //   74	98	7079	java/lang/Throwable
    //   102	126	7115	java/lang/Throwable
    //   325	351	7155	java/lang/Throwable
    //   4721	4726	7186	java/lang/Throwable
    //   4758	4763	7186	java/lang/Throwable
    //   4795	4802	7186	java/lang/Throwable
    //   4834	4841	7186	java/lang/Throwable
    //   4873	4889	7186	java/lang/Throwable
    //   5367	5376	7186	java/lang/Throwable
    //   5885	5896	7219	java/lang/Throwable
    //   1388	1393	7242	java/lang/Throwable
    //   1425	1430	7242	java/lang/Throwable
  }
  
  protected void a(HttpMsg paramHttpMsg, boolean paramBoolean, long paramLong)
  {
    i = ((int)paramLong);
    int i1 = jdField_d_of_type_Int;
    int i2 = jdField_e_of_type_Int;
    int i3 = jdField_f_of_type_Int;
    if (((i1 == -1) || (i2 == -1)) && (QLog.isColorLevel())) {
      QLog.e("flowstat", 2, "fileType:" + i1 + ",busiType:" + i2);
    }
    if (jdField_a_of_type_ComTencentMobileqqUtilsHttputilsIHttpCommunicatorFlowCount != null) {
      jdField_a_of_type_ComTencentMobileqqUtilsHttputilsIHttpCommunicatorFlowCount.a(paramBoolean, i3, i1, i2, paramLong);
    }
  }
  
  public void a(String paramString)
  {
    int i1 = 0;
    if (d) {
      return;
    }
    synchronized (jdField_a_of_type_JavaLangObject)
    {
      if (QLog.isColorLevel()) {
        QLog.d("Q.richmedia.HttpCommunicator", 2, "queueSize:" + jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpCommunicator$PriorityQueue.a() + " mConcurrentRunningMsgs:" + o + " mConcurrentLimit:" + n + " reason:" + paramString + " tid:" + Thread.currentThread().getId());
      }
      if (jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpCommunicator$PriorityQueue.a() == 0) {
        return;
      }
    }
    spc[] arrayOfSpc;
    int i2;
    if (o < n)
    {
      paramString = jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpCommunicator$PriorityQueue.a(false);
      if (paramString != null)
      {
        arrayOfSpc = jdField_a_of_type_ArrayOfSpc;
        i2 = arrayOfSpc.length;
      }
    }
    for (;;)
    {
      spc localSpc;
      HttpMsg localHttpMsg;
      if (i1 < i2)
      {
        localSpc = arrayOfSpc[i1];
        localHttpMsg = jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg;
        if (jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.get()) {
          break label268;
        }
        jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpCommunicator$PriorityQueue.a(paramString);
        paramString.b();
        jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.set(true);
        jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpMsg = paramString;
        localSpc.a(paramString);
        o += 1;
        g = (SystemClock.uptimeMillis() - jdField_f_of_type_Long);
        if (QLog.isColorLevel()) {
          a(paramString, "attach", "");
        }
      }
      for (;;)
      {
        return;
        label268:
        if ((!jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.get()) || (!jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.get()) || (localHttpMsg == null) || (localHttpMsg.b() <= paramString.b())) {
          break;
        }
        localSpc.a();
      }
      i1 += 1;
    }
  }
  
  public void a(spc paramSpc)
  {
    if (d) {}
    int i1;
    do
    {
      do
      {
        return;
      } while (paramSpc == null);
      jdField_b_of_type_JavaUtilConcurrentAtomicAtomicBoolean.set(true);
      i1 = jdField_a_of_type_Int;
      if ((i1 >= 0) && (i1 < 4))
      {
        ??? = new HandlerThread("httpcommunicator_norm_new_" + i1, 5);
        ((HandlerThread)???).start();
        spc localSpc = new spc(this, ((HandlerThread)???).getLooper());
        jdField_a_of_type_Int = i1;
        synchronized (jdField_a_of_type_JavaLangObject)
        {
          jdField_a_of_type_ArrayOfSpc[i1] = localSpc;
          if (jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.get()) {
            o -= 1;
          }
          a("replaceNewThread index:" + i1);
          return;
        }
      }
    } while (!QLog.isColorLevel());
    QLog.e("Q.richmedia.HttpCommunicator", 2, "replaceNewThread,index error occurs. " + i1);
  }
  
  void a(spc paramSpc, HttpMsg paramHttpMsg)
  {
    if (!c) {
      throw new IOException("httpcommunicator closed");
    }
    if (jdField_a_of_type_JavaUtilConcurrentAtomicAtomicBoolean.get()) {
      throw new IOException("request cancelled");
    }
    if ((paramSpc != null) && (jdField_b_of_type_JavaUtilConcurrentAtomicAtomicBoolean.get())) {
      throw new RuntimeException("thread should close");
    }
    if (jdField_b_of_type_JavaUtilConcurrentAtomicAtomicBoolean.get())
    {
      a(paramHttpMsg, "interrupt", "preempted");
      throw new IOException("preempted by higher msg");
    }
  }
  
  void a(boolean paramBoolean, int paramInt, HttpURLConnection paramHttpURLConnection, HttpMsg paramHttpMsg, Throwable paramThrowable)
  {
    if ((paramThrowable instanceof IllegalArgumentException))
    {
      paramHttpMsg.a(9020, paramInt, paramThrowable.toString());
      return;
    }
    if ((paramThrowable instanceof IllegalStateException))
    {
      paramHttpMsg.a(9057, paramInt, paramThrowable.toString());
      return;
    }
    if ((paramThrowable instanceof IOException))
    {
      if ("request cancelled".equals(paramThrowable.getMessage()))
      {
        paramHttpMsg.a(9037, paramInt, paramThrowable.toString());
        return;
      }
      if ("httpcommunicator closed".equals(paramThrowable.getMessage()))
      {
        paramHttpMsg.a(9366, paramInt, paramThrowable.getMessage());
        return;
      }
      if ("preempted by higher msg".equals(paramThrowable.getMessage()))
      {
        paramHttpMsg.a(9361, paramInt, paramThrowable.toString());
        return;
      }
      if ("content-length zero".equals(paramThrowable.getMessage()))
      {
        paramHttpURLConnection = BaseTransProcessor.a("Q", -9531L);
        paramHttpMsg.b(HttpMsg.an, paramHttpURLConnection);
        paramHttpMsg.a(56009, paramInt, "content zero");
        return;
      }
      if ((paramThrowable instanceof MalformedURLException))
      {
        paramHttpMsg.a(9048, paramInt, paramThrowable.toString());
        return;
      }
      if ((paramThrowable instanceof InterruptedIOException))
      {
        if ((paramThrowable instanceof SocketTimeoutException))
        {
          if (paramBoolean)
          {
            paramHttpMsg.a(9014, paramInt, paramThrowable.toString());
            return;
          }
          paramHttpMsg.a(9050, paramInt, paramThrowable.toString());
          return;
        }
        paramHttpMsg.a(9049, paramInt, paramThrowable.toString());
        return;
      }
      if ((paramThrowable instanceof SocketException))
      {
        if ((paramThrowable instanceof ConnectException))
        {
          paramHttpMsg.a(9052, paramInt, paramThrowable.toString());
          return;
        }
        if ((paramThrowable instanceof NoRouteToHostException))
        {
          paramHttpMsg.a(9053, paramInt, paramThrowable.toString());
          return;
        }
        if ((paramThrowable instanceof PortUnreachableException))
        {
          paramHttpMsg.a(9054, paramInt, paramThrowable.toString());
          return;
        }
        paramHttpMsg.a(9051, paramInt, paramThrowable.toString());
        return;
      }
      if ((paramThrowable instanceof UnknownHostException))
      {
        paramHttpMsg.a(9055, paramInt, paramThrowable.toString());
        return;
      }
      if ((paramThrowable instanceof EOFException))
      {
        paramHttpMsg.a(9056, paramInt, paramThrowable.getMessage());
        return;
      }
      paramThrowable = paramThrowable.toString();
      if (paramThrowable.contains("unreachable)")) {
        paramHttpURLConnection = "N_" + 45531;
      }
      for (;;)
      {
        paramHttpMsg.a(9047, paramInt, paramThrowable);
        paramHttpMsg.b(HttpMsg.an, paramHttpURLConnection);
        return;
        if (paramThrowable.contains("Connection refused")) {
          paramHttpURLConnection = "N_" + 45534;
        } else if (paramThrowable.contains("No route to host"))
        {
          if (paramThrowable.contains("SocketException")) {
            paramHttpURLConnection = "N_" + 45533;
          } else {
            paramHttpURLConnection = "N_" + 45532;
          }
        }
        else if (paramThrowable.contains("unexpected end of stream")) {
          paramHttpURLConnection = "N_" + 45531;
        } else if (paramThrowable.contains("Connection timed out")) {
          paramHttpURLConnection = "N_" + 45530;
        } else {
          paramHttpURLConnection = "N_" + 45529;
        }
      }
    }
    if ((paramThrowable instanceof SecurityException))
    {
      paramHttpMsg.a(9022, paramInt, paramThrowable.toString());
      return;
    }
    paramHttpURLConnection = paramThrowable.getMessage();
    if ((!TextUtils.isEmpty(paramHttpURLConnection)) && (paramHttpURLConnection.contains("FlowDecoderExp")))
    {
      paramHttpMsg.a(9058, paramInt, paramHttpURLConnection);
      return;
    }
    paramHttpMsg.a(9322, paramInt, Log.getStackTraceString(paramThrowable));
  }
  
  public boolean a()
  {
    return jdField_e_of_type_Boolean;
  }
  
  public int b()
  {
    return 4;
  }
  
  public int b(HttpMsg paramHttpMsg)
  {
    int i1 = m;
    int i2 = -1;
    for (;;)
    {
      synchronized (jdField_a_of_type_JavaLangObject)
      {
        if ((!d) && (jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpCommunicator$PriorityQueue.a() < i1))
        {
          i1 = k + 1;
          k = i1;
          paramHttpMsg.a(i1);
          jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpCommunicator$PriorityQueue.a(paramHttpMsg);
          paramHttpMsg.a().a(paramHttpMsg, null, 0);
          i1 = k;
          ??? = new Object();
          jdField_a_of_type_JavaLangObject = ???;
          c = new AtomicBoolean(false);
          a("sendMsgSync");
          if (c.get()) {}
        }
      }
      try
      {
        ???.wait();
        return i1;
        i1 = i2;
        if (!QLog.isColorLevel()) {
          continue;
        }
        QLog.e("Q.richmedia.HttpCommunicator", 2, "exceed queue limit");
        i1 = i2;
        continue;
        paramHttpMsg = finally;
        throw paramHttpMsg;
      }
      catch (InterruptedException paramHttpMsg)
      {
        for (;;)
        {
          paramHttpMsg.printStackTrace();
        }
      }
      finally {}
    }
  }
  
  public void b()
  {
    if (d) {
      return;
    }
    d = true;
    c = false;
    if (QLog.isColorLevel()) {
      QLog.d("Q.richmedia.HttpCommunicator", 2, "HttpCommunicator close.async doclose");
    }
    jdField_a_of_type_MqqOsMqqHandler.post(new spb(this));
  }
  
  void b(int paramInt, HttpURLConnection paramHttpURLConnection, HttpMsg paramHttpMsg)
  {
    new StringBuilder().append("Response code: ").append(paramInt).toString();
    long l2 = 0L;
    String str = paramHttpURLConnection.getHeaderField("X-ErrNo");
    if ((str != null) && (!str.equals(""))) {}
    for (;;)
    {
      try
      {
        l1 = Long.parseLong(str);
        paramHttpURLConnection = BaseTransProcessor.b(paramInt, l1);
        paramHttpMsg.b(HttpMsg.an, paramHttpURLConnection);
        paramHttpMsg.a(56009, paramInt, paramHttpURLConnection);
        return;
      }
      catch (Exception paramHttpURLConnection)
      {
        paramHttpURLConnection.printStackTrace();
        l1 = l2;
        continue;
      }
      paramHttpURLConnection = paramHttpURLConnection.getHeaderField("User-ReturnCode");
      long l1 = l2;
      if (paramHttpURLConnection != null)
      {
        l1 = l2;
        if (!paramHttpURLConnection.equals("")) {
          try
          {
            l1 = Long.parseLong(paramHttpURLConnection);
          }
          catch (Exception paramHttpURLConnection)
          {
            paramHttpURLConnection.printStackTrace();
            l1 = l2;
          }
        }
      }
    }
  }
  
  public void b(HttpMsg paramHttpMsg)
  {
    if (paramHttpMsg != null)
    {
      IHttpCommunicatorListener localIHttpCommunicatorListener = paramHttpMsg.a();
      if ((localIHttpCommunicatorListener instanceof BaseTransProcessor)) {
        ((BaseTransProcessor)localIHttpCommunicatorListener).a(2, 9014, "sscm http timeout");
      }
      paramHttpMsg.a().b(paramHttpMsg, null);
    }
  }
  
  public void c()
  {
    int i1 = 0;
    long l1;
    synchronized (jdField_a_of_type_JavaLangObject)
    {
      l1 = System.currentTimeMillis();
      HttpMsg localHttpMsg;
      do
      {
        localHttpMsg = jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpCommunicator$PriorityQueue.a(true);
        if (localHttpMsg == null) {
          break;
        }
      } while ((localHttpMsg == null) || (localHttpMsg.a() == null));
      localHttpMsg.a(9366, -1, "httpcommunicator_close");
      localHttpMsg.a().b(localHttpMsg, localHttpMsg);
    }
    jdField_a_of_type_ComTencentMobileqqUtilsHttputilsHttpCommunicator$PriorityQueue.a();
    spc[] arrayOfSpc = jdField_a_of_type_ArrayOfSpc;
    int i2 = arrayOfSpc.length;
    while (i1 < i2)
    {
      arrayOfSpc[i1].sendEmptyMessage(1);
      i1 += 1;
    }
    jdField_a_of_type_ArrayOfSpc = null;
    o = 0;
    n = 0;
    if (QLog.isColorLevel()) {
      QLog.d("Q.richmedia.HttpCommunicator", 2, "HttpCommunicator close_inter.elapse:" + (System.currentTimeMillis() - l1));
    }
  }
}
