package rx.internal.operators;

import java.util.concurrent.TimeUnit;
import rx.Observable;
import rx.Observable.Operator;
import rx.Scheduler;
import rx.Scheduler.Worker;
import rx.Subscriber;
import rx.functions.Action0;

public final class OperatorDelay<T>
  implements Observable.Operator<T, T>
{
  final long delay;
  final Scheduler scheduler;
  final Observable<? extends T> source;
  final TimeUnit unit;
  
  public OperatorDelay(Observable<? extends T> paramObservable, long paramLong, TimeUnit paramTimeUnit, Scheduler paramScheduler)
  {
    source = paramObservable;
    delay = paramLong;
    unit = paramTimeUnit;
    scheduler = paramScheduler;
  }
  
  public Subscriber<? super T> call(final Subscriber<? super T> paramSubscriber)
  {
    final Scheduler.Worker localWorker = scheduler.createWorker();
    paramSubscriber.add(localWorker);
    new Subscriber(paramSubscriber)
    {
      public void onCompleted()
      {
        localWorker.schedule(new Action0()
        {
          public void call()
          {
            val$child.onCompleted();
          }
        }, delay, unit);
      }
      
      public void onError(Throwable paramAnonymousThrowable)
      {
        paramSubscriber.onError(paramAnonymousThrowable);
      }
      
      public void onNext(final T paramAnonymousT)
      {
        localWorker.schedule(new Action0()
        {
          public void call()
          {
            val$child.onNext(paramAnonymousT);
          }
        }, delay, unit);
      }
    };
  }
}
