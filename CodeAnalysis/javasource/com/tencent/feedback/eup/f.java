package com.tencent.feedback.eup;

import android.content.Context;
import com.tencent.feedback.common.i;
import com.tencent.feedback.proguard.a;
import com.tencent.feedback.proguard.l;
import com.tencent.feedback.proguard.t;
import com.tencent.feedback.proguard.w;
import com.tencent.feedback.upload.AbstractUploadDatas;
import com.tencent.feedback.upload.UploadHandleListener;

public final class f
  extends i
{
  private static f b;
  private CrashStrategyBean c;
  private CrashStrategyBean d;
  private c e;
  private CrashHandleListener f;
  private final boolean g;
  
  private f(Context paramContext, String paramString, boolean paramBoolean, com.tencent.feedback.upload.e paramE, UploadHandleListener paramUploadHandleListener, CrashHandleListener paramCrashHandleListener, CrashStrategyBean paramCrashStrategyBean) {}
  
  public static f a(Context paramContext, String paramString, boolean paramBoolean, com.tencent.feedback.upload.e paramE, UploadHandleListener paramUploadHandleListener, CrashHandleListener paramCrashHandleListener, CrashStrategyBean paramCrashStrategyBean)
  {
    try
    {
      if (b == null)
      {
        com.tencent.feedback.common.e.a("rqdp{  eup create instance}", new Object[0]);
        paramContext = new f(paramContext, paramString, false, paramE, paramUploadHandleListener, paramCrashHandleListener, paramCrashStrategyBean);
        b = paramContext;
        paramContext.a(true);
      }
      paramContext = b;
      return paramContext;
    }
    finally {}
  }
  
  public static com.tencent.feedback.upload.e a(Context paramContext, boolean paramBoolean)
  {
    try
    {
      paramContext = com.tencent.feedback.upload.f.a(paramContext, paramBoolean);
      return paramContext;
    }
    finally
    {
      paramContext = finally;
      throw paramContext;
    }
  }
  
  public static boolean a(Thread paramThread, Throwable paramThrowable, String paramString, byte[] paramArrayOfByte)
  {
    com.tencent.feedback.common.e.a("rqdp{  handleCatchException}", new Object[0]);
    if (!o()) {
      return false;
    }
    Object localObject = l();
    if (localObject == null)
    {
      com.tencent.feedback.common.e.c("rqdp{  instance == null}", new Object[0]);
      return false;
    }
    if (((f)localObject).a()) {}
    for (;;)
    {
      try
      {
        localObject = ((f)localObject).u();
        if (localObject != null) {
          break label122;
        }
        com.tencent.feedback.common.e.c("rqdp{  imposiable chandler null!}", new Object[0]);
        return false;
      }
      catch (Throwable paramThread)
      {
        if (com.tencent.feedback.common.e.a(paramThread)) {
          continue;
        }
        paramThread.printStackTrace();
        com.tencent.feedback.common.e.d("rqdp{  handleCatchException error} %s", new Object[] { paramThread.toString() });
      }
      return ((c)localObject).a(paramThread, paramThrowable, paramString, paramArrayOfByte, false);
      paramThread = paramThread.getName();
      continue;
      return false;
      label122:
      if (paramThread == null) {
        paramThread = null;
      }
    }
  }
  
  public static f l()
  {
    try
    {
      f localF = b;
      return localF;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public static AbstractUploadDatas m()
  {
    AbstractUploadDatas localAbstractUploadDatas = null;
    for (;;)
    {
      try
      {
        boolean bool = o();
        if (!bool) {
          return localAbstractUploadDatas;
        }
        if (b == null)
        {
          com.tencent.feedback.common.e.c("rqdp{  instance == null}", new Object[0]);
          continue;
        }
        if (!b.a()) {
          continue;
        }
      }
      finally {}
      g localG = g.a(ba);
    }
  }
  
  public static boolean n()
  {
    if (!o()) {
      return false;
    }
    com.tencent.feedback.common.e.a("rqdp{  doUploadExceptionDatas}", new Object[0]);
    f localF = l();
    if (localF == null)
    {
      com.tencent.feedback.common.e.c("rqdp{  instance == null}", new Object[0]);
      return false;
    }
    return localF.h();
  }
  
  public static boolean o()
  {
    boolean bool1 = false;
    f localF = l();
    if (localF == null) {
      com.tencent.feedback.common.e.d("rqdp{  not init eup}", new Object[0]);
    }
    do
    {
      boolean bool2;
      do
      {
        return bool1;
        bool2 = localF.a();
        bool1 = bool2;
      } while (!bool2);
      bool1 = bool2;
    } while (!localF.t());
    return localF.b();
  }
  
  private boolean t()
  {
    try
    {
      boolean bool = g;
      return bool;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  private c u()
  {
    try
    {
      c localC = e;
      return localC;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final void a(CrashStrategyBean paramCrashStrategyBean)
  {
    try
    {
      d = paramCrashStrategyBean;
      return;
    }
    finally
    {
      paramCrashStrategyBean = finally;
      throw paramCrashStrategyBean;
    }
  }
  
  /* Error */
  public final void b(boolean paramBoolean)
  {
    // Byte code:
    //   0: aload_0
    //   1: monitorenter
    //   2: aload_0
    //   3: iload_1
    //   4: invokespecial 155	com/tencent/feedback/common/i:b	(Z)V
    //   7: aload_0
    //   8: invokevirtual 104	com/tencent/feedback/eup/f:a	()Z
    //   11: ifeq +13 -> 24
    //   14: aload_0
    //   15: getfield 31	com/tencent/feedback/eup/f:e	Lcom/tencent/feedback/eup/c;
    //   18: invokevirtual 157	com/tencent/feedback/eup/c:a	()V
    //   21: aload_0
    //   22: monitorexit
    //   23: return
    //   24: aload_0
    //   25: getfield 31	com/tencent/feedback/eup/f:e	Lcom/tencent/feedback/eup/c;
    //   28: invokevirtual 159	com/tencent/feedback/eup/c:b	()V
    //   31: goto -10 -> 21
    //   34: astore_2
    //   35: aload_0
    //   36: monitorexit
    //   37: aload_2
    //   38: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	39	0	this	f
    //   0	39	1	paramBoolean	boolean
    //   34	4	2	localObject	Object
    // Exception table:
    //   from	to	target	type
    //   2	21	34	finally
    //   24	31	34	finally
  }
  
  public final void e()
  {
    int i = -1;
    super.e();
    Context localContext = a;
    com.tencent.feedback.common.e.b("rqdp{  EUPDAO.deleteEup() start}", new Object[0]);
    if (localContext == null) {
      com.tencent.feedback.common.e.c("rqdp{  deleteEup() context is null arg}", new Object[0]);
    }
    for (;;)
    {
      com.tencent.feedback.common.e.b("remove fail updata num :%d", new Object[] { Integer.valueOf(i) });
      if (k() == 1) {
        BuglyBroadcastRecevier.brocastProcessLaunch(a);
      }
      return;
      i = l.a(localContext, new int[] { 1, 2 }, -1L, Long.MAX_VALUE, 3, -1);
    }
  }
  
  public final void f()
  {
    int i = -1;
    super.f();
    Context localContext = a;
    com.tencent.feedback.common.e.b("rqdp{  EUPDAO.deleteEup() start}", new Object[0]);
    if (localContext == null) {
      com.tencent.feedback.common.e.c("rqdp{  deleteEup() context is null arg}", new Object[0]);
    }
    for (;;)
    {
      com.tencent.feedback.common.e.b("rqdp{  eup clear} %d ", new Object[] { Integer.valueOf(i) });
      com.tencent.feedback.common.e.b("rqdp{  eup strategy clear} %d ", new Object[] { Integer.valueOf(a.b(a, 510)) });
      return;
      i = l.a(localContext, new int[] { 1, 2 }, -1L, Long.MAX_VALUE, -1, -1);
    }
  }
  
  public final int g()
  {
    int i = 0;
    CrashStrategyBean localCrashStrategyBean = s();
    if ((localCrashStrategyBean != null) && (super.g() >= 0))
    {
      if (!localCrashStrategyBean.isMerged())
      {
        com.tencent.feedback.common.e.b("rqdp{  in no merge}", new Object[0]);
        i = b.b(a);
      }
      do
      {
        return i;
        com.tencent.feedback.common.e.b("rqdp{  in merge}", new Object[0]);
      } while (!b.a(a));
      return 1;
    }
    return -1;
  }
  
  public final boolean h()
  {
    if (super.h())
    {
      g localG = g.a(a);
      com.tencent.feedback.upload.e localE = c();
      if ((localG == null) || (localE == null))
      {
        com.tencent.feedback.common.e.c("rqdp{  upDatas or uphandler null!}", new Object[0]);
        return false;
      }
      try
      {
        localE.a(localG);
        return true;
      }
      catch (Throwable localThrowable)
      {
        if (!com.tencent.feedback.common.e.a(localThrowable)) {
          localThrowable.printStackTrace();
        }
        com.tencent.feedback.common.e.d("rqdp{  upload eupdata error} %s", new Object[] { localThrowable.toString() });
      }
    }
    return false;
  }
  
  public final boolean i()
  {
    return q() != null;
  }
  
  public final CrashStrategyBean p()
  {
    try
    {
      CrashStrategyBean localCrashStrategyBean = c;
      return localCrashStrategyBean;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final CrashStrategyBean q()
  {
    try
    {
      CrashStrategyBean localCrashStrategyBean = d;
      return localCrashStrategyBean;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final CrashHandleListener r()
  {
    try
    {
      CrashHandleListener localCrashHandleListener = f;
      return localCrashHandleListener;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public final CrashStrategyBean s()
  {
    for (;;)
    {
      try
      {
        if (t.a(a).b().f())
        {
          CrashStrategyBean localCrashStrategyBean1 = q();
          CrashStrategyBean localCrashStrategyBean2 = localCrashStrategyBean1;
          if (localCrashStrategyBean1 == null) {
            localCrashStrategyBean2 = p();
          }
          return localCrashStrategyBean2;
        }
      }
      catch (Throwable localThrowable)
      {
        if (!com.tencent.feedback.common.e.a(localThrowable)) {
          localThrowable.printStackTrace();
        }
        return null;
      }
      Object localObject = null;
    }
  }
}
