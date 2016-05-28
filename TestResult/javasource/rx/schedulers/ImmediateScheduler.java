package rx.schedulers;

import java.util.concurrent.TimeUnit;
import rx.Scheduler;
import rx.Scheduler.Worker;
import rx.Subscription;
import rx.functions.Action0;
import rx.subscriptions.BooleanSubscription;
import rx.subscriptions.Subscriptions;

public final class ImmediateScheduler
  extends Scheduler
{
  private static final ImmediateScheduler INSTANCE = new ImmediateScheduler();
  
  ImmediateScheduler() {}
  
  public Scheduler.Worker createWorker()
  {
    return new InnerImmediateScheduler(null);
  }
  
  private class InnerImmediateScheduler
    extends Scheduler.Worker
    implements Subscription
  {
    final BooleanSubscription innerSubscription = new BooleanSubscription();
    
    private InnerImmediateScheduler() {}
    
    public boolean isUnsubscribed()
    {
      return innerSubscription.isUnsubscribed();
    }
    
    public Subscription schedule(Action0 paramAction0)
    {
      paramAction0.call();
      return Subscriptions.unsubscribed();
    }
    
    public Subscription schedule(Action0 paramAction0, long paramLong, TimeUnit paramTimeUnit)
    {
      return schedule(new SleepingAction(paramAction0, this, now() + paramTimeUnit.toMillis(paramLong)));
    }
    
    public void unsubscribe()
    {
      innerSubscription.unsubscribe();
    }
  }
}
