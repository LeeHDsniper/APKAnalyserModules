package rx.schedulers;

import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicIntegerFieldUpdater;
import rx.Scheduler;
import rx.Scheduler.Worker;
import rx.Subscription;
import rx.functions.Action0;
import rx.subscriptions.BooleanSubscription;
import rx.subscriptions.Subscriptions;

public final class TrampolineScheduler
  extends Scheduler
{
  private static final TrampolineScheduler INSTANCE = new TrampolineScheduler();
  
  TrampolineScheduler() {}
  
  private static int compare(int paramInt1, int paramInt2)
  {
    if (paramInt1 < paramInt2) {
      return -1;
    }
    if (paramInt1 == paramInt2) {
      return 0;
    }
    return 1;
  }
  
  static TrampolineScheduler instance()
  {
    return INSTANCE;
  }
  
  public Scheduler.Worker createWorker()
  {
    return new InnerCurrentThreadScheduler(null);
  }
  
  private static class InnerCurrentThreadScheduler
    extends Scheduler.Worker
    implements Subscription
  {
    private static final AtomicIntegerFieldUpdater<InnerCurrentThreadScheduler> COUNTER_UPDATER = AtomicIntegerFieldUpdater.newUpdater(InnerCurrentThreadScheduler.class, "counter");
    volatile int counter;
    private final BooleanSubscription innerSubscription = new BooleanSubscription();
    private final PriorityBlockingQueue<TrampolineScheduler.TimedAction> queue = new PriorityBlockingQueue();
    private final AtomicInteger wip = new AtomicInteger();
    
    private InnerCurrentThreadScheduler() {}
    
    private Subscription enqueue(final Action0 paramAction0, long paramLong)
    {
      if (innerSubscription.isUnsubscribed()) {
        return Subscriptions.unsubscribed();
      }
      paramAction0 = new TrampolineScheduler.TimedAction(paramAction0, Long.valueOf(paramLong), COUNTER_UPDATER.incrementAndGet(this), null);
      queue.add(paramAction0);
      if (wip.getAndIncrement() == 0)
      {
        do
        {
          paramAction0 = (TrampolineScheduler.TimedAction)queue.poll();
          if (paramAction0 != null) {
            action.call();
          }
        } while (wip.decrementAndGet() > 0);
        return Subscriptions.unsubscribed();
      }
      Subscriptions.create(new Action0()
      {
        public void call()
        {
          queue.remove(paramAction0);
        }
      });
    }
    
    public boolean isUnsubscribed()
    {
      return innerSubscription.isUnsubscribed();
    }
    
    public Subscription schedule(Action0 paramAction0)
    {
      return enqueue(paramAction0, now());
    }
    
    public Subscription schedule(Action0 paramAction0, long paramLong, TimeUnit paramTimeUnit)
    {
      paramLong = now() + paramTimeUnit.toMillis(paramLong);
      return enqueue(new SleepingAction(paramAction0, this, paramLong), paramLong);
    }
    
    public void unsubscribe()
    {
      innerSubscription.unsubscribe();
    }
  }
  
  private static final class TimedAction
    implements Comparable<TimedAction>
  {
    final Action0 action;
    final int count;
    final Long execTime;
    
    private TimedAction(Action0 paramAction0, Long paramLong, int paramInt)
    {
      action = paramAction0;
      execTime = paramLong;
      count = paramInt;
    }
    
    public int compareTo(TimedAction paramTimedAction)
    {
      int j = execTime.compareTo(execTime);
      int i = j;
      if (j == 0) {
        i = TrampolineScheduler.compare(count, count);
      }
      return i;
    }
  }
}
