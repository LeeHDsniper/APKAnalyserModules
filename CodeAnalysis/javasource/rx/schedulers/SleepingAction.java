package rx.schedulers;

import rx.Scheduler.Worker;
import rx.functions.Action0;

class SleepingAction
  implements Action0
{
  private final long execTime;
  private final Scheduler.Worker innerScheduler;
  private final Action0 underlying;
  
  public SleepingAction(Action0 paramAction0, Scheduler.Worker paramWorker, long paramLong)
  {
    underlying = paramAction0;
    innerScheduler = paramWorker;
    execTime = paramLong;
  }
  
  public void call()
  {
    if (innerScheduler.isUnsubscribed()) {}
    for (;;)
    {
      return;
      long l;
      if (execTime > innerScheduler.now())
      {
        l = execTime - innerScheduler.now();
        if (l <= 0L) {}
      }
      try
      {
        Thread.sleep(l);
        if (innerScheduler.isUnsubscribed()) {
          continue;
        }
        underlying.call();
        return;
      }
      catch (InterruptedException localInterruptedException)
      {
        Thread.currentThread().interrupt();
        throw new RuntimeException(localInterruptedException);
      }
    }
  }
}
