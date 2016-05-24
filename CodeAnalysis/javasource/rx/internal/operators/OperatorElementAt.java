package rx.internal.operators;

import rx.Observable.Operator;
import rx.Subscriber;

public final class OperatorElementAt<T>
  implements Observable.Operator<T, T>
{
  private final T defaultValue;
  private final boolean hasDefault;
  private final int index;
  
  public OperatorElementAt(int paramInt)
  {
    this(paramInt, null, false);
  }
  
  private OperatorElementAt(int paramInt, T paramT, boolean paramBoolean)
  {
    if (paramInt < 0) {
      throw new IndexOutOfBoundsException(paramInt + " is out of bounds");
    }
    index = paramInt;
    defaultValue = paramT;
    hasDefault = paramBoolean;
  }
  
  public Subscriber<? super T> call(final Subscriber<? super T> paramSubscriber)
  {
    new Subscriber(paramSubscriber)
    {
      private int currentIndex = 0;
      
      public void onCompleted()
      {
        if (currentIndex <= index)
        {
          if (hasDefault)
          {
            paramSubscriber.onNext(defaultValue);
            paramSubscriber.onCompleted();
          }
        }
        else {
          return;
        }
        paramSubscriber.onError(new IndexOutOfBoundsException(index + " is out of bounds"));
      }
      
      public void onError(Throwable paramAnonymousThrowable)
      {
        paramSubscriber.onError(paramAnonymousThrowable);
      }
      
      public void onNext(T paramAnonymousT)
      {
        if (currentIndex == index)
        {
          paramSubscriber.onNext(paramAnonymousT);
          paramSubscriber.onCompleted();
        }
        for (;;)
        {
          currentIndex += 1;
          return;
          request(1L);
        }
      }
    };
  }
}
