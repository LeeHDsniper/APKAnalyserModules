package rx;

import java.util.concurrent.TimeUnit;
import rx.functions.Action0;
import rx.subscriptions.MultipleAssignmentSubscription;

public abstract class Scheduler
{
  public Scheduler() {}
  
  public abstract Worker createWorker();
  
  public long now()
  {
    return System.currentTimeMillis();
  }
  
  public static abstract class Worker
    implements Subscription
  {
    public Worker() {}
    
    public long now()
    {
      return System.currentTimeMillis();
    }
    
    public abstract Subscription schedule(Action0 paramAction0);
    
    public abstract Subscription schedule(Action0 paramAction0, long paramLong, TimeUnit paramTimeUnit);
    
    public Subscription schedulePeriodically(final Action0 paramAction0, long paramLong1, long paramLong2, TimeUnit paramTimeUnit)
    {
      paramLong2 = paramTimeUnit.toNanos(paramLong2);
      long l1 = TimeUnit.MILLISECONDS.toNanos(now());
      long l2 = paramTimeUnit.toNanos(paramLong1);
      final MultipleAssignmentSubscription localMultipleAssignmentSubscription1 = new MultipleAssignmentSubscription();
      paramAction0 = new Action0()
      {
        long count = 0L;
        
        public void call()
        {
          if (!localMultipleAssignmentSubscription1.isUnsubscribed())
          {
            paramAction0.call();
            long l1 = val$startInNanos;
            long l2 = count + 1L;
            count = l2;
            long l3 = val$periodInNanos;
            localMultipleAssignmentSubscription1.set(schedule(this, l1 + l2 * l3 - TimeUnit.MILLISECONDS.toNanos(now()), TimeUnit.NANOSECONDS));
          }
        }
      };
      MultipleAssignmentSubscription localMultipleAssignmentSubscription2 = new MultipleAssignmentSubscription();
      localMultipleAssignmentSubscription1.set(localMultipleAssignmentSubscription2);
      localMultipleAssignmentSubscription2.set(schedule(paramAction0, paramLong1, paramTimeUnit));
      return localMultipleAssignmentSubscription1;
    }
  }
}
