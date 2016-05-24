package org.apache.http.impl.conn.tsccm;

import java.util.Date;
import java.util.concurrent.locks.Condition;
import org.apache.http.util.Args;

@Deprecated
public class WaitingThread
{
  private boolean aborted;
  private final Condition cond;
  private final RouteSpecificPool pool;
  private Thread waiter;
  
  public WaitingThread(Condition paramCondition, RouteSpecificPool paramRouteSpecificPool)
  {
    Args.notNull(paramCondition, "Condition");
    cond = paramCondition;
    pool = paramRouteSpecificPool;
  }
  
  public boolean await(Date paramDate)
    throws InterruptedException
  {
    if (waiter != null) {
      throw new IllegalStateException("A thread is already waiting on this object.\ncaller: " + Thread.currentThread() + "\nwaiter: " + waiter);
    }
    if (aborted) {
      throw new InterruptedException("Operation interrupted");
    }
    waiter = Thread.currentThread();
    if (paramDate != null) {}
    boolean bool;
    for (;;)
    {
      try
      {
        bool = cond.awaitUntil(paramDate);
        if (!aborted) {
          break;
        }
        throw new InterruptedException("Operation interrupted");
      }
      finally
      {
        waiter = null;
      }
      cond.await();
      bool = true;
    }
    waiter = null;
    return bool;
  }
  
  public final Condition getCondition()
  {
    return cond;
  }
  
  public final RouteSpecificPool getPool()
  {
    return pool;
  }
  
  public final Thread getThread()
  {
    return waiter;
  }
  
  public void interrupt()
  {
    aborted = true;
    cond.signalAll();
  }
  
  public void wakeup()
  {
    if (waiter == null) {
      throw new IllegalStateException("Nobody waiting on this object.");
    }
    cond.signalAll();
  }
}
