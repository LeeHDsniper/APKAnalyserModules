package rx.schedulers;

import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.Executor;
import java.util.concurrent.RejectedExecutionException;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import rx.Scheduler;
import rx.Scheduler.Worker;
import rx.Subscription;
import rx.functions.Action0;
import rx.internal.schedulers.ScheduledAction;
import rx.plugins.RxJavaErrorHandler;
import rx.plugins.RxJavaPlugins;
import rx.subscriptions.CompositeSubscription;
import rx.subscriptions.MultipleAssignmentSubscription;
import rx.subscriptions.Subscriptions;

final class ExecutorScheduler
  extends Scheduler
{
  final Executor executor;
  
  public ExecutorScheduler(Executor paramExecutor)
  {
    executor = paramExecutor;
  }
  
  public Scheduler.Worker createWorker()
  {
    return new ExecutorSchedulerWorker(executor);
  }
  
  static final class ExecutorSchedulerWorker
    extends Scheduler.Worker
    implements Runnable
  {
    final Executor executor;
    final ConcurrentLinkedQueue<ScheduledAction> queue;
    final CompositeSubscription tasks;
    final AtomicInteger wip;
    
    public ExecutorSchedulerWorker(Executor paramExecutor)
    {
      executor = paramExecutor;
      queue = new ConcurrentLinkedQueue();
      wip = new AtomicInteger();
      tasks = new CompositeSubscription();
    }
    
    public boolean isUnsubscribed()
    {
      return tasks.isUnsubscribed();
    }
    
    public void run()
    {
      do
      {
        ScheduledAction localScheduledAction = (ScheduledAction)queue.poll();
        if (!localScheduledAction.isUnsubscribed()) {
          localScheduledAction.run();
        }
      } while (wip.decrementAndGet() > 0);
    }
    
    public Subscription schedule(Action0 paramAction0)
    {
      if (isUnsubscribed()) {
        paramAction0 = Subscriptions.unsubscribed();
      }
      ScheduledAction localScheduledAction;
      do
      {
        return paramAction0;
        localScheduledAction = new ScheduledAction(paramAction0, tasks);
        tasks.add(localScheduledAction);
        queue.offer(localScheduledAction);
        paramAction0 = localScheduledAction;
      } while (wip.getAndIncrement() != 0);
      try
      {
        executor.execute(this);
        return localScheduledAction;
      }
      catch (RejectedExecutionException paramAction0)
      {
        tasks.remove(localScheduledAction);
        wip.decrementAndGet();
        RxJavaPlugins.getInstance().getErrorHandler().handleError(paramAction0);
        throw paramAction0;
      }
    }
    
    public Subscription schedule(final Action0 paramAction0, long paramLong, TimeUnit paramTimeUnit)
    {
      if (paramLong <= 0L) {
        return schedule(paramAction0);
      }
      if (isUnsubscribed()) {
        return Subscriptions.unsubscribed();
      }
      if ((executor instanceof ScheduledExecutorService)) {}
      for (ScheduledExecutorService localScheduledExecutorService = (ScheduledExecutorService)executor;; localScheduledExecutorService = GenericScheduledExecutorService.getInstance())
      {
        MultipleAssignmentSubscription localMultipleAssignmentSubscription1 = new MultipleAssignmentSubscription();
        final MultipleAssignmentSubscription localMultipleAssignmentSubscription2 = new MultipleAssignmentSubscription();
        localMultipleAssignmentSubscription2.set(localMultipleAssignmentSubscription1);
        tasks.add(localMultipleAssignmentSubscription2);
        final Subscription localSubscription = Subscriptions.create(new Action0()
        {
          public void call()
          {
            tasks.remove(localMultipleAssignmentSubscription2);
          }
        });
        paramAction0 = new ScheduledAction(new Action0()
        {
          public void call()
          {
            if (localMultipleAssignmentSubscription2.isUnsubscribed()) {}
            Subscription localSubscription;
            do
            {
              return;
              localSubscription = schedule(paramAction0);
              localMultipleAssignmentSubscription2.set(localSubscription);
            } while (localSubscription.getClass() != ScheduledAction.class);
            ((ScheduledAction)localSubscription).add(localSubscription);
          }
        });
        localMultipleAssignmentSubscription1.set(paramAction0);
        try
        {
          paramAction0.add(localScheduledExecutorService.schedule(paramAction0, paramLong, paramTimeUnit));
          return localSubscription;
        }
        catch (RejectedExecutionException paramAction0)
        {
          RxJavaPlugins.getInstance().getErrorHandler().handleError(paramAction0);
          throw paramAction0;
        }
      }
    }
    
    public void unsubscribe()
    {
      tasks.unsubscribe();
    }
  }
}
