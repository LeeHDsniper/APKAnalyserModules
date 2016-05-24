package rx;

import java.util.Arrays;
import java.util.concurrent.TimeUnit;
import rx.exceptions.Exceptions;
import rx.exceptions.OnErrorNotImplementedException;
import rx.functions.Action0;
import rx.functions.Action1;
import rx.functions.Func1;
import rx.functions.Func2;
import rx.internal.operators.OnSubscribeFromIterable;
import rx.internal.operators.OperatorCast;
import rx.internal.operators.OperatorConcat;
import rx.internal.operators.OperatorDelay;
import rx.internal.operators.OperatorDoOnEach;
import rx.internal.operators.OperatorDoOnRequest;
import rx.internal.operators.OperatorElementAt;
import rx.internal.operators.OperatorMap;
import rx.internal.operators.OperatorMerge;
import rx.internal.operators.OperatorObserveOn;
import rx.internal.operators.OperatorSubscribeOn;
import rx.internal.operators.OperatorZip;
import rx.internal.util.ScalarSynchronousObservable;
import rx.observers.SafeSubscriber;
import rx.plugins.RxJavaObservableExecutionHook;
import rx.plugins.RxJavaPlugins;
import rx.schedulers.Schedulers;
import rx.subscriptions.Subscriptions;

public class Observable<T>
{
  private static final Observable<Object> EMPTY = create(new OnSubscribe()
  {
    public void call(Subscriber<? super Object> paramAnonymousSubscriber)
    {
      paramAnonymousSubscriber.onCompleted();
    }
  });
  private static final RxJavaObservableExecutionHook hook = RxJavaPlugins.getInstance().getObservableExecutionHook();
  final OnSubscribe<T> onSubscribe;
  
  protected Observable(OnSubscribe<T> paramOnSubscribe)
  {
    onSubscribe = paramOnSubscribe;
  }
  
  public static final <T> Observable<T> concat(Observable<? extends Observable<? extends T>> paramObservable)
  {
    return paramObservable.lift(OperatorConcat.instance());
  }
  
  public static final <T> Observable<T> concat(Observable<? extends T> paramObservable1, Observable<? extends T> paramObservable2)
  {
    return concat(just(paramObservable1, paramObservable2));
  }
  
  public static final <T> Observable<T> create(OnSubscribe<T> paramOnSubscribe)
  {
    return new Observable(hook.onCreate(paramOnSubscribe));
  }
  
  public static final <T> Observable<T> from(Iterable<? extends T> paramIterable)
  {
    return create(new OnSubscribeFromIterable(paramIterable));
  }
  
  public static final <T> Observable<T> just(T paramT)
  {
    return ScalarSynchronousObservable.create(paramT);
  }
  
  public static final <T> Observable<T> just(T paramT1, T paramT2)
  {
    return from(Arrays.asList(new Object[] { paramT1, paramT2 }));
  }
  
  public static final <T> Observable<T> merge(Observable<? extends Observable<? extends T>> paramObservable)
  {
    return paramObservable.lift(OperatorMerge.instance(false));
  }
  
  public static final <T1, T2, R> Observable<R> zip(Observable<? extends T1> paramObservable, Observable<? extends T2> paramObservable1, Func2<? super T1, ? super T2, ? extends R> paramFunc2)
  {
    return just(new Observable[] { paramObservable, paramObservable1 }).lift(new OperatorZip(paramFunc2));
  }
  
  public final <R> Observable<R> cast(Class<R> paramClass)
  {
    return lift(new OperatorCast(paramClass));
  }
  
  public final <R> Observable<R> concatMap(Func1<? super T, ? extends Observable<? extends R>> paramFunc1)
  {
    return concat(map(paramFunc1));
  }
  
  public final Observable<T> delay(long paramLong, TimeUnit paramTimeUnit)
  {
    return delay(paramLong, paramTimeUnit, Schedulers.computation());
  }
  
  public final Observable<T> delay(long paramLong, TimeUnit paramTimeUnit, Scheduler paramScheduler)
  {
    return lift(new OperatorDelay(this, paramLong, paramTimeUnit, paramScheduler));
  }
  
  public final Observable<T> doOnError(final Action1<Throwable> paramAction1)
  {
    lift(new OperatorDoOnEach(new Observer()
    {
      public final void onCompleted() {}
      
      public final void onError(Throwable paramAnonymousThrowable)
      {
        paramAction1.call(paramAnonymousThrowable);
      }
      
      public final void onNext(T paramAnonymousT) {}
    }));
  }
  
  public final Observable<T> doOnNext(final Action1<? super T> paramAction1)
  {
    lift(new OperatorDoOnEach(new Observer()
    {
      public final void onCompleted() {}
      
      public final void onError(Throwable paramAnonymousThrowable) {}
      
      public final void onNext(T paramAnonymousT)
      {
        paramAction1.call(paramAnonymousT);
      }
    }));
  }
  
  public final Observable<T> doOnRequest(Action1<Long> paramAction1)
  {
    return lift(new OperatorDoOnRequest(paramAction1));
  }
  
  public final Observable<T> elementAt(int paramInt)
  {
    return lift(new OperatorElementAt(paramInt));
  }
  
  public final <R> Observable<R> flatMap(Func1<? super T, ? extends Observable<? extends R>> paramFunc1)
  {
    return merge(map(paramFunc1));
  }
  
  public final <R> Observable<R> lift(final Operator<? extends R, ? super T> paramOperator)
  {
    new Observable(new OnSubscribe()
    {
      public void call(Subscriber<? super R> paramAnonymousSubscriber)
      {
        try
        {
          Subscriber localSubscriber = (Subscriber)Observable.hook.onLift(paramOperator).call(paramAnonymousSubscriber);
          try
          {
            localSubscriber.onStart();
            onSubscribe.call(localSubscriber);
            return;
          }
          catch (Throwable localThrowable2)
          {
            if (!(localThrowable2 instanceof OnErrorNotImplementedException)) {
              break label64;
            }
          }
          throw ((OnErrorNotImplementedException)localThrowable2);
        }
        catch (Throwable localThrowable1)
        {
          if ((localThrowable1 instanceof OnErrorNotImplementedException))
          {
            throw ((OnErrorNotImplementedException)localThrowable1);
            label64:
            localThrowable1.onError(localThrowable2);
            return;
          }
          paramAnonymousSubscriber.onError(localThrowable1);
        }
      }
    });
  }
  
  public final <R> Observable<R> map(Func1<? super T, ? extends R> paramFunc1)
  {
    return lift(new OperatorMap(paramFunc1));
  }
  
  public final Observable<Observable<T>> nest()
  {
    return just(this);
  }
  
  public final Observable<T> observeOn(Scheduler paramScheduler)
  {
    if ((this instanceof ScalarSynchronousObservable)) {
      return ((ScalarSynchronousObservable)this).scalarScheduleOn(paramScheduler);
    }
    return lift(new OperatorObserveOn(paramScheduler));
  }
  
  public final Subscription subscribe()
  {
    subscribe(new Subscriber()
    {
      public final void onCompleted() {}
      
      public final void onError(Throwable paramAnonymousThrowable)
      {
        throw new OnErrorNotImplementedException(paramAnonymousThrowable);
      }
      
      public final void onNext(T paramAnonymousT) {}
    });
  }
  
  public final Subscription subscribe(Subscriber<? super T> paramSubscriber)
  {
    if (paramSubscriber == null) {
      throw new IllegalArgumentException("observer can not be null");
    }
    if (onSubscribe == null) {
      throw new IllegalStateException("onSubscribe function can not be null.");
    }
    paramSubscriber.onStart();
    Object localObject = paramSubscriber;
    if (!(paramSubscriber instanceof SafeSubscriber)) {
      localObject = new SafeSubscriber(paramSubscriber);
    }
    try
    {
      hook.onSubscribeStart(this, onSubscribe).call(localObject);
      paramSubscriber = hook.onSubscribeReturn((Subscription)localObject);
      return paramSubscriber;
    }
    catch (Throwable paramSubscriber)
    {
      Exceptions.throwIfFatal(paramSubscriber);
      try
      {
        ((Subscriber)localObject).onError(hook.onSubscribeError(paramSubscriber));
        return Subscriptions.unsubscribed();
      }
      catch (OnErrorNotImplementedException paramSubscriber)
      {
        throw paramSubscriber;
      }
      catch (Throwable localThrowable)
      {
        paramSubscriber = new RuntimeException("Error occurred attempting to subscribe [" + paramSubscriber.getMessage() + "] and then again while trying to pass to onError.", localThrowable);
        hook.onSubscribeError(paramSubscriber);
        throw paramSubscriber;
      }
    }
  }
  
  public final Subscription subscribe(final Action1<? super T> paramAction1)
  {
    if (paramAction1 == null) {
      throw new IllegalArgumentException("onNext can not be null");
    }
    subscribe(new Subscriber()
    {
      public final void onCompleted() {}
      
      public final void onError(Throwable paramAnonymousThrowable)
      {
        throw new OnErrorNotImplementedException(paramAnonymousThrowable);
      }
      
      public final void onNext(T paramAnonymousT)
      {
        paramAction1.call(paramAnonymousT);
      }
    });
  }
  
  public final Subscription subscribe(final Action1<? super T> paramAction1, final Action1<Throwable> paramAction11)
  {
    if (paramAction1 == null) {
      throw new IllegalArgumentException("onNext can not be null");
    }
    if (paramAction11 == null) {
      throw new IllegalArgumentException("onError can not be null");
    }
    subscribe(new Subscriber()
    {
      public final void onCompleted() {}
      
      public final void onError(Throwable paramAnonymousThrowable)
      {
        paramAction11.call(paramAnonymousThrowable);
      }
      
      public final void onNext(T paramAnonymousT)
      {
        paramAction1.call(paramAnonymousT);
      }
    });
  }
  
  public final Subscription subscribe(final Action1<? super T> paramAction1, final Action1<Throwable> paramAction11, final Action0 paramAction0)
  {
    if (paramAction1 == null) {
      throw new IllegalArgumentException("onNext can not be null");
    }
    if (paramAction11 == null) {
      throw new IllegalArgumentException("onError can not be null");
    }
    if (paramAction0 == null) {
      throw new IllegalArgumentException("onComplete can not be null");
    }
    subscribe(new Subscriber()
    {
      public final void onCompleted()
      {
        paramAction0.call();
      }
      
      public final void onError(Throwable paramAnonymousThrowable)
      {
        paramAction11.call(paramAnonymousThrowable);
      }
      
      public final void onNext(T paramAnonymousT)
      {
        paramAction1.call(paramAnonymousT);
      }
    });
  }
  
  public final Observable<T> subscribeOn(Scheduler paramScheduler)
  {
    if ((this instanceof ScalarSynchronousObservable)) {
      return ((ScalarSynchronousObservable)this).scalarScheduleOn(paramScheduler);
    }
    return nest().lift(new OperatorSubscribeOn(paramScheduler));
  }
  
  public final Subscription unsafeSubscribe(Subscriber<? super T> paramSubscriber)
  {
    try
    {
      paramSubscriber.onStart();
      hook.onSubscribeStart(this, onSubscribe).call(paramSubscriber);
      Subscription localSubscription = hook.onSubscribeReturn(paramSubscriber);
      return localSubscription;
    }
    catch (Throwable localThrowable)
    {
      Exceptions.throwIfFatal(localThrowable);
      try
      {
        paramSubscriber.onError(hook.onSubscribeError(localThrowable));
        return Subscriptions.unsubscribed();
      }
      catch (OnErrorNotImplementedException paramSubscriber)
      {
        throw paramSubscriber;
      }
      catch (Throwable paramSubscriber)
      {
        paramSubscriber = new RuntimeException("Error occurred attempting to subscribe [" + localThrowable.getMessage() + "] and then again while trying to pass to onError.", paramSubscriber);
        hook.onSubscribeError(paramSubscriber);
        throw paramSubscriber;
      }
    }
  }
  
  public static abstract interface OnSubscribe<T>
    extends Action1<Subscriber<? super T>>
  {}
  
  public static abstract interface Operator<R, T>
    extends Func1<Subscriber<? super R>, Subscriber<? super T>>
  {}
}
