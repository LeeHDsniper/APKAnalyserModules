package com.adobe.creativesdk.aviary.log;

import android.util.Log;

public final class LoggerFactory
{
  private LoggerFactory() {}
  
  public static Logger getLogger(String paramString)
  {
    return getLogger(paramString, LoggerType.ConsoleLoggerType);
  }
  
  public static Logger getLogger(String paramString, LoggerType paramLoggerType)
  {
    if (paramLoggerType == LoggerType.ConsoleLoggerType) {
      return new ConsoleLogger(paramString);
    }
    return new NullLogger(paramString);
  }
  
  public static void printDeveloperError(String paramString)
  {
    StringBuffer localStringBuffer = new StringBuffer();
    localStringBuffer.append(" \n");
    localStringBuffer.append("==================================================\n");
    localStringBuffer.append("==================================================\n");
    localStringBuffer.append(paramString);
    localStringBuffer.append("\n");
    localStringBuffer.append("==================================================\n");
    localStringBuffer.append("==================================================\n");
    Log.e("Aviary-SDK", localStringBuffer.toString());
  }
  
  static abstract class BaseLogger
    implements LoggerFactory.Logger
  {
    String tag;
    
    public BaseLogger(String paramString)
    {
      tag = paramString;
    }
  }
  
  static class ConsoleLogger
    extends LoggerFactory.BaseLogger
  {
    public ConsoleLogger(String paramString)
    {
      super();
    }
    
    public void error(String paramString)
    {
      Log.e(tag, paramString);
    }
    
    public void error(String paramString, Object... paramVarArgs)
    {
      Log.e(tag, String.format(paramString, paramVarArgs));
    }
    
    public void info(String paramString)
    {
      Log.i(tag, paramString);
    }
    
    public void info(String paramString, Object... paramVarArgs)
    {
      Log.i(tag, String.format(paramString, paramVarArgs));
    }
    
    public void log(String paramString)
    {
      Log.d(tag, paramString);
    }
    
    public void log(String paramString, Object... paramVarArgs)
    {
      Log.d(tag, String.format(paramString, paramVarArgs));
    }
    
    public void verbose(String paramString, Object... paramVarArgs)
    {
      Log.v(tag, String.format(paramString, paramVarArgs));
    }
    
    public void warn(String paramString)
    {
      Log.w(tag, paramString);
    }
    
    public void warn(String paramString, Object... paramVarArgs)
    {
      Log.w(tag, String.format(paramString, paramVarArgs));
    }
  }
  
  public static abstract interface Logger
  {
    public abstract void error(String paramString);
    
    public abstract void error(String paramString, Object... paramVarArgs);
    
    public abstract void info(String paramString);
    
    public abstract void info(String paramString, Object... paramVarArgs);
    
    public abstract void log(String paramString);
    
    public abstract void log(String paramString, Object... paramVarArgs);
    
    public abstract void verbose(String paramString, Object... paramVarArgs);
    
    public abstract void warn(String paramString);
    
    public abstract void warn(String paramString, Object... paramVarArgs);
  }
  
  public static enum LoggerType
  {
    ConsoleLoggerType;
    
    private LoggerType() {}
  }
  
  static class NullLogger
    extends LoggerFactory.BaseLogger
  {
    public NullLogger(String paramString)
    {
      super();
    }
    
    public void error(String paramString) {}
    
    public void error(String paramString, Object... paramVarArgs) {}
    
    public void info(String paramString) {}
    
    public void info(String paramString, Object... paramVarArgs) {}
    
    public void log(String paramString) {}
    
    public void log(String paramString, Object... paramVarArgs) {}
    
    public void verbose(String paramString, Object... paramVarArgs) {}
    
    public void warn(String paramString) {}
    
    public void warn(String paramString, Object... paramVarArgs) {}
  }
}
