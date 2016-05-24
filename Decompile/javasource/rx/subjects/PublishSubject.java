package rx.subjects;

import java.util.ArrayList;
import java.util.List;
import rx.Observable.OnSubscribe;
import rx.exceptions.Exceptions;
import rx.functions.Action1;
import rx.internal.operators.NotificationLite;

public final class PublishSubject<T>
  extends Subject<T, T>
{
  private final NotificationLite<T> nl = NotificationLite.instance();
  final SubjectSubscriptionManager<T> state;
  
  protected PublishSubject(Observable.OnSubscribe<T> paramOnSubscribe, SubjectSubscriptionManager<T> paramSubjectSubscriptionManager)
  {
    super(paramOnSubscribe);
    state = paramSubjectSubscriptionManager;
  }
  
  public static <T> PublishSubject<T> create()
  {
    SubjectSubscriptionManager localSubjectSubscriptionManager = new SubjectSubscriptionManager();
    onTerminated = new Action1()
    {
      public void call(SubjectSubscriptionManager.SubjectObserver<T> paramAnonymousSubjectObserver)
      {
        paramAnonymousSubjectObserver.emitFirst(val$state.get(), val$state.nl);
      }
    };
    return new PublishSubject(localSubjectSubscriptionManager, localSubjectSubscriptionManager);
  }
  
  public void onCompleted()
  {
    if (state.active)
    {
      Object localObject = nl.completed();
      SubjectSubscriptionManager.SubjectObserver[] arrayOfSubjectObserver = state.terminate(localObject);
      int j = arrayOfSubjectObserver.length;
      int i = 0;
      while (i < j)
      {
        arrayOfSubjectObserver[i].emitNext(localObject, state.nl);
        i += 1;
      }
    }
  }
  
  public void onError(Throwable paramThrowable)
  {
    if (state.active)
    {
      Object localObject2 = nl.error(paramThrowable);
      paramThrowable = null;
      SubjectSubscriptionManager.SubjectObserver[] arrayOfSubjectObserver = state.terminate(localObject2);
      int j = arrayOfSubjectObserver.length;
      int i = 0;
      for (;;)
      {
        if (i < j)
        {
          Object localObject1 = arrayOfSubjectObserver[i];
          try
          {
            ((SubjectSubscriptionManager.SubjectObserver)localObject1).emitNext(localObject2, state.nl);
            i += 1;
          }
          catch (Throwable localThrowable)
          {
            for (;;)
            {
              localObject1 = paramThrowable;
              if (paramThrowable == null) {
                localObject1 = new ArrayList();
              }
              ((List)localObject1).add(localThrowable);
              paramThrowable = (Throwable)localObject1;
            }
          }
        }
      }
      Exceptions.throwIfAny(paramThrowable);
    }
  }
  
  public void onNext(T paramT)
  {
    SubjectSubscriptionManager.SubjectObserver[] arrayOfSubjectObserver = state.observers();
    int j = arrayOfSubjectObserver.length;
    int i = 0;
    while (i < j)
    {
      arrayOfSubjectObserver[i].onNext(paramT);
      i += 1;
    }
  }
}
