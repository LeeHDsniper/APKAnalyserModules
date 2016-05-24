package rx.subjects;

import rx.Observable;
import rx.Observable.OnSubscribe;
import rx.Observer;

public abstract class Subject<T, R>
  extends Observable<R>
  implements Observer<T>
{
  private static final Object[] EMPTY_ARRAY = new Object[0];
  
  protected Subject(Observable.OnSubscribe<R> paramOnSubscribe)
  {
    super(paramOnSubscribe);
  }
}
