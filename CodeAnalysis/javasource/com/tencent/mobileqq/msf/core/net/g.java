package com.tencent.mobileqq.msf.core.net;

import android.os.SystemClock;
import com.tencent.mobileqq.msf.core.MsfCore;
import com.tencent.mobileqq.msf.core.b.i;
import com.tencent.mobileqq.msf.core.d;
import com.tencent.mobileqq.msf.core.net.a.e;
import com.tencent.mobileqq.msf.core.net.a.f;
import com.tencent.mobileqq.msf.core.w;
import com.tencent.mobileqq.msf.sdk.MsfCommand;
import com.tencent.mobileqq.msf.sdk.MsfSdkUtils;
import com.tencent.qphone.base.remote.ToServiceMsg;
import com.tencent.qphone.base.util.MsfSocketInputBuffer;
import com.tencent.qphone.base.util.QLog;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.locks.ReentrantLock;

public class g
{
  public static final int a = -100;
  public static final int b = -200;
  public static ArrayList n = new ArrayList();
  public d A;
  private AtomicInteger B = new AtomicInteger();
  private long C = 0L;
  protected InetSocketAddress c;
  d d;
  int e;
  int f = 30000;
  public Socket g;
  OutputStream h = null;
  public c i;
  a j;
  MsfSocketInputBuffer k = null;
  public String l = "";
  public int m = 0;
  AtomicLong o = new AtomicLong();
  AtomicLong p = new AtomicLong();
  long q = 0L;
  boolean r = false;
  AtomicBoolean s = new AtomicBoolean();
  AtomicBoolean t = new AtomicBoolean();
  AtomicBoolean u = new AtomicBoolean();
  ReentrantLock v = new ReentrantLock();
  boolean w;
  ToServiceMsg x;
  Runnable y;
  MsfCore z;
  
  public g(MsfCore paramMsfCore, boolean paramBoolean)
  {
    z = paramMsfCore;
    w = paramBoolean;
  }
  
  public static String a(Throwable paramThrowable)
  {
    if (paramThrowable == null) {
      return "";
    }
    for (Object localObject = paramThrowable; localObject != null; localObject = ((Throwable)localObject).getCause()) {
      if ((localObject instanceof UnknownHostException)) {
        return "";
      }
    }
    localObject = new StringWriter();
    PrintWriter localPrintWriter = new PrintWriter((Writer)localObject);
    paramThrowable.printStackTrace(localPrintWriter);
    localPrintWriter.flush();
    return ((StringWriter)localObject).toString();
  }
  
  public int a(int paramInt1, int paramInt2, int paramInt3, String paramString1, String paramString2, String paramString3, MsfCommand paramMsfCommand, byte[] paramArrayOfByte, ToServiceMsg paramToServiceMsg)
    throws IOException
  {
    if ((u.get()) || (!s.get()) || (i == null)) {
      return -100;
    }
    if (paramMsfCommand == MsfCommand.openConn) {}
    for (;;)
    {
      return paramArrayOfByte.length;
      paramMsfCommand = i.a(d, paramString1, paramString2, paramArrayOfByte);
      if (paramString2.equals("SSO.LoginMerge"))
      {
        if (!z.sender.n)
        {
          paramString1 = (ArrayList)z.sender.d.remove(Integer.valueOf(paramInt3));
          QLog.d("MSF.C.NetConnTag", 1, "NetChanged devide merge package, " + Arrays.toString(paramString1.toArray()) + " resend.");
          if (paramString1 != null)
          {
            paramString1 = paramString1.iterator();
            while (paramString1.hasNext())
            {
              paramString2 = (Integer)paramString1.next();
              paramString2 = z.sender.c(paramString2.intValue());
              z.sender.b(paramString2);
            }
          }
          return 65336;
        }
        if (paramToServiceMsg != null) {
          z.sender.a(paramToServiceMsg, g.hashCode());
        }
        if ((!w.p) || (!f.a())) {
          break label532;
        }
        QLog.d("MSF.C.NetConnTag", 1, "send data in socket adaptor way");
      }
      for (;;)
      {
        try
        {
          if (z.sender.F != null) {
            z.sender.F.b().a(paramMsfCommand, g, paramInt3);
          }
          o.addAndGet(paramMsfCommand.length);
          paramToServiceMsg = new StringBuilder();
          if (!QLog.isDevelopLevel()) {
            break label551;
          }
          QLog.d("MSF.C.NetConnTag", 1, "netSend appid:" + paramInt1 + " appSeq:" + paramInt2 + " ssoSeq:" + paramInt3 + " uin:" + MsfSdkUtils.getShortUin(paramString1) + " cmd:" + paramString2 + " len:" + paramArrayOfByte.length);
          if (!paramString2.equals("SSO.LoginMerge")) {
            break label630;
          }
          return paramArrayOfByte.length;
          if (paramString2.equals("RegPrxySvc.infoLogin"))
          {
            z.sender.a(paramToServiceMsg, g.hashCode());
            break;
          }
          if (paramString2.equals("RegPrxySvc.getOffMsg"))
          {
            z.sender.a(paramToServiceMsg, g.hashCode());
            break;
          }
          if (!paramString2.equals("RegPrxySvc.infoSync")) {
            break;
          }
          z.sender.a(paramToServiceMsg, g.hashCode());
        }
        catch (Exception paramToServiceMsg)
        {
          QLog.d("MSF.C.NetConnTag", 1, "", paramToServiceMsg);
          continue;
        }
        label532:
        h.write(paramMsfCommand);
        h.flush();
        continue;
        label551:
        QLog.d("MSF.C.NetConnTag", 1, "netSend ssoSeq:" + paramInt3 + " uin:" + MsfSdkUtils.getShortUin(paramString1) + " cmd:" + paramString2.hashCode() + new StringBuilder().append(" ").append(paramArrayOfByte.length + paramInt3).toString());
      }
      label630:
      if (paramString3 == null) {
        i.a(true, paramString1, paramMsfCommand.length, paramString2, 0, l, m);
      } else {
        i.a(true, paramString1, paramMsfCommand.length, paramString3, 0, l, m);
      }
    }
  }
  
  /* Error */
  public void a(d paramD, int paramInt1, int paramInt2, c paramC, boolean paramBoolean, a paramA)
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 105	com/tencent/mobileqq/msf/core/net/g:u	Ljava/util/concurrent/atomic/AtomicBoolean;
    //   4: invokevirtual 153	java/util/concurrent/atomic/AtomicBoolean:get	()Z
    //   7: ifne +13 -> 20
    //   10: aload_0
    //   11: getfield 101	com/tencent/mobileqq/msf/core/net/g:s	Ljava/util/concurrent/atomic/AtomicBoolean;
    //   14: invokevirtual 153	java/util/concurrent/atomic/AtomicBoolean:get	()Z
    //   17: ifne +28 -> 45
    //   20: aload_0
    //   21: getfield 105	com/tencent/mobileqq/msf/core/net/g:u	Ljava/util/concurrent/atomic/AtomicBoolean;
    //   24: invokevirtual 153	java/util/concurrent/atomic/AtomicBoolean:get	()Z
    //   27: ifeq +18 -> 45
    //   30: aload_0
    //   31: getfield 105	com/tencent/mobileqq/msf/core/net/g:u	Ljava/util/concurrent/atomic/AtomicBoolean;
    //   34: iconst_0
    //   35: invokevirtual 342	java/util/concurrent/atomic/AtomicBoolean:set	(Z)V
    //   38: aload_0
    //   39: getstatic 347	com/tencent/qphone/base/a:f	Lcom/tencent/qphone/base/a;
    //   42: invokevirtual 350	com/tencent/mobileqq/msf/core/net/g:a	(Lcom/tencent/qphone/base/a;)V
    //   45: aload_0
    //   46: getfield 352	com/tencent/mobileqq/msf/core/net/g:x	Lcom/tencent/qphone/base/remote/ToServiceMsg;
    //   49: ifnull +22 -> 71
    //   52: aload_0
    //   53: invokevirtual 355	com/tencent/mobileqq/msf/core/net/g:f	()Lcom/tencent/qphone/base/remote/ToServiceMsg;
    //   56: pop
    //   57: aload_0
    //   58: getfield 114	com/tencent/mobileqq/msf/core/net/g:z	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   61: getfield 182	com/tencent/mobileqq/msf/core/MsfCore:sender	Lcom/tencent/mobileqq/msf/core/w;
    //   64: aload_0
    //   65: getfield 357	com/tencent/mobileqq/msf/core/net/g:y	Ljava/lang/Runnable;
    //   68: invokevirtual 360	com/tencent/mobileqq/msf/core/w:a	(Ljava/lang/Runnable;)V
    //   71: aload_0
    //   72: aload_1
    //   73: putfield 163	com/tencent/mobileqq/msf/core/net/g:d	Lcom/tencent/mobileqq/msf/core/d;
    //   76: aload_0
    //   77: aload 4
    //   79: putfield 155	com/tencent/mobileqq/msf/core/net/g:i	Lcom/tencent/mobileqq/msf/core/net/c;
    //   82: aload_0
    //   83: iload 5
    //   85: putfield 96	com/tencent/mobileqq/msf/core/net/g:r	Z
    //   88: aload_0
    //   89: getfield 114	com/tencent/mobileqq/msf/core/net/g:z	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   92: getfield 182	com/tencent/mobileqq/msf/core/MsfCore:sender	Lcom/tencent/mobileqq/msf/core/w;
    //   95: aload_1
    //   96: invokevirtual 364	com/tencent/mobileqq/msf/core/d:h	()Z
    //   99: putfield 186	com/tencent/mobileqq/msf/core/w:n	Z
    //   102: getstatic 369	com/tencent/mobileqq/msf/core/net/q:b	Lcom/tencent/mobileqq/msf/core/net/q;
    //   105: astore 20
    //   107: ldc 76
    //   109: astore 21
    //   111: aload_0
    //   112: lconst_0
    //   113: putfield 94	com/tencent/mobileqq/msf/core/net/g:q	J
    //   116: aload_0
    //   117: getfield 110	com/tencent/mobileqq/msf/core/net/g:v	Ljava/util/concurrent/locks/ReentrantLock;
    //   120: ldc2_w 370
    //   123: getstatic 377	java/util/concurrent/TimeUnit:MILLISECONDS	Ljava/util/concurrent/TimeUnit;
    //   126: invokevirtual 381	java/util/concurrent/locks/ReentrantLock:tryLock	(JLjava/util/concurrent/TimeUnit;)Z
    //   129: ifeq +1849 -> 1978
    //   132: invokestatic 387	android/os/SystemClock:elapsedRealtime	()J
    //   135: lstore 15
    //   137: invokestatic 392	java/lang/System:currentTimeMillis	()J
    //   140: lstore 7
    //   142: invokestatic 392	java/lang/System:currentTimeMillis	()J
    //   145: pop2
    //   146: lload 7
    //   148: lstore 9
    //   150: aload 21
    //   152: astore 18
    //   154: aload 20
    //   156: astore 17
    //   158: aload 21
    //   160: astore 19
    //   162: aload 20
    //   164: astore 4
    //   166: aload_0
    //   167: new 394	java/net/InetSocketAddress
    //   170: dup
    //   171: aload_1
    //   172: invokevirtual 396	com/tencent/mobileqq/msf/core/d:c	()Ljava/lang/String;
    //   175: aload_1
    //   176: invokevirtual 398	com/tencent/mobileqq/msf/core/d:d	()I
    //   179: invokespecial 401	java/net/InetSocketAddress:<init>	(Ljava/lang/String;I)V
    //   182: putfield 403	com/tencent/mobileqq/msf/core/net/g:c	Ljava/net/InetSocketAddress;
    //   185: lload 7
    //   187: lstore 9
    //   189: aload 21
    //   191: astore 18
    //   193: aload 20
    //   195: astore 17
    //   197: aload 21
    //   199: astore 19
    //   201: aload 20
    //   203: astore 4
    //   205: new 205	java/lang/StringBuilder
    //   208: dup
    //   209: invokespecial 206	java/lang/StringBuilder:<init>	()V
    //   212: astore 23
    //   214: lload 7
    //   216: lstore 9
    //   218: aload 21
    //   220: astore 18
    //   222: aload 20
    //   224: astore 17
    //   226: aload 21
    //   228: astore 19
    //   230: aload 20
    //   232: astore 4
    //   234: new 205	java/lang/StringBuilder
    //   237: dup
    //   238: invokespecial 206	java/lang/StringBuilder:<init>	()V
    //   241: aload 23
    //   243: ldc_w 405
    //   246: invokevirtual 212	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   249: aload_0
    //   250: getfield 403	com/tencent/mobileqq/msf/core/net/g:c	Ljava/net/InetSocketAddress;
    //   253: invokevirtual 408	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   256: invokevirtual 224	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   259: invokevirtual 212	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   262: astore 24
    //   264: lload 7
    //   266: lstore 9
    //   268: aload 21
    //   270: astore 18
    //   272: aload 20
    //   274: astore 17
    //   276: aload 21
    //   278: astore 19
    //   280: aload 20
    //   282: astore 4
    //   284: aload_1
    //   285: getfield 410	com/tencent/mobileqq/msf/core/d:h	Z
    //   288: ifeq +1691 -> 1979
    //   291: ldc_w 412
    //   294: astore 22
    //   296: lload 7
    //   298: lstore 9
    //   300: aload 21
    //   302: astore 18
    //   304: aload 20
    //   306: astore 17
    //   308: aload 21
    //   310: astore 19
    //   312: aload 20
    //   314: astore 4
    //   316: ldc -53
    //   318: iconst_1
    //   319: aload 24
    //   321: aload 22
    //   323: invokevirtual 212	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   326: invokevirtual 224	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   329: invokestatic 229	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   332: lload 7
    //   334: lstore 9
    //   336: aload 21
    //   338: astore 18
    //   340: aload 20
    //   342: astore 17
    //   344: aload 21
    //   346: astore 19
    //   348: aload 20
    //   350: astore 4
    //   352: invokestatic 392	java/lang/System:currentTimeMillis	()J
    //   355: lstore 11
    //   357: lload 11
    //   359: lstore 9
    //   361: aload 21
    //   363: astore 18
    //   365: aload 20
    //   367: astore 17
    //   369: aload 21
    //   371: astore 19
    //   373: aload 20
    //   375: astore 4
    //   377: aload_0
    //   378: lload 11
    //   380: putfield 112	com/tencent/mobileqq/msf/core/net/g:C	J
    //   383: lload 11
    //   385: lstore 9
    //   387: aload 21
    //   389: astore 18
    //   391: aload 20
    //   393: astore 17
    //   395: aload 21
    //   397: astore 19
    //   399: aload 20
    //   401: astore 4
    //   403: aload_0
    //   404: new 414	java/net/Socket
    //   407: dup
    //   408: invokespecial 415	java/net/Socket:<init>	()V
    //   411: putfield 254	com/tencent/mobileqq/msf/core/net/g:g	Ljava/net/Socket;
    //   414: lload 11
    //   416: lstore 9
    //   418: aload 21
    //   420: astore 18
    //   422: aload 20
    //   424: astore 17
    //   426: aload 21
    //   428: astore 19
    //   430: aload 20
    //   432: astore 4
    //   434: aload_0
    //   435: getfield 254	com/tencent/mobileqq/msf/core/net/g:g	Ljava/net/Socket;
    //   438: iload_3
    //   439: invokevirtual 419	java/net/Socket:setSoTimeout	(I)V
    //   442: lload 11
    //   444: lstore 9
    //   446: aload 21
    //   448: astore 18
    //   450: aload 20
    //   452: astore 17
    //   454: aload 21
    //   456: astore 19
    //   458: aload 20
    //   460: astore 4
    //   462: aload_0
    //   463: getfield 254	com/tencent/mobileqq/msf/core/net/g:g	Ljava/net/Socket;
    //   466: iconst_1
    //   467: invokevirtual 422	java/net/Socket:setTcpNoDelay	(Z)V
    //   470: lload 11
    //   472: lstore 9
    //   474: aload 21
    //   476: astore 18
    //   478: aload 20
    //   480: astore 17
    //   482: aload 21
    //   484: astore 19
    //   486: aload 20
    //   488: astore 4
    //   490: aload_0
    //   491: getfield 254	com/tencent/mobileqq/msf/core/net/g:g	Ljava/net/Socket;
    //   494: iconst_1
    //   495: invokevirtual 425	java/net/Socket:setKeepAlive	(Z)V
    //   498: lload 11
    //   500: lstore 9
    //   502: aload 21
    //   504: astore 18
    //   506: aload 20
    //   508: astore 17
    //   510: aload 21
    //   512: astore 19
    //   514: aload 20
    //   516: astore 4
    //   518: aload_0
    //   519: getfield 254	com/tencent/mobileqq/msf/core/net/g:g	Ljava/net/Socket;
    //   522: aload_0
    //   523: getfield 403	com/tencent/mobileqq/msf/core/net/g:c	Ljava/net/InetSocketAddress;
    //   526: aload_1
    //   527: invokevirtual 427	com/tencent/mobileqq/msf/core/d:e	()I
    //   530: invokevirtual 431	java/net/Socket:connect	(Ljava/net/SocketAddress;I)V
    //   533: lload 11
    //   535: lstore 9
    //   537: aload 21
    //   539: astore 18
    //   541: aload 20
    //   543: astore 17
    //   545: aload 21
    //   547: astore 19
    //   549: aload 20
    //   551: astore 4
    //   553: aload 6
    //   555: iconst_1
    //   556: putfield 435	com/tencent/mobileqq/msf/core/net/a:d	Z
    //   559: lload 11
    //   561: lstore 9
    //   563: aload 21
    //   565: astore 18
    //   567: aload 20
    //   569: astore 17
    //   571: aload 21
    //   573: astore 19
    //   575: aload 20
    //   577: astore 4
    //   579: aload 6
    //   581: aload 6
    //   583: getfield 437	com/tencent/mobileqq/msf/core/net/a:j	I
    //   586: iconst_1
    //   587: iadd
    //   588: putfield 437	com/tencent/mobileqq/msf/core/net/a:j	I
    //   591: lload 11
    //   593: lstore 9
    //   595: aload 21
    //   597: astore 18
    //   599: aload 20
    //   601: astore 17
    //   603: aload 21
    //   605: astore 19
    //   607: aload 20
    //   609: astore 4
    //   611: aload_0
    //   612: invokestatic 392	java/lang/System:currentTimeMillis	()J
    //   615: putfield 94	com/tencent/mobileqq/msf/core/net/g:q	J
    //   618: lload 11
    //   620: lstore 9
    //   622: aload 21
    //   624: astore 18
    //   626: aload 20
    //   628: astore 17
    //   630: aload 21
    //   632: astore 19
    //   634: aload 20
    //   636: astore 4
    //   638: aload_0
    //   639: getfield 94	com/tencent/mobileqq/msf/core/net/g:q	J
    //   642: lload 11
    //   644: lsub
    //   645: lstore 13
    //   647: lload 11
    //   649: lstore 9
    //   651: aload 21
    //   653: astore 18
    //   655: aload 20
    //   657: astore 17
    //   659: aload 21
    //   661: astore 19
    //   663: aload 20
    //   665: astore 4
    //   667: aload_0
    //   668: getfield 114	com/tencent/mobileqq/msf/core/net/g:z	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   671: getfield 182	com/tencent/mobileqq/msf/core/MsfCore:sender	Lcom/tencent/mobileqq/msf/core/w;
    //   674: getfield 440	com/tencent/mobileqq/msf/core/w:a	Lcom/tencent/mobileqq/msf/core/net/h;
    //   677: astore 22
    //   679: lload 11
    //   681: lstore 9
    //   683: aload 21
    //   685: astore 18
    //   687: aload 20
    //   689: astore 17
    //   691: aload 21
    //   693: astore 19
    //   695: aload 20
    //   697: astore 4
    //   699: aload 22
    //   701: aload 22
    //   703: getfield 444	com/tencent/mobileqq/msf/core/net/h:p	J
    //   706: lload 13
    //   708: ladd
    //   709: putfield 444	com/tencent/mobileqq/msf/core/net/h:p	J
    //   712: lload 13
    //   714: lstore 7
    //   716: lload 13
    //   718: lconst_0
    //   719: lcmp
    //   720: ifge +6 -> 726
    //   723: lconst_0
    //   724: lstore 7
    //   726: lload 11
    //   728: lstore 9
    //   730: aload 21
    //   732: astore 18
    //   734: aload 20
    //   736: astore 17
    //   738: aload 21
    //   740: astore 19
    //   742: aload 20
    //   744: astore 4
    //   746: aload_0
    //   747: getfield 94	com/tencent/mobileqq/msf/core/net/g:q	J
    //   750: putstatic 447	com/tencent/mobileqq/msf/core/w:O	J
    //   753: lload 11
    //   755: lstore 9
    //   757: aload 21
    //   759: astore 18
    //   761: aload 20
    //   763: astore 17
    //   765: aload 21
    //   767: astore 19
    //   769: aload 20
    //   771: astore 4
    //   773: aload_0
    //   774: getfield 90	com/tencent/mobileqq/msf/core/net/g:o	Ljava/util/concurrent/atomic/AtomicLong;
    //   777: lconst_0
    //   778: invokevirtual 450	java/util/concurrent/atomic/AtomicLong:set	(J)V
    //   781: lload 11
    //   783: lstore 9
    //   785: aload 21
    //   787: astore 18
    //   789: aload 20
    //   791: astore 17
    //   793: aload 21
    //   795: astore 19
    //   797: aload 20
    //   799: astore 4
    //   801: aload_0
    //   802: getfield 92	com/tencent/mobileqq/msf/core/net/g:p	Ljava/util/concurrent/atomic/AtomicLong;
    //   805: lconst_0
    //   806: invokevirtual 450	java/util/concurrent/atomic/AtomicLong:set	(J)V
    //   809: lload 11
    //   811: lstore 9
    //   813: aload 21
    //   815: astore 18
    //   817: aload 20
    //   819: astore 17
    //   821: aload 21
    //   823: astore 19
    //   825: aload 20
    //   827: astore 4
    //   829: aload_0
    //   830: aload_0
    //   831: getfield 254	com/tencent/mobileqq/msf/core/net/g:g	Ljava/net/Socket;
    //   834: invokevirtual 454	java/net/Socket:getOutputStream	()Ljava/io/OutputStream;
    //   837: putfield 72	com/tencent/mobileqq/msf/core/net/g:h	Ljava/io/OutputStream;
    //   840: lload 11
    //   842: lstore 9
    //   844: aload 21
    //   846: astore 18
    //   848: aload 20
    //   850: astore 17
    //   852: aload 21
    //   854: astore 19
    //   856: aload 20
    //   858: astore 4
    //   860: getstatic 65	com/tencent/mobileqq/msf/core/net/g:n	Ljava/util/ArrayList;
    //   863: aload_0
    //   864: getfield 72	com/tencent/mobileqq/msf/core/net/g:h	Ljava/io/OutputStream;
    //   867: invokevirtual 455	java/lang/Object:toString	()Ljava/lang/String;
    //   870: invokevirtual 458	java/util/ArrayList:contains	(Ljava/lang/Object;)Z
    //   873: ifne +37 -> 910
    //   876: lload 11
    //   878: lstore 9
    //   880: aload 21
    //   882: astore 18
    //   884: aload 20
    //   886: astore 17
    //   888: aload 21
    //   890: astore 19
    //   892: aload 20
    //   894: astore 4
    //   896: getstatic 65	com/tencent/mobileqq/msf/core/net/g:n	Ljava/util/ArrayList;
    //   899: aload_0
    //   900: getfield 72	com/tencent/mobileqq/msf/core/net/g:h	Ljava/io/OutputStream;
    //   903: invokevirtual 455	java/lang/Object:toString	()Ljava/lang/String;
    //   906: invokevirtual 461	java/util/ArrayList:add	(Ljava/lang/Object;)Z
    //   909: pop
    //   910: lload 11
    //   912: lstore 9
    //   914: aload 21
    //   916: astore 18
    //   918: aload 20
    //   920: astore 17
    //   922: aload 21
    //   924: astore 19
    //   926: aload 20
    //   928: astore 4
    //   930: aload_0
    //   931: new 463	com/tencent/qphone/base/util/MsfSocketInputBuffer
    //   934: dup
    //   935: aload_0
    //   936: getfield 254	com/tencent/mobileqq/msf/core/net/g:g	Ljava/net/Socket;
    //   939: iload_2
    //   940: ldc_w 465
    //   943: iconst_m1
    //   944: invokespecial 468	com/tencent/qphone/base/util/MsfSocketInputBuffer:<init>	(Ljava/net/Socket;ILjava/lang/String;I)V
    //   947: putfield 74	com/tencent/mobileqq/msf/core/net/g:k	Lcom/tencent/qphone/base/util/MsfSocketInputBuffer;
    //   950: lload 11
    //   952: lstore 9
    //   954: aload 21
    //   956: astore 18
    //   958: aload 20
    //   960: astore 17
    //   962: aload 21
    //   964: astore 19
    //   966: aload 20
    //   968: astore 4
    //   970: aload_0
    //   971: new 6	com/tencent/mobileqq/msf/core/net/g$a
    //   974: dup
    //   975: aload_0
    //   976: invokespecial 471	com/tencent/mobileqq/msf/core/net/g$a:<init>	(Lcom/tencent/mobileqq/msf/core/net/g;)V
    //   979: putfield 473	com/tencent/mobileqq/msf/core/net/g:j	Lcom/tencent/mobileqq/msf/core/net/g$a;
    //   982: lload 11
    //   984: lstore 9
    //   986: aload 21
    //   988: astore 18
    //   990: aload 20
    //   992: astore 17
    //   994: aload 21
    //   996: astore 19
    //   998: aload 20
    //   1000: astore 4
    //   1002: aload_0
    //   1003: getfield 473	com/tencent/mobileqq/msf/core/net/g:j	Lcom/tencent/mobileqq/msf/core/net/g$a;
    //   1006: ldc_w 475
    //   1009: invokevirtual 479	com/tencent/mobileqq/msf/core/net/g$a:setName	(Ljava/lang/String;)V
    //   1012: lload 11
    //   1014: lstore 9
    //   1016: aload 21
    //   1018: astore 18
    //   1020: aload 20
    //   1022: astore 17
    //   1024: aload 21
    //   1026: astore 19
    //   1028: aload 20
    //   1030: astore 4
    //   1032: aload_0
    //   1033: getfield 473	com/tencent/mobileqq/msf/core/net/g:j	Lcom/tencent/mobileqq/msf/core/net/g$a;
    //   1036: invokevirtual 482	com/tencent/mobileqq/msf/core/net/g$a:start	()V
    //   1039: lload 11
    //   1041: lstore 9
    //   1043: aload 21
    //   1045: astore 18
    //   1047: aload 20
    //   1049: astore 17
    //   1051: aload 21
    //   1053: astore 19
    //   1055: aload 20
    //   1057: astore 4
    //   1059: aload_0
    //   1060: getfield 101	com/tencent/mobileqq/msf/core/net/g:s	Ljava/util/concurrent/atomic/AtomicBoolean;
    //   1063: iconst_1
    //   1064: invokevirtual 342	java/util/concurrent/atomic/AtomicBoolean:set	(Z)V
    //   1067: lload 11
    //   1069: lstore 9
    //   1071: aload 21
    //   1073: astore 18
    //   1075: aload 20
    //   1077: astore 17
    //   1079: aload 21
    //   1081: astore 19
    //   1083: aload 20
    //   1085: astore 4
    //   1087: getstatic 484	com/tencent/mobileqq/msf/core/net/q:c	Lcom/tencent/mobileqq/msf/core/net/q;
    //   1090: astore 20
    //   1092: ldc_w 486
    //   1095: astore 21
    //   1097: lload 11
    //   1099: lstore 9
    //   1101: aload 21
    //   1103: astore 18
    //   1105: aload 20
    //   1107: astore 17
    //   1109: aload 21
    //   1111: astore 19
    //   1113: aload 20
    //   1115: astore 4
    //   1117: aload_0
    //   1118: aload_1
    //   1119: putfield 488	com/tencent/mobileqq/msf/core/net/g:A	Lcom/tencent/mobileqq/msf/core/d;
    //   1122: lload 11
    //   1124: lstore 9
    //   1126: aload 21
    //   1128: astore 18
    //   1130: aload 20
    //   1132: astore 17
    //   1134: aload 21
    //   1136: astore 19
    //   1138: aload 20
    //   1140: astore 4
    //   1142: invokestatic 490	com/tencent/mobileqq/msf/core/w:d	()V
    //   1145: lload 11
    //   1147: lstore 9
    //   1149: aload 21
    //   1151: astore 18
    //   1153: aload 20
    //   1155: astore 17
    //   1157: aload 21
    //   1159: astore 19
    //   1161: aload 20
    //   1163: astore 4
    //   1165: new 205	java/lang/StringBuilder
    //   1168: dup
    //   1169: invokespecial 206	java/lang/StringBuilder:<init>	()V
    //   1172: aload_0
    //   1173: getfield 488	com/tencent/mobileqq/msf/core/net/g:A	Lcom/tencent/mobileqq/msf/core/d;
    //   1176: invokevirtual 396	com/tencent/mobileqq/msf/core/d:c	()Ljava/lang/String;
    //   1179: invokevirtual 212	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1182: ldc_w 492
    //   1185: invokevirtual 212	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1188: aload_0
    //   1189: getfield 488	com/tencent/mobileqq/msf/core/net/g:A	Lcom/tencent/mobileqq/msf/core/d;
    //   1192: invokevirtual 398	com/tencent/mobileqq/msf/core/d:d	()I
    //   1195: invokevirtual 292	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1198: invokevirtual 224	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1201: putstatic 494	com/tencent/mobileqq/msf/core/w:C	Ljava/lang/String;
    //   1204: lload 11
    //   1206: lstore 9
    //   1208: aload 21
    //   1210: astore 18
    //   1212: aload 20
    //   1214: astore 17
    //   1216: aload 21
    //   1218: astore 19
    //   1220: aload 20
    //   1222: astore 4
    //   1224: new 205	java/lang/StringBuilder
    //   1227: dup
    //   1228: invokespecial 206	java/lang/StringBuilder:<init>	()V
    //   1231: aload_0
    //   1232: getfield 254	com/tencent/mobileqq/msf/core/net/g:g	Ljava/net/Socket;
    //   1235: invokevirtual 498	java/net/Socket:getLocalSocketAddress	()Ljava/net/SocketAddress;
    //   1238: invokevirtual 408	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   1241: ldc_w 500
    //   1244: invokevirtual 212	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1247: aload_0
    //   1248: getfield 254	com/tencent/mobileqq/msf/core/net/g:g	Ljava/net/Socket;
    //   1251: invokevirtual 503	java/net/Socket:getLocalPort	()I
    //   1254: invokevirtual 292	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1257: invokevirtual 224	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1260: putstatic 506	com/tencent/mobileqq/msf/core/w:D	Ljava/lang/String;
    //   1263: lload 11
    //   1265: lstore 9
    //   1267: aload 21
    //   1269: astore 18
    //   1271: aload 20
    //   1273: astore 17
    //   1275: aload 21
    //   1277: astore 19
    //   1279: aload 20
    //   1281: astore 4
    //   1283: invokestatic 511	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:isWifiConn	()Z
    //   1286: ifeq +701 -> 1987
    //   1289: lload 11
    //   1291: lstore 9
    //   1293: aload 21
    //   1295: astore 18
    //   1297: aload 20
    //   1299: astore 17
    //   1301: aload 21
    //   1303: astore 19
    //   1305: aload 20
    //   1307: astore 4
    //   1309: iconst_1
    //   1310: putstatic 514	com/tencent/mobileqq/msf/core/w:E	I
    //   1313: lload 11
    //   1315: lstore 9
    //   1317: aload 21
    //   1319: astore 18
    //   1321: aload 20
    //   1323: astore 17
    //   1325: aload 21
    //   1327: astore 19
    //   1329: aload 20
    //   1331: astore 4
    //   1333: aload_0
    //   1334: getfield 488	com/tencent/mobileqq/msf/core/net/g:A	Lcom/tencent/mobileqq/msf/core/d;
    //   1337: invokevirtual 516	com/tencent/mobileqq/msf/core/d:f	()V
    //   1340: lload 11
    //   1342: lstore 9
    //   1344: aload 21
    //   1346: astore 18
    //   1348: aload 20
    //   1350: astore 17
    //   1352: aload 21
    //   1354: astore 19
    //   1356: aload 20
    //   1358: astore 4
    //   1360: aload 23
    //   1362: iconst_0
    //   1363: aload 23
    //   1365: invokevirtual 519	java/lang/StringBuilder:length	()I
    //   1368: invokevirtual 523	java/lang/StringBuilder:delete	(II)Ljava/lang/StringBuilder;
    //   1371: pop
    //   1372: lload 11
    //   1374: lstore 9
    //   1376: aload 21
    //   1378: astore 18
    //   1380: aload 20
    //   1382: astore 17
    //   1384: aload 21
    //   1386: astore 19
    //   1388: aload 20
    //   1390: astore 4
    //   1392: new 205	java/lang/StringBuilder
    //   1395: dup
    //   1396: invokespecial 206	java/lang/StringBuilder:<init>	()V
    //   1399: aload 23
    //   1401: ldc_w 525
    //   1404: invokevirtual 212	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1407: aload_0
    //   1408: getfield 403	com/tencent/mobileqq/msf/core/net/g:c	Ljava/net/InetSocketAddress;
    //   1411: invokevirtual 408	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   1414: ldc_w 527
    //   1417: invokevirtual 212	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1420: lload 7
    //   1422: invokevirtual 530	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   1425: ldc_w 532
    //   1428: invokevirtual 212	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1431: aload_1
    //   1432: invokevirtual 427	com/tencent/mobileqq/msf/core/d:e	()I
    //   1435: invokevirtual 292	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1438: ldc_w 534
    //   1441: invokevirtual 212	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1444: aload_0
    //   1445: getfield 254	com/tencent/mobileqq/msf/core/net/g:g	Ljava/net/Socket;
    //   1448: invokevirtual 538	java/net/Socket:getLocalAddress	()Ljava/net/InetAddress;
    //   1451: invokevirtual 543	java/net/InetAddress:getHostAddress	()Ljava/lang/String;
    //   1454: invokevirtual 212	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1457: ldc_w 492
    //   1460: invokevirtual 212	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1463: aload_0
    //   1464: getfield 254	com/tencent/mobileqq/msf/core/net/g:g	Ljava/net/Socket;
    //   1467: invokevirtual 503	java/net/Socket:getLocalPort	()I
    //   1470: invokevirtual 292	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1473: invokevirtual 224	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1476: invokevirtual 212	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1479: astore 23
    //   1481: lload 11
    //   1483: lstore 9
    //   1485: aload 21
    //   1487: astore 18
    //   1489: aload 20
    //   1491: astore 17
    //   1493: aload 21
    //   1495: astore 19
    //   1497: aload 20
    //   1499: astore 4
    //   1501: aload_1
    //   1502: getfield 410	com/tencent/mobileqq/msf/core/d:h	Z
    //   1505: ifeq +736 -> 2241
    //   1508: ldc_w 412
    //   1511: astore 22
    //   1513: lload 11
    //   1515: lstore 9
    //   1517: aload 21
    //   1519: astore 18
    //   1521: aload 20
    //   1523: astore 17
    //   1525: aload 21
    //   1527: astore 19
    //   1529: aload 20
    //   1531: astore 4
    //   1533: ldc -53
    //   1535: iconst_1
    //   1536: aload 23
    //   1538: aload 22
    //   1540: invokevirtual 212	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1543: invokevirtual 224	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1546: invokestatic 229	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   1549: lload 11
    //   1551: lstore 9
    //   1553: aload 21
    //   1555: astore 18
    //   1557: aload 20
    //   1559: astore 17
    //   1561: aload 21
    //   1563: astore 19
    //   1565: aload 20
    //   1567: astore 4
    //   1569: aload_0
    //   1570: getfield 85	com/tencent/mobileqq/msf/core/net/g:B	Ljava/util/concurrent/atomic/AtomicInteger;
    //   1573: iconst_0
    //   1574: invokevirtual 545	java/util/concurrent/atomic/AtomicInteger:set	(I)V
    //   1577: lload 11
    //   1579: lstore 9
    //   1581: aload 21
    //   1583: astore 18
    //   1585: aload 20
    //   1587: astore 17
    //   1589: aload 21
    //   1591: astore 19
    //   1593: aload 20
    //   1595: astore 4
    //   1597: getstatic 262	com/tencent/mobileqq/msf/core/w:p	Z
    //   1600: ifeq +137 -> 1737
    //   1603: lload 11
    //   1605: lstore 9
    //   1607: aload 21
    //   1609: astore 18
    //   1611: aload 20
    //   1613: astore 17
    //   1615: aload 21
    //   1617: astore 19
    //   1619: aload 20
    //   1621: astore 4
    //   1623: invokestatic 266	com/tencent/mobileqq/msf/core/net/a/f:a	()Z
    //   1626: istore 5
    //   1628: iload 5
    //   1630: ifeq +107 -> 1737
    //   1633: lload 11
    //   1635: lstore 9
    //   1637: aload 21
    //   1639: astore 18
    //   1641: aload 20
    //   1643: astore 17
    //   1645: aload 21
    //   1647: astore 19
    //   1649: aload 20
    //   1651: astore 4
    //   1653: ldc -53
    //   1655: iconst_1
    //   1656: ldc_w 547
    //   1659: invokestatic 229	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   1662: lload 11
    //   1664: lstore 9
    //   1666: aload 21
    //   1668: astore 18
    //   1670: aload 20
    //   1672: astore 17
    //   1674: aload 21
    //   1676: astore 19
    //   1678: aload 20
    //   1680: astore 4
    //   1682: aload_0
    //   1683: getfield 114	com/tencent/mobileqq/msf/core/net/g:z	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   1686: getfield 182	com/tencent/mobileqq/msf/core/MsfCore:sender	Lcom/tencent/mobileqq/msf/core/w;
    //   1689: getfield 272	com/tencent/mobileqq/msf/core/w:F	Lcom/tencent/mobileqq/msf/core/net/a/f;
    //   1692: ifnull +45 -> 1737
    //   1695: lload 11
    //   1697: lstore 9
    //   1699: aload 21
    //   1701: astore 18
    //   1703: aload 20
    //   1705: astore 17
    //   1707: aload 21
    //   1709: astore 19
    //   1711: aload 20
    //   1713: astore 4
    //   1715: aload_0
    //   1716: getfield 114	com/tencent/mobileqq/msf/core/net/g:z	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   1719: getfield 182	com/tencent/mobileqq/msf/core/MsfCore:sender	Lcom/tencent/mobileqq/msf/core/w;
    //   1722: getfield 272	com/tencent/mobileqq/msf/core/w:F	Lcom/tencent/mobileqq/msf/core/net/a/f;
    //   1725: invokevirtual 275	com/tencent/mobileqq/msf/core/net/a/f:b	()Lcom/tencent/mobileqq/msf/core/net/a/e;
    //   1728: aload_0
    //   1729: getfield 254	com/tencent/mobileqq/msf/core/net/g:g	Ljava/net/Socket;
    //   1732: invokeinterface 550 2 0
    //   1737: aload_0
    //   1738: getfield 110	com/tencent/mobileqq/msf/core/net/g:v	Ljava/util/concurrent/locks/ReentrantLock;
    //   1741: invokevirtual 553	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   1744: aload 20
    //   1746: getstatic 484	com/tencent/mobileqq/msf/core/net/q:c	Lcom/tencent/mobileqq/msf/core/net/q;
    //   1749: if_acmpeq +21 -> 1770
    //   1752: aload 6
    //   1754: iconst_0
    //   1755: putfield 435	com/tencent/mobileqq/msf/core/net/a:d	Z
    //   1758: aload 6
    //   1760: aload 6
    //   1762: getfield 555	com/tencent/mobileqq/msf/core/net/a:k	I
    //   1765: iconst_1
    //   1766: iadd
    //   1767: putfield 555	com/tencent/mobileqq/msf/core/net/a:k	I
    //   1770: aload 6
    //   1772: aload 20
    //   1774: putfield 557	com/tencent/mobileqq/msf/core/net/a:e	Lcom/tencent/mobileqq/msf/core/net/q;
    //   1777: aload 6
    //   1779: ldc_w 486
    //   1782: putfield 559	com/tencent/mobileqq/msf/core/net/a:f	Ljava/lang/String;
    //   1785: aload 6
    //   1787: invokestatic 387	android/os/SystemClock:elapsedRealtime	()J
    //   1790: lload 15
    //   1792: lsub
    //   1793: putfield 561	com/tencent/mobileqq/msf/core/net/a:a	J
    //   1796: aload 20
    //   1798: astore 18
    //   1800: aload 18
    //   1802: getstatic 484	com/tencent/mobileqq/msf/core/net/q:c	Lcom/tencent/mobileqq/msf/core/net/q;
    //   1805: if_acmpne +1457 -> 3262
    //   1808: aload_0
    //   1809: getfield 116	com/tencent/mobileqq/msf/core/net/g:w	Z
    //   1812: ifeq +1450 -> 3262
    //   1815: invokestatic 564	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:isNetSupport	()Z
    //   1818: ifne +7 -> 1825
    //   1821: iconst_1
    //   1822: invokestatic 567	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:setNetSupport	(Z)V
    //   1825: aload_0
    //   1826: getfield 114	com/tencent/mobileqq/msf/core/net/g:z	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   1829: getfield 182	com/tencent/mobileqq/msf/core/MsfCore:sender	Lcom/tencent/mobileqq/msf/core/w;
    //   1832: aconst_null
    //   1833: invokevirtual 569	com/tencent/mobileqq/msf/core/w:a	([B)V
    //   1836: aload_0
    //   1837: getfield 114	com/tencent/mobileqq/msf/core/net/g:z	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   1840: getfield 182	com/tencent/mobileqq/msf/core/MsfCore:sender	Lcom/tencent/mobileqq/msf/core/w;
    //   1843: invokevirtual 571	com/tencent/mobileqq/msf/core/w:c	()V
    //   1846: getstatic 573	com/tencent/mobileqq/msf/core/w:z	Ljava/util/concurrent/atomic/AtomicInteger;
    //   1849: iconst_0
    //   1850: invokevirtual 545	java/util/concurrent/atomic/AtomicInteger:set	(I)V
    //   1853: aload_0
    //   1854: getfield 254	com/tencent/mobileqq/msf/core/net/g:g	Ljava/net/Socket;
    //   1857: ifnull +121 -> 1978
    //   1860: aload_0
    //   1861: getfield 114	com/tencent/mobileqq/msf/core/net/g:z	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   1864: new 205	java/lang/StringBuilder
    //   1867: dup
    //   1868: invokespecial 206	java/lang/StringBuilder:<init>	()V
    //   1871: aload_0
    //   1872: getfield 254	com/tencent/mobileqq/msf/core/net/g:g	Ljava/net/Socket;
    //   1875: invokevirtual 538	java/net/Socket:getLocalAddress	()Ljava/net/InetAddress;
    //   1878: invokevirtual 543	java/net/InetAddress:getHostAddress	()Ljava/lang/String;
    //   1881: invokevirtual 212	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1884: ldc_w 492
    //   1887: invokevirtual 212	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   1890: aload_0
    //   1891: getfield 254	com/tencent/mobileqq/msf/core/net/g:g	Ljava/net/Socket;
    //   1894: invokevirtual 503	java/net/Socket:getLocalPort	()I
    //   1897: invokevirtual 292	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   1900: invokevirtual 224	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   1903: putfield 576	com/tencent/mobileqq/msf/core/MsfCore:nowSocketConnAdd	Ljava/lang/String;
    //   1906: aload_0
    //   1907: getfield 103	com/tencent/mobileqq/msf/core/net/g:t	Ljava/util/concurrent/atomic/AtomicBoolean;
    //   1910: iconst_0
    //   1911: invokevirtual 342	java/util/concurrent/atomic/AtomicBoolean:set	(Z)V
    //   1914: invokestatic 580	com/tencent/mobileqq/msf/core/a/a:u	()Z
    //   1917: ifeq +1303 -> 3220
    //   1920: aload_0
    //   1921: invokevirtual 582	com/tencent/mobileqq/msf/core/net/g:e	()V
    //   1924: invokestatic 584	com/tencent/mobileqq/msf/core/a/a:v	()Z
    //   1927: ifeq +1323 -> 3250
    //   1930: aload_0
    //   1931: aload_0
    //   1932: getfield 114	com/tencent/mobileqq/msf/core/net/g:z	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   1935: getfield 182	com/tencent/mobileqq/msf/core/MsfCore:sender	Lcom/tencent/mobileqq/msf/core/w;
    //   1938: aload_0
    //   1939: getfield 254	com/tencent/mobileqq/msf/core/net/g:g	Ljava/net/Socket;
    //   1942: invokevirtual 257	java/lang/Object:hashCode	()I
    //   1945: invokevirtual 587	com/tencent/mobileqq/msf/core/w:a	(I)Ljava/lang/Runnable;
    //   1948: putfield 357	com/tencent/mobileqq/msf/core/net/g:y	Ljava/lang/Runnable;
    //   1951: aload_0
    //   1952: getfield 403	com/tencent/mobileqq/msf/core/net/g:c	Ljava/net/InetSocketAddress;
    //   1955: invokevirtual 588	java/net/InetSocketAddress:toString	()Ljava/lang/String;
    //   1958: aload_0
    //   1959: getfield 114	com/tencent/mobileqq/msf/core/net/g:z	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   1962: getfield 576	com/tencent/mobileqq/msf/core/MsfCore:nowSocketConnAdd	Ljava/lang/String;
    //   1965: invokestatic 594	com/tencent/mobileqq/msf/core/NetConnInfoCenter:onConnOpened	(Ljava/lang/String;Ljava/lang/String;)V
    //   1968: aload_0
    //   1969: getfield 114	com/tencent/mobileqq/msf/core/net/g:z	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   1972: getfield 182	com/tencent/mobileqq/msf/core/MsfCore:sender	Lcom/tencent/mobileqq/msf/core/w;
    //   1975: invokevirtual 596	com/tencent/mobileqq/msf/core/w:h	()V
    //   1978: return
    //   1979: ldc_w 598
    //   1982: astore 22
    //   1984: goto -1688 -> 296
    //   1987: lload 11
    //   1989: lstore 9
    //   1991: aload 21
    //   1993: astore 18
    //   1995: aload 20
    //   1997: astore 17
    //   1999: aload 21
    //   2001: astore 19
    //   2003: aload 20
    //   2005: astore 4
    //   2007: invokestatic 601	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:isMobileConn	()Z
    //   2010: ifeq -697 -> 1313
    //   2013: lload 11
    //   2015: lstore 9
    //   2017: aload 21
    //   2019: astore 18
    //   2021: aload 20
    //   2023: astore 17
    //   2025: aload 21
    //   2027: astore 19
    //   2029: aload 20
    //   2031: astore 4
    //   2033: invokestatic 604	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:getMobileNetworkType	()I
    //   2036: bipush 100
    //   2038: iadd
    //   2039: putstatic 514	com/tencent/mobileqq/msf/core/w:E	I
    //   2042: goto -729 -> 1313
    //   2045: astore 22
    //   2047: aload 18
    //   2049: astore 19
    //   2051: aload 17
    //   2053: astore 4
    //   2055: invokestatic 392	java/lang/System:currentTimeMillis	()J
    //   2058: lload 9
    //   2060: lsub
    //   2061: lstore 7
    //   2063: aload 18
    //   2065: astore 19
    //   2067: aload 17
    //   2069: astore 4
    //   2071: aload_0
    //   2072: getfield 114	com/tencent/mobileqq/msf/core/net/g:z	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   2075: getfield 182	com/tencent/mobileqq/msf/core/MsfCore:sender	Lcom/tencent/mobileqq/msf/core/w;
    //   2078: getfield 440	com/tencent/mobileqq/msf/core/w:a	Lcom/tencent/mobileqq/msf/core/net/h;
    //   2081: astore 20
    //   2083: aload 18
    //   2085: astore 19
    //   2087: aload 17
    //   2089: astore 4
    //   2091: aload 20
    //   2093: aload 20
    //   2095: getfield 444	com/tencent/mobileqq/msf/core/net/h:p	J
    //   2098: lload 7
    //   2100: ladd
    //   2101: putfield 444	com/tencent/mobileqq/msf/core/net/h:p	J
    //   2104: aload 18
    //   2106: astore 19
    //   2108: aload 17
    //   2110: astore 4
    //   2112: aload 22
    //   2114: invokevirtual 605	java/lang/Throwable:toString	()Ljava/lang/String;
    //   2117: invokevirtual 608	java/lang/String:toLowerCase	()Ljava/lang/String;
    //   2120: astore 21
    //   2122: aload 21
    //   2124: astore 19
    //   2126: aload 17
    //   2128: astore 4
    //   2130: invokestatic 611	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:getSystemNetworkType	()I
    //   2133: ifne +256 -> 2389
    //   2136: aload 21
    //   2138: astore 19
    //   2140: aload 17
    //   2142: astore 4
    //   2144: getstatic 613	com/tencent/mobileqq/msf/core/net/q:m	Lcom/tencent/mobileqq/msf/core/net/q;
    //   2147: astore 18
    //   2149: aload 21
    //   2151: astore 19
    //   2153: aload 18
    //   2155: astore 4
    //   2157: aload 18
    //   2159: invokevirtual 614	com/tencent/mobileqq/msf/core/net/q:toString	()Ljava/lang/String;
    //   2162: astore 17
    //   2164: aload 17
    //   2166: astore 19
    //   2168: aload 18
    //   2170: astore 4
    //   2172: aload 6
    //   2174: invokestatic 617	com/tencent/mobileqq/msf/core/a/a:av	()I
    //   2177: putfield 619	com/tencent/mobileqq/msf/core/net/a:h	I
    //   2180: aload_0
    //   2181: getfield 110	com/tencent/mobileqq/msf/core/net/g:v	Ljava/util/concurrent/locks/ReentrantLock;
    //   2184: invokevirtual 553	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   2187: aload 18
    //   2189: getstatic 484	com/tencent/mobileqq/msf/core/net/q:c	Lcom/tencent/mobileqq/msf/core/net/q;
    //   2192: if_acmpeq +21 -> 2213
    //   2195: aload 6
    //   2197: iconst_0
    //   2198: putfield 435	com/tencent/mobileqq/msf/core/net/a:d	Z
    //   2201: aload 6
    //   2203: aload 6
    //   2205: getfield 555	com/tencent/mobileqq/msf/core/net/a:k	I
    //   2208: iconst_1
    //   2209: iadd
    //   2210: putfield 555	com/tencent/mobileqq/msf/core/net/a:k	I
    //   2213: aload 6
    //   2215: aload 18
    //   2217: putfield 557	com/tencent/mobileqq/msf/core/net/a:e	Lcom/tencent/mobileqq/msf/core/net/q;
    //   2220: aload 6
    //   2222: aload 17
    //   2224: putfield 559	com/tencent/mobileqq/msf/core/net/a:f	Ljava/lang/String;
    //   2227: aload 6
    //   2229: invokestatic 387	android/os/SystemClock:elapsedRealtime	()J
    //   2232: lload 15
    //   2234: lsub
    //   2235: putfield 561	com/tencent/mobileqq/msf/core/net/a:a	J
    //   2238: goto -438 -> 1800
    //   2241: ldc_w 598
    //   2244: astore 22
    //   2246: goto -733 -> 1513
    //   2249: astore 22
    //   2251: lload 11
    //   2253: lstore 9
    //   2255: aload 21
    //   2257: astore 18
    //   2259: aload 20
    //   2261: astore 17
    //   2263: aload 21
    //   2265: astore 19
    //   2267: aload 20
    //   2269: astore 4
    //   2271: ldc -53
    //   2273: iconst_1
    //   2274: ldc_w 621
    //   2277: aload 22
    //   2279: invokestatic 317	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   2282: goto -545 -> 1737
    //   2285: astore_1
    //   2286: aload_0
    //   2287: getfield 110	com/tencent/mobileqq/msf/core/net/g:v	Ljava/util/concurrent/locks/ReentrantLock;
    //   2290: invokevirtual 553	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   2293: aload 4
    //   2295: getstatic 484	com/tencent/mobileqq/msf/core/net/q:c	Lcom/tencent/mobileqq/msf/core/net/q;
    //   2298: if_acmpeq +21 -> 2319
    //   2301: aload 6
    //   2303: iconst_0
    //   2304: putfield 435	com/tencent/mobileqq/msf/core/net/a:d	Z
    //   2307: aload 6
    //   2309: aload 6
    //   2311: getfield 555	com/tencent/mobileqq/msf/core/net/a:k	I
    //   2314: iconst_1
    //   2315: iadd
    //   2316: putfield 555	com/tencent/mobileqq/msf/core/net/a:k	I
    //   2319: aload 6
    //   2321: aload 4
    //   2323: putfield 557	com/tencent/mobileqq/msf/core/net/a:e	Lcom/tencent/mobileqq/msf/core/net/q;
    //   2326: aload 6
    //   2328: aload 19
    //   2330: putfield 559	com/tencent/mobileqq/msf/core/net/a:f	Ljava/lang/String;
    //   2333: aload 6
    //   2335: invokestatic 387	android/os/SystemClock:elapsedRealtime	()J
    //   2338: lload 15
    //   2340: lsub
    //   2341: putfield 561	com/tencent/mobileqq/msf/core/net/a:a	J
    //   2344: aload_1
    //   2345: athrow
    //   2346: astore_1
    //   2347: aload 6
    //   2349: iconst_0
    //   2350: putfield 435	com/tencent/mobileqq/msf/core/net/a:d	Z
    //   2353: aload 6
    //   2355: aload 6
    //   2357: getfield 555	com/tencent/mobileqq/msf/core/net/a:k	I
    //   2360: iconst_1
    //   2361: iadd
    //   2362: putfield 555	com/tencent/mobileqq/msf/core/net/a:k	I
    //   2365: aload 6
    //   2367: getstatic 623	com/tencent/mobileqq/msf/core/net/q:f	Lcom/tencent/mobileqq/msf/core/net/q;
    //   2370: putfield 557	com/tencent/mobileqq/msf/core/net/a:e	Lcom/tencent/mobileqq/msf/core/net/q;
    //   2373: aload 6
    //   2375: aload_1
    //   2376: invokevirtual 624	java/lang/InterruptedException:toString	()Ljava/lang/String;
    //   2379: putfield 559	com/tencent/mobileqq/msf/core/net/a:f	Ljava/lang/String;
    //   2382: aload 6
    //   2384: lconst_0
    //   2385: putfield 561	com/tencent/mobileqq/msf/core/net/a:a	J
    //   2388: return
    //   2389: aload 21
    //   2391: astore 19
    //   2393: aload 17
    //   2395: astore 4
    //   2397: aload 21
    //   2399: ldc_w 626
    //   2402: invokevirtual 630	java/lang/String:indexOf	(Ljava/lang/String;)I
    //   2405: iconst_m1
    //   2406: if_icmple +34 -> 2440
    //   2409: aload 21
    //   2411: astore 19
    //   2413: aload 17
    //   2415: astore 4
    //   2417: getstatic 632	com/tencent/mobileqq/msf/core/net/q:g	Lcom/tencent/mobileqq/msf/core/net/q;
    //   2420: astore 18
    //   2422: aload 21
    //   2424: astore 19
    //   2426: aload 18
    //   2428: astore 4
    //   2430: aload 18
    //   2432: invokevirtual 614	com/tencent/mobileqq/msf/core/net/q:toString	()Ljava/lang/String;
    //   2435: astore 17
    //   2437: goto -257 -> 2180
    //   2440: aload 21
    //   2442: astore 19
    //   2444: aload 17
    //   2446: astore 4
    //   2448: aload 21
    //   2450: ldc_w 634
    //   2453: invokevirtual 630	java/lang/String:indexOf	(Ljava/lang/String;)I
    //   2456: iconst_m1
    //   2457: if_icmple +34 -> 2491
    //   2460: aload 21
    //   2462: astore 19
    //   2464: aload 17
    //   2466: astore 4
    //   2468: getstatic 636	com/tencent/mobileqq/msf/core/net/q:q	Lcom/tencent/mobileqq/msf/core/net/q;
    //   2471: astore 18
    //   2473: aload 21
    //   2475: astore 19
    //   2477: aload 18
    //   2479: astore 4
    //   2481: aload 18
    //   2483: invokevirtual 614	com/tencent/mobileqq/msf/core/net/q:toString	()Ljava/lang/String;
    //   2486: astore 17
    //   2488: goto -308 -> 2180
    //   2491: aload 21
    //   2493: astore 19
    //   2495: aload 17
    //   2497: astore 4
    //   2499: aload 21
    //   2501: ldc_w 638
    //   2504: invokevirtual 630	java/lang/String:indexOf	(Ljava/lang/String;)I
    //   2507: iconst_m1
    //   2508: if_icmple +50 -> 2558
    //   2511: aload 21
    //   2513: astore 19
    //   2515: aload 17
    //   2517: astore 4
    //   2519: getstatic 613	com/tencent/mobileqq/msf/core/net/q:m	Lcom/tencent/mobileqq/msf/core/net/q;
    //   2522: astore 18
    //   2524: aload 21
    //   2526: astore 19
    //   2528: aload 18
    //   2530: astore 4
    //   2532: aload 18
    //   2534: invokevirtual 614	com/tencent/mobileqq/msf/core/net/q:toString	()Ljava/lang/String;
    //   2537: astore 17
    //   2539: aload 17
    //   2541: astore 19
    //   2543: aload 18
    //   2545: astore 4
    //   2547: aload 6
    //   2549: invokestatic 617	com/tencent/mobileqq/msf/core/a/a:av	()I
    //   2552: putfield 619	com/tencent/mobileqq/msf/core/net/a:h	I
    //   2555: goto -375 -> 2180
    //   2558: aload 21
    //   2560: astore 19
    //   2562: aload 17
    //   2564: astore 4
    //   2566: aload 21
    //   2568: ldc_w 640
    //   2571: invokevirtual 630	java/lang/String:indexOf	(Ljava/lang/String;)I
    //   2574: iconst_m1
    //   2575: if_icmple +34 -> 2609
    //   2578: aload 21
    //   2580: astore 19
    //   2582: aload 17
    //   2584: astore 4
    //   2586: getstatic 642	com/tencent/mobileqq/msf/core/net/q:i	Lcom/tencent/mobileqq/msf/core/net/q;
    //   2589: astore 18
    //   2591: aload 21
    //   2593: astore 19
    //   2595: aload 18
    //   2597: astore 4
    //   2599: aload 18
    //   2601: invokevirtual 614	com/tencent/mobileqq/msf/core/net/q:toString	()Ljava/lang/String;
    //   2604: astore 17
    //   2606: goto -426 -> 2180
    //   2609: aload 21
    //   2611: astore 19
    //   2613: aload 17
    //   2615: astore 4
    //   2617: aload 21
    //   2619: ldc_w 644
    //   2622: invokevirtual 630	java/lang/String:indexOf	(Ljava/lang/String;)I
    //   2625: iconst_m1
    //   2626: if_icmple +34 -> 2660
    //   2629: aload 21
    //   2631: astore 19
    //   2633: aload 17
    //   2635: astore 4
    //   2637: getstatic 646	com/tencent/mobileqq/msf/core/net/q:s	Lcom/tencent/mobileqq/msf/core/net/q;
    //   2640: astore 18
    //   2642: aload 21
    //   2644: astore 19
    //   2646: aload 18
    //   2648: astore 4
    //   2650: aload 18
    //   2652: invokevirtual 614	com/tencent/mobileqq/msf/core/net/q:toString	()Ljava/lang/String;
    //   2655: astore 17
    //   2657: goto -477 -> 2180
    //   2660: aload 21
    //   2662: astore 19
    //   2664: aload 17
    //   2666: astore 4
    //   2668: aload 21
    //   2670: ldc_w 648
    //   2673: invokevirtual 630	java/lang/String:indexOf	(Ljava/lang/String;)I
    //   2676: iconst_m1
    //   2677: if_icmple +34 -> 2711
    //   2680: aload 21
    //   2682: astore 19
    //   2684: aload 17
    //   2686: astore 4
    //   2688: getstatic 650	com/tencent/mobileqq/msf/core/net/q:r	Lcom/tencent/mobileqq/msf/core/net/q;
    //   2691: astore 18
    //   2693: aload 21
    //   2695: astore 19
    //   2697: aload 18
    //   2699: astore 4
    //   2701: aload 18
    //   2703: invokevirtual 614	com/tencent/mobileqq/msf/core/net/q:toString	()Ljava/lang/String;
    //   2706: astore 17
    //   2708: goto -528 -> 2180
    //   2711: aload 21
    //   2713: astore 19
    //   2715: aload 17
    //   2717: astore 4
    //   2719: aload 21
    //   2721: ldc_w 652
    //   2724: invokevirtual 630	java/lang/String:indexOf	(Ljava/lang/String;)I
    //   2727: iconst_m1
    //   2728: if_icmpgt +23 -> 2751
    //   2731: aload 21
    //   2733: astore 19
    //   2735: aload 17
    //   2737: astore 4
    //   2739: aload 21
    //   2741: ldc_w 654
    //   2744: invokevirtual 630	java/lang/String:indexOf	(Ljava/lang/String;)I
    //   2747: iconst_m1
    //   2748: if_icmple +34 -> 2782
    //   2751: aload 21
    //   2753: astore 19
    //   2755: aload 17
    //   2757: astore 4
    //   2759: getstatic 656	com/tencent/mobileqq/msf/core/net/q:t	Lcom/tencent/mobileqq/msf/core/net/q;
    //   2762: astore 18
    //   2764: aload 21
    //   2766: astore 19
    //   2768: aload 18
    //   2770: astore 4
    //   2772: aload 18
    //   2774: invokevirtual 614	com/tencent/mobileqq/msf/core/net/q:toString	()Ljava/lang/String;
    //   2777: astore 17
    //   2779: goto -599 -> 2180
    //   2782: aload 21
    //   2784: astore 19
    //   2786: aload 17
    //   2788: astore 4
    //   2790: aload 21
    //   2792: ldc_w 658
    //   2795: invokevirtual 630	java/lang/String:indexOf	(Ljava/lang/String;)I
    //   2798: iconst_m1
    //   2799: if_icmple +34 -> 2833
    //   2802: aload 21
    //   2804: astore 19
    //   2806: aload 17
    //   2808: astore 4
    //   2810: getstatic 660	com/tencent/mobileqq/msf/core/net/q:p	Lcom/tencent/mobileqq/msf/core/net/q;
    //   2813: astore 18
    //   2815: aload 21
    //   2817: astore 19
    //   2819: aload 18
    //   2821: astore 4
    //   2823: aload 18
    //   2825: invokevirtual 614	com/tencent/mobileqq/msf/core/net/q:toString	()Ljava/lang/String;
    //   2828: astore 17
    //   2830: goto -650 -> 2180
    //   2833: aload 21
    //   2835: astore 19
    //   2837: aload 17
    //   2839: astore 4
    //   2841: aload 21
    //   2843: ldc_w 662
    //   2846: invokevirtual 630	java/lang/String:indexOf	(Ljava/lang/String;)I
    //   2849: iconst_m1
    //   2850: if_icmple +34 -> 2884
    //   2853: aload 21
    //   2855: astore 19
    //   2857: aload 17
    //   2859: astore 4
    //   2861: getstatic 664	com/tencent/mobileqq/msf/core/net/q:o	Lcom/tencent/mobileqq/msf/core/net/q;
    //   2864: astore 18
    //   2866: aload 21
    //   2868: astore 19
    //   2870: aload 18
    //   2872: astore 4
    //   2874: aload 18
    //   2876: invokevirtual 614	com/tencent/mobileqq/msf/core/net/q:toString	()Ljava/lang/String;
    //   2879: astore 17
    //   2881: goto -701 -> 2180
    //   2884: aload 21
    //   2886: astore 19
    //   2888: aload 17
    //   2890: astore 4
    //   2892: aload 21
    //   2894: ldc_w 666
    //   2897: invokevirtual 630	java/lang/String:indexOf	(Ljava/lang/String;)I
    //   2900: iconst_m1
    //   2901: if_icmple +34 -> 2935
    //   2904: aload 21
    //   2906: astore 19
    //   2908: aload 17
    //   2910: astore 4
    //   2912: getstatic 668	com/tencent/mobileqq/msf/core/net/q:h	Lcom/tencent/mobileqq/msf/core/net/q;
    //   2915: astore 18
    //   2917: aload 21
    //   2919: astore 19
    //   2921: aload 18
    //   2923: astore 4
    //   2925: aload 18
    //   2927: invokevirtual 614	com/tencent/mobileqq/msf/core/net/q:toString	()Ljava/lang/String;
    //   2930: astore 17
    //   2932: goto -752 -> 2180
    //   2935: aload 21
    //   2937: astore 19
    //   2939: aload 17
    //   2941: astore 4
    //   2943: aload 21
    //   2945: ldc_w 670
    //   2948: invokevirtual 630	java/lang/String:indexOf	(Ljava/lang/String;)I
    //   2951: iconst_m1
    //   2952: if_icmple +34 -> 2986
    //   2955: aload 21
    //   2957: astore 19
    //   2959: aload 17
    //   2961: astore 4
    //   2963: getstatic 672	com/tencent/mobileqq/msf/core/net/q:l	Lcom/tencent/mobileqq/msf/core/net/q;
    //   2966: astore 18
    //   2968: aload 21
    //   2970: astore 19
    //   2972: aload 18
    //   2974: astore 4
    //   2976: aload 18
    //   2978: invokevirtual 614	com/tencent/mobileqq/msf/core/net/q:toString	()Ljava/lang/String;
    //   2981: astore 17
    //   2983: goto -803 -> 2180
    //   2986: aload 21
    //   2988: astore 19
    //   2990: aload 17
    //   2992: astore 4
    //   2994: aload 21
    //   2996: ldc_w 674
    //   2999: invokevirtual 630	java/lang/String:indexOf	(Ljava/lang/String;)I
    //   3002: iconst_m1
    //   3003: if_icmple +34 -> 3037
    //   3006: aload 21
    //   3008: astore 19
    //   3010: aload 17
    //   3012: astore 4
    //   3014: getstatic 676	com/tencent/mobileqq/msf/core/net/q:j	Lcom/tencent/mobileqq/msf/core/net/q;
    //   3017: astore 18
    //   3019: aload 21
    //   3021: astore 19
    //   3023: aload 18
    //   3025: astore 4
    //   3027: aload 18
    //   3029: invokevirtual 614	com/tencent/mobileqq/msf/core/net/q:toString	()Ljava/lang/String;
    //   3032: astore 17
    //   3034: goto -854 -> 2180
    //   3037: aload 21
    //   3039: astore 19
    //   3041: aload 17
    //   3043: astore 4
    //   3045: aload 21
    //   3047: ldc_w 678
    //   3050: invokevirtual 630	java/lang/String:indexOf	(Ljava/lang/String;)I
    //   3053: iconst_m1
    //   3054: if_icmple +34 -> 3088
    //   3057: aload 21
    //   3059: astore 19
    //   3061: aload 17
    //   3063: astore 4
    //   3065: getstatic 656	com/tencent/mobileqq/msf/core/net/q:t	Lcom/tencent/mobileqq/msf/core/net/q;
    //   3068: astore 18
    //   3070: aload 21
    //   3072: astore 19
    //   3074: aload 18
    //   3076: astore 4
    //   3078: aload 18
    //   3080: invokevirtual 614	com/tencent/mobileqq/msf/core/net/q:toString	()Ljava/lang/String;
    //   3083: astore 17
    //   3085: goto -905 -> 2180
    //   3088: aload 21
    //   3090: astore 19
    //   3092: aload 17
    //   3094: astore 4
    //   3096: aload 21
    //   3098: ldc_w 680
    //   3101: invokevirtual 630	java/lang/String:indexOf	(Ljava/lang/String;)I
    //   3104: iconst_m1
    //   3105: if_icmple +34 -> 3139
    //   3108: aload 21
    //   3110: astore 19
    //   3112: aload 17
    //   3114: astore 4
    //   3116: getstatic 682	com/tencent/mobileqq/msf/core/net/q:n	Lcom/tencent/mobileqq/msf/core/net/q;
    //   3119: astore 18
    //   3121: aload 21
    //   3123: astore 19
    //   3125: aload 18
    //   3127: astore 4
    //   3129: aload 18
    //   3131: invokevirtual 614	com/tencent/mobileqq/msf/core/net/q:toString	()Ljava/lang/String;
    //   3134: astore 17
    //   3136: goto -956 -> 2180
    //   3139: aload 21
    //   3141: astore 19
    //   3143: aload 17
    //   3145: astore 4
    //   3147: getstatic 684	com/tencent/mobileqq/msf/core/net/q:u	Lcom/tencent/mobileqq/msf/core/net/q;
    //   3150: astore 20
    //   3152: aload 21
    //   3154: astore 19
    //   3156: aload 20
    //   3158: astore 4
    //   3160: aload 22
    //   3162: invokestatic 686	com/tencent/mobileqq/msf/core/net/g:a	(Ljava/lang/Throwable;)Ljava/lang/String;
    //   3165: astore 21
    //   3167: aload 21
    //   3169: astore 17
    //   3171: aload 20
    //   3173: astore 18
    //   3175: aload 21
    //   3177: astore 19
    //   3179: aload 20
    //   3181: astore 4
    //   3183: aload 21
    //   3185: invokevirtual 687	java/lang/String:length	()I
    //   3188: sipush 200
    //   3191: if_icmple -1011 -> 2180
    //   3194: aload 21
    //   3196: astore 19
    //   3198: aload 20
    //   3200: astore 4
    //   3202: aload 21
    //   3204: iconst_0
    //   3205: sipush 200
    //   3208: invokevirtual 691	java/lang/String:substring	(II)Ljava/lang/String;
    //   3211: astore 17
    //   3213: aload 20
    //   3215: astore 18
    //   3217: goto -1037 -> 2180
    //   3220: ldc -53
    //   3222: iconst_1
    //   3223: ldc_w 693
    //   3226: invokestatic 229	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   3229: goto -1305 -> 1924
    //   3232: astore_1
    //   3233: aload_1
    //   3234: invokevirtual 695	java/lang/Exception:printStackTrace	()V
    //   3237: ldc -53
    //   3239: iconst_1
    //   3240: ldc_w 697
    //   3243: aload_1
    //   3244: invokestatic 317	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   3247: goto -1296 -> 1951
    //   3250: ldc -53
    //   3252: iconst_1
    //   3253: ldc_w 699
    //   3256: invokestatic 229	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   3259: goto -1308 -> 1951
    //   3262: aload 18
    //   3264: getstatic 484	com/tencent/mobileqq/msf/core/net/q:c	Lcom/tencent/mobileqq/msf/core/net/q;
    //   3267: if_acmpeq -1289 -> 1978
    //   3270: new 205	java/lang/StringBuilder
    //   3273: dup
    //   3274: invokespecial 206	java/lang/StringBuilder:<init>	()V
    //   3277: astore 4
    //   3279: new 205	java/lang/StringBuilder
    //   3282: dup
    //   3283: invokespecial 206	java/lang/StringBuilder:<init>	()V
    //   3286: aload 4
    //   3288: ldc_w 701
    //   3291: invokevirtual 212	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3294: aload_0
    //   3295: getfield 403	com/tencent/mobileqq/msf/core/net/g:c	Ljava/net/InetSocketAddress;
    //   3298: invokevirtual 408	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   3301: ldc_w 703
    //   3304: invokevirtual 212	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3307: aload 6
    //   3309: getfield 559	com/tencent/mobileqq/msf/core/net/a:f	Ljava/lang/String;
    //   3312: invokevirtual 212	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3315: ldc_w 705
    //   3318: invokevirtual 212	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3321: lload 7
    //   3323: invokevirtual 530	java/lang/StringBuilder:append	(J)Ljava/lang/StringBuilder;
    //   3326: ldc_w 532
    //   3329: invokevirtual 212	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3332: aload_1
    //   3333: invokevirtual 427	com/tencent/mobileqq/msf/core/d:e	()I
    //   3336: invokevirtual 292	java/lang/StringBuilder:append	(I)Ljava/lang/StringBuilder;
    //   3339: invokevirtual 224	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3342: invokevirtual 212	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3345: astore 4
    //   3347: aload_1
    //   3348: getfield 410	com/tencent/mobileqq/msf/core/d:h	Z
    //   3351: ifeq +23 -> 3374
    //   3354: ldc_w 412
    //   3357: astore_1
    //   3358: ldc -53
    //   3360: iconst_1
    //   3361: aload 4
    //   3363: aload_1
    //   3364: invokevirtual 212	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   3367: invokevirtual 224	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   3370: invokestatic 229	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   3373: return
    //   3374: ldc_w 598
    //   3377: astore_1
    //   3378: goto -20 -> 3358
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	3381	0	this	g
    //   0	3381	1	paramD	d
    //   0	3381	2	paramInt1	int
    //   0	3381	3	paramInt2	int
    //   0	3381	4	paramC	c
    //   0	3381	5	paramBoolean	boolean
    //   0	3381	6	paramA	a
    //   140	3182	7	l1	long
    //   148	2106	9	l2	long
    //   355	1897	11	l3	long
    //   645	72	13	l4	long
    //   135	2204	15	l5	long
    //   156	3056	17	localObject1	Object
    //   152	3111	18	localObject2	Object
    //   160	3037	19	localObject3	Object
    //   105	3109	20	localObject4	Object
    //   109	3094	21	str1	String
    //   294	1689	22	localObject5	Object
    //   2045	68	22	localThrowable	Throwable
    //   2244	1	22	str2	String
    //   2249	912	22	localException	Exception
    //   212	1325	23	localStringBuilder1	StringBuilder
    //   262	58	24	localStringBuilder2	StringBuilder
    // Exception table:
    //   from	to	target	type
    //   166	185	2045	java/lang/Throwable
    //   205	214	2045	java/lang/Throwable
    //   234	264	2045	java/lang/Throwable
    //   284	291	2045	java/lang/Throwable
    //   316	332	2045	java/lang/Throwable
    //   352	357	2045	java/lang/Throwable
    //   377	383	2045	java/lang/Throwable
    //   403	414	2045	java/lang/Throwable
    //   434	442	2045	java/lang/Throwable
    //   462	470	2045	java/lang/Throwable
    //   490	498	2045	java/lang/Throwable
    //   518	533	2045	java/lang/Throwable
    //   553	559	2045	java/lang/Throwable
    //   579	591	2045	java/lang/Throwable
    //   611	618	2045	java/lang/Throwable
    //   638	647	2045	java/lang/Throwable
    //   667	679	2045	java/lang/Throwable
    //   699	712	2045	java/lang/Throwable
    //   746	753	2045	java/lang/Throwable
    //   773	781	2045	java/lang/Throwable
    //   801	809	2045	java/lang/Throwable
    //   829	840	2045	java/lang/Throwable
    //   860	876	2045	java/lang/Throwable
    //   896	910	2045	java/lang/Throwable
    //   930	950	2045	java/lang/Throwable
    //   970	982	2045	java/lang/Throwable
    //   1002	1012	2045	java/lang/Throwable
    //   1032	1039	2045	java/lang/Throwable
    //   1059	1067	2045	java/lang/Throwable
    //   1087	1092	2045	java/lang/Throwable
    //   1117	1122	2045	java/lang/Throwable
    //   1142	1145	2045	java/lang/Throwable
    //   1165	1204	2045	java/lang/Throwable
    //   1224	1263	2045	java/lang/Throwable
    //   1283	1289	2045	java/lang/Throwable
    //   1309	1313	2045	java/lang/Throwable
    //   1333	1340	2045	java/lang/Throwable
    //   1360	1372	2045	java/lang/Throwable
    //   1392	1481	2045	java/lang/Throwable
    //   1501	1508	2045	java/lang/Throwable
    //   1533	1549	2045	java/lang/Throwable
    //   1569	1577	2045	java/lang/Throwable
    //   1597	1603	2045	java/lang/Throwable
    //   1623	1628	2045	java/lang/Throwable
    //   1653	1662	2045	java/lang/Throwable
    //   1682	1695	2045	java/lang/Throwable
    //   1715	1737	2045	java/lang/Throwable
    //   2007	2013	2045	java/lang/Throwable
    //   2033	2042	2045	java/lang/Throwable
    //   2271	2282	2045	java/lang/Throwable
    //   1653	1662	2249	java/lang/Exception
    //   1682	1695	2249	java/lang/Exception
    //   1715	1737	2249	java/lang/Exception
    //   166	185	2285	finally
    //   205	214	2285	finally
    //   234	264	2285	finally
    //   284	291	2285	finally
    //   316	332	2285	finally
    //   352	357	2285	finally
    //   377	383	2285	finally
    //   403	414	2285	finally
    //   434	442	2285	finally
    //   462	470	2285	finally
    //   490	498	2285	finally
    //   518	533	2285	finally
    //   553	559	2285	finally
    //   579	591	2285	finally
    //   611	618	2285	finally
    //   638	647	2285	finally
    //   667	679	2285	finally
    //   699	712	2285	finally
    //   746	753	2285	finally
    //   773	781	2285	finally
    //   801	809	2285	finally
    //   829	840	2285	finally
    //   860	876	2285	finally
    //   896	910	2285	finally
    //   930	950	2285	finally
    //   970	982	2285	finally
    //   1002	1012	2285	finally
    //   1032	1039	2285	finally
    //   1059	1067	2285	finally
    //   1087	1092	2285	finally
    //   1117	1122	2285	finally
    //   1142	1145	2285	finally
    //   1165	1204	2285	finally
    //   1224	1263	2285	finally
    //   1283	1289	2285	finally
    //   1309	1313	2285	finally
    //   1333	1340	2285	finally
    //   1360	1372	2285	finally
    //   1392	1481	2285	finally
    //   1501	1508	2285	finally
    //   1533	1549	2285	finally
    //   1569	1577	2285	finally
    //   1597	1603	2285	finally
    //   1623	1628	2285	finally
    //   1653	1662	2285	finally
    //   1682	1695	2285	finally
    //   1715	1737	2285	finally
    //   2007	2013	2285	finally
    //   2033	2042	2285	finally
    //   2055	2063	2285	finally
    //   2071	2083	2285	finally
    //   2091	2104	2285	finally
    //   2112	2122	2285	finally
    //   2130	2136	2285	finally
    //   2144	2149	2285	finally
    //   2157	2164	2285	finally
    //   2172	2180	2285	finally
    //   2271	2282	2285	finally
    //   2397	2409	2285	finally
    //   2417	2422	2285	finally
    //   2430	2437	2285	finally
    //   2448	2460	2285	finally
    //   2468	2473	2285	finally
    //   2481	2488	2285	finally
    //   2499	2511	2285	finally
    //   2519	2524	2285	finally
    //   2532	2539	2285	finally
    //   2547	2555	2285	finally
    //   2566	2578	2285	finally
    //   2586	2591	2285	finally
    //   2599	2606	2285	finally
    //   2617	2629	2285	finally
    //   2637	2642	2285	finally
    //   2650	2657	2285	finally
    //   2668	2680	2285	finally
    //   2688	2693	2285	finally
    //   2701	2708	2285	finally
    //   2719	2731	2285	finally
    //   2739	2751	2285	finally
    //   2759	2764	2285	finally
    //   2772	2779	2285	finally
    //   2790	2802	2285	finally
    //   2810	2815	2285	finally
    //   2823	2830	2285	finally
    //   2841	2853	2285	finally
    //   2861	2866	2285	finally
    //   2874	2881	2285	finally
    //   2892	2904	2285	finally
    //   2912	2917	2285	finally
    //   2925	2932	2285	finally
    //   2943	2955	2285	finally
    //   2963	2968	2285	finally
    //   2976	2983	2285	finally
    //   2994	3006	2285	finally
    //   3014	3019	2285	finally
    //   3027	3034	2285	finally
    //   3045	3057	2285	finally
    //   3065	3070	2285	finally
    //   3078	3085	2285	finally
    //   3096	3108	2285	finally
    //   3116	3121	2285	finally
    //   3129	3136	2285	finally
    //   3147	3152	2285	finally
    //   3160	3167	2285	finally
    //   3183	3194	2285	finally
    //   3202	3213	2285	finally
    //   116	146	2346	java/lang/InterruptedException
    //   1737	1770	2346	java/lang/InterruptedException
    //   1770	1796	2346	java/lang/InterruptedException
    //   1800	1825	2346	java/lang/InterruptedException
    //   1825	1906	2346	java/lang/InterruptedException
    //   1906	1924	2346	java/lang/InterruptedException
    //   1924	1951	2346	java/lang/InterruptedException
    //   1951	1978	2346	java/lang/InterruptedException
    //   2180	2213	2346	java/lang/InterruptedException
    //   2213	2238	2346	java/lang/InterruptedException
    //   2286	2319	2346	java/lang/InterruptedException
    //   2319	2346	2346	java/lang/InterruptedException
    //   3220	3229	2346	java/lang/InterruptedException
    //   3233	3247	2346	java/lang/InterruptedException
    //   3250	3259	2346	java/lang/InterruptedException
    //   3262	3354	2346	java/lang/InterruptedException
    //   3358	3373	2346	java/lang/InterruptedException
    //   1906	1924	3232	java/lang/Exception
    //   1924	1951	3232	java/lang/Exception
    //   3220	3229	3232	java/lang/Exception
    //   3250	3259	3232	java/lang/Exception
  }
  
  /* Error */
  public void a(com.tencent.qphone.base.a paramA)
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 114	com/tencent/mobileqq/msf/core/net/g:z	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   4: getfield 182	com/tencent/mobileqq/msf/core/MsfCore:sender	Lcom/tencent/mobileqq/msf/core/w;
    //   7: iconst_0
    //   8: putfield 707	com/tencent/mobileqq/msf/core/w:m	Z
    //   11: aload_0
    //   12: getfield 114	com/tencent/mobileqq/msf/core/net/g:z	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   15: getfield 182	com/tencent/mobileqq/msf/core/MsfCore:sender	Lcom/tencent/mobileqq/msf/core/w;
    //   18: iconst_0
    //   19: putfield 186	com/tencent/mobileqq/msf/core/w:n	Z
    //   22: aload_0
    //   23: getfield 114	com/tencent/mobileqq/msf/core/net/g:z	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   26: getfield 182	com/tencent/mobileqq/msf/core/MsfCore:sender	Lcom/tencent/mobileqq/msf/core/w;
    //   29: lconst_0
    //   30: putfield 709	com/tencent/mobileqq/msf/core/w:l	J
    //   33: aload_0
    //   34: getfield 352	com/tencent/mobileqq/msf/core/net/g:x	Lcom/tencent/qphone/base/remote/ToServiceMsg;
    //   37: ifnull +22 -> 59
    //   40: aload_0
    //   41: invokevirtual 355	com/tencent/mobileqq/msf/core/net/g:f	()Lcom/tencent/qphone/base/remote/ToServiceMsg;
    //   44: pop
    //   45: aload_0
    //   46: getfield 114	com/tencent/mobileqq/msf/core/net/g:z	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   49: getfield 182	com/tencent/mobileqq/msf/core/MsfCore:sender	Lcom/tencent/mobileqq/msf/core/w;
    //   52: aload_0
    //   53: getfield 357	com/tencent/mobileqq/msf/core/net/g:y	Ljava/lang/Runnable;
    //   56: invokevirtual 360	com/tencent/mobileqq/msf/core/w:a	(Ljava/lang/Runnable;)V
    //   59: aload_0
    //   60: getfield 254	com/tencent/mobileqq/msf/core/net/g:g	Ljava/net/Socket;
    //   63: ifnonnull +30 -> 93
    //   66: ldc -53
    //   68: iconst_1
    //   69: new 205	java/lang/StringBuilder
    //   72: dup
    //   73: invokespecial 206	java/lang/StringBuilder:<init>	()V
    //   76: ldc_w 711
    //   79: invokevirtual 212	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   82: aload_1
    //   83: invokevirtual 408	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   86: invokevirtual 224	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   89: invokestatic 229	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   92: return
    //   93: invokestatic 714	com/tencent/mobileqq/msf/core/a/a:aA	()Z
    //   96: ifeq +518 -> 614
    //   99: getstatic 262	com/tencent/mobileqq/msf/core/w:p	Z
    //   102: ifeq +49 -> 151
    //   105: invokestatic 266	com/tencent/mobileqq/msf/core/net/a/f:a	()Z
    //   108: ifeq +43 -> 151
    //   111: ldc -53
    //   113: iconst_1
    //   114: ldc_w 716
    //   117: invokestatic 229	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   120: aload_0
    //   121: getfield 114	com/tencent/mobileqq/msf/core/net/g:z	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   124: getfield 182	com/tencent/mobileqq/msf/core/MsfCore:sender	Lcom/tencent/mobileqq/msf/core/w;
    //   127: getfield 272	com/tencent/mobileqq/msf/core/w:F	Lcom/tencent/mobileqq/msf/core/net/a/f;
    //   130: ifnull +21 -> 151
    //   133: aload_0
    //   134: getfield 114	com/tencent/mobileqq/msf/core/net/g:z	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   137: getfield 182	com/tencent/mobileqq/msf/core/MsfCore:sender	Lcom/tencent/mobileqq/msf/core/w;
    //   140: getfield 272	com/tencent/mobileqq/msf/core/w:F	Lcom/tencent/mobileqq/msf/core/net/a/f;
    //   143: invokevirtual 275	com/tencent/mobileqq/msf/core/net/a/f:b	()Lcom/tencent/mobileqq/msf/core/net/a/e;
    //   146: invokeinterface 718 1 0
    //   151: iconst_1
    //   152: istore_3
    //   153: aload_0
    //   154: getfield 254	com/tencent/mobileqq/msf/core/net/g:g	Ljava/net/Socket;
    //   157: invokevirtual 719	java/net/Socket:toString	()Ljava/lang/String;
    //   160: astore 6
    //   162: aload_0
    //   163: getfield 110	com/tencent/mobileqq/msf/core/net/g:v	Ljava/util/concurrent/locks/ReentrantLock;
    //   166: ldc2_w 370
    //   169: getstatic 377	java/util/concurrent/TimeUnit:MILLISECONDS	Ljava/util/concurrent/TimeUnit;
    //   172: invokevirtual 381	java/util/concurrent/locks/ReentrantLock:tryLock	(JLjava/util/concurrent/TimeUnit;)Z
    //   175: istore_2
    //   176: iload_2
    //   177: ifeq +507 -> 684
    //   180: aload_0
    //   181: getfield 85	com/tencent/mobileqq/msf/core/net/g:B	Ljava/util/concurrent/atomic/AtomicInteger;
    //   184: iconst_0
    //   185: invokevirtual 545	java/util/concurrent/atomic/AtomicInteger:set	(I)V
    //   188: aload_0
    //   189: getfield 114	com/tencent/mobileqq/msf/core/net/g:z	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   192: getfield 182	com/tencent/mobileqq/msf/core/MsfCore:sender	Lcom/tencent/mobileqq/msf/core/w;
    //   195: aconst_null
    //   196: invokevirtual 569	com/tencent/mobileqq/msf/core/w:a	([B)V
    //   199: aload_0
    //   200: getfield 101	com/tencent/mobileqq/msf/core/net/g:s	Ljava/util/concurrent/atomic/AtomicBoolean;
    //   203: invokevirtual 153	java/util/concurrent/atomic/AtomicBoolean:get	()Z
    //   206: istore_2
    //   207: aload_0
    //   208: getfield 473	com/tencent/mobileqq/msf/core/net/g:j	Lcom/tencent/mobileqq/msf/core/net/g$a;
    //   211: ifnull +14 -> 225
    //   214: aload_0
    //   215: getfield 473	com/tencent/mobileqq/msf/core/net/g:j	Lcom/tencent/mobileqq/msf/core/net/g$a;
    //   218: getfield 721	com/tencent/mobileqq/msf/core/net/g$a:a	Ljava/util/concurrent/atomic/AtomicBoolean;
    //   221: iconst_0
    //   222: invokevirtual 342	java/util/concurrent/atomic/AtomicBoolean:set	(Z)V
    //   225: aload_0
    //   226: getfield 254	com/tencent/mobileqq/msf/core/net/g:g	Ljava/net/Socket;
    //   229: invokevirtual 725	java/net/Socket:getInputStream	()Ljava/io/InputStream;
    //   232: ifnull +13 -> 245
    //   235: aload_0
    //   236: getfield 254	com/tencent/mobileqq/msf/core/net/g:g	Ljava/net/Socket;
    //   239: invokevirtual 725	java/net/Socket:getInputStream	()Ljava/io/InputStream;
    //   242: invokevirtual 730	java/io/InputStream:close	()V
    //   245: aload_0
    //   246: getfield 72	com/tencent/mobileqq/msf/core/net/g:h	Ljava/io/OutputStream;
    //   249: astore 7
    //   251: aload 7
    //   253: ifnull +24 -> 277
    //   256: getstatic 65	com/tencent/mobileqq/msf/core/net/g:n	Ljava/util/ArrayList;
    //   259: aload_0
    //   260: getfield 72	com/tencent/mobileqq/msf/core/net/g:h	Ljava/io/OutputStream;
    //   263: invokevirtual 455	java/lang/Object:toString	()Ljava/lang/String;
    //   266: invokevirtual 732	java/util/ArrayList:remove	(Ljava/lang/Object;)Z
    //   269: pop
    //   270: aload_0
    //   271: getfield 72	com/tencent/mobileqq/msf/core/net/g:h	Ljava/io/OutputStream;
    //   274: invokevirtual 733	java/io/OutputStream:close	()V
    //   277: aload_0
    //   278: aconst_null
    //   279: putfield 473	com/tencent/mobileqq/msf/core/net/g:j	Lcom/tencent/mobileqq/msf/core/net/g$a;
    //   282: aload_0
    //   283: getfield 254	com/tencent/mobileqq/msf/core/net/g:g	Ljava/net/Socket;
    //   286: astore 7
    //   288: aload 7
    //   290: ifnull +30 -> 320
    //   293: aload_0
    //   294: getfield 254	com/tencent/mobileqq/msf/core/net/g:g	Ljava/net/Socket;
    //   297: invokevirtual 734	java/net/Socket:close	()V
    //   300: aload_1
    //   301: invokestatic 737	com/tencent/mobileqq/msf/core/aa:a	(Lcom/tencent/qphone/base/a;)V
    //   304: aload_0
    //   305: getfield 114	com/tencent/mobileqq/msf/core/net/g:z	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   308: invokevirtual 741	com/tencent/mobileqq/msf/core/MsfCore:getStandyModeManager	()Lcom/tencent/mobileqq/msf/core/c/a;
    //   311: invokevirtual 744	com/tencent/mobileqq/msf/core/c/a:f	()V
    //   314: getstatic 65	com/tencent/mobileqq/msf/core/net/g:n	Ljava/util/ArrayList;
    //   317: invokevirtual 747	java/util/ArrayList:clear	()V
    //   320: aload_0
    //   321: aconst_null
    //   322: putfield 254	com/tencent/mobileqq/msf/core/net/g:g	Ljava/net/Socket;
    //   325: aload_0
    //   326: getfield 101	com/tencent/mobileqq/msf/core/net/g:s	Ljava/util/concurrent/atomic/AtomicBoolean;
    //   329: iconst_0
    //   330: invokevirtual 342	java/util/concurrent/atomic/AtomicBoolean:set	(Z)V
    //   333: aload_0
    //   334: aconst_null
    //   335: putfield 155	com/tencent/mobileqq/msf/core/net/g:i	Lcom/tencent/mobileqq/msf/core/net/c;
    //   338: aload_0
    //   339: getfield 110	com/tencent/mobileqq/msf/core/net/g:v	Ljava/util/concurrent/locks/ReentrantLock;
    //   342: invokevirtual 553	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   345: aload_0
    //   346: getfield 105	com/tencent/mobileqq/msf/core/net/g:u	Ljava/util/concurrent/atomic/AtomicBoolean;
    //   349: invokevirtual 153	java/util/concurrent/atomic/AtomicBoolean:get	()Z
    //   352: ifne +189 -> 541
    //   355: iload_2
    //   356: ifeq +185 -> 541
    //   359: aload_0
    //   360: getfield 116	com/tencent/mobileqq/msf/core/net/g:w	Z
    //   363: ifeq +178 -> 541
    //   366: aload_0
    //   367: getfield 94	com/tencent/mobileqq/msf/core/net/g:q	J
    //   370: lconst_0
    //   371: lcmp
    //   372: ifle +96 -> 468
    //   375: invokestatic 392	java/lang/System:currentTimeMillis	()J
    //   378: aload_0
    //   379: getfield 94	com/tencent/mobileqq/msf/core/net/g:q	J
    //   382: lsub
    //   383: lstore 4
    //   385: aload_0
    //   386: lconst_0
    //   387: putfield 94	com/tencent/mobileqq/msf/core/net/g:q	J
    //   390: aload_0
    //   391: getfield 114	com/tencent/mobileqq/msf/core/net/g:z	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   394: getfield 182	com/tencent/mobileqq/msf/core/MsfCore:sender	Lcom/tencent/mobileqq/msf/core/w;
    //   397: invokevirtual 750	com/tencent/mobileqq/msf/core/w:b	()[B
    //   400: invokestatic 756	com/qq/taf/jce/HexUtil:bytes2HexStr	([B)Ljava/lang/String;
    //   403: astore 7
    //   405: invokestatic 759	com/tencent/mobileqq/msf/core/NetConnInfoCenterImpl:getCurrentAPN	()Ljava/lang/String;
    //   408: astore 8
    //   410: aload_0
    //   411: getfield 114	com/tencent/mobileqq/msf/core/net/g:z	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   414: getfield 182	com/tencent/mobileqq/msf/core/MsfCore:sender	Lcom/tencent/mobileqq/msf/core/w;
    //   417: getfield 440	com/tencent/mobileqq/msf/core/w:a	Lcom/tencent/mobileqq/msf/core/net/h;
    //   420: invokevirtual 760	com/tencent/mobileqq/msf/core/net/h:d	()V
    //   423: aload_0
    //   424: getfield 114	com/tencent/mobileqq/msf/core/net/g:z	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   427: invokevirtual 764	com/tencent/mobileqq/msf/core/MsfCore:getStatReporter	()Lcom/tencent/mobileqq/msf/core/b/m;
    //   430: iconst_0
    //   431: lload 4
    //   433: ldc2_w 765
    //   436: ldiv
    //   437: aload_0
    //   438: getfield 163	com/tencent/mobileqq/msf/core/net/g:d	Lcom/tencent/mobileqq/msf/core/d;
    //   441: aload_1
    //   442: getstatic 514	com/tencent/mobileqq/msf/core/w:E	I
    //   445: lload 4
    //   447: aload_0
    //   448: getfield 90	com/tencent/mobileqq/msf/core/net/g:o	Ljava/util/concurrent/atomic/AtomicLong;
    //   451: invokevirtual 768	java/util/concurrent/atomic/AtomicLong:get	()J
    //   454: aload_0
    //   455: getfield 92	com/tencent/mobileqq/msf/core/net/g:p	Ljava/util/concurrent/atomic/AtomicLong;
    //   458: invokevirtual 768	java/util/concurrent/atomic/AtomicLong:get	()J
    //   461: aload 7
    //   463: aload 8
    //   465: invokevirtual 773	com/tencent/mobileqq/msf/core/b/m:a	(ZJLcom/tencent/mobileqq/msf/core/d;Lcom/tencent/qphone/base/a;IJJJLjava/lang/String;Ljava/lang/String;)V
    //   468: ldc -53
    //   470: iconst_1
    //   471: new 205	java/lang/StringBuilder
    //   474: dup
    //   475: invokespecial 206	java/lang/StringBuilder:<init>	()V
    //   478: ldc_w 775
    //   481: invokevirtual 212	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   484: aload 6
    //   486: invokevirtual 212	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   489: ldc_w 777
    //   492: invokevirtual 212	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   495: aload_1
    //   496: invokevirtual 408	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   499: invokevirtual 224	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   502: invokestatic 229	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   505: aload_0
    //   506: getfield 114	com/tencent/mobileqq/msf/core/net/g:z	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   509: aconst_null
    //   510: putfield 576	com/tencent/mobileqq/msf/core/MsfCore:nowSocketConnAdd	Ljava/lang/String;
    //   513: aload_0
    //   514: aconst_null
    //   515: putfield 163	com/tencent/mobileqq/msf/core/net/g:d	Lcom/tencent/mobileqq/msf/core/d;
    //   518: aload_0
    //   519: getfield 90	com/tencent/mobileqq/msf/core/net/g:o	Ljava/util/concurrent/atomic/AtomicLong;
    //   522: lconst_0
    //   523: invokevirtual 450	java/util/concurrent/atomic/AtomicLong:set	(J)V
    //   526: aload_0
    //   527: getfield 92	com/tencent/mobileqq/msf/core/net/g:p	Ljava/util/concurrent/atomic/AtomicLong;
    //   530: lconst_0
    //   531: invokevirtual 450	java/util/concurrent/atomic/AtomicLong:set	(J)V
    //   534: invokestatic 782	com/tencent/qphone/base/util/CodecWarpper:onConnClose	()V
    //   537: aload_1
    //   538: invokestatic 785	com/tencent/mobileqq/msf/core/NetConnInfoCenter:onConnClosed	(Lcom/tencent/qphone/base/a;)V
    //   541: aload_0
    //   542: getfield 488	com/tencent/mobileqq/msf/core/net/g:A	Lcom/tencent/mobileqq/msf/core/d;
    //   545: ifnull +28 -> 573
    //   548: aload_0
    //   549: getfield 488	com/tencent/mobileqq/msf/core/net/g:A	Lcom/tencent/mobileqq/msf/core/d;
    //   552: aload_1
    //   553: invokevirtual 788	com/tencent/mobileqq/msf/core/d:a	(Lcom/tencent/qphone/base/a;)Z
    //   556: ifeq +17 -> 573
    //   559: aload_0
    //   560: getfield 114	com/tencent/mobileqq/msf/core/net/g:z	Lcom/tencent/mobileqq/msf/core/MsfCore;
    //   563: invokevirtual 792	com/tencent/mobileqq/msf/core/MsfCore:getSsoListManager	()Lcom/tencent/mobileqq/msf/core/a/d;
    //   566: aload_0
    //   567: getfield 488	com/tencent/mobileqq/msf/core/net/g:A	Lcom/tencent/mobileqq/msf/core/d;
    //   570: invokevirtual 797	com/tencent/mobileqq/msf/core/a/d:a	(Lcom/tencent/mobileqq/msf/core/d;)V
    //   573: aload_0
    //   574: aconst_null
    //   575: putfield 488	com/tencent/mobileqq/msf/core/net/g:A	Lcom/tencent/mobileqq/msf/core/d;
    //   578: ldc_w 492
    //   581: putstatic 494	com/tencent/mobileqq/msf/core/w:C	Ljava/lang/String;
    //   584: ldc_w 799
    //   587: putstatic 506	com/tencent/mobileqq/msf/core/w:D	Ljava/lang/String;
    //   590: return
    //   591: astore_1
    //   592: aload_1
    //   593: invokevirtual 695	java/lang/Exception:printStackTrace	()V
    //   596: return
    //   597: astore 6
    //   599: getstatic 803	com/tencent/mobileqq/msf/core/net/a/a:a	Ljava/lang/String;
    //   602: iconst_1
    //   603: ldc_w 805
    //   606: aload 6
    //   608: invokestatic 317	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   611: goto -460 -> 151
    //   614: iconst_0
    //   615: putstatic 262	com/tencent/mobileqq/msf/core/w:p	Z
    //   618: goto -467 -> 151
    //   621: astore 7
    //   623: aload 7
    //   625: invokevirtual 806	java/lang/Throwable:printStackTrace	()V
    //   628: goto -314 -> 314
    //   631: astore 7
    //   633: goto -313 -> 320
    //   636: astore 7
    //   638: iconst_1
    //   639: istore_2
    //   640: aload_0
    //   641: getfield 110	com/tencent/mobileqq/msf/core/net/g:v	Ljava/util/concurrent/locks/ReentrantLock;
    //   644: invokevirtual 553	java/util/concurrent/locks/ReentrantLock:unlock	()V
    //   647: aload 7
    //   649: athrow
    //   650: astore 7
    //   652: ldc -53
    //   654: iconst_1
    //   655: new 205	java/lang/StringBuilder
    //   658: dup
    //   659: invokespecial 206	java/lang/StringBuilder:<init>	()V
    //   662: ldc_w 808
    //   665: invokevirtual 212	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   668: aload 7
    //   670: invokevirtual 408	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   673: invokevirtual 224	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   676: aload 7
    //   678: invokestatic 317	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   681: goto -336 -> 345
    //   684: aload_0
    //   685: getfield 473	com/tencent/mobileqq/msf/core/net/g:j	Lcom/tencent/mobileqq/msf/core/net/g$a;
    //   688: ifnull +14 -> 702
    //   691: aload_0
    //   692: getfield 473	com/tencent/mobileqq/msf/core/net/g:j	Lcom/tencent/mobileqq/msf/core/net/g$a;
    //   695: getfield 721	com/tencent/mobileqq/msf/core/net/g$a:a	Ljava/util/concurrent/atomic/AtomicBoolean;
    //   698: iconst_0
    //   699: invokevirtual 342	java/util/concurrent/atomic/AtomicBoolean:set	(Z)V
    //   702: ldc -53
    //   704: iconst_1
    //   705: ldc_w 810
    //   708: invokestatic 229	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   711: aload_0
    //   712: getfield 105	com/tencent/mobileqq/msf/core/net/g:u	Ljava/util/concurrent/atomic/AtomicBoolean;
    //   715: iconst_1
    //   716: invokevirtual 342	java/util/concurrent/atomic/AtomicBoolean:set	(Z)V
    //   719: iload_3
    //   720: istore_2
    //   721: aload_0
    //   722: getfield 85	com/tencent/mobileqq/msf/core/net/g:B	Ljava/util/concurrent/atomic/AtomicInteger;
    //   725: iconst_1
    //   726: invokevirtual 813	java/util/concurrent/atomic/AtomicInteger:addAndGet	(I)I
    //   729: bipush 10
    //   731: if_icmpne -386 -> 345
    //   734: invokestatic 818	android/os/Process:myPid	()I
    //   737: invokestatic 821	android/os/Process:killProcess	(I)V
    //   740: iload_3
    //   741: istore_2
    //   742: goto -397 -> 345
    //   745: astore 7
    //   747: iconst_1
    //   748: istore_2
    //   749: goto -97 -> 652
    //   752: astore 6
    //   754: ldc -53
    //   756: iconst_1
    //   757: new 205	java/lang/StringBuilder
    //   760: dup
    //   761: invokespecial 206	java/lang/StringBuilder:<init>	()V
    //   764: ldc_w 823
    //   767: invokevirtual 212	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   770: aload 6
    //   772: invokevirtual 408	java/lang/StringBuilder:append	(Ljava/lang/Object;)Ljava/lang/StringBuilder;
    //   775: invokevirtual 224	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   778: aload 6
    //   780: invokestatic 317	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;Ljava/lang/Throwable;)V
    //   783: goto -246 -> 537
    //   786: astore 7
    //   788: iconst_1
    //   789: istore_2
    //   790: ldc 76
    //   792: astore 6
    //   794: goto -142 -> 652
    //   797: astore 7
    //   799: goto -147 -> 652
    //   802: astore 7
    //   804: goto -164 -> 640
    //   807: astore 7
    //   809: goto -532 -> 277
    //   812: astore 7
    //   814: goto -569 -> 245
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	817	0	this	g
    //   0	817	1	paramA	com.tencent.qphone.base.a
    //   175	615	2	bool1	boolean
    //   152	589	3	bool2	boolean
    //   383	63	4	l1	long
    //   160	325	6	str1	String
    //   597	10	6	localException1	Exception
    //   752	27	6	localException2	Exception
    //   792	1	6	str2	String
    //   249	213	7	localObject1	Object
    //   621	3	7	localThrowable1	Throwable
    //   631	1	7	localThrowable2	Throwable
    //   636	12	7	localObject2	Object
    //   650	27	7	localThrowable3	Throwable
    //   745	1	7	localThrowable4	Throwable
    //   786	1	7	localThrowable5	Throwable
    //   797	1	7	localThrowable6	Throwable
    //   802	1	7	localObject3	Object
    //   807	1	7	localException3	Exception
    //   812	1	7	localThrowable7	Throwable
    //   408	56	8	str3	String
    // Exception table:
    //   from	to	target	type
    //   541	573	591	java/lang/Exception
    //   573	590	591	java/lang/Exception
    //   111	151	597	java/lang/Exception
    //   300	314	621	java/lang/Throwable
    //   293	300	631	java/lang/Throwable
    //   314	320	631	java/lang/Throwable
    //   623	628	631	java/lang/Throwable
    //   180	207	636	finally
    //   640	650	650	java/lang/Throwable
    //   162	176	745	java/lang/Throwable
    //   684	702	745	java/lang/Throwable
    //   702	719	745	java/lang/Throwable
    //   721	740	745	java/lang/Throwable
    //   534	537	752	java/lang/Exception
    //   153	162	786	java/lang/Throwable
    //   338	345	797	java/lang/Throwable
    //   207	225	802	finally
    //   225	245	802	finally
    //   245	251	802	finally
    //   256	277	802	finally
    //   277	288	802	finally
    //   293	300	802	finally
    //   300	314	802	finally
    //   314	320	802	finally
    //   320	338	802	finally
    //   623	628	802	finally
    //   256	277	807	java/lang/Exception
    //   225	245	812	java/lang/Throwable
  }
  
  public boolean a()
  {
    return r;
  }
  
  public boolean b()
  {
    return s.get();
  }
  
  public long c()
  {
    return q;
  }
  
  public void d()
  {
    try
    {
      ToServiceMsg localToServiceMsg = new ToServiceMsg("", "0", "MSF");
      localToServiceMsg.setRequestSsoSeq(MsfCore.getNextSeq());
      localToServiceMsg.setMsfCommand(MsfCommand.msf_msgsignal);
      QLog.d("MSF.C.NetConnTag", 1, "msgSignal seq: " + localToServiceMsg.getRequestSsoSeq());
      int i1 = "CHNK".getBytes().length + 13 + 1 + 0 + 4;
      byte b1 = (byte)("CHNK".getBytes().length + 1);
      ByteBuffer localByteBuffer = ByteBuffer.allocate(i1);
      localByteBuffer.putInt(i1).putInt(20140601).putInt(0).put(b1).put("CHNK".getBytes()).put((byte)1).putInt(0);
      localToServiceMsg.putWupBuffer(localByteBuffer.array());
      a(z.getMsfAppid(), 0, localToServiceMsg.getRequestSsoSeq(), localToServiceMsg.getUin(), localToServiceMsg.getServiceCmd(), "", localToServiceMsg.getMsfCommand(), localToServiceMsg.getWupBuffer(), null);
      return;
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      QLog.d("MSF.C.NetConnTag", 1, "send MsgSignal pkg fail, exception ", localException);
    }
  }
  
  public void e()
  {
    try
    {
      ToServiceMsg localToServiceMsg = new ToServiceMsg("", "0", "MSF");
      localToServiceMsg.setRequestSsoSeq(MsfCore.getNextSeq());
      localToServiceMsg.setMsfCommand(MsfCommand.msf_ssoping);
      long l1 = com.tencent.mobileqq.msf.core.a.a.t();
      if (l1 > 10000L) {
        localToServiceMsg.setTimeout(l1);
      }
      for (;;)
      {
        QLog.d("MSF.C.NetConnTag", 1, "ssoping seq: " + localToServiceMsg.getRequestSsoSeq() + " timeout: " + localToServiceMsg.getTimeout());
        int i1 = "MSF".getBytes().length + 13 + 1 + 0 + 4;
        byte b1 = (byte)"MSF".getBytes().length;
        ByteBuffer localByteBuffer = ByteBuffer.allocate(i1);
        localByteBuffer.putInt(i1).putInt(20140601).putInt(0).put(b1).put("MSF".getBytes()).put((byte)0).putInt(0);
        localToServiceMsg.putWupBuffer(localByteBuffer.array());
        x = localToServiceMsg;
        z.sender.c(localToServiceMsg);
        localToServiceMsg.getAttributes().put("__timestamp_msf2net", Long.valueOf(SystemClock.elapsedRealtime()));
        if (a(z.getMsfAppid(), 0, localToServiceMsg.getRequestSsoSeq(), localToServiceMsg.getUin(), localToServiceMsg.getServiceCmd(), "", localToServiceMsg.getMsfCommand(), localToServiceMsg.getWupBuffer(), null) <= 0) {
          break;
        }
        return;
        localToServiceMsg.setTimeout(10000L);
      }
      z.sender.c(localException.getRequestSsoSeq());
    }
    catch (Exception localException)
    {
      localException.printStackTrace();
      QLog.d("MSF.C.NetConnTag", 1, "send SSOPing pkg fail, exception ", localException);
      return;
    }
    z.sender.d(localException);
    QLog.d("MSF.C.NetConnTag", 1, "send SSOPing pkg fail");
  }
  
  public ToServiceMsg f()
  {
    if (x != null)
    {
      z.sender.c(x.getRequestSsoSeq());
      z.sender.d(x);
    }
    return x;
  }
  
  class a
    extends Thread
  {
    AtomicBoolean a = new AtomicBoolean(true);
    long b = SystemClock.elapsedRealtime();
    
    a() {}
    
    public void run()
    {
      while (a.get()) {
        try
        {
          while (!k.isDataAvailable(f)) {
            if (!a.get()) {
              return;
            }
          }
          if (!a.get()) {
            break;
          }
          i.a(k);
          p.addAndGet(k.getBufferlen());
          k.reset();
        }
        catch (Throwable localThrowable)
        {
          a.set(false);
          QLog.d("MSF.C.NetConnTag", 1, "read DataError " + localThrowable);
          a(com.tencent.qphone.base.a.c);
        }
      }
    }
  }
}
