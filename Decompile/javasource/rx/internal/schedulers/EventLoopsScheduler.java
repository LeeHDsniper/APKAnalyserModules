package rx.internal.schedulers;

import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;
import rx.Scheduler;
import rx.Scheduler.Worker;
import rx.Subscription;
import rx.functions.Action0;
import rx.internal.util.RxThreadFactory;
import rx.internal.util.SubscriptionList;
import rx.subscriptions.CompositeSubscription;
import rx.subscriptions.Subscriptions;

public class EventLoopsScheduler
  extends Scheduler
{
  static final int MAX_THREADS;
  private static final RxThreadFactory THREAD_FACTORY = new RxThreadFactory("RxComputationThreadPool-");
  final FixedSchedulerPool pool = new FixedSchedulerPool();
  
  static
  {
    int i = Integer.getInteger("rx.scheduler.max-computation-threads", 0).intValue();
    int j = Runtime.getRuntime().availableProcessors();
    if ((i <= 0) || (i > j)) {
      i = j;
    }
    for (;;)
    {
      MAX_THREADS = i;
      return;
    }
  }
  
  public EventLoopsScheduler() {}
  
  public Scheduler.Worker createWorker()
  {
    return new EventLoopWorker(pool.getEventLoop());
  }
  
  public Subscription scheduleDirect(Action0 paramAction0)
  {
    return pool.getEventLoop().scheduleActual(paramAction0, -1L, TimeUnit.NANOSECONDS);
  }
  
  private static class EventLoopWorker
    extends Scheduler.Worker
  {
    private final SubscriptionList both = new SubscriptionList(new Subscription[] { serial, timed });
    private final EventLoopsScheduler.PoolWorker poolWorker;
    private final SubscriptionList serial = new SubscriptionList();
    private final CompositeSubscription timed = new CompositeSubscription();
    
    EventLoopWorker(EventLoopsScheduler.PoolWorker paramPoolWorker)
    {
      poolWorker = paramPoolWorker;
    }
    
    public boolean isUnsubscribed()
    {
      return both.isUnsubscribed();
    }
    
    public Subscription schedule(Action0 paramAction0)
    {
      if (isUnsubscribed()) {
        return Subscriptions.unsubscribed();
      }
      return poolWorker.scheduleActual(paramAction0, 0L, null, serial);
    }
    
    public Subscription schedule(Action0 paramAction0, long paramLong, TimeUnit paramTimeUnit)
    {
      if (isUnsubscribed()) {
        return Subscriptions.unsubscribed();
      }
      return poolWorker.scheduleActual(paramAction0, paramLong, paramTimeUnit, timed);
    }
    
    public void unsubscribe()
    {
      both.unsubscribe();
    }
  }
  
  static final class FixedSchedulerPool
  {
    final int cores = EventLoopsScheduler.MAX_THREADS;
    final EventLoopsScheduler.PoolWorker[] eventLoops = new EventLoopsScheduler.PoolWorker[cores];
    long n;
    
    FixedSchedulerPool()
    {
      int i = 0;
      while (i < cores)
      {
        eventLoops[i] = new EventLoopsScheduler.PoolWorker(EventLoopsScheduler.THREAD_FACTORY);
        i += 1;
      }
    }
    
    public EventLoopsScheduler.PoolWorker getEventLoop()
    {
      EventLoopsScheduler.PoolWorker[] arrayOfPoolWorker = eventLoops;
      long l = n;
      n = (1L + l);
      return arrayOfPoolWorker[((int)(l % cores))];
    }
  }
  
  private static final class PoolWorker
    extends NewThreadWorker
  {
    PoolWorker(ThreadFactory paramThreadFactory)
    {
      super();
    }
  }
}
