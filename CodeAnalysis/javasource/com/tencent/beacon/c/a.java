package com.tencent.beacon.c;

import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public final class a<T>
{
  private Lock a = new ReentrantLock();
  private Condition b = a.newCondition();
  private volatile T c;
  
  public a() {}
  
  public final T a()
    throws InterruptedException
  {
    a.lock();
    try
    {
      while (c == null) {
        b.await();
      }
      localObject2 = c;
    }
    finally
    {
      a.unlock();
    }
    Object localObject2;
    a.unlock();
    return localObject2;
  }
  
  public final void a(T paramT)
  {
    a.lock();
    try
    {
      c = paramT;
      if (paramT != null) {
        b.signal();
      }
      return;
    }
    finally
    {
      a.unlock();
    }
  }
  
  public final T b()
  {
    return c;
  }
}
