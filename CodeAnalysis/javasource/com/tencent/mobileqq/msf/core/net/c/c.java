package com.tencent.mobileqq.msf.core.net.c;

import com.qq.jce.wup.UniPacket;
import com.tencent.mobileqq.msf.core.MsfCore;
import com.tencent.mobileqq.msf.core.NetConnInfoCenter;
import com.tencent.mobileqq.msf.core.NetConnInfoCenterImpl;
import com.tencent.mobileqq.msf.core.b.m;
import com.tencent.msf.service.protocol.push.a.b;
import com.tencent.qphone.base.remote.FromServiceMsg;
import com.tencent.qphone.base.util.QLog;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

public class c
{
  static final String a = "MSF.C.QualityTestManager";
  public static com.tencent.msf.service.protocol.push.a.c b = null;
  public static b c = null;
  public static MsfCore d = null;
  public static String e = "";
  public static ArrayList f = new ArrayList();
  public static ArrayList g = new ArrayList();
  static int h = 1;
  static int i = 0;
  
  public c() {}
  
  private static String a(ArrayList paramArrayList)
  {
    if ((paramArrayList == null) || (paramArrayList.size() <= 0)) {
      localObject = "";
    }
    Iterator localIterator;
    do
    {
      return localObject;
      localIterator = paramArrayList.iterator();
      paramArrayList = "";
      localObject = paramArrayList;
    } while (!localIterator.hasNext());
    Object localObject = (Long)localIterator.next();
    if (localObject != null) {}
    for (paramArrayList = paramArrayList + localObject + ";";; paramArrayList = paramArrayList + "-1;") {
      break;
    }
  }
  
  public static void a()
  {
    b = null;
    c = null;
  }
  
  public static void a(FromServiceMsg paramFromServiceMsg)
  {
    UniPacket localUniPacket;
    try
    {
      if (!paramFromServiceMsg.isSuccess()) {
        break label710;
      }
      if (b != null) {
        break label701;
      }
      localUniPacket = new UniPacket(true);
      localUniPacket.decode(paramFromServiceMsg.getWupBuffer());
      paramFromServiceMsg = localUniPacket.getFuncName();
      if (!paramFromServiceMsg.equals("QualityTest")) {
        break label536;
      }
      b = (com.tencent.msf.service.protocol.push.a.c)localUniPacket.getByClass("QualityTest", new com.tencent.msf.service.protocol.push.a.c());
      QLog.d("MSF.C.QualityTestManager", 1, "Quality getted, start now " + ba);
      if ((NetConnInfoCenterImpl.isWifiConn()) && (NetConnInfoCenter.getWifiStrength() >= 10)) {
        break label252;
      }
      e = "NotWiFi";
      if (ba == 1)
      {
        new Thread(new a(b, c, a.a.a, h, i)).start();
        return;
      }
      if (ba == 2)
      {
        new Thread(new a(b, c, a.a.b, h, i)).start();
        return;
      }
    }
    catch (Throwable paramFromServiceMsg)
    {
      QLog.d("MSF.C.QualityTestManager", 1, "QualityManager error, ", paramFromServiceMsg);
      return;
    }
    label252:
    int j;
    if (ba == 3)
    {
      new Thread(new a(b, c, a.a.c, h, i)).start();
      return;
      if ((bm & 0xFF) == 1L)
      {
        e = "WiFi";
        j = 0;
      }
    }
    for (;;)
    {
      if (j < 2)
      {
        if (ba == 1)
        {
          new Thread(new a(b, c, a.a.a, 2, j)).start();
          break label719;
        }
        if (ba == 2)
        {
          new Thread(new a(b, c, a.a.b, 2, j)).start();
          break label719;
        }
        if (ba != 3) {
          break label719;
        }
        new Thread(new a(b, c, a.a.c, 2, j)).start();
        break label719;
        e = "WiFi";
        if (ba == 1)
        {
          new Thread(new a(b, c, a.a.a, h, i)).start();
          return;
        }
        if (ba == 2)
        {
          new Thread(new a(b, c, a.a.b, h, i)).start();
          return;
        }
        if (ba == 3)
        {
          new Thread(new a(b, c, a.a.c, h, i)).start();
          return;
          label536:
          if (paramFromServiceMsg.equals("MtuTest"))
          {
            c = (b)localUniPacket.getByClass("MtuTest", new b());
            QLog.d("MSF.C.QualityTestManager", 1, "MtuTest getted, start now");
            if (ca == 1)
            {
              new Thread(new a(b, c, a.a.a, h, i)).start();
              return;
            }
            if (ca == 2)
            {
              new Thread(new a(b, c, a.a.b, h, i)).start();
              return;
            }
            if (ca == 3)
            {
              new Thread(new a(b, c, a.a.c, h, i)).start();
              return;
              label701:
              QLog.d("MSF.C.QualityTestManager", 1, "QualityManager getted too frequently drop now");
              return;
              label710:
              QLog.d("MSF.C.QualityTestManager", 1, "QualityManager getted, return fail do nothing");
            }
          }
        }
      }
      return;
      label719:
      j += 1;
    }
  }
  
  public static void a(boolean paramBoolean, com.tencent.msf.service.protocol.push.a.c paramC, b paramB, int paramInt1, int paramInt2)
  {
    int j = -1;
    HashMap localHashMap = new HashMap();
    int k;
    if (paramC != null)
    {
      localHashMap.put("TestType", "QualityTest");
      localHashMap.put("ProtoType", "" + a);
      paramB = new StringBuilder().append("");
      if (b != null)
      {
        k = b.size();
        localHashMap.put("IpNum", k);
        localHashMap.put("PkgNum", "" + c);
        paramB = new StringBuilder().append("");
        if (e == null) {
          break label334;
        }
        k = e.length;
        label159:
        localHashMap.put("PkgDataSize", k);
        localHashMap.put("RepeatTimes", "" + f);
        paramB = new StringBuilder().append("");
        if (g != null) {
          j = g.length;
        }
        localHashMap.put("HeadDataSize", j);
        localHashMap.put("testPacketRecved", "" + paramInt1);
        localHashMap.put("testPacketSend", "" + paramInt2);
      }
    }
    for (;;)
    {
      d.getStatReporter().a("dim.Msf.NetTestResult", paramBoolean, 0L, paramInt1 + paramInt2, localHashMap, false, false);
      return;
      k = -1;
      break;
      label334:
      k = -1;
      break label159;
      if (paramB != null)
      {
        localHashMap.put("TestType", "MtuTest");
        localHashMap.put("ProtoType", "" + a);
        paramC = new StringBuilder().append("");
        if (b != null) {
          j = b.size();
        }
        localHashMap.put("IpNum", j);
        localHashMap.put("PkgNum", "" + g);
        localHashMap.put("PkgDataSize", b(c));
        localHashMap.put("RepeatTimes", a(d));
        localHashMap.put("HeadDataSize", b(e));
        localHashMap.put("testPacketRecved", "" + paramInt1);
        localHashMap.put("testPacketSend", "" + paramInt2);
      }
    }
  }
  
  private static String b(ArrayList paramArrayList)
  {
    if ((paramArrayList == null) || (paramArrayList.size() <= 0)) {
      localObject = "";
    }
    Iterator localIterator;
    do
    {
      return localObject;
      localIterator = paramArrayList.iterator();
      paramArrayList = "";
      localObject = paramArrayList;
    } while (!localIterator.hasNext());
    Object localObject = (byte[])localIterator.next();
    if (localObject != null) {}
    for (paramArrayList = paramArrayList + localObject.length + ";";; paramArrayList = paramArrayList + "-1;") {
      break;
    }
  }
}
