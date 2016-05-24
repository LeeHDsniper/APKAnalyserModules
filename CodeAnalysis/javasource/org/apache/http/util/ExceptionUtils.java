package org.apache.http.util;

import java.lang.reflect.Method;

@Deprecated
public final class ExceptionUtils
{
  private static final Method INIT_CAUSE_METHOD = ;
  
  private ExceptionUtils() {}
  
  private static Method getInitCauseMethod()
  {
    try
    {
      Method localMethod = Throwable.class.getMethod("initCause", new Class[] { Throwable.class });
      return localMethod;
    }
    catch (NoSuchMethodException localNoSuchMethodException) {}
    return null;
  }
  
  public static void initCause(Throwable paramThrowable1, Throwable paramThrowable2)
  {
    if (INIT_CAUSE_METHOD != null) {}
    try
    {
      INIT_CAUSE_METHOD.invoke(paramThrowable1, new Object[] { paramThrowable2 });
      return;
    }
    catch (Exception paramThrowable1) {}
  }
}
