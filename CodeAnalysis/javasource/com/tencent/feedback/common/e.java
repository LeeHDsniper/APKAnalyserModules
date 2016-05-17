package com.tencent.feedback.common;

import android.util.Log;
import com.tencent.feedback.proguard.a;
import java.util.Locale;

public final class e
{
  private static a a = null;
  
  private static a a()
  {
    try
    {
      a localA = a;
      return localA;
    }
    finally
    {
      localObject = finally;
      throw localObject;
    }
  }
  
  public static void a(a paramA)
  {
    try
    {
      a = paramA;
      return;
    }
    finally
    {
      paramA = finally;
      throw paramA;
    }
  }
  
  private static boolean a(int paramInt, String paramString, Object... paramVarArgs)
  {
    a localA = a();
    if (localA == null) {
      return false;
    }
    String str;
    if (paramString == null) {
      str = "null";
    }
    for (;;)
    {
      switch (paramInt)
      {
      default: 
        return false;
      case 0: 
        localA.a(str);
        return true;
        str = paramString;
        if (paramVarArgs != null)
        {
          str = paramString;
          if (paramVarArgs.length != 0) {
            str = String.format(Locale.US, paramString, paramVarArgs);
          }
        }
        break;
      }
    }
    localA.b(str);
    return true;
    localA.c(str);
    return true;
    localA.d(str);
    return true;
  }
  
  private static boolean a(int paramInt, Throwable paramThrowable)
  {
    a localA = a();
    if (localA == null) {
      return false;
    }
    paramThrowable = a.a(paramThrowable);
    switch (paramInt)
    {
    default: 
      return false;
    case 0: 
      localA.a(paramThrowable);
      return true;
    case 1: 
      localA.b(paramThrowable);
      return true;
    case 2: 
      localA.c(paramThrowable);
      return true;
    }
    localA.d(paramThrowable);
    return true;
  }
  
  public static boolean a(String paramString, Object... paramVarArgs)
  {
    return a(0, paramString, paramVarArgs);
  }
  
  public static boolean a(Throwable paramThrowable)
  {
    return a(2, paramThrowable);
  }
  
  public static boolean b(String paramString, Object... paramVarArgs)
  {
    return a(1, paramString, paramVarArgs);
  }
  
  public static boolean b(Throwable paramThrowable)
  {
    return a(3, paramThrowable);
  }
  
  public static boolean c(String paramString, Object... paramVarArgs)
  {
    return a(2, paramString, paramVarArgs);
  }
  
  public static boolean d(String paramString, Object... paramVarArgs)
  {
    return a(3, paramString, paramVarArgs);
  }
  
  public static class a
  {
    public a() {}
    
    public void a(String paramString)
    {
      Log.i("eup", paramString);
    }
    
    public void b(String paramString)
    {
      Log.d("eup", paramString);
    }
    
    public void c(String paramString)
    {
      Log.w("eup", paramString);
    }
    
    public void d(String paramString)
    {
      Log.e("eup", paramString);
    }
  }
}
