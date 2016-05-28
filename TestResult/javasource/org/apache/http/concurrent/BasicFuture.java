package org.apache.http.concurrent;

import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import org.apache.http.util.Args;

public class BasicFuture<T>
  implements Future<T>, Cancellable
{
  private final FutureCallback<T> callback;
  private volatile boolean cancelled;
  private volatile boolean completed;
  private volatile Exception ex;
  private volatile T result;
  
  public BasicFuture(FutureCallback<T> paramFutureCallback)
  {
    callback = paramFutureCallback;
  }
  
  private T getResult()
    throws ExecutionException
  {
    if (ex != null) {
      throw new ExecutionException(ex);
    }
    return result;
  }
  
  public boolean cancel()
  {
    return cancel(true);
  }
  
  public boolean cancel(boolean paramBoolean)
  {
    try
    {
      if (completed) {
        return false;
      }
      completed = true;
      cancelled = true;
      notifyAll();
      if (callback != null)
      {
        callback.cancelled();
        return true;
      }
    }
    finally {}
    return true;
  }
  
  public boolean completed(T paramT)
  {
    try
    {
      if (completed) {
        return false;
      }
      completed = true;
      result = paramT;
      notifyAll();
      if (callback != null)
      {
        callback.completed(paramT);
        return true;
      }
    }
    finally {}
    return true;
  }
  
  public boolean failed(Exception paramException)
  {
    try
    {
      if (completed) {
        return false;
      }
      completed = true;
      ex = paramException;
      notifyAll();
      if (callback != null)
      {
        callback.failed(paramException);
        return true;
      }
    }
    finally {}
    return true;
  }
  
  public T get()
    throws InterruptedException, ExecutionException
  {
    try
    {
      while (!completed) {
        wait();
      }
      localObject2 = getResult();
    }
    finally {}
    Object localObject2;
    return localObject2;
  }
  
  public T get(long paramLong, TimeUnit paramTimeUnit)
    throws InterruptedException, ExecutionException, TimeoutException
  {
    long l3;
    long l2;
    long l1;
    try
    {
      Args.notNull(paramTimeUnit, "Time unit");
      l3 = paramTimeUnit.toMillis(paramLong);
      if (l3 <= 0L) {}
      for (paramLong = 0L;; paramLong = System.currentTimeMillis())
      {
        l2 = l3;
        if (!completed) {
          break;
        }
        paramTimeUnit = getResult();
        return paramTimeUnit;
      }
      l1 = l2;
      if (l2 <= 0L) {
        throw new TimeoutException();
      }
    }
    finally {}
    do
    {
      wait(l1);
      if (completed)
      {
        paramTimeUnit = getResult();
        break;
      }
      l2 = l3 - (System.currentTimeMillis() - paramLong);
      l1 = l2;
    } while (l2 > 0L);
    throw new TimeoutException();
  }
  
  public boolean isCancelled()
  {
    return cancelled;
  }
  
  public boolean isDone()
  {
    return completed;
  }
}
