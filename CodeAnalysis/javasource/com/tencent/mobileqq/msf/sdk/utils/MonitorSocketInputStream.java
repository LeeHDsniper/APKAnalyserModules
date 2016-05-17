package com.tencent.mobileqq.msf.sdk.utils;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import com.tencent.mobileqq.msf.core.NetConnInfoCenterImpl;
import com.tencent.mobileqq.msf.core.net.c.c;
import com.tencent.mobileqq.msf.core.net.g;
import com.tencent.mobileqq.msf.sdk.k;
import com.tencent.qphone.base.util.BaseApplication;
import com.tencent.qphone.base.util.QLog;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.concurrent.ConcurrentHashMap;

public class MonitorSocketInputStream
  extends InputStream
{
  private Context context;
  private InputStream mInputStream;
  private b monitorSocketImpl;
  
  public MonitorSocketInputStream(InputStream paramInputStream, b paramB, Context paramContext)
  {
    mInputStream = paramInputStream;
    monitorSocketImpl = paramB;
    context = paramContext;
  }
  
  public void close()
    throws IOException
  {
    mInputStream.close();
  }
  
  public int hashCode()
  {
    return mInputStream.hashCode();
  }
  
  public int read()
    throws IOException
  {
    return mInputStream.read();
  }
  
  public int read(byte[] paramArrayOfByte)
    throws IOException
  {
    return read(paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  public int read(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    int i = 2;
    paramInt2 = mInputStream.read(paramArrayOfByte, paramInt1, paramInt2);
    if (MonitorSocketImplFactory.isServerSocket(toString())) {
      return paramInt2;
    }
    try
    {
      paramInt1 = NetConnInfoCenterImpl.getSystemNetworkType();
      if (paramInt1 != 0) {
        break label1200;
      }
      paramArrayOfByte = ((ConnectivityManager)BaseApplication.getContext().getSystemService("connectivity")).getActiveNetworkInfo();
      if (paramArrayOfByte == null) {
        break label1200;
      }
      paramInt1 = paramArrayOfByte.getType();
      if (paramInt1 == 1) {
        paramInt1 = i;
      } else if (MonitorSocketImplFactory.isNetworkTypeMobile(paramInt1) == true) {
        paramInt1 = 1;
      }
    }
    catch (Exception paramArrayOfByte)
    {
      do
      {
        for (;;)
        {
          a localA;
          QLog.d("MSF.D.MonitorSocket", 1, "analyze netflow failed.", paramArrayOfByte);
          break;
          if ((monitorSocketImpl.g != null) && (!monitorSocketImpl.g.equals(b.h)))
          {
            paramArrayOfByte = (a)monitorSocketImpl.i.get(Integer.valueOf(monitorSocketImpl.c.hashCode()));
            if (paramArrayOfByte == null) {
              localA = new a(monitorSocketImpl.a, null, monitorSocketImpl.b, 1, paramInt2, paramInt1);
            }
            for (h = monitorSocketImpl.g;; h = monitorSocketImpl.g)
            {
              i = MonitorSocketStat.STATUS;
              paramArrayOfByte = localA;
              if (monitorSocketImpl.g.equals("qzone_video_player")) {
                break;
              }
              paramArrayOfByte = localA;
              if (!QLog.isColorLevel()) {
                break;
              }
              QLog.d("MSF.D.MonitorSocket", 2, "|" + monitorSocketImpl.c + "|read|" + paramInt2 + "|" + paramInt1 + "|" + h + "|" + MonitorSocketStat.STATUS);
              paramArrayOfByte = localA;
              break;
              localA = paramArrayOfByte.a(paramInt2);
            }
          }
          if (g.n.contains(toString()))
          {
            if (QLog.isColorLevel())
            {
              QLog.d("MSF.D.MonitorSocket", 2, "|" + monitorSocketImpl.c + "|read|" + paramInt2 + "|" + paramInt1 + "|MSF Signal" + "|" + MonitorSocketStat.STATUS);
              paramArrayOfByte = null;
            }
          }
          else
          {
            if (c.f.contains(toString()))
            {
              localA = new a(monitorSocketImpl.a, null, monitorSocketImpl.b, 1, paramInt2, paramInt1);
              h = "QualityTest";
              i = MonitorSocketStat.STATUS;
              paramArrayOfByte = localA;
              if (!QLog.isColorLevel()) {
                continue;
              }
              QLog.d("MSF.D.MonitorSocket", 2, "|" + monitorSocketImpl.c + "|read|" + paramInt2 + "|" + paramInt1 + "|" + "QualityTest.PushList" + "|" + MonitorSocketStat.STATUS);
              paramArrayOfByte = localA;
              continue;
            }
            if (BaseApplication.exclusiveStreamList.contains(toString()))
            {
              if (QLog.isColorLevel())
              {
                QLog.d("MSF.D.MonitorSocket", 2, "|" + monitorSocketImpl.c + "|read|" + paramInt2 + "|" + paramInt1 + "|BigData" + "|" + MonitorSocketStat.STATUS);
                paramArrayOfByte = null;
              }
            }
            else
            {
              localA = new a(monitorSocketImpl.a, null, monitorSocketImpl.b, 1, paramInt2, paramInt1);
              i = MonitorSocketStat.STATUS;
              i = monitorSocketImpl.d.indexOf("tencent.");
              if (i > -1)
              {
                i += 8;
                h = monitorSocketImpl.d.substring(i, monitorSocketImpl.d.indexOf(".", i));
              }
              for (;;)
              {
                paramArrayOfByte = localA;
                if (!QLog.isColorLevel()) {
                  break;
                }
                QLog.d("MSF.D.MonitorSocket", 2, "|" + monitorSocketImpl.d + monitorSocketImpl.c + "|read|" + paramInt2 + "|" + paramInt1 + "|" + h + "|" + MonitorSocketStat.STATUS);
                paramArrayOfByte = localA;
                break;
                if (monitorSocketImpl.d.indexOf("_") > 0) {
                  h = monitorSocketImpl.d.substring(0, monitorSocketImpl.d.indexOf("_"));
                } else {
                  h = "unknown";
                }
              }
            }
          }
          paramArrayOfByte = null;
        }
      } while (paramInt2 != -1);
      return paramInt2;
    }
    if ((monitorSocketImpl.g != null) && (monitorSocketImpl.g.equals(b.h)))
    {
      localA = (a)monitorSocketImpl.i.get(Integer.valueOf(monitorSocketImpl.c.hashCode()));
      if (localA == null)
      {
        localA = new a(monitorSocketImpl.a, null, monitorSocketImpl.b, 1, paramInt2, paramInt1);
        i = MonitorSocketStat.STATUS;
        h = b.h;
        monitorSocketImpl.i.put(Integer.valueOf(monitorSocketImpl.c.hashCode()), localA);
      }
      for (;;)
      {
        paramArrayOfByte = localA;
        if (QLog.isColorLevel())
        {
          QLog.d("MSF.D.MonitorSocket", 2, "|" + monitorSocketImpl.d + monitorSocketImpl.c + "|read|" + paramInt2 + "|" + paramInt1 + "|" + h + "|" + MonitorSocketStat.STATUS);
          paramArrayOfByte = localA;
        }
        if ((paramArrayOfByte == null) || (h.equals(b.h))) {
          break;
        }
        MonitorSocketStat.dataFlow.add(paramArrayOfByte);
        monitorSocketImpl.i.clear();
        break;
        monitorSocketImpl.i.put(Integer.valueOf(monitorSocketImpl.c.hashCode()), localA.a(paramInt2));
      }
    }
    label1200:
    return paramInt2;
  }
}
