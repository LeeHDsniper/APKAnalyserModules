package rx.internal.util;

import rx.Observable;
import rx.Observable.OnSubscribe;
import rx.Scheduler;
import rx.Scheduler.Worker;
import rx.Subscriber;
import rx.functions.Action0;
import rx.internal.schedulers.EventLoopsScheduler;

public final class ScalarSynchronousObservable<T>
  extends Observable<T>
{
  private final T t;
  
  protected ScalarSynchronousObservable(T paramT)
  {
    super(new Observable.OnSubscribe()
    {
      public void call(Subscriber<? super T> paramAnonymousSubscriber)
      {
        paramAnonymousSubscriber.onNext(ScalarSynchronousObservable.this);
        paramAnonymousSubscriber.onCompleted();
      }
    });
    t = paramT;
  }
  
  public static final <T> ScalarSynchronousObservable<T> create(T paramT)
  {
    return new ScalarSynchronousObservable(paramT);
  }
  
  public T get()
  {
    return t;
  }
  
  public Observable<T> scalarScheduleOn(Scheduler paramScheduler)
  {
    if ((paramScheduler instanceof EventLoopsScheduler)) {
      return create(new DirectScheduledEmission((EventLoopsScheduler)paramScheduler, t));
    }
    return create(new NormalScheduledEmission(paramScheduler, t));
  }
  
  static final class DirectScheduledEmission<T>
    implements Observable.OnSubscribe<T>
  {
    private final EventLoopsScheduler es;
    private final T value;
    
    DirectScheduledEmission(EventLoopsScheduler paramEventLoopsScheduler, T paramT)
    {
      es = paramEventLoopsScheduler;
      value = paramT;
    }
    
    public void call(Subscriber<? super T> paramSubscriber)
    {
      paramSubscriber.add(es.scheduleDirect(new ScalarSynchronousObservable.ScalarSynchronousAction(paramSubscriber, value, null)));
    }
  }
  
  static final class NormalScheduledEmission<T>
    implements Observable.OnSubscribe<T>
  {
    private final Scheduler scheduler;
    private final T value;
    
    NormalScheduledEmission(Scheduler paramScheduler, T paramT)
    {
      scheduler = paramScheduler;
      value = paramT;
    }
    
    public void call(Subscriber<? super T> paramSubscriber)
    {
      Scheduler.Worker localWorker = scheduler.createWorker();
      paramSubscriber.add(localWorker);
      localWorker.schedule(new ScalarSynchronousObservable.ScalarSynchronousAction(paramSubscriber, value, null));
    }
  }
  
  static final class ScalarSynchronousAction<T>
    implements Action0
  {
    private final Subscriber<? super T> subscriber;
    private final T value;
    
    private ScalarSynchronousAction(Subscriber<? super T> paramSubscriber, T paramT)
    {
      subscriber = paramSubscriber;
      value = paramT;
    }
    
    public void call()
    {
      try
      {
        subscriber.onNext(value);
        subscriber.onCompleted();
        return;
      }
      catch (Throwable localThrowable)
      {
        subscriber.onError(localThrowable);
      }
    }
  }
}
