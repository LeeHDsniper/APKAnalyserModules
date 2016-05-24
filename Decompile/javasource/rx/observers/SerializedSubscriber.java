package rx.observers;

import rx.Observer;
import rx.Subscriber;

public class SerializedSubscriber<T>
  extends Subscriber<T>
{
  private final Observer<T> s;
  
  public SerializedSubscriber(Subscriber<? super T> paramSubscriber)
  {
    this(paramSubscriber, true);
  }
  
  public SerializedSubscriber(Subscriber<? super T> paramSubscriber, boolean paramBoolean)
  {
    super(paramSubscriber, paramBoolean);
    s = new SerializedObserver(paramSubscriber);
  }
  
  public void onCompleted()
  {
    s.onCompleted();
  }
  
  public void onError(Throwable paramThrowable)
  {
    s.onError(paramThrowable);
  }
  
  public void onNext(T paramT)
  {
    s.onNext(paramT);
  }
}
