package com.tencent.mobileqq.msf.core.net.c;

import android.os.Build.VERSION;
import android.text.TextUtils;
import com.tencent.mobileqq.msf.core.MsfCore;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.mobileqq.msf.core.NetConnInfoCenterImpl;
import com.tencent.msf.service.protocol.push.a.b;
import com.tencent.qphone.base.util.MD5;
import com.tencent.qphone.base.util.QLog;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.UnknownHostException;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.zip.CRC32;

public class a
  implements Runnable
{
  private static final String A = "Cookie:";
  private static final String B = "Set-Cookie:";
  private static final String C = "Content-Length:";
  private static final String D = "md5=";
  private static final String E = "gateway=";
  private static final String F = ";";
  private static final String G = "\r\n";
  private static final String H = "\r\n\r\n";
  private static final String I = "200";
  private static final int J = 10240;
  private static final int K = 3;
  private static final String z = "HTTP/1.";
  private String L = "";
  private int M;
  private int N;
  private boolean O = true;
  a a;
  com.tencent.msf.service.protocol.push.a.c b;
  b c;
  int d;
  int e;
  boolean f = false;
  DatagramSocket g = null;
  Socket h = null;
  OutputStream i = null;
  InetAddress j = null;
  int k;
  d l = new d();
  c m = new c();
  long n = 0L;
  long o = 0L;
  long p = 0L;
  long q = 0L;
  long r = 0L;
  long s = 0L;
  long t = 0L;
  long u = 0L;
  long v = 0L;
  long w = 0L;
  long x = 0L;
  long y = 0L;
  
  public a(com.tencent.msf.service.protocol.push.a.c paramC, a paramA)
  {
    b = paramC;
    a = paramA;
    c = null;
    d = 1;
    e = 0;
  }
  
  public a(com.tencent.msf.service.protocol.push.a.c paramC, b paramB, a paramA, int paramInt1, int paramInt2)
  {
    b = paramC;
    c = paramB;
    a = paramA;
    d = paramInt1;
    e = paramInt2;
  }
  
  public static int a(int paramInt)
  {
    return (0xFF00 & paramInt) >> 8 | (paramInt & 0xFF) << 8;
  }
  
  public static InetAddress a(long paramLong)
    throws UnknownHostException
  {
    int i1 = (byte)(int)(paramLong >> 24 & 0xFF);
    int i2 = (byte)(int)(paramLong >> 16 & 0xFF);
    int i3 = (byte)(int)(paramLong >> 8 & 0xFF);
    return InetAddress.getByAddress(new byte[] { (byte)(int)(paramLong & 0xFF), i3, i2, i1 });
  }
  
  private void a(a.d.a paramA)
  {
    if (l.c.containsKey(paramA))
    {
      int i1 = ((Integer)l.c.get(paramA)).intValue();
      l.c.put(paramA, Integer.valueOf(i1 + 1));
      return;
    }
    l.c.put(paramA, Integer.valueOf(1));
  }
  
  private boolean a(int paramInt, byte[] paramArrayOfByte)
  {
    if (QLog.isColorLevel()) {
      QLog.d("MSF.C.QualityTestManager", 2, "receBodySize len " + paramInt);
    }
    Object localObject2;
    int i1;
    try
    {
      if ((a != a.c) && (paramInt > 262144))
      {
        O = false;
        a(a.d.a.e);
        QLog.d("MSF.C.QualityTestManager", 1, "QualityClient: Recvbodysize too large, stop it");
        return false;
      }
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.QualityTestManager", 2, "qualityTestMsg.cTestType " + b.o);
      }
      switch (1.a[a.ordinal()])
      {
      case 1: 
        localObject1 = new byte[paramInt];
        localObject2 = new DatagramPacket((byte[])localObject1, paramInt);
        try
        {
          u = System.currentTimeMillis();
          g.receive((DatagramPacket)localObject2);
          v = System.currentTimeMillis();
          if (v <= q) {
            throw new Exception("receiveEndTime < sendTime");
          }
        }
        catch (Exception paramArrayOfByte)
        {
          a(a.d.a.e);
          QLog.d("MSF.C.QualityTestManager", 1, "QualityClient: udp read packet error:", paramArrayOfByte);
          paramArrayOfByte = l;
          n += 1;
          l.C.add(Long.valueOf(-1L));
          return false;
        }
        y = (v - q);
        l.C.add(Long.valueOf(y));
        w += v - u;
        x += ((DatagramPacket)localObject2).getLength();
        N += ((DatagramPacket)localObject2).getLength();
        localObject3 = l;
        k = ((int)(k + (v - q)));
        if ((b.o == 0) || (1 == b.o))
        {
          localObject2 = new byte[paramArrayOfByte.length - 8];
          System.arraycopy(paramArrayOfByte, 0, localObject2, 0, localObject2.length);
          paramArrayOfByte = new byte[paramInt - 8];
          System.arraycopy(localObject1, 0, paramArrayOfByte, 0, paramArrayOfByte.length);
          if (!MD5.toMD5((byte[])localObject2).equals(MD5.toMD5(paramArrayOfByte)))
          {
            l.C.remove(Long.valueOf(y));
            throw new Exception("recv package error. " + MD5.toMD5(paramArrayOfByte));
          }
          QLog.d("MSF.C.QualityTestManager", 1, "QualityClient: udp recv packet size " + paramInt);
          paramInt = com.tencent.mobileqq.msf.core.c.a((byte[])localObject1, 0);
          i1 = com.tencent.mobileqq.msf.core.c.a((byte[])localObject1, localObject1.length - 4);
          paramArrayOfByte = a(i1);
          QLog.d("MSF.C.QualityTestManager", 1, "QualityClient: udp split respBodySize " + paramInt + " gateWayIp:" + paramArrayOfByte + " gateWayIpInt:" + i1);
          localObject1 = l;
          m += 1;
          l.d = paramArrayOfByte;
        }
        else if (2 == b.o)
        {
          if ((!((DatagramPacket)localObject2).getAddress().equals(j)) || (((DatagramPacket)localObject2).getPort() != k))
          {
            paramArrayOfByte = l;
            m += 1;
            a(a.d.a.v);
            QLog.d("MSF.C.QualityTestManager", 2, "Warning: send_recv_server_info_mismatch send_svninfo:(" + j.toString() + ", port " + k + "), recv_svrinfo:(" + ((DatagramPacket)localObject2).getAddress().toString() + ", port " + ((DatagramPacket)localObject2).getPort() + ")");
            return false;
          }
          QLog.d("MSF.C.QualityTestManager", 2, "send_svninfo:(" + j.toString() + ", port " + k + "), recv_svrinfo:(" + ((DatagramPacket)localObject2).getAddress().toString() + ", port " + ((DatagramPacket)localObject2).getPort() + ")");
          paramArrayOfByte = l;
          m += 1;
          if (QLog.isColorLevel()) {
            QLog.d("MSF.C.QualityTestManager", 2, "udp speed test rsp cTestType 2, **NOT**, check RspBody");
          }
        }
        break;
      }
    }
    catch (Exception paramArrayOfByte)
    {
      Object localObject3;
      Object localObject4;
      paramArrayOfByte = l;
      n += 1;
      l.C.add(Long.valueOf(-1L));
      return false;
    }
    Object localObject1 = null;
    try
    {
      localObject2 = h.getInputStream();
      localObject1 = localObject2;
      c.f.add(localObject2.toString());
      localObject1 = localObject2;
      localObject3 = new byte[paramInt];
      localObject1 = localObject2;
      u = System.currentTimeMillis();
      localObject1 = localObject2;
      i1 = ((InputStream)localObject2).read((byte[])localObject3);
      if (i1 != -1) {
        while (i1 < paramInt)
        {
          localObject1 = localObject2;
          i1 += ((InputStream)localObject2).read((byte[])localObject3, i1, paramInt - i1);
        }
      }
      localObject1 = localObject2;
      c.f.remove(localObject2.toString());
      localObject1 = localObject2;
      v = System.currentTimeMillis();
      localObject1 = localObject2;
      if (v <= q)
      {
        localObject1 = localObject2;
        throw new Exception("receiveEndTime < sendTime");
      }
    }
    catch (Exception paramArrayOfByte)
    {
      if (localObject1 != null) {
        c.f.remove(localObject1.toString());
      }
      a(a.d.a.e);
      if (QLog.isDevelopLevel()) {
        QLog.d("MSF.C.QualityTestManager", 4, "QualityClient: receive TCP resp failed", paramArrayOfByte);
      }
      localObject1 = l;
      n += 1;
      l.C.add(Long.valueOf(-1L));
      paramArrayOfByte.printStackTrace();
      return false;
    }
    localObject1 = localObject2;
    y = (v - q);
    localObject1 = localObject2;
    l.C.add(Long.valueOf(y));
    localObject1 = localObject2;
    w += v - u;
    localObject1 = localObject2;
    localObject4 = l;
    localObject1 = localObject2;
    k = ((int)(k + (v - q)));
    localObject1 = localObject2;
    x += paramInt;
    localObject1 = localObject2;
    N += paramInt;
    localObject1 = localObject2;
    if (b.o != 0)
    {
      localObject1 = localObject2;
      if (1 != b.o) {}
    }
    else
    {
      localObject1 = localObject2;
      localObject4 = new byte[paramArrayOfByte.length - 8];
      localObject1 = localObject2;
      System.arraycopy(paramArrayOfByte, 0, localObject4, 0, localObject4.length);
      localObject1 = localObject2;
      paramArrayOfByte = new byte[paramInt - 8];
      localObject1 = localObject2;
      System.arraycopy(localObject3, 0, paramArrayOfByte, 0, paramArrayOfByte.length);
      localObject1 = localObject2;
      if (!MD5.toMD5((byte[])localObject4).equals(MD5.toMD5(paramArrayOfByte)))
      {
        localObject1 = localObject2;
        l.C.remove(Long.valueOf(y));
        localObject1 = localObject2;
        throw new Exception("recv package error. " + MD5.toMD5(paramArrayOfByte));
      }
      localObject1 = localObject2;
      QLog.d("MSF.C.QualityTestManager", 1, "QualityClient: tcp recv packet size " + paramInt);
      localObject1 = localObject2;
      i1 = com.tencent.mobileqq.msf.core.c.a((byte[])localObject3, localObject3.length - 4);
      localObject1 = localObject2;
      paramArrayOfByte = a(i1);
      localObject1 = localObject2;
      QLog.d("MSF.C.QualityTestManager", 1, "QualityClient: tcp split respBodySize " + paramInt + " gateWayIp:" + paramArrayOfByte + " gateWayIpInt:" + i1);
      localObject1 = localObject2;
      localObject3 = l;
      localObject1 = localObject2;
      m += 1;
      localObject1 = localObject2;
      l.d = paramArrayOfByte;
      break label2387;
    }
    localObject1 = localObject2;
    if (2 == b.o)
    {
      localObject1 = localObject2;
      paramArrayOfByte = l;
      localObject1 = localObject2;
      m += 1;
      localObject1 = localObject2;
      if (QLog.isColorLevel())
      {
        localObject1 = localObject2;
        QLog.d("MSF.C.QualityTestManager", 2, "tcp speed test rsp cTestType 2, **NOT**, check RspBody");
        break label2387;
        localObject2 = null;
        for (;;)
        {
          try
          {
            localObject1 = h.getInputStream();
          }
          catch (Exception paramArrayOfByte)
          {
            int i3;
            int i6;
            int i5;
            int i4;
            localObject1 = localObject2;
            continue;
            int i2 = i5;
            i1 = i4;
            continue;
          }
          try
          {
            c.f.add(localObject1.toString());
            localObject2 = new byte['Ѐ'];
            paramArrayOfByte = new byte['⠀'];
            u = System.currentTimeMillis();
            i3 = 0;
            i1 = 1048576;
            i2 = 0;
            paramInt = 0;
            i6 = ((InputStream)localObject1).read((byte[])localObject2);
            if ((i6 != -1) && (paramInt < i1))
            {
              if (paramInt < 10240)
              {
                i5 = 10240 - paramInt;
                i4 = i5;
                if (i5 > i6) {
                  i4 = i6;
                }
                System.arraycopy(localObject2, 0, paramArrayOfByte, paramInt, i4);
                int i7 = i3 + i4;
                i5 = i2;
                i4 = i1;
                i3 = i7;
                if (i2 == 0)
                {
                  localObject3 = b.a(new String(paramArrayOfByte, 0, i7));
                  i5 = i2;
                  i4 = i1;
                  i3 = i7;
                  if (localObject3 != null)
                  {
                    i5 = i2;
                    i4 = i1;
                    i3 = i7;
                    if (((b)localObject3).e() > 0)
                    {
                      i5 = i2;
                      i4 = i1;
                      i3 = i7;
                      if (!TextUtils.isEmpty(((b)localObject3).a()))
                      {
                        i1 = ((b)localObject3).e();
                        i4 = ((b)localObject3).a().getBytes().length + i1;
                        i5 = 1;
                        i3 = i7;
                      }
                    }
                  }
                }
                paramInt += i6;
                if (paramInt <= 1048576) {
                  continue;
                }
                x += paramInt;
                N += paramInt;
                O = false;
                a(a.d.a.u);
                return false;
              }
              i5 = i2;
              i4 = i1;
              if (i2 != 0) {
                continue;
              }
              a(a.d.a.r);
              return false;
            }
            c.f.remove(localObject1.toString());
            v = System.currentTimeMillis();
            if (v <= q) {
              throw new Exception("receiveEndTime < sendTime");
            }
          }
          catch (Exception paramArrayOfByte)
          {
            if (localObject1 != null) {
              c.f.remove(localObject1.toString());
            }
            a(a.d.a.e);
            if (QLog.isDevelopLevel()) {
              QLog.d("MSF.C.QualityTestManager", 4, "QualityClient: http receive resp failed ", paramArrayOfByte);
            }
            localObject1 = l;
            n += 1;
            l.C.add(Long.valueOf(-1L));
            paramArrayOfByte.printStackTrace();
            return false;
          }
        }
        y = (v - q);
        l.C.add(Long.valueOf(y));
        w += v - u;
        localObject2 = l;
        k = ((int)(k + (v - q)));
        x += paramInt;
        N += paramInt;
        paramArrayOfByte = b.a(new String(paramArrayOfByte, 0, i3));
        if ((paramArrayOfByte == null) || (!paramArrayOfByte.g()))
        {
          a(a.d.a.r);
          return false;
        }
        if (!b(paramArrayOfByte.a().getBytes()))
        {
          a(a.d.a.s);
          return false;
        }
        i1 = paramArrayOfByte.e();
        localObject2 = paramArrayOfByte.a();
        if ((i1 <= 0) || (i1 != paramInt - ((String)localObject2).length()))
        {
          a(a.d.a.t);
          return false;
        }
        localObject2 = paramArrayOfByte.c();
        localObject3 = paramArrayOfByte.b();
        if (!MD5.toMD5(paramArrayOfByte.d()).equalsIgnoreCase((String)localObject2))
        {
          l.x = true;
          l.A = paramArrayOfByte.a();
          a(a.d.a.p);
          return false;
        }
        paramArrayOfByte = InetAddress.getByName((String)localObject3);
        localObject2 = l;
        m += 1;
        QLog.d("MSF.C.QualityTestManager", 1, "QualityClient: http recv packet size " + paramInt);
        l.d = paramArrayOfByte;
        break label2387;
        return false;
      }
    }
    label2387:
    return true;
  }
  
  private boolean a(com.tencent.msf.service.protocol.push.a.a paramA)
  {
    int i2 = 10000;
    int i1;
    if (b != null)
    {
      l.z = b.i;
      i1 = i2;
      if (b.i > 0L)
      {
        i1 = i2;
        if (b.i < 600L) {
          i1 = (int)b.i * 1000;
        }
      }
    }
    for (;;)
    {
      try
      {
        long l1 = a;
        i2 = b;
        j = a(l1);
        k = a(i2);
        l.e = j;
        l.f = k;
        if (QLog.isDevelopLevel()) {
          QLog.d("MSF.C.QualityTestManager", 4, "QualityTest: Start connecting " + j + " port:" + k + " mTestType:" + a);
        }
        i2 = 1.a[a.ordinal()];
        switch (i2)
        {
        default: 
          return false;
        }
      }
      catch (Exception paramA)
      {
        l.B.add(Long.valueOf(-1L));
        paramA.printStackTrace();
        return false;
      }
      i1 = i2;
      if (c != null)
      {
        l.z = c.i;
        i1 = i2;
        if (c.i > 0L)
        {
          i1 = i2;
          if (c.i < 600L)
          {
            i1 = (int)c.i * 1000;
            continue;
            g = new DatagramSocket();
            g.setSoTimeout(i1);
            l.B.add(Long.valueOf(-1L));
          }
        }
      }
    }
    for (;;)
    {
      return true;
      try
      {
        paramA = new InetSocketAddress(j, k);
        h = new Socket();
        h.setSoTimeout(i1);
        h.setTcpNoDelay(true);
        h.setKeepAlive(true);
        n = System.currentTimeMillis();
        h.connect(paramA, i1);
        o = System.currentTimeMillis();
        p = (o - n);
        l.B.add(Long.valueOf(p));
        i = h.getOutputStream();
      }
      catch (Throwable paramA)
      {
        if (QLog.isDevelopLevel()) {
          QLog.d("MSF.C.QualityTestManager", 4, "QualityTest: connecting " + j + " port:" + k + " mTestType:" + a + " failed", paramA);
        }
        paramA = l;
        o += 1;
        l.B.add(Long.valueOf(-1L));
        return false;
      }
      try
      {
        paramA = new InetSocketAddress(j, k);
        h = new Socket();
        h.setSoTimeout(i1);
        h.setTcpNoDelay(true);
        h.setKeepAlive(true);
        n = System.currentTimeMillis();
        h.connect(paramA, i1);
        o = System.currentTimeMillis();
        p = (o - n);
        l.B.add(Long.valueOf(p));
        i = h.getOutputStream();
      }
      catch (Throwable paramA)
      {
        if (QLog.isDevelopLevel()) {
          QLog.d("MSF.C.QualityTestManager", 4, "QualityTest: connecting " + j + " port:" + k + " mTestType:" + a + " failed", paramA);
        }
        paramA = l;
        o += 1;
        l.B.add(Long.valueOf(-1L));
      }
    }
    return false;
  }
  
  private boolean a(byte[] paramArrayOfByte)
  {
    for (;;)
    {
      try
      {
        switch (1.a[a.ordinal()])
        {
        case 1: 
          DatagramPacket localDatagramPacket = new DatagramPacket(paramArrayOfByte, paramArrayOfByte.length, j, k);
          try
          {
            q = System.currentTimeMillis();
            g.send(localDatagramPacket);
            r = System.currentTimeMillis();
            s += r - q;
            t += paramArrayOfByte.length;
            M += paramArrayOfByte.length;
            QLog.d("MSF.C.QualityTestManager", 1, "QualityTest: send udp packet length:" + localDatagramPacket.getLength() + " sendEndTime:" + r + " sendTime:" + q);
            paramArrayOfByte = l;
            l += 1;
            return true;
          }
          catch (Exception paramArrayOfByte)
          {
            a(a.d.a.d);
            QLog.d("MSF.C.QualityTestManager", 1, "QualityTest: send udp packet error:", paramArrayOfByte);
            return false;
          }
        case 2: 
          try
          {
            q = System.currentTimeMillis();
            c.g.add(i.toString());
            i.write(paramArrayOfByte);
            i.flush();
            c.g.remove(i.toString());
            r = System.currentTimeMillis();
            s += r - q;
            t += paramArrayOfByte.length;
            M += paramArrayOfByte.length;
            QLog.d("MSF.C.QualityTestManager", 1, "QualityTest: send tcp packet length:" + paramArrayOfByte.length + " sendEndTime:" + r + " sendTime:" + q);
            paramArrayOfByte = l;
            l += 1;
          }
          catch (Exception paramArrayOfByte)
          {
            if (i != null) {
              c.g.remove(i.toString());
            }
            a(a.d.a.d);
            QLog.d("MSF.C.QualityTestManager", 1, "QualityTest: send tcp error:", paramArrayOfByte);
            return false;
          }
        }
      }
      catch (Exception paramArrayOfByte)
      {
        return false;
      }
      try
      {
        new String(paramArrayOfByte);
        q = System.currentTimeMillis();
        c.g.add(i.toString());
        i.write(paramArrayOfByte);
        i.flush();
        c.g.remove(i.toString());
        r = System.currentTimeMillis();
        s += r - q;
        t += paramArrayOfByte.length;
        M += paramArrayOfByte.length;
        QLog.d("MSF.C.QualityTestManager", 1, "QualityTest: send http packet length:" + paramArrayOfByte.length + " sendEndTime:" + r + " sendTime:" + q);
        paramArrayOfByte = l;
        l += 1;
      }
      catch (Exception paramArrayOfByte)
      {
        if (i != null) {
          c.g.remove(i.toString());
        }
        a(a.d.a.d);
        QLog.d("MSF.C.QualityTestManager", 1, "QualityTest: send http error:", paramArrayOfByte);
        return false;
      }
    }
    return false;
  }
  
  private void b(a.d.a paramA, boolean paramBoolean)
  {
    if (!paramBoolean)
    {
      a(paramA, false);
      return;
    }
    a(paramA, true);
    paramA = new ArrayList();
    try
    {
      paramA.add(L.getBytes("utf-8"));
      localHashMap = new HashMap();
      localHashMap.put("QualTest", paramA);
    }
    catch (UnsupportedEncodingException localUnsupportedEncodingException)
    {
      try
      {
        HashMap localHashMap;
        c.a(O, b, c, N, M);
        dconfigManager.a(localHashMap, "");
        QLog.d("MSF.C.QualityTestManager", 1, "QualityClient finish, succ: " + L);
        return;
        localUnsupportedEncodingException = localUnsupportedEncodingException;
        localUnsupportedEncodingException.printStackTrace();
      }
      catch (Exception paramA)
      {
        for (;;)
        {
          paramA.printStackTrace();
        }
      }
    }
  }
  
  private boolean b(byte[] paramArrayOfByte)
  {
    return (paramArrayOfByte != null) && (paramArrayOfByte.length > 0) && (new String(paramArrayOfByte).endsWith("\r\n\r\n"));
  }
  
  private byte[] b(int paramInt, byte[] paramArrayOfByte)
  {
    if (QLog.isColorLevel()) {
      QLog.d("MSF.C.QualityTestManager", 2, "entry getSendData");
    }
    if (b != null)
    {
      ByteBuffer localByteBuffer = ByteBuffer.allocate(paramInt);
      byte[] arrayOfByte = new byte[paramInt];
      if ((paramArrayOfByte != null) && (paramArrayOfByte.length > 0)) {
        localByteBuffer.put(paramArrayOfByte);
      }
      paramInt = 0;
      while (paramInt < b.f)
      {
        localByteBuffer.put(b.e);
        paramInt += 1;
      }
      localByteBuffer.flip();
      localByteBuffer.get(arrayOfByte);
      paramInt = arrayOfByte.length;
      if (a != a.c) {
        if ((b.o == 0) || (1 == b.o))
        {
          int i1 = com.tencent.mobileqq.msf.core.c.a(arrayOfByte, 0);
          if (i1 != paramInt)
          {
            if (QLog.isDevelopLevel()) {
              QLog.d("MSF.C.QualityTestManager", 4, "testdata length error stop dataTotalLen:" + i1 + " receBodySize:" + paramInt);
            }
            b(a.d.a.f, true);
            c.a();
            return null;
          }
        }
        else
        {
          if (2 != b.o) {
            break label229;
          }
          if (QLog.isColorLevel()) {
            QLog.d("MSF.C.QualityTestManager", 2, "qualityTestMsg.cTestType=2, Should*NOT* check head len");
          }
        }
      }
      return arrayOfByte;
      label229:
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.QualityTestManager", 2, "qualityTestMsg.cTestType" + b.o + "NotSupport, giveup speed_test");
      }
      return null;
    }
    if (c != null) {}
    return null;
  }
  
  /* Error */
  public static String d()
  {
    // Byte code:
    //   0: new 659	java/io/BufferedReader
    //   3: dup
    //   4: new 661	java/io/FileReader
    //   7: dup
    //   8: ldc_w 663
    //   11: invokespecial 664	java/io/FileReader:<init>	(Ljava/lang/String;)V
    //   14: sipush 8192
    //   17: invokespecial 667	java/io/BufferedReader:<init>	(Ljava/io/Reader;I)V
    //   20: astore_1
    //   21: aload_1
    //   22: astore_0
    //   23: aload_1
    //   24: invokevirtual 670	java/io/BufferedReader:readLine	()Ljava/lang/String;
    //   27: ldc_w 672
    //   30: ldc 113
    //   32: invokevirtual 676	java/lang/String:replaceAll	(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    //   35: ldc_w 678
    //   38: invokevirtual 682	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   41: astore_2
    //   42: aload_1
    //   43: astore_0
    //   44: invokestatic 394	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   47: ifeq +33 -> 80
    //   50: aload_1
    //   51: astore_0
    //   52: ldc -44
    //   54: iconst_4
    //   55: new 214	java/lang/StringBuilder
    //   58: dup
    //   59: invokespecial 215	java/lang/StringBuilder:<init>	()V
    //   62: ldc_w 684
    //   65: invokevirtual 221	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   68: aload_2
    //   69: iconst_1
    //   70: aaload
    //   71: invokevirtual 221	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   74: invokevirtual 228	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   77: invokestatic 231	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   80: aload_1
    //   81: invokevirtual 687	java/io/BufferedReader:close	()V
    //   84: aload_2
    //   85: iconst_1
    //   86: aaload
    //   87: areturn
    //   88: astore_2
    //   89: aconst_null
    //   90: astore_1
    //   91: aload_1
    //   92: astore_0
    //   93: invokestatic 394	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   96: ifeq +14 -> 110
    //   99: aload_1
    //   100: astore_0
    //   101: ldc -44
    //   103: iconst_4
    //   104: ldc_w 689
    //   107: invokestatic 231	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   110: aload_1
    //   111: astore_0
    //   112: aload_2
    //   113: invokevirtual 399	java/lang/Exception:printStackTrace	()V
    //   116: aload_1
    //   117: invokevirtual 687	java/io/BufferedReader:close	()V
    //   120: ldc_w 691
    //   123: areturn
    //   124: astore_0
    //   125: invokestatic 394	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   128: ifeq +12 -> 140
    //   131: ldc -44
    //   133: iconst_4
    //   134: ldc_w 693
    //   137: invokestatic 231	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   140: aload_0
    //   141: invokevirtual 399	java/lang/Exception:printStackTrace	()V
    //   144: ldc_w 691
    //   147: areturn
    //   148: astore_1
    //   149: aconst_null
    //   150: astore_0
    //   151: aload_0
    //   152: invokevirtual 687	java/io/BufferedReader:close	()V
    //   155: aload_1
    //   156: athrow
    //   157: astore_0
    //   158: invokestatic 394	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   161: ifeq +12 -> 173
    //   164: ldc -44
    //   166: iconst_4
    //   167: ldc_w 693
    //   170: invokestatic 231	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   173: aload_0
    //   174: invokevirtual 399	java/lang/Exception:printStackTrace	()V
    //   177: goto -22 -> 155
    //   180: astore_0
    //   181: invokestatic 394	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   184: ifeq +12 -> 196
    //   187: ldc -44
    //   189: iconst_4
    //   190: ldc_w 693
    //   193: invokestatic 231	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   196: aload_0
    //   197: invokevirtual 399	java/lang/Exception:printStackTrace	()V
    //   200: goto -116 -> 84
    //   203: astore_1
    //   204: goto -53 -> 151
    //   207: astore_2
    //   208: goto -117 -> 91
    // Local variable table:
    //   start	length	slot	name	signature
    //   22	90	0	localBufferedReader1	java.io.BufferedReader
    //   124	17	0	localException1	Exception
    //   150	2	0	localObject1	Object
    //   157	17	0	localException2	Exception
    //   180	17	0	localException3	Exception
    //   20	97	1	localBufferedReader2	java.io.BufferedReader
    //   148	8	1	localObject2	Object
    //   203	1	1	localObject3	Object
    //   41	44	2	arrayOfString	String[]
    //   88	25	2	localException4	Exception
    //   207	1	2	localException5	Exception
    // Exception table:
    //   from	to	target	type
    //   0	21	88	java/lang/Exception
    //   116	120	124	java/lang/Exception
    //   0	21	148	finally
    //   151	155	157	java/lang/Exception
    //   80	84	180	java/lang/Exception
    //   23	42	203	finally
    //   44	50	203	finally
    //   52	80	203	finally
    //   93	99	203	finally
    //   101	110	203	finally
    //   112	116	203	finally
    //   23	42	207	java/lang/Exception
    //   44	50	207	java/lang/Exception
    //   52	80	207	java/lang/Exception
  }
  
  /* Error */
  public static String e()
  {
    // Byte code:
    //   0: new 659	java/io/BufferedReader
    //   3: dup
    //   4: new 661	java/io/FileReader
    //   7: dup
    //   8: ldc_w 695
    //   11: invokespecial 664	java/io/FileReader:<init>	(Ljava/lang/String;)V
    //   14: sipush 8192
    //   17: invokespecial 667	java/io/BufferedReader:<init>	(Ljava/io/Reader;I)V
    //   20: astore_3
    //   21: aload_3
    //   22: astore_1
    //   23: aload_3
    //   24: invokevirtual 670	java/io/BufferedReader:readLine	()Ljava/lang/String;
    //   27: ldc_w 697
    //   30: invokevirtual 682	java/lang/String:split	(Ljava/lang/String;)[Ljava/lang/String;
    //   33: astore 4
    //   35: iconst_2
    //   36: istore_0
    //   37: ldc 113
    //   39: astore_2
    //   40: aload_3
    //   41: astore_1
    //   42: iload_0
    //   43: aload 4
    //   45: arraylength
    //   46: if_icmpge +89 -> 135
    //   49: aload_3
    //   50: astore_1
    //   51: new 214	java/lang/StringBuilder
    //   54: dup
    //   55: invokespecial 215	java/lang/StringBuilder:<init>	()V
    //   58: aload_2
    //   59: invokevirtual 221	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   62: aload 4
    //   64: iload_0
    //   65: aaload
    //   66: invokevirtual 221	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   69: ldc_w 699
    //   72: invokevirtual 221	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   75: invokevirtual 228	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   78: astore_2
    //   79: iload_0
    //   80: iconst_1
    //   81: iadd
    //   82: istore_0
    //   83: goto -43 -> 40
    //   86: astore 4
    //   88: aconst_null
    //   89: astore_2
    //   90: aload_2
    //   91: astore_1
    //   92: invokestatic 394	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   95: ifeq +14 -> 109
    //   98: aload_2
    //   99: astore_1
    //   100: ldc -44
    //   102: iconst_4
    //   103: ldc_w 701
    //   106: invokestatic 231	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   109: aload_2
    //   110: astore_1
    //   111: aload 4
    //   113: invokevirtual 399	java/lang/Exception:printStackTrace	()V
    //   116: ldc_w 703
    //   119: astore_1
    //   120: aload_2
    //   121: invokevirtual 687	java/io/BufferedReader:close	()V
    //   124: aload_1
    //   125: areturn
    //   126: astore_2
    //   127: aconst_null
    //   128: astore_1
    //   129: aload_1
    //   130: invokevirtual 687	java/io/BufferedReader:close	()V
    //   133: aload_2
    //   134: athrow
    //   135: aload_3
    //   136: invokevirtual 687	java/io/BufferedReader:close	()V
    //   139: aload_2
    //   140: astore_1
    //   141: invokestatic 394	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   144: ifeq -20 -> 124
    //   147: ldc -44
    //   149: iconst_4
    //   150: new 214	java/lang/StringBuilder
    //   153: dup
    //   154: invokespecial 215	java/lang/StringBuilder:<init>	()V
    //   157: ldc_w 705
    //   160: invokevirtual 221	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   163: aload_2
    //   164: invokevirtual 221	java/lang/StringBuilder:append	(Ljava/lang/String;)Ljava/lang/StringBuilder;
    //   167: invokevirtual 228	java/lang/StringBuilder:toString	()Ljava/lang/String;
    //   170: invokestatic 231	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   173: aload_2
    //   174: areturn
    //   175: astore_1
    //   176: invokestatic 394	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   179: ifeq +12 -> 191
    //   182: ldc -44
    //   184: iconst_4
    //   185: ldc_w 693
    //   188: invokestatic 231	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   191: aload_1
    //   192: invokevirtual 399	java/lang/Exception:printStackTrace	()V
    //   195: goto -62 -> 133
    //   198: astore_1
    //   199: invokestatic 394	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   202: ifeq +12 -> 214
    //   205: ldc -44
    //   207: iconst_4
    //   208: ldc_w 693
    //   211: invokestatic 231	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   214: aload_1
    //   215: invokevirtual 399	java/lang/Exception:printStackTrace	()V
    //   218: ldc_w 703
    //   221: areturn
    //   222: astore_1
    //   223: invokestatic 394	com/tencent/qphone/base/util/QLog:isDevelopLevel	()Z
    //   226: ifeq +12 -> 238
    //   229: ldc -44
    //   231: iconst_4
    //   232: ldc_w 693
    //   235: invokestatic 231	com/tencent/qphone/base/util/QLog:d	(Ljava/lang/String;ILjava/lang/String;)V
    //   238: aload_1
    //   239: invokevirtual 399	java/lang/Exception:printStackTrace	()V
    //   242: goto -103 -> 139
    //   245: astore_2
    //   246: goto -117 -> 129
    //   249: astore 4
    //   251: aload_3
    //   252: astore_2
    //   253: goto -163 -> 90
    // Local variable table:
    //   start	length	slot	name	signature
    //   36	47	0	i1	int
    //   22	119	1	localObject1	Object
    //   175	17	1	localException1	Exception
    //   198	17	1	localException2	Exception
    //   222	17	1	localException3	Exception
    //   39	82	2	str1	String
    //   126	48	2	str2	String
    //   245	1	2	localObject2	Object
    //   252	1	2	localBufferedReader1	java.io.BufferedReader
    //   20	232	3	localBufferedReader2	java.io.BufferedReader
    //   33	30	4	arrayOfString	String[]
    //   86	26	4	localException4	Exception
    //   249	1	4	localException5	Exception
    // Exception table:
    //   from	to	target	type
    //   0	21	86	java/lang/Exception
    //   0	21	126	finally
    //   129	133	175	java/lang/Exception
    //   120	124	198	java/lang/Exception
    //   135	139	222	java/lang/Exception
    //   23	35	245	finally
    //   42	49	245	finally
    //   51	79	245	finally
    //   92	98	245	finally
    //   100	109	245	finally
    //   111	116	245	finally
    //   23	35	249	java/lang/Exception
    //   42	49	249	java/lang/Exception
    //   51	79	249	java/lang/Exception
  }
  
  private void f()
  {
    try
    {
      switch (1.a[a.ordinal()])
      {
      case 1: 
        g.close();
        if (QLog.isDevelopLevel())
        {
          QLog.d("MSF.C.QualityTestManager", 4, "QualityTest: close Udp socket");
          return;
        }
        break;
      case 2: 
        h.close();
        i.close();
        if (QLog.isDevelopLevel())
        {
          QLog.d("MSF.C.QualityTestManager", 4, "QualityTest: close Tcp socket");
          return;
        }
        break;
      case 3: 
        h.close();
        i.close();
        if (QLog.isDevelopLevel())
        {
          QLog.d("MSF.C.QualityTestManager", 4, "QualityTest: close Http socket");
          return;
        }
        break;
      }
      return;
    }
    catch (Exception localException) {}
  }
  
  private boolean g()
  {
    if ((b.g == null) && (b.g.length <= 0)) {
      return false;
    }
    String[] arrayOfString = new String(b.g).split("\r\n");
    Object localObject1 = "";
    Object localObject2 = "";
    int i2 = arrayOfString.length;
    int i1 = 0;
    if (i1 < i2)
    {
      String str = arrayOfString[i1];
      Object localObject4;
      Object localObject3;
      if (((!str.startsWith("Cookie:")) || (!str.contains("md5="))) && ((!str.startsWith("Set-Cookie:")) || (!str.contains("md5="))))
      {
        localObject4 = (String)localObject1 + str + "\r\n";
        localObject3 = localObject2;
      }
      for (;;)
      {
        i1 += 1;
        localObject2 = localObject3;
        localObject1 = localObject4;
        break;
        int i3 = str.indexOf("md5=");
        int i4 = str.indexOf(";", i3);
        localObject3 = localObject2;
        localObject4 = localObject1;
        if (i3 != -1)
        {
          localObject3 = localObject2;
          localObject4 = localObject1;
          if (i4 > "md5=".length() + i3)
          {
            localObject3 = str.substring("md5=".length() + i3, i4);
            localObject4 = localObject1;
          }
        }
      }
    }
    return ((String)localObject2).equals(MD5.toMD5((String)localObject1 + "\r\n"));
  }
  
  private void h()
  {
    if (c == null)
    {
      b(a.d.a.o, true);
      c.a();
      return;
    }
    l.a = a.d.b.b;
    l.g = NetConnInfoCenterImpl.getSystemNetworkType();
    l.r = c.a;
    l.s = c.g;
    l.t = c.f;
    l.u = new ArrayList();
    int i1 = 0;
    while (i1 < c.d.size())
    {
      l.u.add(c.d.get(i1));
      i1 += 1;
    }
    l.w = c.h;
    l.v = new ArrayList();
    QLog.d("MSF.C.QualityTestManager", 1, "PkgInterval :" + c.f + " IpPort.size():" + c.b.size() + " PkgData.length " + c.c.size() + " PkgNum:" + c.g);
    if (c.b.size() > 75)
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("MSF.C.QualityTestManager", 4, "IPPort size too much, return ");
      }
      O = false;
      b(a.d.a.m, true);
      c.a();
      return;
    }
    if (c.b.size() <= 0)
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("MSF.C.QualityTestManager", 4, "IPPort size too small, return ");
      }
      b(a.d.a.n, true);
      c.a();
      return;
    }
    if (c.g > 20L)
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("MSF.C.QualityTestManager", 4, "dwPkgNum too much, return ");
      }
      O = false;
      b(a.d.a.l, true);
      c.a();
      return;
    }
    if (c.h * 1000L < System.currentTimeMillis())
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("MSF.C.QualityTestManager", 4, "mtuTest expired, stop test mtuTest.dwExpirTime:" + c.h + "System.currentTimeMillis():" + System.currentTimeMillis());
      }
      b(a.d.a.j, true);
      c.a();
      return;
    }
    if ((c.e.size() != c.d.size()) || (c.c.size() != c.d.size()))
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("MSF.C.QualityTestManager", 4, "qualityTestMsg sPkgData size error, stop test");
      }
      b(a.d.a.i, true);
      c.a();
      return;
    }
    if (c.g <= 0L)
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("MSF.C.QualityTestManager", 4, "mtuTest dwPkgNum too short, stop test mtuTest.dwPkgNum:" + c.g);
      }
      b(a.d.a.i, true);
      c.a();
      return;
    }
    if (c.g * c.c.size() > 20L)
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("MSF.C.QualityTestManager", 4, "dwPkgNum too much, return ");
      }
      O = false;
      b(a.d.a.l, true);
      c.a();
      return;
    }
    int i3 = 0;
    for (;;)
    {
      int i4;
      int i5;
      try
      {
        if (i3 < c.b.size())
        {
          i1 = 0;
          l.y = new ArrayList();
          l.k = 0;
          l.n = 0;
          l.l = 0;
          l.m = 0;
          l.o = 0;
          l.c.clear();
          l.v.clear();
          try
          {
            l.h = NetConnInfoCenter.getWifiStrength();
            l.j = NetConnInfoCenter.getCdmaStrength();
            l.i = NetConnInfoCenter.getGsmStrength();
            i4 = 0;
            if (i4 >= c.c.size()) {
              break label1638;
            }
            if (((byte[])c.c.get(i4)).length < 8)
            {
              if (QLog.isDevelopLevel()) {
                QLog.d("MSF.C.QualityTestManager", 4, "qualityTestMsg sPkgData too short, stop test qualityTestMsg.sPkgData.length");
              }
              a(a.d.a.i);
            }
          }
          catch (Exception localException1)
          {
            if (!QLog.isDevelopLevel()) {
              continue;
            }
            QLog.d("MSF.C.QualityTestManager", 4, "failed to get network strength");
            continue;
          }
        }
        int i6;
        ByteBuffer localByteBuffer;
        int i7;
        if (arrayOfByte == null) {
          break label1593;
        }
      }
      catch (Exception localException2)
      {
        QLog.d("MSF.C.QualityTestManager", 1, "QualityClient  error ", localException2);
        return;
        if ((c.e.get(i4) == null) || (((byte[])c.e.get(i4)).length <= 0)) {
          break label1688;
        }
        i2 = ((byte[])c.e.get(i4)).length;
        i6 = (int)(i2 + ((byte[])c.c.get(i4)).length * ((Long)c.d.get(i4)).longValue());
        QLog.d("MSF.C.QualityTestManager", 1, "mtu allbodylength " + i6);
        if ((i6 > 262144) && (a == a.a))
        {
          if (QLog.isDevelopLevel()) {
            QLog.d("MSF.C.QualityTestManager", 4, "testdata too big " + i6 + " return ");
          }
          a(a.d.a.h);
        }
        else if (i6 > 262144)
        {
          if (QLog.isDevelopLevel()) {
            QLog.d("MSF.C.QualityTestManager", 4, "testdata too big " + i6 + " return ");
          }
          O = false;
          a(a.d.a.h);
        }
        else
        {
          if (c.f >= 10L) {
            break label1702;
          }
          if (QLog.isDevelopLevel()) {
            QLog.d("MSF.C.QualityTestManager", 4, "dwPkgInterval too small " + c.f + " return ");
          }
          a(a.d.a.g);
          break label1693;
          if (i5 < c.g)
          {
            i1 = i2;
            if (i2 == 0)
            {
              if (!a((com.tencent.msf.service.protocol.push.a.a)c.b.get(i3)))
              {
                if (QLog.isDevelopLevel()) {
                  QLog.d("MSF.C.QualityTestManager", 4, "connectToServer error, return ");
                }
                a(a.d.a.c);
                i1 = i2;
                break label1710;
              }
              s = 0L;
              w = 0L;
              t = 0L;
              x = 0L;
              i1 = 1;
            }
            try
            {
              localByteBuffer = ByteBuffer.allocate(i6);
              arrayOfByte = new byte[i6];
              if ((c.e.get(i4) == null) || (((byte[])c.e.get(i4)).length <= 0)) {
                break label1721;
              }
              localByteBuffer.put((byte[])c.e.get(i4));
            }
            catch (Exception localException3)
            {
              byte[] arrayOfByte;
              QLog.d("MSF.C.QualityTestManager", 1, "QualityClient:  error:", localException3);
              localException3.printStackTrace();
              try
              {
                Thread.sleep(c.f);
              }
              catch (Exception localException4)
              {
                QLog.d("MSF.C.QualityTestManager", 1, "QualityClient: Thread sleep error " + localException4);
              }
            }
            if (i2 < ((Long)c.d.get(i4)).longValue())
            {
              localByteBuffer.put((byte[])c.c.get(i4));
              i2 += 1;
              continue;
            }
            localByteBuffer.flip();
            localByteBuffer.get(arrayOfByte);
            i2 = arrayOfByte.length;
            i7 = com.tencent.mobileqq.msf.core.c.a(arrayOfByte, 0);
            if (i7 != i2)
            {
              if (QLog.isDevelopLevel()) {
                QLog.d("MSF.C.QualityTestManager", 4, "testdata length error stop dataTotalLen:" + i7 + " receBodySize:" + i2);
              }
              a(a.d.a.f);
              l.y.add(Integer.valueOf(i6));
            }
          }
        }
      }
      finally
      {
        c.a();
      }
      if (!a(arrayOfByte))
      {
        i1 = 0;
      }
      else if (!a(arrayOfByte.length, arrayOfByte))
      {
        l.v.add(Integer.valueOf(arrayOfByte.length));
        i1 = 0;
      }
      else
      {
        label1593:
        label1638:
        f();
        if (i3 == c.b.size() - 1) {}
        for (boolean bool = true;; bool = false)
        {
          b(a.d.a.a, bool);
          i3 += 1;
          break;
        }
        i1 = i2;
        continue;
        label1688:
        i2 = 0;
        continue;
        label1693:
        i4 += 1;
        continue;
        label1702:
        i5 = 0;
        i2 = i1;
        continue;
      }
      label1710:
      i5 += 1;
      int i2 = i1;
      continue;
      label1721:
      i2 = 0;
    }
  }
  
  public String a()
  {
    return L;
  }
  
  public void a(a.d.a paramA, boolean paramBoolean)
  {
    if (paramA == a.d.a.a)
    {
      l.b = paramA;
      if (s == 0L) {
        break label319;
      }
      l.p = ((int)((float)t / (float)s));
      label43:
      if (w == 0L) {
        break label330;
      }
      l.q = ((int)((float)x / (float)w));
      label71:
      paramA = l.toString();
      if (!TextUtils.isEmpty(L)) {
        break label341;
      }
      L += "(";
      if ((b == null) || (c != null) || (m.a != a.c.a.a) || (l.a != a.d.b.a)) {}
    }
    for (L += m.toString();; L += "*") {
      label319:
      label330:
      label341:
      do
      {
        L += paramA;
        if (paramBoolean) {}
        try
        {
          L += ")";
          paramA = new CRC32();
          paramA.update(L.getBytes("UTF-8"));
          L += paramA.getValue();
          return;
        }
        catch (UnsupportedEncodingException paramA)
        {
          paramA.printStackTrace();
        }
        l.b = a.d.a.b;
        if (paramA == a.d.a.b) {
          break;
        }
        a(paramA);
        break;
        l.p = 0;
        break label43;
        l.q = 0;
        break label71;
      } while ((L.endsWith("#")) || (L.endsWith("(")));
    }
  }
  
  public String b()
  {
    c();
    if (f) {
      return L;
    }
    return "";
  }
  
  public void c()
  {
    f = false;
    if (b == null)
    {
      b(a.d.a.k, true);
      c.a();
      return;
    }
    try
    {
      if (a != a.c)
      {
        byte[] arrayOfByte1 = new byte[b.e.length - 4];
        System.arraycopy(b.e, 0, arrayOfByte1, 0, arrayOfByte1.length);
        m.c = com.tencent.mobileqq.msf.core.c.a(arrayOfByte1, arrayOfByte1.length - 4);
      }
      m.d = b.j;
      m.e = b.o;
      m.f = b.k;
      m.g = b.l;
      m.h = b.m;
      m.a = a.c.a.a;
      l.a = a.d.b.a;
      l.g = NetConnInfoCenterImpl.getSystemNetworkType();
      l.r = b.a;
      l.s = b.c;
      l.t = b.d;
      l.u = new ArrayList();
      l.u.add(Long.valueOf(b.f));
      l.w = b.h;
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.QualityTestManager", 2, "PkgInterval :" + b.d + " IpPort.size():" + b.b.size() + " PkgNum:" + b.c + " HeadData.length" + b.g.length + " RepeatTimes" + b.f + " PkgData.length " + b.e.length + " dwTaskType" + b.j + " dwTaskTime" + b.k + " dwReserved1 " + b.l + " dwReserved2 " + b.m + " dwRecvLen " + b.n + " cTestType " + b.o + " sPkgData " + Arrays.toString(b.e));
      }
      if (d > 1)
      {
        if (b.b.size() <= 200) {
          break label764;
        }
        if (QLog.isDevelopLevel()) {
          QLog.d("MSF.C.QualityTestManager", 4, "IPPort size too much for WiFi test, return ");
        }
        O = false;
        b(a.d.a.m, true);
        c.a();
        return;
      }
    }
    catch (Exception localException1)
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("MSF.C.QualityTestManager", 4, "qualityTestMsg sPkgData too short, stop test qualityTestMsg.sPkgData.length:" + b.e.length);
      }
      b(a.d.a.i, true);
      c.a();
      return;
    }
    if ((d == 1) && ((b.m & 0xFF) != 1L))
    {
      if (b.b.size() > 75)
      {
        if (QLog.isDevelopLevel()) {
          QLog.d("MSF.C.QualityTestManager", 4, "IPPort size too much, return ");
        }
        O = false;
        b(a.d.a.m, true);
        c.a();
      }
    }
    else if ((d == 1) && ((b.m & 0xFF) == 1L) && (b.b.size() > 200))
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("MSF.C.QualityTestManager", 4, "IPPort size too much for WiFi test, return ");
      }
      O = false;
      b(a.d.a.m, true);
      c.a();
      return;
    }
    label764:
    if (b.b.size() <= 0)
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("MSF.C.QualityTestManager", 4, "IPPort size too small, return ");
      }
      b(a.d.a.n, true);
      c.a();
      return;
    }
    if (b.f <= 0L)
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("MSF.C.QualityTestManager", 4, "dwRepeatTimes must > 0");
      }
      b(a.d.a.q, true);
      c.a();
      return;
    }
    if (d > 1)
    {
      if (b.c > 50L)
      {
        if (QLog.isDevelopLevel()) {
          QLog.d("MSF.C.QualityTestManager", 4, "dwPkgNum too much for WiFi test, return ");
        }
        O = false;
        b(a.d.a.l, true);
        c.a();
      }
    }
    else if ((d == 1) && ((b.m & 0xFF) != 1L))
    {
      if (b.c > 20L)
      {
        if (QLog.isDevelopLevel()) {
          QLog.d("MSF.C.QualityTestManager", 4, "dwPkgNum too much, return ");
        }
        O = false;
        b(a.d.a.l, true);
        c.a();
      }
    }
    else if ((d == 1) && ((b.m & 0xFF) == 1L) && (b.c > 50L))
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("MSF.C.QualityTestManager", 4, "dwPkgNum too much for WiFi test, return ");
      }
      O = false;
      b(a.d.a.l, true);
      c.a();
      return;
    }
    if ((b.m >> 8 & 0xFF) > 20L)
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("MSF.C.QualityTestManager", 4, "dwReserved2>>8 &0xFF too much, return ");
      }
      O = false;
      b(a.d.a.l, true);
      c.a();
      return;
    }
    if (b.h * 1000L < System.currentTimeMillis())
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("MSF.C.QualityTestManager", 4, "qualityTestMsg expired, stop test qualityTestMsg.dwExpirTime:" + b.h + "System.currentTimeMillis():" + System.currentTimeMillis());
      }
      b(a.d.a.j, true);
      c.a();
      return;
    }
    if ((a != a.c) && (b.e.length < 8))
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("MSF.C.QualityTestManager", 4, "qualityTestMsg sPkgData too short, stop test qualityTestMsg.sPkgData.length:" + b.e.length);
      }
      b(a.d.a.i, true);
      c.a();
      return;
    }
    if ((a == a.c) && (!b(b.g)))
    {
      if (QLog.isDevelopLevel()) {
        QLog.d("MSF.C.QualityTestManager", 4, "qualityTestMsg sPkgData too short, stop test qualityTestMsg.sPkgData.length:" + b.e.length);
      }
      b(a.d.a.s, true);
      c.a();
      return;
    }
    if ((b.o != 0) && (1 != b.o) && (2 != b.o))
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.QualityTestManager", 2, "qualityTestMsg.cTestType " + b.o + " NoSupport");
      }
      b(a.d.a.w, true);
      c.a();
      return;
    }
    int i2 = 0;
    int i1 = i2;
    int i6;
    for (;;)
    {
      try
      {
        if (b.g != null)
        {
          i1 = i2;
          if (b.g.length > 0) {
            i1 = b.g.length;
          }
        }
        i6 = (int)(i1 + b.e.length * b.f);
        QLog.d("MSF.C.QualityTestManager", 1, "allbodylength " + i6);
        if ((i6 <= 262144) || (a != a.a)) {
          continue;
        }
        if (QLog.isDevelopLevel()) {
          QLog.d("MSF.C.QualityTestManager", 4, "testdata too big " + i6 + " return ");
        }
        O = false;
        b(a.d.a.h, true);
        c.a();
      }
      catch (Exception localException2)
      {
        QLog.d("MSF.C.QualityTestManager", 1, "QualityClient: error ", localException2);
        continue;
      }
      finally
      {
        c.a();
      }
      return;
      if ((i6 > 262144) && (a == a.b))
      {
        if (QLog.isDevelopLevel()) {
          QLog.d("MSF.C.QualityTestManager", 4, "testdata too big " + i6 + " return ");
        }
        O = false;
        b(a.d.a.h, true);
        c.a();
      }
      else if ((i6 > 1048576) && (a == a.c))
      {
        if (QLog.isDevelopLevel()) {
          QLog.d("MSF.C.QualityTestManager", 4, "testdata too big " + i6 + " return ");
        }
        O = false;
        b(a.d.a.h, true);
        c.a();
      }
      else if (b.d < 10L)
      {
        if (QLog.isDevelopLevel()) {
          QLog.d("MSF.C.QualityTestManager", 4, "dwPkgInterval too small " + b.d + " return ");
        }
        b(a.d.a.g, true);
        c.a();
      }
      else
      {
        if ((a != a.c) || (g())) {
          break;
        }
        if (QLog.isDevelopLevel()) {
          QLog.d("MSF.C.QualityTestManager", 4, "no valid http push");
        }
        l.x = true;
        b(a.d.a.p, true);
        c.a();
      }
    }
    byte[] arrayOfByte2 = b(i6, b.g);
    int i5 = 0;
    i1 = 0;
    label1889:
    int i3;
    long l1;
    label2184:
    int i4;
    label2312:
    label2628:
    label2789:
    label2792:
    boolean bool1;
    if ((i1 < b.b.size()) && (i5 == 0))
    {
      l.y = new ArrayList();
      l.k = 0;
      l.n = 0;
      l.l = 0;
      l.m = 0;
      l.o = 0;
      l.c.clear();
      l.x = false;
      l.A = null;
      l.B.clear();
      l.C.clear();
      for (;;)
      {
        long l2;
        try
        {
          l.h = NetConnInfoCenter.getWifiStrength();
          l.j = NetConnInfoCenter.getCdmaStrength();
          l.i = NetConnInfoCenter.getGsmStrength();
          s = 0L;
          w = 0L;
          t = 0L;
          x = 0L;
          i3 = i1;
          try
          {
            if (!NetConnInfoCenterImpl.isWifiConn()) {
              break label2312;
            }
            i3 = i1;
            if (NetConnInfoCenter.getWifiStrength() <= 10) {
              break label2312;
            }
            i3 = i1;
            if (!c.e.equals("NotWiFi")) {
              continue;
            }
            i3 = i1;
            if (e == 0) {
              continue;
            }
            i3 = i1;
            if (!QLog.isColorLevel()) {
              break;
            }
            i3 = i1;
            QLog.d("MSF.C.QualityTestManager", 2, "lost wifi connection, give up qualitytest run_thread" + Thread.currentThread().getName());
          }
          catch (Exception localException3)
          {
            l2 = 1L;
            i2 = i3;
          }
          l1 = l2;
          i1 = i2;
          if (!QLog.isDevelopLevel()) {
            break label3633;
          }
          QLog.d("MSF.C.QualityTestManager", 4, "net change caused quality test error", localException3);
          l1 = l2;
          i1 = i2;
          break label3633;
          l.y.add(Integer.valueOf(i6));
          if (i4 != -1) {
            break label3508;
          }
        }
        catch (Exception localException4)
        {
          if (!QLog.isDevelopLevel()) {
            continue;
          }
          QLog.d("MSF.C.QualityTestManager", 4, "failed to get network strength");
          continue;
          i3 = i1;
          if ((b.m & 0xFF) == 1L)
          {
            i3 = i1;
            if (d > 1)
            {
              i3 = i1;
              l1 = b.c / d;
              break label3633;
            }
            i3 = i1;
            l1 = b.m >> 8 & 0xFF;
            break label3633;
          }
          i3 = i1;
          l1 = b.c;
          break label3633;
        }
        i3 = i1;
        c.e = "NotWiFi";
        i3 = i1;
        if ((b.m & 0xFF) == 1L)
        {
          i3 = i1;
          if (d > 1)
          {
            i3 = i1;
            if (e != 0)
            {
              i3 = i1;
              if (!QLog.isColorLevel()) {
                break;
              }
              i3 = i1;
              QLog.d("MSF.C.QualityTestManager", 2, "lost wifi connection, give up qualitytest run_thread" + Thread.currentThread().getName());
              break;
            }
            i2 = -1;
            i3 = i2;
            d = 1;
            i3 = i2;
            if (b.b.size() > 75)
            {
              i3 = i2;
              if (QLog.isDevelopLevel())
              {
                i3 = i2;
                QLog.d("MSF.C.QualityTestManager", 4, "IPPort size too much, return ");
              }
              i3 = i2;
              i1 = L.indexOf("#");
              if (i1 != -1)
              {
                i3 = i2;
                L = L.substring(0, i1 + 1);
              }
              i3 = i2;
              l.c.clear();
              i3 = i2;
              O = false;
              i3 = i2;
              b(a.d.a.m, true);
              i3 = i2;
              c.a();
              break;
            }
            i3 = i2;
            l1 = b.m;
            l2 = l1 >> 8 & 0xFF;
            try
            {
              i3 = L.indexOf("#");
              l1 = l2;
              i1 = i2;
              if (i3 == -1) {
                break label3633;
              }
              L = L.substring(0, i3 + 1);
              l1 = l2;
              i1 = i2;
            }
            catch (Exception localException5) {}
            continue;
          }
          i3 = i1;
          l1 = b.m >> 8 & 0xFF;
          break label3633;
        }
        i3 = i1;
        l1 = b.c;
        break label3633;
        i4 = i1;
        try
        {
          if (NetConnInfoCenterImpl.isWifiConn())
          {
            i4 = i1;
            if (NetConnInfoCenter.getWifiStrength() > 10)
            {
              i4 = i1;
              if (c.e.equals("NotWiFi"))
              {
                i4 = i1;
                if (e != 0)
                {
                  i4 = 1;
                  i5 = 1;
                  i1 = b.b.size();
                  i3 = i1;
                  i1 = i3;
                }
              }
            }
          }
        }
        catch (Exception localException11)
        {
          for (;;)
          {
            label3083:
            label3237:
            label3425:
            label3476:
            label3508:
            i1 = i3;
            i3 = i2;
            i2 = i4;
          }
        }
        try
        {
          if (QLog.isColorLevel())
          {
            i1 = i3;
            QLog.d("MSF.C.QualityTestManager", 2, "lost wifi connection, give up qualitytest run_thread" + e);
          }
          i4 = i3;
        }
        catch (Exception localException12)
        {
          i4 = 1;
          i3 = i2;
          i2 = i4;
          break label3083;
        }
      }
      i4 = i1;
      if ((b.m & 0xFF) == 1L)
      {
        i4 = i1;
        if (d > 1)
        {
          i4 = i1;
          l2 = b.c / d;
          l1 = l2;
          i4 = i1;
          if (arrayOfByte2 != null) {
            break label3237;
          }
          bool1 = false;
          f();
        }
      }
      for (;;)
      {
        i2 += 1;
        i1 = i4;
        break label3643;
        i4 = i1;
        l2 = b.m >> 8 & 0xFF;
        l1 = l2;
        break label2789;
        i4 = i1;
        l2 = b.c;
        l1 = l2;
        break label2789;
        i4 = i1;
        c.e = "NotWiFi";
        i4 = i1;
        if ((b.m & 0xFF) == 1L)
        {
          i4 = i1;
          if (d > 1)
          {
            i4 = i1;
            if (e != 0)
            {
              i4 = 1;
              i5 = 1;
              i1 = b.b.size();
              i3 = i1;
              i1 = i3;
              if (QLog.isColorLevel())
              {
                i1 = i3;
                QLog.d("MSF.C.QualityTestManager", 2, "lost wifi connection, give up qualitytest run_thread" + e);
              }
              i4 = i3;
              break label2184;
            }
            i2 = -1;
            i3 = 0;
            try
            {
              d = 1;
              if (b.b.size() > 75)
              {
                if (QLog.isDevelopLevel()) {
                  QLog.d("MSF.C.QualityTestManager", 4, "IPPort size too much, return ");
                }
                i2 = L.indexOf("#");
                if (i2 != -1) {
                  L = L.substring(0, i2 + 1);
                }
                l.c.clear();
                O = false;
                b(a.d.a.m, true);
                c.a();
              }
            }
            catch (Exception localException6)
            {
              i4 = -1;
              i2 = i1;
              i1 = i4;
            }
            for (;;)
            {
              if (QLog.isDevelopLevel()) {
                QLog.d("MSF.C.QualityTestManager", 4, "net change caused quality test error", localException6);
              }
              i4 = i2;
              i2 = i3;
              i3 = i1;
              break label2792;
              l2 = b.m;
              l1 = l2 >> 8 & 0xFF;
              try
              {
                int i7 = L.indexOf("#");
                i4 = i2;
                i5 = i1;
                if (i7 == -1) {
                  break;
                }
                L = L.substring(0, i7 + 1);
                i4 = i2;
                i5 = i1;
              }
              catch (Exception localException7)
              {
                i4 = -1;
                i2 = i1;
                i1 = i4;
              }
            }
          }
          i4 = i1;
          l2 = b.m >> 8 & 0xFF;
          l1 = l2;
          break label2789;
        }
        i4 = i1;
        l2 = b.c;
        l1 = l2;
        break label2789;
        try
        {
          if (!a((com.tencent.msf.service.protocol.push.a.a)b.b.get(i3)))
          {
            if (QLog.isDevelopLevel()) {
              QLog.d("MSF.C.QualityTestManager", 4, "connectToServer error, return ");
            }
            bool1 = false;
          }
        }
        catch (Exception localException9)
        {
          for (;;)
          {
            QLog.d("MSF.C.QualityTestManager", 1, "QualityClient:  error:", localException9);
            localException9.printStackTrace();
            f();
          }
        }
        finally
        {
          f();
        }
        try
        {
          l.C.add(Long.valueOf(-1L));
          a(a.d.a.c);
          f();
        }
        catch (Exception localException10)
        {
          bool1 = false;
          break label3476;
        }
        bool2 = a(arrayOfByte2);
        if (!bool2)
        {
          bool1 = false;
          l.C.add(Long.valueOf(-1L));
          f();
        }
        else
        {
          i1 = 0;
          if ((b.o == 0) || (1 == b.o)) {
            i1 = arrayOfByte2.length;
          }
          for (;;)
          {
            bool2 = a(i1, arrayOfByte2);
            if (bool2) {
              break label3425;
            }
            bool1 = false;
            f();
            break;
            if (2 == b.o)
            {
              l2 = b.n;
              i1 = (int)l2;
            }
          }
          f();
          try
          {
            Thread.sleep(b.d);
          }
          catch (Exception localException8)
          {
            QLog.d("MSF.C.QualityTestManager", 1, "QualityClient: Thread sleep error " + localException8);
          }
        }
      }
      if (i4 != b.b.size() - 1) {
        break label3679;
      }
    }
    label3633:
    label3643:
    label3671:
    label3679:
    for (boolean bool2 = true;; bool2 = false)
    {
      if (QLog.isColorLevel()) {
        QLog.d("MSF.C.QualityTestManager", 2, "testsuccess: " + bool1);
      }
      if (bool1) {
        b(a.d.a.a, bool2);
      }
      for (;;)
      {
        if (bool2)
        {
          f = true;
          break label3671;
          b(a.d.a.b, bool2);
          continue;
          bool1 = true;
          i3 = i1;
          i2 = 0;
          i1 = i5;
          i4 = i3;
          i5 = i1;
          if (i2 >= l1) {
            break;
          }
          if (i3 != -1) {
            break label2628;
          }
          i4 = i3;
          i5 = i1;
          break;
        }
      }
      i1 = i4 + 1;
      break label1889;
      break;
    }
  }
  
  public void run()
  {
    try
    {
      if (b != null)
      {
        c();
        return;
      }
      if (c != null)
      {
        h();
        return;
      }
    }
    catch (Exception localException)
    {
      QLog.d("MSF.C.QualityTestManager", 1, "QualityClient start failed, Exception :", localException);
    }
  }
  
  public static enum a
  {
    public static a a(String paramString)
    {
      return (a)Enum.valueOf(a.class, paramString);
    }
    
    public static a[] a()
    {
      return (a[])d.clone();
    }
  }
  
  static class b
  {
    public String[] a;
    public String b = "";
    
    b() {}
    
    public static b a(String paramString)
    {
      if (TextUtils.isEmpty(paramString)) {
        return null;
      }
      b localB = new b();
      int j = paramString.indexOf("\r\n\r\n");
      int i = j;
      if (j == -1) {
        i = paramString.length();
      }
      a = paramString.substring(0, i).split("\r\n");
      return localB;
    }
    
    public String a()
    {
      if ((a == null) || (a.length == 0)) {
        return "";
      }
      String str1 = "";
      String[] arrayOfString = a;
      int j = arrayOfString.length;
      int i = 0;
      while (i < j)
      {
        String str2 = arrayOfString[i];
        str1 = str1 + str2 + "\r\n";
        i += 1;
      }
      return str1 + "\r\n";
    }
    
    public String b()
    {
      if ((a == null) || (a.length == 0)) {}
      for (;;)
      {
        return "";
        String[] arrayOfString = a;
        int m = arrayOfString.length;
        int i = 0;
        while (i < m)
        {
          String str = arrayOfString[i];
          if (((str.startsWith("Set-Cookie:")) && (str.contains("gateway="))) || ((str.startsWith("Cookie:")) && (str.contains("gateway="))))
          {
            int n = str.indexOf("gateway=");
            int k = str.indexOf(";", n);
            int j = k;
            if (k == -1) {
              j = str.length();
            }
            if ((n != -1) && (j > n)) {
              return str.substring("gateway=".length() + n, j);
            }
          }
          i += 1;
        }
      }
    }
    
    public String c()
    {
      if ((a == null) || (a.length == 0)) {}
      for (;;)
      {
        return "";
        String[] arrayOfString = a;
        int m = arrayOfString.length;
        int i = 0;
        while (i < m)
        {
          String str = arrayOfString[i];
          if (((str.startsWith("Set-Cookie:")) && (str.contains("md5="))) || ((str.startsWith("Cookie:")) && (str.contains("md5="))))
          {
            int n = str.indexOf("md5=");
            int k = str.indexOf(";", n);
            int j = k;
            if (k == -1) {
              j = str.length();
            }
            if ((n != -1) && (j > n)) {
              return str.substring("md5=".length() + n, j);
            }
          }
          i += 1;
        }
      }
    }
    
    public String d()
    {
      if ((a == null) || (a.length == 0)) {
        return b;
      }
      String[] arrayOfString = a;
      int j = arrayOfString.length;
      Object localObject1 = "";
      int i = 0;
      while (i < j)
      {
        String str = arrayOfString[i];
        Object localObject2;
        if (str.startsWith("Set-Cookie:"))
        {
          localObject2 = localObject1;
          if (str.contains("md5=")) {}
        }
        else if (str.startsWith("Cookie:"))
        {
          localObject2 = localObject1;
          if (str.contains("md5=")) {}
        }
        else
        {
          localObject2 = (String)localObject1 + str + "\r\n";
        }
        i += 1;
        localObject1 = localObject2;
      }
      return (String)localObject1 + "\r\n";
    }
    
    public int e()
    {
      int k = -1;
      int j = k;
      if (a != null)
      {
        j = k;
        if (a.length <= 0) {}
      }
      try
      {
        String[] arrayOfString = a;
        int m = arrayOfString.length;
        int i = 0;
        for (;;)
        {
          j = k;
          if (i < m)
          {
            String str = arrayOfString[i];
            if (str.startsWith("Content-Length:")) {
              j = Integer.parseInt(str.substring("Content-Length:".length(), str.length()).trim());
            }
          }
          else
          {
            return j;
          }
          i += 1;
        }
        return -1;
      }
      catch (Exception localException) {}
    }
    
    public boolean f()
    {
      if ((a == null) || (a.length <= 0)) {}
      label64:
      for (;;)
      {
        return false;
        String[] arrayOfString = a;
        int j = arrayOfString.length;
        int i = 0;
        for (;;)
        {
          if (i >= j) {
            break label64;
          }
          String str = arrayOfString[i];
          if (str.startsWith("HTTP/1."))
          {
            if (!str.contains("200")) {
              break;
            }
            return true;
          }
          i += 1;
        }
      }
    }
    
    public boolean g()
    {
      return (f()) && (!TextUtils.isEmpty(c()));
    }
  }
  
  static class c
  {
    public a a = a.a;
    public String b;
    public int c;
    public long d;
    public long e;
    public long f;
    public long g;
    public long h;
    
    c()
    {
      String str = Build.VERSION.RELEASE.replaceAll("|", "_").replaceAll("#", "_").replace("*", "_");
      b = (a.e() + "," + a.d() + "," + str);
      c = 0;
      d = 0L;
      e = 0L;
      f = 0L;
      g = 0L;
      h = 0L;
    }
    
    public String toString()
    {
      StringBuilder localStringBuilder = new StringBuilder("");
      localStringBuilder.append(a).append(":").append(3).append("|").append(e).append("|").append(d).append("|").append(f).append("|").append(c).append("|").append(b).append("|").append(g).append("|").append(h).append("#");
      return localStringBuilder.toString();
    }
    
    public static enum a
    {
      public static a a(String paramString)
      {
        return (a)Enum.valueOf(a.class, paramString);
      }
      
      public static a[] a()
      {
        return (a[])b.clone();
      }
    }
  }
  
  static class d
  {
    public String A;
    public ArrayList B = new ArrayList();
    public ArrayList C = new ArrayList();
    public b a = b.a;
    public a b = a.a;
    public Map c = new HashMap();
    public InetAddress d;
    public InetAddress e;
    public int f = 0;
    public int g;
    public int h;
    public int i;
    public int j;
    public int k = 0;
    public int l = 0;
    public int m = 0;
    public int n = 0;
    public int o = 0;
    public int p = 0;
    public int q = 0;
    public int r = 0;
    public long s = 0L;
    public long t = 0L;
    ArrayList u;
    ArrayList v;
    public long w = 0L;
    public boolean x = false;
    ArrayList y;
    public long z;
    
    d() {}
    
    public String toString()
    {
      Object localObject1;
      label44:
      Object localObject3;
      label72:
      Object localObject4;
      if ((b == a.a) && (c.isEmpty()))
      {
        localObject1 = b;
        localObject1 = a.a.toString();
        if (d != null) {
          break label305;
        }
        localObject2 = "0.0.0.0|";
        if (e != null) {
          break label334;
        }
        localObject3 = (String)localObject2 + "0.0.0.0|";
        localObject2 = "";
        localObject4 = localObject2;
        if (y == null) {
          break label397;
        }
        localObject4 = localObject2;
        if (y.size() == 0) {
          break label397;
        }
        i1 = 0;
        label100:
        localObject4 = localObject2;
        if (i1 >= y.size()) {
          break label397;
        }
        if (i1 == y.size() - 1) {
          break label368;
        }
      }
      label305:
      label334:
      label368:
      for (Object localObject2 = (String)localObject2 + y.get(i1) + ",";; localObject2 = (String)localObject2 + y.get(i1))
      {
        i1 += 1;
        break label100;
        if ((c == null) || (c.isEmpty()))
        {
          localObject1 = b;
          localObject1 = a.b.toString();
          break;
        }
        localObject3 = c.entrySet().iterator();
        for (localObject2 = "";; localObject2 = (String)localObject2 + ((a)localObject4).toString() + ":" + i1 + ";")
        {
          localObject1 = localObject2;
          if (!((Iterator)localObject3).hasNext()) {
            break;
          }
          localObject1 = (Map.Entry)((Iterator)localObject3).next();
          localObject4 = (a)((Map.Entry)localObject1).getKey();
          i1 = ((Integer)((Map.Entry)localObject1).getValue()).intValue();
        }
        localObject2 = d.getHostAddress() + "|";
        break label44;
        localObject3 = (String)localObject2 + e.getHostAddress() + "|";
        break label72;
      }
      label397:
      localObject2 = "";
      Object localObject5 = localObject2;
      if (u != null)
      {
        localObject5 = localObject2;
        if (u.size() != 0)
        {
          i1 = 0;
          localObject5 = localObject2;
          if (i1 < u.size())
          {
            if (i1 != u.size() - 1) {}
            for (localObject2 = (String)localObject2 + u.get(i1) + ",";; localObject2 = (String)localObject2 + u.get(i1))
            {
              i1 += 1;
              break;
            }
          }
        }
      }
      if (x) {}
      for (String str1 = A; a == b.a; str1 = "false") {
        return "" + (String)localObject1 + "|" + (String)localObject3 + f + "|" + g + "|" + l + "|" + m + "|" + B.toString().replace("[", "").replace("]", "") + "|" + C.toString().replace("[", "").replace("]", "") + "|" + n + "|" + o + "|" + p + "|" + q + "|" + r + "|" + s + "|" + t + "|" + localObject5 + "|" + w + "|" + str1 + "|" + (String)localObject4 + "|" + z + "|" + h + "," + i + "," + j;
      }
      int i1 = Math.min(l, m);
      String str2;
      if (i1 > 0)
      {
        str2 = Integer.toString(k / i1);
        String str3 = "";
        localObject2 = str3;
        if (v == null) {
          break label1008;
        }
        localObject2 = str3;
        if (v.size() == 0) {
          break label1008;
        }
        localObject2 = "";
        i1 = 0;
        label910:
        if (i1 >= v.size()) {
          break label1008;
        }
        if (i1 == v.size() - 1) {
          break label979;
        }
      }
      label979:
      for (localObject2 = (String)localObject2 + v.get(i1) + ",";; localObject2 = (String)localObject2 + v.get(i1))
      {
        i1 += 1;
        break label910;
        str2 = "0";
        break;
      }
      label1008:
      return "" + a + "|" + (String)localObject1 + "|" + (String)localObject3 + f + "|" + g + "|" + str2 + "|" + l + "|" + m + "|" + n + "|" + o + "|" + (String)localObject2 + "|" + p + "|" + q + "|" + r + "|" + s + "|" + t + "|" + localObject5 + "|" + w + "|" + str1 + "|" + (String)localObject4 + "|" + z + "|" + h + "," + i + "," + j;
    }
    
    public static enum a
    {
      public static a a(String paramString)
      {
        return (a)Enum.valueOf(a.class, paramString);
      }
      
      public static a[] a()
      {
        return (a[])x.clone();
      }
    }
    
    public static enum b
    {
      public static b a(String paramString)
      {
        return (b)Enum.valueOf(b.class, paramString);
      }
      
      public static b[] a()
      {
        return (b[])c.clone();
      }
    }
  }
}
