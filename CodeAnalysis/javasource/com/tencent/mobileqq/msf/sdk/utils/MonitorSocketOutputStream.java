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
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.concurrent.ConcurrentHashMap;

public class MonitorSocketOutputStream
  extends OutputStream
{
  private Context context;
  private OutputStream mOutputStream;
  private b monitorSocketImpl;
  
  public MonitorSocketOutputStream(OutputStream paramOutputStream, b paramB, Context paramContext)
  {
    mOutputStream = paramOutputStream;
    monitorSocketImpl = paramB;
    context = paramContext;
  }
  
  public static String getMType(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    String str1 = b.h;
    int i = paramInt1;
    int j = paramInt1;
    if ((i >= paramInt2 + paramInt1) || (i + 1 == paramInt2)) {}
    String str2;
    label100:
    do
    {
      return str1;
      int k = j;
      if (paramArrayOfByte[i] == 13)
      {
        k = j;
        if (paramArrayOfByte[(i + 1)] == 10)
        {
          str2 = new String(paramArrayOfByte, j, i - j);
          j = str2.indexOf("mType=");
          if (j != -1) {
            break label100;
          }
          k = i + 2;
        }
      }
      i += 1;
      j = k;
      break;
      paramInt1 = str2.indexOf("&", j + 6);
      if (paramInt1 != -1) {
        break label148;
      }
      paramInt1 = str2.indexOf(" ", j + 6);
    } while (paramInt1 == -1);
    return str2.substring(j + 6, paramInt1);
    label148:
    return str2.substring(j + 6, paramInt1);
  }
  
  public static String getRefer(byte[] paramArrayOfByte, int paramInt)
  {
    int i = paramInt;
    Object localObject1;
    if (i < paramArrayOfByte.length) {
      if ((paramArrayOfByte[i] == 13) && (paramArrayOfByte[(i + 1)] == 10))
      {
        localObject1 = new String(paramArrayOfByte, paramInt, i - paramInt).trim().split(" ");
        if (localObject1.length == 2) {
          localObject1 = localObject1[0];
        }
      }
    }
    for (;;)
    {
      Object localObject2 = localObject1;
      if (localObject1 == null)
      {
        i = paramArrayOfByte.length - 1;
        for (;;)
        {
          localObject2 = localObject1;
          if (i < paramInt) {
            break;
          }
          if (paramArrayOfByte[i] == 32)
          {
            localObject1 = new String(paramArrayOfByte, paramInt, i - paramInt);
            localObject2 = ((String)localObject1).trim().split(" ");
            if (localObject2.length == 2) {
              localObject1 = localObject2[0];
            }
          }
          i -= 1;
        }
        localObject1 = "";
        continue;
        i += 1;
        break;
      }
      localObject1 = localObject2;
      if (localObject2 == null) {
        localObject1 = new String(paramArrayOfByte, paramInt, paramArrayOfByte.length - paramInt);
      }
      paramArrayOfByte = (byte[])localObject1;
      if (((String)localObject1).length() > 42) {
        paramArrayOfByte = ((String)localObject1).substring(0, 41);
      }
      return paramArrayOfByte;
      localObject1 = null;
    }
  }
  
  public void close()
    throws IOException
  {
    mOutputStream.close();
  }
  
  public void flush()
    throws IOException
  {
    mOutputStream.flush();
  }
  
  public int hashCode()
  {
    return mOutputStream.hashCode();
  }
  
  public void write(int paramInt)
    throws IOException
  {
    mOutputStream.write(paramInt);
  }
  
  public void write(byte[] paramArrayOfByte)
    throws IOException
  {
    write(paramArrayOfByte, 0, paramArrayOfByte.length);
  }
  
  public void write(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
    throws IOException
  {
    int i = 2;
    mOutputStream.write(paramArrayOfByte, paramInt1, paramInt2);
    if (MonitorSocketImplFactory.isServerSocket(toString())) {
      return;
    }
    for (;;)
    {
      int j;
      Object localObject2;
      try
      {
        j = NetConnInfoCenterImpl.getSystemNetworkType();
        if (j != 0) {
          break label1733;
        }
        localObject1 = ((ConnectivityManager)BaseApplication.getContext().getSystemService("connectivity")).getActiveNetworkInfo();
        if (localObject1 == null) {
          break label1733;
        }
        j = ((NetworkInfo)localObject1).getType();
        if (j == 1)
        {
          localObject1 = new byte[4];
          System.arraycopy(paramArrayOfByte, 0, localObject1, 0, localObject1.length);
          if (!new String((byte[])localObject1).equals("POST")) {
            break label481;
          }
          localObject2 = getRefer(paramArrayOfByte, 5);
          monitorSocketImpl.g = getMType(paramArrayOfByte, paramInt1, paramInt2);
          localObject1 = "http://" + monitorSocketImpl.a + ":" + monitorSocketImpl.b + (String)localObject2;
          paramArrayOfByte = (byte[])localObject2;
          if ((monitorSocketImpl.g == null) || (!monitorSocketImpl.g.equals(b.h))) {
            break label900;
          }
          localObject2 = (a)monitorSocketImpl.j.get(Integer.valueOf(monitorSocketImpl.c.hashCode()));
          if (localObject2 != null) {
            break label858;
          }
          localObject2 = new a(monitorSocketImpl.a, paramArrayOfByte, monitorSocketImpl.b, 0, paramInt2, i);
          i = MonitorSocketStat.STATUS;
          if ((!monitorSocketImpl.d.contains("beacon")) && (!monitorSocketImpl.d.contains("feedback"))) {
            break label618;
          }
          monitorSocketImpl.g = "beacon";
          h = monitorSocketImpl.g;
          paramArrayOfByte = (byte[])localObject2;
          if (QLog.isColorLevel())
          {
            QLog.d("MSF.D.MonitorSocket", 2, "|" + monitorSocketImpl.d + monitorSocketImpl.c + (String)localObject1 + "|write|" + paramInt2 + "|" + i + "|" + h + "|" + MonitorSocketStat.STATUS);
            paramArrayOfByte = (byte[])localObject2;
          }
          if ((paramArrayOfByte == null) || (h.equals(b.h))) {
            break;
          }
          MonitorSocketStat.dataFlow.add(paramArrayOfByte);
          monitorSocketImpl.j.clear();
          return;
        }
      }
      catch (Exception paramArrayOfByte)
      {
        QLog.d("MSF.D.MonitorSocket", 1, "analyze netflow failed.", paramArrayOfByte);
        return;
      }
      if (MonitorSocketImplFactory.isNetworkTypeMobile(j) == true)
      {
        i = 1;
        continue;
        label481:
        if (new String((byte[])localObject1).equals("GET "))
        {
          localObject1 = getRefer(paramArrayOfByte, 4);
          monitorSocketImpl.g = getMType(paramArrayOfByte, paramInt1, paramInt2);
          localObject2 = "http://" + monitorSocketImpl.a + ":" + monitorSocketImpl.b + (String)localObject1;
          paramArrayOfByte = (byte[])localObject1;
          localObject1 = localObject2;
          continue;
        }
        if ((monitorSocketImpl.g != null) && (monitorSocketImpl.g.equals(b.h)))
        {
          monitorSocketImpl.g = getMType(paramArrayOfByte, paramInt1, paramInt2);
          break label1740;
          label618:
          if (monitorSocketImpl.d.contains("map"))
          {
            monitorSocketImpl.g = "Map";
            h = monitorSocketImpl.g;
            continue;
          }
          if ((monitorSocketImpl.d.toLowerCase().contains("tmassistant")) || (monitorSocketImpl.d.contains("apkupdate")))
          {
            monitorSocketImpl.g = "yingyongbao";
            h = monitorSocketImpl.g;
            continue;
          }
          if (monitorSocketImpl.d.contains("smtt"))
          {
            monitorSocketImpl.g = "Web";
            h = monitorSocketImpl.g;
            continue;
          }
          if ((monitorSocketImpl.d.contains("biz")) || (monitorSocketImpl.d.contains("troop")))
          {
            monitorSocketImpl.g = "AppDepart";
            h = monitorSocketImpl.g;
            continue;
          }
          h = monitorSocketImpl.g;
          monitorSocketImpl.j.put(Integer.valueOf(monitorSocketImpl.c.hashCode()), localObject2);
          continue;
          label858:
          i = MonitorSocketStat.STATUS;
          monitorSocketImpl.j.put(Integer.valueOf(monitorSocketImpl.c.hashCode()), ((a)localObject2).a(paramInt2));
          continue;
          label900:
          if ((monitorSocketImpl.g != null) && (!monitorSocketImpl.g.equals(b.h)))
          {
            localObject2 = (a)monitorSocketImpl.j.get(Integer.valueOf(monitorSocketImpl.c.hashCode()));
            if (localObject2 == null) {
              localObject2 = new a(monitorSocketImpl.a, paramArrayOfByte, monitorSocketImpl.b, 0, paramInt2, i);
            }
            for (h = monitorSocketImpl.g;; h = monitorSocketImpl.g)
            {
              i = MonitorSocketStat.STATUS;
              paramArrayOfByte = (byte[])localObject2;
              if (monitorSocketImpl.g.equals("qzone_video_player")) {
                break;
              }
              paramArrayOfByte = (byte[])localObject2;
              if (!QLog.isColorLevel()) {
                break;
              }
              QLog.d("MSF.D.MonitorSocket", 2, "|" + monitorSocketImpl.c + (String)localObject1 + "|write|" + paramInt2 + "|" + i + "|" + h + "|" + MonitorSocketStat.STATUS);
              paramArrayOfByte = (byte[])localObject2;
              break;
              localObject2 = ((a)localObject2).a(paramInt2);
            }
          }
          if (g.n.contains(toString()))
          {
            if (QLog.isColorLevel())
            {
              QLog.d("MSF.D.MonitorSocket", 2, "|" + monitorSocketImpl.c + "|write|" + paramInt2 + "|" + i + "|MSF Signal" + "|" + MonitorSocketStat.STATUS);
              paramArrayOfByte = null;
            }
          }
          else
          {
            if (c.g.contains(toString()))
            {
              localObject1 = new a(monitorSocketImpl.a, null, monitorSocketImpl.b, 0, paramInt2, i);
              h = "QualityTest";
              i = MonitorSocketStat.STATUS;
              paramArrayOfByte = (byte[])localObject1;
              if (!QLog.isColorLevel()) {
                continue;
              }
              QLog.d("MSF.D.MonitorSocket", 2, "|" + monitorSocketImpl.c + "|write|" + paramInt2 + "|" + i + "|" + "QualityTest.PushList" + "|" + MonitorSocketStat.STATUS);
              paramArrayOfByte = (byte[])localObject1;
              continue;
            }
            if (BaseApplication.exclusiveStreamList.contains(toString()))
            {
              if (QLog.isColorLevel())
              {
                QLog.d("MSF.D.MonitorSocket", 2, "|" + monitorSocketImpl.c + "|write|" + paramInt2 + "|" + i + "|BigData" + "|" + MonitorSocketStat.STATUS);
                paramArrayOfByte = null;
              }
            }
            else
            {
              localObject1 = new a(monitorSocketImpl.a, null, monitorSocketImpl.b, 0, paramInt2, i);
              i = MonitorSocketStat.STATUS;
              paramInt1 = monitorSocketImpl.d.indexOf("tencent.");
              if (paramInt1 > -1)
              {
                paramInt1 += 8;
                h = monitorSocketImpl.d.substring(paramInt1, monitorSocketImpl.d.indexOf(".", paramInt1));
              }
              for (;;)
              {
                paramArrayOfByte = (byte[])localObject1;
                if (!QLog.isColorLevel()) {
                  break;
                }
                QLog.d("MSF.D.MonitorSocket", 2, "|" + monitorSocketImpl.d + monitorSocketImpl.c + "|write|" + paramInt2 + "|" + i + "|" + h + "|" + MonitorSocketStat.STATUS);
                paramArrayOfByte = (byte[])localObject1;
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
          continue;
        }
      }
      else
      {
        i = j;
        continue;
        label1733:
        i = j;
        continue;
      }
      label1740:
      Object localObject1 = "";
      paramArrayOfByte = null;
    }
  }
}
