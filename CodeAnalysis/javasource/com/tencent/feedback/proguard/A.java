package com.tencent.feedback.proguard;

import android.content.Context;
import com.tencent.feedback.common.c;
import com.tencent.feedback.common.e;
import com.tencent.feedback.upload.AbstractUploadDatas;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public final class A
  extends AbstractUploadDatas
{
  private y d = null;
  private byte e = -1;
  
  public A(Context paramContext, y paramY, byte paramByte)
  {
    super(paramContext, 1111, 520);
    d = paramY;
    e = paramByte;
  }
  
  public static S a(Context paramContext, y paramY, byte paramByte)
  {
    if ((paramY == null) || (paramContext == null)) {
      return null;
    }
    paramContext = c.a(paramContext);
    String str1 = paramContext.E();
    Object localObject1 = paramY.a(str1);
    if ((localObject1 == null) || (localObject1.length <= 0)) {
      return null;
    }
    paramY.a((q[])localObject1);
    paramY = new ArrayList(localObject1.length);
    int j = localObject1.length;
    int i = 0;
    if (i < j)
    {
      Object localObject2 = localObject1[i];
      R localR = new R();
      a = localObject2.a();
      d = localObject2.c();
      c = localObject2.e();
      switch (localObject2.b())
      {
      default: 
        e.c("rqdp{  unknown app state :%d ,drop it}", new Object[] { Integer.valueOf(localObject2.b()) });
      }
      for (;;)
      {
        i += 1;
        break;
        b = 1;
        Iterator localIterator;
        String str2;
        for (;;)
        {
          e = new HashMap();
          if (paramContext.F() >= 0) {
            e.put("C01", paramContext.F());
          }
          if (paramContext.G() >= 0) {
            e.put("C02", paramContext.G());
          }
          if (paramContext.I() <= 0) {
            break;
          }
          localIterator = paramContext.J().iterator();
          while (localIterator.hasNext())
          {
            str2 = (String)localIterator.next();
            e.put("C03_" + str2, paramContext.k(str2));
          }
          b = 2;
          continue;
          b = 3;
          continue;
          b = 4;
        }
        if (paramContext.L() > 0)
        {
          localIterator = paramContext.M().iterator();
          while (localIterator.hasNext())
          {
            str2 = (String)localIterator.next();
            e.put("C04_" + str2, paramContext.l(str2));
          }
        }
        paramY.add(localR);
        e.b("rqdp{  loc st :%s , uid:%s ,  tm:%d , st:%d }", new Object[] { localObject2.c(), localObject2.e(), Long.valueOf(localObject2.a()), Integer.valueOf(localObject2.b()) });
      }
    }
    if (paramY.size() > 0)
    {
      localObject1 = new S();
      b = str1;
      c = paramY;
      a = paramByte;
      d = new HashMap();
      d.put("A7", paramContext.d());
      d.put("A6", paramContext.w());
      d.put("A5", paramContext.v());
      d.put("A2", paramContext.t());
      d.put("A1", paramContext.t());
      d.put("A24", paramContext.f());
      d.put("A17", paramContext.u());
      d.put("A15", paramContext.z());
      d.put("A13", paramContext.C());
      return localObject1;
    }
    return null;
  }
  
  private N e()
  {
    localObject3 = null;
    for (;;)
    {
      try
      {
        localObject1 = a(c, d, e);
        if (localObject1 != null) {
          continue;
        }
        localObject1 = localObject3;
      }
      catch (Throwable localThrowable)
      {
        Object localObject1 = localObject3;
        if (e.a(localThrowable)) {
          continue;
        }
        localThrowable.printStackTrace();
        localObject1 = localObject3;
        continue;
      }
      finally {}
      return localObject1;
      localObject1 = a(c, a, ((S)localObject1).a());
    }
  }
  
  public final N a()
  {
    try
    {
      N localN = e();
      return localN;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final void done(boolean paramBoolean) {}
}
