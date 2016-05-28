package rx.internal.operators;

import rx.Observable.Operator;
import rx.Producer;
import rx.Subscriber;
import rx.functions.Action1;

public class OperatorDoOnRequest<T>
  implements Observable.Operator<T, T>
{
  private final Action1<Long> request;
  
  public OperatorDoOnRequest(Action1<Long> paramAction1)
  {
    request = paramAction1;
  }
  
  public Subscriber<? super T> call(Subscriber<? super T> paramSubscriber)
  {
    final ParentSubscriber localParentSubscriber = new ParentSubscriber(paramSubscriber, null);
    paramSubscriber.setProducer(new Producer()
    {
      public void request(long paramAnonymousLong)
      {
        request.call(Long.valueOf(paramAnonymousLong));
        OperatorDoOnRequest.ParentSubscriber.access$200(localParentSubscriber, paramAnonymousLong);
      }
    });
    paramSubscriber.add(localParentSubscriber);
    return localParentSubscriber;
  }
  
  private static final class ParentSubscriber<T>
    extends Subscriber<T>
  {
    private final Subscriber<? super T> child;
    
    private ParentSubscriber(Subscriber<? super T> paramSubscriber)
    {
      child = paramSubscriber;
    }
    
    private void requestMore(long paramLong)
    {
      request(paramLong);
    }
    
    public void onCompleted()
    {
      child.onCompleted();
    }
    
    public void onError(Throwable paramThrowable)
    {
      child.onError(paramThrowable);
    }
    
    public void onNext(T paramT)
    {
      child.onNext(paramT);
    }
  }
}
