package com.behance.sdk.logger;

public abstract interface ILogger
{
  public abstract void debug(String paramString, Object... paramVarArgs);
  
  public abstract void debug(Throwable paramThrowable);
  
  public abstract void debug(Throwable paramThrowable, String paramString, Object... paramVarArgs);
  
  public abstract void error(String paramString, Object... paramVarArgs);
  
  public abstract void error(Throwable paramThrowable);
  
  public abstract void error(Throwable paramThrowable, String paramString, Object... paramVarArgs);
  
  public abstract void warn(String paramString, Object... paramVarArgs);
}
