package com.tencent.feedback.proguard;

import android.content.Context;
import com.tencent.feedback.common.e;
import com.tencent.feedback.upload.d;
import java.util.Map;

public final class r
  implements d
{
  private Context a = null;
  
  public r(Context paramContext)
  {
    a = paramContext;
  }
  
  private static boolean a(Q paramQ, w paramW)
  {
    if ((paramQ == null) || (paramW == null) || (b == null))
    {
      bool1 = false;
      return bool1;
    }
    String str = (String)b.get("B17");
    if (str != null) {
      if (str.equals("1"))
      {
        bool1 = true;
        label52:
        if (bool1 == paramW.f()) {
          break label433;
        }
        e.b("rqdp{  useStrategy changed to} %b", new Object[] { Boolean.valueOf(bool1) });
        paramW.a(bool1);
      }
    }
    boolean bool2;
    label133:
    boolean bool3;
    label390:
    label412:
    label433:
    for (boolean bool1 = true;; bool1 = false)
    {
      if ((a != null) && (!a.equals(paramW.a())))
      {
        e.b("rqdp{  url changed to} %s", new Object[] { a });
        paramW.a(a);
        bool2 = true;
        str = (String)b.get("B18");
        bool1 = bool2;
        if (str == null) {}
      }
      for (;;)
      {
        int i;
        try
        {
          i = Integer.parseInt(str);
          bool1 = bool2;
          if (i != paramW.b()) {
            e.b("rqdp{  upStrategy changed to} %d", new Object[] { Integer.valueOf(i) });
          }
        }
        catch (Exception localException1) {}
        try
        {
          paramW.a(i);
          bool1 = true;
          str = (String)b.get("B19");
          bool2 = bool1;
          if (str == null) {}
        }
        catch (Exception localException4)
        {
          for (;;)
          {
            bool2 = true;
          }
        }
        try
        {
          i = Integer.parseInt(str);
          bool2 = bool1;
          if (i != paramW.c()) {
            e.b("rqdp{  QueryPeriod changed to} %d", new Object[] { Integer.valueOf(i) });
          }
        }
        catch (Exception localException2)
        {
          bool2 = bool1;
          if (e.a(localException2)) {
            continue;
          }
          localException2.printStackTrace();
          bool2 = bool1;
          continue;
          bool3 = true;
          continue;
        }
        try
        {
          paramW.b(i);
          bool2 = true;
          paramQ = (String)b.get("B20");
          bool1 = bool2;
          if (paramQ == null) {
            break;
          }
          if (!paramQ.equals("0")) {
            break label412;
          }
          bool3 = false;
          bool1 = bool2;
          if (bool3 == paramW.g()) {
            break;
          }
          e.b("rqdp{  enforceQuery changed to} %b", new Object[] { Boolean.valueOf(bool3) });
          paramW.b(bool3);
          return true;
        }
        catch (Exception localException3)
        {
          bool1 = true;
          break label390;
        }
        bool1 = false;
        break label52;
        e.b("rqdp{  url same to} %s", new Object[] { a });
        bool2 = bool1;
        break label133;
        bool1 = bool2;
        if (!e.a(localException1))
        {
          localException1.printStackTrace();
          bool1 = bool2;
        }
      }
    }
  }
  
  public final void a(int paramInt, byte[] paramArrayOfByte, boolean paramBoolean)
  {
    if (paramInt != 510) {
      e.c("rqdp{  com strategy unmatch key:}%d", new Object[] { Integer.valueOf(paramInt) });
    }
    for (;;)
    {
      return;
      if (paramArrayOfByte != null)
      {
        w localW = t.a(a).b();
        if (localW == null)
        {
          e.c("rqdp{  imposible! common strategy null!}", new Object[0]);
          return;
        }
        try
        {
          Q localQ = a.d(paramArrayOfByte);
          localQ.a(new h(paramArrayOfByte));
          if (a(localQ, localW))
          {
            if (paramBoolean)
            {
              e.b("rqdp{  update common strategy should save}", new Object[0]);
              a.a(a, paramInt, paramArrayOfByte);
            }
            e.b("rqdp{  com strategy changed notify!}", new Object[0]);
            t.a(a).a(localW);
            return;
          }
        }
        catch (Throwable paramArrayOfByte)
        {
          if (!e.a(paramArrayOfByte)) {
            paramArrayOfByte.printStackTrace();
          }
          e.d("rqdp{  error to common strategy!}", new Object[0]);
        }
      }
    }
  }
}
