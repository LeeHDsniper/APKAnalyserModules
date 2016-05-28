package org.apache.http.pool;

import java.io.IOException;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import org.apache.http.annotation.ThreadSafe;
import org.apache.http.concurrent.FutureCallback;
import org.apache.http.util.Args;
import org.apache.http.util.Asserts;

@ThreadSafe
public abstract class AbstractConnPool<T, C, E extends PoolEntry<T, C>>
  implements ConnPool<T, E>, ConnPoolControl<T>
{
  private final LinkedList<E> available;
  private final ConnFactory<T, C> connFactory;
  private volatile int defaultMaxPerRoute;
  private volatile boolean isShutDown;
  private final Set<E> leased;
  private final Lock lock;
  private final Map<T, Integer> maxPerRoute;
  private volatile int maxTotal;
  private final LinkedList<PoolEntryFuture<E>> pending;
  private final Map<T, RouteSpecificPool<T, C, E>> routeToPool;
  
  public AbstractConnPool(ConnFactory<T, C> paramConnFactory, int paramInt1, int paramInt2)
  {
    connFactory = ((ConnFactory)Args.notNull(paramConnFactory, "Connection factory"));
    defaultMaxPerRoute = Args.notNegative(paramInt1, "Max per route value");
    maxTotal = Args.notNegative(paramInt2, "Max total value");
    lock = new ReentrantLock();
    routeToPool = new HashMap();
    leased = new HashSet();
    available = new LinkedList();
    pending = new LinkedList();
    maxPerRoute = new HashMap();
  }
  
  private void enumEntries(Iterator<E> paramIterator, PoolEntryCallback<T, C> paramPoolEntryCallback)
  {
    while (paramIterator.hasNext())
    {
      PoolEntry localPoolEntry = (PoolEntry)paramIterator.next();
      paramPoolEntryCallback.process(localPoolEntry);
      if (localPoolEntry.isClosed())
      {
        getPool(localPoolEntry.getRoute()).remove(localPoolEntry);
        paramIterator.remove();
      }
    }
  }
  
  private int getMax(T paramT)
  {
    paramT = (Integer)maxPerRoute.get(paramT);
    if (paramT != null) {
      return paramT.intValue();
    }
    return defaultMaxPerRoute;
  }
  
  private RouteSpecificPool<T, C, E> getPool(final T paramT)
  {
    RouteSpecificPool localRouteSpecificPool = (RouteSpecificPool)routeToPool.get(paramT);
    Object localObject = localRouteSpecificPool;
    if (localRouteSpecificPool == null)
    {
      localObject = new RouteSpecificPool(paramT)
      {
        protected E createEntry(C paramAnonymousC)
        {
          return createEntry(paramT, paramAnonymousC);
        }
      };
      routeToPool.put(paramT, localObject);
    }
    return localObject;
  }
  
  private E getPoolEntryBlocking(T paramT, Object paramObject, long paramLong, TimeUnit paramTimeUnit, PoolEntryFuture<E> paramPoolEntryFuture)
    throws IOException, InterruptedException, TimeoutException
  {
    Date localDate = null;
    if (paramLong > 0L) {
      localDate = new Date(System.currentTimeMillis() + paramTimeUnit.toMillis(paramLong));
    }
    lock.lock();
    for (;;)
    {
      RouteSpecificPool localRouteSpecificPool;
      boolean bool;
      PoolEntry localPoolEntry;
      try
      {
        localRouteSpecificPool = getPool(paramT);
        paramTimeUnit = null;
        if (paramTimeUnit != null) {
          break label472;
        }
        if (!isShutDown)
        {
          bool = true;
          Asserts.check(bool, "Connection pool shut down");
          localPoolEntry = localRouteSpecificPool.getFree(paramObject);
          if (localPoolEntry == null)
          {
            if (localPoolEntry == null) {
              break label184;
            }
            available.remove(localPoolEntry);
            leased.add(localPoolEntry);
            return localPoolEntry;
          }
        }
        else
        {
          bool = false;
          continue;
        }
        if ((!localPoolEntry.isClosed()) && (!localPoolEntry.isExpired(System.currentTimeMillis()))) {
          continue;
        }
        localPoolEntry.close();
        available.remove(localPoolEntry);
        localRouteSpecificPool.free(localPoolEntry, false);
        continue;
        j = getMax(paramT);
      }
      finally
      {
        lock.unlock();
      }
      label184:
      int j;
      int k = Math.max(0, localRouteSpecificPool.getAllocatedCount() + 1 - j);
      int i;
      if (k > 0) {
        i = 0;
      }
      for (;;)
      {
        if (i < k)
        {
          paramTimeUnit = localRouteSpecificPool.getLastUsed();
          if (paramTimeUnit != null) {}
        }
        else
        {
          if (localRouteSpecificPool.getAllocatedCount() >= j) {
            break;
          }
          i = leased.size();
          i = Math.max(maxTotal - i, 0);
          if (i <= 0) {
            break;
          }
          if ((available.size() > i - 1) && (!available.isEmpty()))
          {
            paramObject = (PoolEntry)available.removeLast();
            paramObject.close();
            getPool(paramObject.getRoute()).remove(paramObject);
          }
          paramT = localRouteSpecificPool.add(connFactory.create(paramT));
          leased.add(paramT);
          lock.unlock();
          return paramT;
        }
        paramTimeUnit.close();
        available.remove(paramTimeUnit);
        localRouteSpecificPool.remove(paramTimeUnit);
        i += 1;
      }
      try
      {
        localRouteSpecificPool.queue(paramPoolEntryFuture);
        pending.add(paramPoolEntryFuture);
        bool = paramPoolEntryFuture.await(localDate);
        localRouteSpecificPool.unqueue(paramPoolEntryFuture);
        pending.remove(paramPoolEntryFuture);
        paramTimeUnit = localPoolEntry;
        if (bool) {
          continue;
        }
        paramTimeUnit = localPoolEntry;
        if (localDate == null) {
          continue;
        }
        paramTimeUnit = localPoolEntry;
        if (localDate.getTime() > System.currentTimeMillis()) {
          continue;
        }
        label472:
        throw new TimeoutException("Timeout waiting for connection");
      }
      finally
      {
        localRouteSpecificPool.unqueue(paramPoolEntryFuture);
        pending.remove(paramPoolEntryFuture);
      }
    }
  }
  
  private void notifyPending(RouteSpecificPool<T, C, E> paramRouteSpecificPool)
  {
    paramRouteSpecificPool = paramRouteSpecificPool.nextPending();
    if (paramRouteSpecificPool != null) {
      pending.remove(paramRouteSpecificPool);
    }
    for (;;)
    {
      if (paramRouteSpecificPool != null) {
        paramRouteSpecificPool.wakeup();
      }
      return;
      paramRouteSpecificPool = (PoolEntryFuture)pending.poll();
    }
  }
  
  public void closeExpired()
  {
    enumAvailable(new PoolEntryCallback()
    {
      public void process(PoolEntry<T, C> paramAnonymousPoolEntry)
      {
        if (paramAnonymousPoolEntry.isExpired(val$now)) {
          paramAnonymousPoolEntry.close();
        }
      }
    });
  }
  
  public void closeIdle(long paramLong, TimeUnit paramTimeUnit)
  {
    Args.notNull(paramTimeUnit, "Time unit");
    long l = paramTimeUnit.toMillis(paramLong);
    paramLong = l;
    if (l < 0L) {
      paramLong = 0L;
    }
    enumAvailable(new PoolEntryCallback()
    {
      public void process(PoolEntry<T, C> paramAnonymousPoolEntry)
      {
        if (paramAnonymousPoolEntry.getUpdated() <= val$deadline) {
          paramAnonymousPoolEntry.close();
        }
      }
    });
  }
  
  protected abstract E createEntry(T paramT, C paramC);
  
  protected void enumAvailable(PoolEntryCallback<T, C> paramPoolEntryCallback)
  {
    lock.lock();
    try
    {
      enumEntries(available.iterator(), paramPoolEntryCallback);
      return;
    }
    finally
    {
      lock.unlock();
    }
  }
  
  protected void enumLeased(PoolEntryCallback<T, C> paramPoolEntryCallback)
  {
    lock.lock();
    try
    {
      enumEntries(leased.iterator(), paramPoolEntryCallback);
      return;
    }
    finally
    {
      lock.unlock();
    }
  }
  
  public int getDefaultMaxPerRoute()
  {
    lock.lock();
    try
    {
      int i = defaultMaxPerRoute;
      return i;
    }
    finally
    {
      lock.unlock();
    }
  }
  
  public int getMaxPerRoute(T paramT)
  {
    Args.notNull(paramT, "Route");
    lock.lock();
    try
    {
      int i = getMax(paramT);
      return i;
    }
    finally
    {
      lock.unlock();
    }
  }
  
  public int getMaxTotal()
  {
    lock.lock();
    try
    {
      int i = maxTotal;
      return i;
    }
    finally
    {
      lock.unlock();
    }
  }
  
  public PoolStats getStats(T paramT)
  {
    Args.notNull(paramT, "Route");
    lock.lock();
    try
    {
      RouteSpecificPool localRouteSpecificPool = getPool(paramT);
      paramT = new PoolStats(localRouteSpecificPool.getLeasedCount(), localRouteSpecificPool.getPendingCount(), localRouteSpecificPool.getAvailableCount(), getMax(paramT));
      return paramT;
    }
    finally
    {
      lock.unlock();
    }
  }
  
  public PoolStats getTotalStats()
  {
    lock.lock();
    try
    {
      PoolStats localPoolStats = new PoolStats(leased.size(), pending.size(), available.size(), maxTotal);
      return localPoolStats;
    }
    finally
    {
      lock.unlock();
    }
  }
  
  public boolean isShutdown()
  {
    return isShutDown;
  }
  
  public Future<E> lease(T paramT, Object paramObject)
  {
    return lease(paramT, paramObject, null);
  }
  
  public Future<E> lease(final T paramT, final Object paramObject, FutureCallback<E> paramFutureCallback)
  {
    Args.notNull(paramT, "Route");
    if (!isShutDown) {}
    for (boolean bool = true;; bool = false)
    {
      Asserts.check(bool, "Connection pool shut down");
      new PoolEntryFuture(lock, paramFutureCallback)
      {
        public E getPoolEntry(long paramAnonymousLong, TimeUnit paramAnonymousTimeUnit)
          throws InterruptedException, TimeoutException, IOException
        {
          paramAnonymousTimeUnit = AbstractConnPool.this.getPoolEntryBlocking(paramT, paramObject, paramAnonymousLong, paramAnonymousTimeUnit, this);
          onLease(paramAnonymousTimeUnit);
          return paramAnonymousTimeUnit;
        }
      };
    }
  }
  
  protected void onLease(E paramE) {}
  
  protected void onRelease(E paramE) {}
  
  /* Error */
  public void release(E paramE, boolean paramBoolean)
  {
    // Byte code:
    //   0: aload_0
    //   1: getfield 75	org/apache/http/pool/AbstractConnPool:lock	Ljava/util/concurrent/locks/Lock;
    //   4: invokeinterface 193 1 0
    //   9: aload_0
    //   10: getfield 85	org/apache/http/pool/AbstractConnPool:leased	Ljava/util/Set;
    //   13: aload_1
    //   14: invokeinterface 362 2 0
    //   19: ifeq +47 -> 66
    //   22: aload_0
    //   23: aload_1
    //   24: invokevirtual 136	org/apache/http/pool/PoolEntry:getRoute	()Ljava/lang/Object;
    //   27: invokespecial 140	org/apache/http/pool/AbstractConnPool:getPool	(Ljava/lang/Object;)Lorg/apache/http/pool/RouteSpecificPool;
    //   30: astore_3
    //   31: aload_3
    //   32: aload_1
    //   33: iload_2
    //   34: invokevirtual 229	org/apache/http/pool/RouteSpecificPool:free	(Lorg/apache/http/pool/PoolEntry;Z)V
    //   37: iload_2
    //   38: ifeq +38 -> 76
    //   41: aload_0
    //   42: getfield 195	org/apache/http/pool/AbstractConnPool:isShutDown	Z
    //   45: ifne +31 -> 76
    //   48: aload_0
    //   49: getfield 90	org/apache/http/pool/AbstractConnPool:available	Ljava/util/LinkedList;
    //   52: aload_1
    //   53: invokevirtual 366	java/util/LinkedList:addFirst	(Ljava/lang/Object;)V
    //   56: aload_0
    //   57: aload_1
    //   58: invokevirtual 368	org/apache/http/pool/AbstractConnPool:onRelease	(Lorg/apache/http/pool/PoolEntry;)V
    //   61: aload_0
    //   62: aload_3
    //   63: invokespecial 370	org/apache/http/pool/AbstractConnPool:notifyPending	(Lorg/apache/http/pool/RouteSpecificPool;)V
    //   66: aload_0
    //   67: getfield 75	org/apache/http/pool/AbstractConnPool:lock	Ljava/util/concurrent/locks/Lock;
    //   70: invokeinterface 218 1 0
    //   75: return
    //   76: aload_1
    //   77: invokevirtual 225	org/apache/http/pool/PoolEntry:close	()V
    //   80: goto -19 -> 61
    //   83: astore_1
    //   84: aload_0
    //   85: getfield 75	org/apache/http/pool/AbstractConnPool:lock	Ljava/util/concurrent/locks/Lock;
    //   88: invokeinterface 218 1 0
    //   93: aload_1
    //   94: athrow
    // Local variable table:
    //   start	length	slot	name	signature
    //   0	95	0	this	AbstractConnPool
    //   0	95	1	paramE	E
    //   0	95	2	paramBoolean	boolean
    //   30	33	3	localRouteSpecificPool	RouteSpecificPool
    // Exception table:
    //   from	to	target	type
    //   9	37	83	finally
    //   41	61	83	finally
    //   61	66	83	finally
    //   76	80	83	finally
  }
  
  public void setDefaultMaxPerRoute(int paramInt)
  {
    Args.notNegative(paramInt, "Max per route value");
    lock.lock();
    try
    {
      defaultMaxPerRoute = paramInt;
      return;
    }
    finally
    {
      lock.unlock();
    }
  }
  
  public void setMaxPerRoute(T paramT, int paramInt)
  {
    Args.notNull(paramT, "Route");
    Args.notNegative(paramInt, "Max per route value");
    lock.lock();
    try
    {
      maxPerRoute.put(paramT, Integer.valueOf(paramInt));
      return;
    }
    finally
    {
      lock.unlock();
    }
  }
  
  public void setMaxTotal(int paramInt)
  {
    Args.notNegative(paramInt, "Max value");
    lock.lock();
    try
    {
      maxTotal = paramInt;
      return;
    }
    finally
    {
      lock.unlock();
    }
  }
  
  public void shutdown()
    throws IOException
  {
    if (isShutDown) {
      return;
    }
    isShutDown = true;
    lock.lock();
    try
    {
      Iterator localIterator1 = available.iterator();
      while (localIterator1.hasNext()) {
        ((PoolEntry)localIterator1.next()).close();
      }
      localIterator2 = leased.iterator();
    }
    finally
    {
      lock.unlock();
    }
    while (localIterator2.hasNext()) {
      ((PoolEntry)localIterator2.next()).close();
    }
    Iterator localIterator2 = routeToPool.values().iterator();
    while (localIterator2.hasNext()) {
      ((RouteSpecificPool)localIterator2.next()).shutdown();
    }
    routeToPool.clear();
    leased.clear();
    available.clear();
    lock.unlock();
  }
  
  public String toString()
  {
    StringBuilder localStringBuilder = new StringBuilder();
    localStringBuilder.append("[leased: ");
    localStringBuilder.append(leased);
    localStringBuilder.append("][available: ");
    localStringBuilder.append(available);
    localStringBuilder.append("][pending: ");
    localStringBuilder.append(pending);
    localStringBuilder.append("]");
    return localStringBuilder.toString();
  }
}
