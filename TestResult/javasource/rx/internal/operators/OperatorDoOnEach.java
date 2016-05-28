package rx.internal.operators;

import rx.Observable.Operator;
import rx.Observer;
import rx.Subscriber;
import rx.exceptions.Exceptions;
import rx.exceptions.OnErrorThrowable;

public class OperatorDoOnEach<T>
  implements Observable.Operator<T, T>
{
  private final Observer<? super T> doOnEachObserver;
  
  public OperatorDoOnEach(Observer<? super T> paramObserver)
  {
    doOnEachObserver = paramObserver;
  }
  
  public Subscriber<? super T> call(final Subscriber<? super T> paramSubscriber)
  {
    new Subscriber(paramSubscriber)
    {
      private boolean done = false;
      
      public void onCompleted()
      {
        if (done) {
          return;
        }
        try
        {
          doOnEachObserver.onCompleted();
          done = true;
          paramSubscriber.onCompleted();
          return;
        }
        catch (Throwable localThrowable)
        {
          onError(localThrowable);
        }
      }
      
      public void onError(Throwable paramAnonymousThrowable)
      {
        Exceptions.throwIfFatal(paramAnonymousThrowable);
        if (done) {
          return;
        }
        done = true;
        try
        {
          doOnEachObserver.onError(paramAnonymousThrowable);
          paramSubscriber.onError(paramAnonymousThrowable);
          return;
        }
        catch (Throwable paramAnonymousThrowable)
        {
          paramSubscriber.onError(paramAnonymousThrowable);
        }
      }
      
      public void onNext(T paramAnonymousT)
      {
        if (done) {
          return;
        }
        try
        {
          doOnEachObserver.onNext(paramAnonymousT);
          paramSubscriber.onNext(paramAnonymousT);
          return;
        }
        catch (Throwable localThrowable)
        {
          onError(OnErrorThrowable.addValueAsLastCause(localThrowable, paramAnonymousT));
        }
      }
    };
  }
}
