package rx.internal.operators;

import rx.Observable;
import rx.Observable.Operator;
import rx.Producer;
import rx.Scheduler;
import rx.Scheduler.Worker;
import rx.Subscriber;
import rx.functions.Action0;

public class OperatorSubscribeOn<T>
  implements Observable.Operator<T, Observable<T>>
{
  private final Scheduler scheduler;
  
  public OperatorSubscribeOn(Scheduler paramScheduler)
  {
    scheduler = paramScheduler;
  }
  
  public Subscriber<? super Observable<T>> call(final Subscriber<? super T> paramSubscriber)
  {
    final Scheduler.Worker localWorker = scheduler.createWorker();
    paramSubscriber.add(localWorker);
    new Subscriber(paramSubscriber)
    {
      public void onCompleted() {}
      
      public void onError(Throwable paramAnonymousThrowable)
      {
        paramSubscriber.onError(paramAnonymousThrowable);
      }
      
      public void onNext(final Observable<T> paramAnonymousObservable)
      {
        localWorker.schedule(new Action0()
        {
          public void call()
          {
            final Thread localThread = Thread.currentThread();
            paramAnonymousObservable.unsafeSubscribe(new Subscriber(val$subscriber)
            {
              public void onCompleted()
              {
                val$subscriber.onCompleted();
              }
              
              public void onError(Throwable paramAnonymous3Throwable)
              {
                val$subscriber.onError(paramAnonymous3Throwable);
              }
              
              public void onNext(T paramAnonymous3T)
              {
                val$subscriber.onNext(paramAnonymous3T);
              }
              
              public void setProducer(final Producer paramAnonymous3Producer)
              {
                val$subscriber.setProducer(new Producer()
                {
                  public void request(final long paramAnonymous4Long)
                  {
                    if (Thread.currentThread() == val$t)
                    {
                      paramAnonymous3Producer.request(paramAnonymous4Long);
                      return;
                    }
                    val$inner.schedule(new Action0()
                    {
                      public void call()
                      {
                        val$producer.request(paramAnonymous4Long);
                      }
                    });
                  }
                });
              }
            });
          }
        });
      }
    };
  }
}
