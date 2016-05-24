package com.squareup.okhttp.internal;

public abstract class NamedRunnable
  implements Runnable
{
  private final String name;
  
  public NamedRunnable(String paramString, Object... paramVarArgs)
  {
    name = String.format(paramString, paramVarArgs);
  }
  
  protected abstract void execute();
  
  public final void run()
  {
    String str = Thread.currentThread().getName();
    Thread.currentThread().setName(name);
    try
    {
      execute();
      return;
    }
    finally
    {
      Thread.currentThread().setName(str);
    }
  }
}
