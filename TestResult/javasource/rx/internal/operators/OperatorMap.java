package rx.internal.operators;

import rx.Observable.Operator;
import rx.Subscriber;
import rx.exceptions.Exceptions;
import rx.exceptions.OnErrorThrowable;
import rx.functions.Func1;

public final class OperatorMap<T, R>
  implements Observable.Operator<R, T>
{
  private final Func1<? super T, ? extends R> transformer;
  
  public OperatorMap(Func1<? super T, ? extends R> paramFunc1)
  {
    transformer = paramFunc1;
  }
  
  public Subscriber<? super T> call(final Subscriber<? super R> paramSubscriber)
  {
    new Subscriber(paramSubscriber)
    {
      public void onCompleted()
      {
        paramSubscriber.onCompleted();
      }
      
      public void onError(Throwable paramAnonymousThrowable)
      {
        paramSubscriber.onError(paramAnonymousThrowable);
      }
      
      public void onNext(T paramAnonymousT)
      {
        try
        {
          paramSubscriber.onNext(transformer.call(paramAnonymousT));
          return;
        }
        catch (Throwable localThrowable)
        {
          Exceptions.throwIfFatal(localThrowable);
          onError(OnErrorThrowable.addValueAsLastCause(localThrowable, paramAnonymousT));
        }
      }
    };
  }
}
