package rx.internal.schedulers;

import java.util.concurrent.Future;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
import rx.Subscription;
import rx.exceptions.OnErrorNotImplementedException;
import rx.functions.Action0;
import rx.internal.util.SubscriptionList;
import rx.plugins.RxJavaErrorHandler;
import rx.plugins.RxJavaPlugins;
import rx.subscriptions.CompositeSubscription;

public final class ScheduledAction
  extends AtomicReference<Thread>
  implements Runnable, Subscription
{
  private static final long serialVersionUID = -3962399486978279857L;
  final Action0 action;
  final SubscriptionList cancel;
  
  public ScheduledAction(Action0 paramAction0)
  {
    action = paramAction0;
    cancel = new SubscriptionList();
  }
  
  public ScheduledAction(Action0 paramAction0, SubscriptionList paramSubscriptionList)
  {
    action = paramAction0;
    cancel = new SubscriptionList(new Remover2(this, paramSubscriptionList));
  }
  
  public ScheduledAction(Action0 paramAction0, CompositeSubscription paramCompositeSubscription)
  {
    action = paramAction0;
    cancel = new SubscriptionList(new Remover(this, paramCompositeSubscription));
  }
  
  public void add(Future<?> paramFuture)
  {
    cancel.add(new FutureCompleter(paramFuture, null));
  }
  
  public void add(Subscription paramSubscription)
  {
    cancel.add(paramSubscription);
  }
  
  public void addParent(CompositeSubscription paramCompositeSubscription)
  {
    cancel.add(new Remover(this, paramCompositeSubscription));
  }
  
  public boolean isUnsubscribed()
  {
    return cancel.isUnsubscribed();
  }
  
  public void run()
  {
    try
    {
      lazySet(Thread.currentThread());
      action.call();
      return;
    }
    catch (Throwable localThrowable)
    {
      if ((localThrowable instanceof OnErrorNotImplementedException)) {}
      for (IllegalStateException localIllegalStateException = new IllegalStateException("Exception thrown on Scheduler.Worker thread. Add `onError` handling.", localThrowable);; localIllegalStateException = new IllegalStateException("Fatal Exception thrown on Scheduler.Worker thread.", localIllegalStateException))
      {
        RxJavaPlugins.getInstance().getErrorHandler().handleError(localIllegalStateException);
        Thread localThread = Thread.currentThread();
        localThread.getUncaughtExceptionHandler().uncaughtException(localThread, localIllegalStateException);
        return;
      }
    }
    finally
    {
      unsubscribe();
    }
  }
  
  public void unsubscribe()
  {
    if (!cancel.isUnsubscribed()) {
      cancel.unsubscribe();
    }
  }
  
  private final class FutureCompleter
    implements Subscription
  {
    private final Future<?> f;
    
    private FutureCompleter()
    {
      Object localObject;
      f = localObject;
    }
    
    public boolean isUnsubscribed()
    {
      return f.isCancelled();
    }
    
    public void unsubscribe()
    {
      if (get() != Thread.currentThread())
      {
        f.cancel(true);
        return;
      }
      f.cancel(false);
    }
  }
  
  private static final class Remover
    extends AtomicBoolean
    implements Subscription
  {
    private static final long serialVersionUID = 247232374289553518L;
    final CompositeSubscription parent;
    final ScheduledAction s;
    
    public Remover(ScheduledAction paramScheduledAction, CompositeSubscription paramCompositeSubscription)
    {
      s = paramScheduledAction;
      parent = paramCompositeSubscription;
    }
    
    public boolean isUnsubscribed()
    {
      return s.isUnsubscribed();
    }
    
    public void unsubscribe()
    {
      if (compareAndSet(false, true)) {
        parent.remove(s);
      }
    }
  }
  
  private static final class Remover2
    extends AtomicBoolean
    implements Subscription
  {
    private static final long serialVersionUID = 247232374289553518L;
    final SubscriptionList parent;
    final ScheduledAction s;
    
    public Remover2(ScheduledAction paramScheduledAction, SubscriptionList paramSubscriptionList)
    {
      s = paramScheduledAction;
      parent = paramSubscriptionList;
    }
    
    public boolean isUnsubscribed()
    {
      return s.isUnsubscribed();
    }
    
    public void unsubscribe()
    {
      if (compareAndSet(false, true)) {
        parent.remove(s);
      }
    }
  }
}
