package com.behance.sdk.logger;

import android.util.Log;

public class Logger
  implements ILogger
{
  private boolean DEBUG;
  private boolean ERROR;
  private boolean INFO;
  private int LOG_LEVEL = 2;
  private boolean WARN;
  private boolean WTF;
  private String tag;
  
  public Logger(Class paramClass)
  {
    if (LOG_LEVEL > 0)
    {
      bool1 = true;
      WTF = bool1;
      if (LOG_LEVEL <= 1) {
        break label99;
      }
      bool1 = true;
      label35:
      ERROR = bool1;
      if (LOG_LEVEL <= 2) {
        break label104;
      }
      bool1 = true;
      label50:
      WARN = bool1;
      if (LOG_LEVEL <= 3) {
        break label109;
      }
      bool1 = true;
      label65:
      INFO = bool1;
      if (LOG_LEVEL <= 4) {
        break label114;
      }
    }
    label99:
    label104:
    label109:
    label114:
    for (boolean bool1 = bool2;; bool1 = false)
    {
      DEBUG = bool1;
      tag = paramClass.getSimpleName();
      return;
      bool1 = false;
      break;
      bool1 = false;
      break label35;
      bool1 = false;
      break label50;
      bool1 = false;
      break label65;
    }
  }
  
  private String getFormattedMessage(String paramString, Object... paramVarArgs)
  {
    String str = paramString;
    try
    {
      if (paramVarArgs.length > 0) {
        str = String.format(paramString, paramVarArgs);
      }
      return str;
    }
    catch (Exception paramString)
    {
      error(paramString);
    }
    return "";
  }
  
  public void debug(String paramString, Object... paramVarArgs)
  {
    if (DEBUG) {
      Log.d(tag, getFormattedMessage(paramString, paramVarArgs));
    }
  }
  
  public void debug(Throwable paramThrowable)
  {
    if (DEBUG) {
      Log.d(tag, paramThrowable.getMessage(), paramThrowable);
    }
  }
  
  public void debug(Throwable paramThrowable, String paramString, Object... paramVarArgs)
  {
    if (DEBUG) {
      Log.d(tag, getFormattedMessage(paramString, paramVarArgs), paramThrowable);
    }
  }
  
  public void error(String paramString, Object... paramVarArgs)
  {
    if (ERROR) {
      Log.e(tag, getFormattedMessage(paramString, paramVarArgs));
    }
  }
  
  public void error(Throwable paramThrowable)
  {
    if (ERROR) {
      Log.e(tag, paramThrowable.getMessage(), paramThrowable);
    }
  }
  
  public void error(Throwable paramThrowable, String paramString, Object... paramVarArgs)
  {
    if (ERROR) {
      Log.e(tag, getFormattedMessage(paramString, paramVarArgs), paramThrowable);
    }
  }
  
  public void warn(String paramString, Object... paramVarArgs)
  {
    if (WARN) {
      Log.w(tag, getFormattedMessage(paramString, paramVarArgs));
    }
  }
}
