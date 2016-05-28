package rx.android.schedulers;

import android.os.Handler;
import java.util.concurrent.TimeUnit;
import rx.Scheduler;
import rx.Scheduler.Worker;
import rx.Subscription;
import rx.android.plugins.RxAndroidPlugins;
import rx.android.plugins.RxAndroidSchedulersHook;
import rx.functions.Action0;
import rx.internal.schedulers.ScheduledAction;
import rx.subscriptions.CompositeSubscription;
import rx.subscriptions.Subscriptions;

@Deprecated
public class HandlerThreadScheduler
  extends Scheduler
{
  private final Handler handler;
  
  @Deprecated
  public HandlerThreadScheduler(Handler paramHandler)
  {
    handler = paramHandler;
  }
  
  public Scheduler.Worker createWorker()
  {
    return new InnerHandlerThreadScheduler(handler);
  }
  
  private static class InnerHandlerThreadScheduler
    extends Scheduler.Worker
  {
    private final CompositeSubscription compositeSubscription = new CompositeSubscription();
    private final Handler handler;
    
    public InnerHandlerThreadScheduler(Handler paramHandler)
    {
      handler = paramHandler;
    }
    
    public boolean isUnsubscribed()
    {
      return compositeSubscription.isUnsubscribed();
    }
    
    public Subscription schedule(Action0 paramAction0)
    {
      return schedule(paramAction0, 0L, TimeUnit.MILLISECONDS);
    }
    
    public Subscription schedule(final Action0 paramAction0, long paramLong, TimeUnit paramTimeUnit)
    {
      paramAction0 = new ScheduledAction(RxAndroidPlugins.getInstance().getSchedulersHook().onSchedule(paramAction0));
      paramAction0.add(Subscriptions.create(new Action0()
      {
        public void call()
        {
          handler.removeCallbacks(paramAction0);
        }
      }));
      paramAction0.addParent(compositeSubscription);
      compositeSubscription.add(paramAction0);
      handler.postDelayed(paramAction0, paramTimeUnit.toMillis(paramLong));
      return paramAction0;
    }
    
    public void unsubscribe()
    {
      compositeSubscription.unsubscribe();
    }
  }
}
