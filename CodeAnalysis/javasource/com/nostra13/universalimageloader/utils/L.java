package com.nostra13.universalimageloader.utils;

import android.util.Log;
import com.nostra13.universalimageloader.core.ImageLoader;

public final class L
{
  private static volatile boolean writeDebugLogs = false;
  private static volatile boolean writeLogs = true;
  
  public static void d(String paramString, Object... paramVarArgs)
  {
    if (writeDebugLogs) {
      log(3, null, paramString, paramVarArgs);
    }
  }
  
  public static void e(String paramString, Object... paramVarArgs)
  {
    log(6, null, paramString, paramVarArgs);
  }
  
  public static void e(Throwable paramThrowable)
  {
    log(6, paramThrowable, null, new Object[0]);
  }
  
  public static void i(String paramString, Object... paramVarArgs)
  {
    log(4, null, paramString, paramVarArgs);
  }
  
  private static void log(int paramInt, Throwable paramThrowable, String paramString, Object... paramVarArgs)
  {
    if (!writeLogs) {
      return;
    }
    String str = paramString;
    if (paramVarArgs.length > 0) {
      str = String.format(paramString, paramVarArgs);
    }
    if (paramThrowable == null)
    {
      Log.println(paramInt, ImageLoader.TAG, str);
      return;
    }
    if (str == null) {}
    for (paramString = paramThrowable.getMessage();; paramString = str)
    {
      str = String.format("%1$s\n%2$s", new Object[] { paramString, Log.getStackTraceString(paramThrowable) });
      break;
    }
  }
  
  public static void w(String paramString, Object... paramVarArgs)
  {
    log(5, null, paramString, paramVarArgs);
  }
  
  public static void writeDebugLogs(boolean paramBoolean)
  {
    writeDebugLogs = paramBoolean;
  }
}
