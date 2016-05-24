package rx.schedulers;

import java.util.Iterator;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import rx.Scheduler;
import rx.Scheduler.Worker;
import rx.Subscription;
import rx.functions.Action0;
import rx.internal.schedulers.NewThreadWorker;
import rx.internal.schedulers.ScheduledAction;
import rx.internal.util.RxThreadFactory;
import rx.subscriptions.CompositeSubscription;
import rx.subscriptions.Subscriptions;

final class CachedThreadScheduler
  extends Scheduler
{
  private static final RxThreadFactory EVICTOR_THREAD_FACTORY = new RxThreadFactory("RxCachedWorkerPoolEvictor-");
  private static final RxThreadFactory WORKER_THREAD_FACTORY = new RxThreadFactory("RxCachedThreadScheduler-");
  
  CachedThreadScheduler() {}
  
  public Scheduler.Worker createWorker()
  {
    return new EventLoopWorker(CachedWorkerPool.INSTANCE.get());
  }
  
  private static final class CachedWorkerPool
  {
    private static CachedWorkerPool INSTANCE = new CachedWorkerPool(60L, TimeUnit.SECONDS);
    private final ScheduledExecutorService evictExpiredWorkerExecutor;
    private final ConcurrentLinkedQueue<CachedThreadScheduler.ThreadWorker> expiringWorkerQueue;
    private final long keepAliveTime;
    
    CachedWorkerPool(long paramLong, TimeUnit paramTimeUnit)
    {
      keepAliveTime = paramTimeUnit.toNanos(paramLong);
      expiringWorkerQueue = new ConcurrentLinkedQueue();
      evictExpiredWorkerExecutor = Executors.newScheduledThreadPool(1, CachedThreadScheduler.EVICTOR_THREAD_FACTORY);
      evictExpiredWorkerExecutor.scheduleWithFixedDelay(new Runnable()
      {
        public void run()
        {
          evictExpiredWorkers();
        }
      }, keepAliveTime, keepAliveTime, TimeUnit.NANOSECONDS);
    }
    
    void evictExpiredWorkers()
    {
      if (!expiringWorkerQueue.isEmpty())
      {
        long l = now();
        Iterator localIterator = expiringWorkerQueue.iterator();
        while (localIterator.hasNext())
        {
          CachedThreadScheduler.ThreadWorker localThreadWorker = (CachedThreadScheduler.ThreadWorker)localIterator.next();
          if (localThreadWorker.getExpirationTime() > l) {
            break;
          }
          if (expiringWorkerQueue.remove(localThreadWorker)) {
            localThreadWorker.unsubscribe();
          }
        }
      }
    }
    
    CachedThreadScheduler.ThreadWorker get()
    {
      while (!expiringWorkerQueue.isEmpty())
      {
        CachedThreadScheduler.ThreadWorker localThreadWorker = (CachedThreadScheduler.ThreadWorker)expiringWorkerQueue.poll();
        if (localThreadWorker != null) {
          return localThreadWorker;
        }
      }
      return new CachedThreadScheduler.ThreadWorker(CachedThreadScheduler.WORKER_THREAD_FACTORY);
    }
    
    long now()
    {
      return System.nanoTime();
    }
    
    void release(CachedThreadScheduler.ThreadWorker paramThreadWorker)
    {
      paramThreadWorker.setExpirationTime(now() + keepAliveTime);
      expiringWorkerQueue.offer(paramThreadWorker);
    }
  }
  
  private static final class EventLoopWorker
    extends Scheduler.Worker
  {
    static final AtomicIntegerFieldUpdater<EventLoopWorker> ONCE_UPDATER = AtomicIntegerFieldUpdater.newUpdater(EventLoopWorker.class, "once");
    private final CompositeSubscription innerSubscription = new CompositeSubscription();
    volatile int once;
    private final CachedThreadScheduler.ThreadWorker threadWorker;
    
    EventLoopWorker(CachedThreadScheduler.ThreadWorker paramThreadWorker)
    {
      threadWorker = paramThreadWorker;
    }
    
    public boolean isUnsubscribed()
    {
      return innerSubscription.isUnsubscribed();
    }
    
    public Subscription schedule(Action0 paramAction0)
    {
      return schedule(paramAction0, 0L, null);
    }
    
    public Subscription schedule(Action0 paramAction0, long paramLong, TimeUnit paramTimeUnit)
    {
      if (innerSubscription.isUnsubscribed()) {
        return Subscriptions.unsubscribed();
      }
      paramAction0 = threadWorker.scheduleActual(paramAction0, paramLong, paramTimeUnit);
      innerSubscription.add(paramAction0);
      paramAction0.addParent(innerSubscription);
      return paramAction0;
    }
    
    public void unsubscribe()
    {
      if (ONCE_UPDATER.compareAndSet(this, 0, 1)) {
        CachedThreadScheduler.CachedWorkerPool.INSTANCE.release(threadWorker);
      }
      innerSubscription.unsubscribe();
    }
  }
  
  private static final class ThreadWorker
    extends NewThreadWorker
  {
    private long expirationTime = 0L;
    
    ThreadWorker(ThreadFactory paramThreadFactory)
    {
      super();
    }
    
    public long getExpirationTime()
    {
      return expirationTime;
    }
    
    public void setExpirationTime(long paramLong)
    {
      expirationTime = paramLong;
    }
  }
}
