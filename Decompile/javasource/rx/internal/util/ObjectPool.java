package rx.internal.util;

import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.TimeUnit;
import rx.Scheduler;
import rx.Scheduler.Worker;
import rx.functions.Action0;
import rx.internal.util.unsafe.MpmcArrayQueue;
import rx.internal.util.unsafe.UnsafeAccess;
import rx.schedulers.Schedulers;

public abstract class ObjectPool<T>
{
  private final int maxSize;
  private Queue<T> pool;
  private Scheduler.Worker schedulerWorker;
  
  public ObjectPool()
  {
    this(0, 0, 67L);
  }
  
  private ObjectPool(final int paramInt1, final int paramInt2, long paramLong)
  {
    maxSize = paramInt2;
    initialize(paramInt1);
    schedulerWorker = Schedulers.computation().createWorker();
    schedulerWorker.schedulePeriodically(new Action0()
    {
      public void call()
      {
        int j = pool.size();
        int k;
        int i;
        if (j < paramInt1)
        {
          k = paramInt2;
          i = 0;
          while (i < k - j)
          {
            pool.add(createObject());
            i += 1;
          }
        }
        if (j > paramInt2)
        {
          k = paramInt2;
          i = 0;
          while (i < j - k)
          {
            pool.poll();
            i += 1;
          }
        }
      }
    }, paramLong, paramLong, TimeUnit.SECONDS);
  }
  
  private void initialize(int paramInt)
  {
    if (UnsafeAccess.isUnsafeAvailable()) {}
    for (pool = new MpmcArrayQueue(Math.max(maxSize, 1024));; pool = new ConcurrentLinkedQueue())
    {
      int i = 0;
      while (i < paramInt)
      {
        pool.add(createObject());
        i += 1;
      }
    }
  }
  
  public T borrowObject()
  {
    Object localObject2 = pool.poll();
    Object localObject1 = localObject2;
    if (localObject2 == null) {
      localObject1 = createObject();
    }
    return localObject1;
  }
  
  protected abstract T createObject();
  
  public void returnObject(T paramT)
  {
    if (paramT == null) {
      return;
    }
    pool.offer(paramT);
  }
}
