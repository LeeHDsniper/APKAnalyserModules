package rx.internal.schedulers;

import java.lang.reflect.Method;
import java.util.Iterator;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;
import rx.Scheduler.Worker;
import rx.Subscription;
import rx.exceptions.Exceptions;
import rx.functions.Action0;
import rx.internal.util.RxThreadFactory;
import rx.internal.util.SubscriptionList;
import rx.plugins.RxJavaErrorHandler;
import rx.plugins.RxJavaPlugins;
import rx.plugins.RxJavaSchedulersHook;
import rx.subscriptions.CompositeSubscription;
import rx.subscriptions.Subscriptions;

public class NewThreadWorker
  extends Scheduler.Worker
  implements Subscription
{
  private static final ConcurrentHashMap<ScheduledThreadPoolExecutor, ScheduledThreadPoolExecutor> EXECUTORS = new ConcurrentHashMap();
  private static final AtomicReference<ScheduledExecutorService> PURGE = new AtomicReference();
  private static final boolean PURGE_FORCE = Boolean.getBoolean("rx.scheduler.jdk6.purge-force");
  public static final int PURGE_FREQUENCY = Integer.getInteger("rx.scheduler.jdk6.purge-frequency-millis", 1000).intValue();
  private final ScheduledExecutorService executor;
  volatile boolean isUnsubscribed;
  private final RxJavaSchedulersHook schedulersHook;
  
  public NewThreadWorker(ThreadFactory paramThreadFactory)
  {
    paramThreadFactory = Executors.newScheduledThreadPool(1, paramThreadFactory);
    if ((!tryEnableCancelPolicy(paramThreadFactory)) && ((paramThreadFactory instanceof ScheduledThreadPoolExecutor))) {
      registerExecutor((ScheduledThreadPoolExecutor)paramThreadFactory);
    }
    schedulersHook = RxJavaPlugins.getInstance().getSchedulersHook();
    executor = paramThreadFactory;
  }
  
  public static void deregisterExecutor(ScheduledExecutorService paramScheduledExecutorService)
  {
    EXECUTORS.remove(paramScheduledExecutorService);
  }
  
  static void purgeExecutors()
  {
    for (;;)
    {
      try
      {
        Iterator localIterator = EXECUTORS.keySet().iterator();
        if (localIterator.hasNext())
        {
          ScheduledThreadPoolExecutor localScheduledThreadPoolExecutor = (ScheduledThreadPoolExecutor)localIterator.next();
          if (!localScheduledThreadPoolExecutor.isShutdown()) {
            localScheduledThreadPoolExecutor.purge();
          }
        }
        else
        {
          return;
        }
      }
      catch (Throwable localThrowable)
      {
        Exceptions.throwIfFatal(localThrowable);
        RxJavaPlugins.getInstance().getErrorHandler().handleError(localThrowable);
      }
      localThrowable.remove();
    }
  }
  
  public static void registerExecutor(ScheduledThreadPoolExecutor paramScheduledThreadPoolExecutor)
  {
    if ((ScheduledExecutorService)PURGE.get() != null) {}
    for (;;)
    {
      EXECUTORS.putIfAbsent(paramScheduledThreadPoolExecutor, paramScheduledThreadPoolExecutor);
      return;
      ScheduledExecutorService localScheduledExecutorService = Executors.newScheduledThreadPool(1, new RxThreadFactory("RxSchedulerPurge-"));
      if (!PURGE.compareAndSet(null, localScheduledExecutorService)) {
        break;
      }
      localScheduledExecutorService.scheduleAtFixedRate(new Runnable()
      {
        public void run() {}
      }, PURGE_FREQUENCY, PURGE_FREQUENCY, TimeUnit.MILLISECONDS);
    }
  }
  
  public static boolean tryEnableCancelPolicy(ScheduledExecutorService paramScheduledExecutorService)
  {
    if (!PURGE_FORCE)
    {
      Method[] arrayOfMethod = paramScheduledExecutorService.getClass().getMethods();
      int j = arrayOfMethod.length;
      int i = 0;
      while (i < j)
      {
        Method localMethod = arrayOfMethod[i];
        if ((localMethod.getName().equals("setRemoveOnCancelPolicy")) && (localMethod.getParameterTypes().length == 1) && (localMethod.getParameterTypes()[0] == Boolean.TYPE)) {
          try
          {
            localMethod.invoke(paramScheduledExecutorService, new Object[] { Boolean.valueOf(true) });
            return true;
          }
          catch (Exception localException)
          {
            RxJavaPlugins.getInstance().getErrorHandler().handleError(localException);
          }
        }
        i += 1;
      }
    }
    return false;
  }
  
  public boolean isUnsubscribed()
  {
    return isUnsubscribed;
  }
  
  public Subscription schedule(Action0 paramAction0)
  {
    return schedule(paramAction0, 0L, null);
  }
  
  public Subscription schedule(Action0 paramAction0, long paramLong, TimeUnit paramTimeUnit)
  {
    if (isUnsubscribed) {
      return Subscriptions.unsubscribed();
    }
    return scheduleActual(paramAction0, paramLong, paramTimeUnit);
  }
  
  public ScheduledAction scheduleActual(Action0 paramAction0, long paramLong, TimeUnit paramTimeUnit)
  {
    ScheduledAction localScheduledAction = new ScheduledAction(schedulersHook.onSchedule(paramAction0));
    if (paramLong <= 0L) {}
    for (paramAction0 = executor.submit(localScheduledAction);; paramAction0 = executor.schedule(localScheduledAction, paramLong, paramTimeUnit))
    {
      localScheduledAction.add(paramAction0);
      return localScheduledAction;
    }
  }
  
  public ScheduledAction scheduleActual(Action0 paramAction0, long paramLong, TimeUnit paramTimeUnit, SubscriptionList paramSubscriptionList)
  {
    ScheduledAction localScheduledAction = new ScheduledAction(schedulersHook.onSchedule(paramAction0), paramSubscriptionList);
    paramSubscriptionList.add(localScheduledAction);
    if (paramLong <= 0L) {}
    for (paramAction0 = executor.submit(localScheduledAction);; paramAction0 = executor.schedule(localScheduledAction, paramLong, paramTimeUnit))
    {
      localScheduledAction.add(paramAction0);
      return localScheduledAction;
    }
  }
  
  public ScheduledAction scheduleActual(Action0 paramAction0, long paramLong, TimeUnit paramTimeUnit, CompositeSubscription paramCompositeSubscription)
  {
    ScheduledAction localScheduledAction = new ScheduledAction(schedulersHook.onSchedule(paramAction0), paramCompositeSubscription);
    paramCompositeSubscription.add(localScheduledAction);
    if (paramLong <= 0L) {}
    for (paramAction0 = executor.submit(localScheduledAction);; paramAction0 = executor.schedule(localScheduledAction, paramLong, paramTimeUnit))
    {
      localScheduledAction.add(paramAction0);
      return localScheduledAction;
    }
  }
  
  public void unsubscribe()
  {
    isUnsubscribed = true;
    executor.shutdownNow();
    deregisterExecutor(executor);
  }
}
