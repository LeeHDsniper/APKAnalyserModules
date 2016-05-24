package org.apache.http.concurrent;

public abstract interface FutureCallback<T>
{
  public abstract void cancelled();
  
  public abstract void completed(T paramT);
  
  public abstract void failed(Exception paramException);
}
