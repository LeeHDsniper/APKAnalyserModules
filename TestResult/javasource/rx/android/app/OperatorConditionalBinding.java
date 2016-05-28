package rx.android.app;

import android.util.Log;
import rx.Observable.Operator;
import rx.Subscriber;
import rx.android.internal.Assertions;
import rx.functions.Func1;

final class OperatorConditionalBinding<T, R>
  implements Observable.Operator<T, T>
{
  private R boundRef;
  private final Func1<? super R, Boolean> predicate;
  
  public OperatorConditionalBinding(R paramR, Func1<? super R, Boolean> paramFunc1)
  {
    boundRef = paramR;
    predicate = paramFunc1;
  }
  
  public Subscriber<? super T> call(final Subscriber<? super T> paramSubscriber)
  {
    new Subscriber(paramSubscriber)
    {
      private void handleLostBinding(String paramAnonymousString)
      {
        log("bound object has become invalid; skipping " + paramAnonymousString);
        log("unsubscribing...");
        OperatorConditionalBinding.access$002(OperatorConditionalBinding.this, null);
        unsubscribe();
      }
      
      private void log(String paramAnonymousString)
      {
        if (Log.isLoggable("ConditionalBinding", 3)) {
          Log.d("ConditionalBinding", paramAnonymousString);
        }
      }
      
      private boolean shouldForwardNotification()
      {
        return (boundRef != null) && (((Boolean)predicate.call(boundRef)).booleanValue());
      }
      
      public void onCompleted()
      {
        
        if (shouldForwardNotification())
        {
          paramSubscriber.onCompleted();
          return;
        }
        handleLostBinding("onCompleted");
      }
      
      public void onError(Throwable paramAnonymousThrowable)
      {
        
        if (shouldForwardNotification())
        {
          paramSubscriber.onError(paramAnonymousThrowable);
          return;
        }
        handleLostBinding("onError");
      }
      
      public void onNext(T paramAnonymousT)
      {
        
        if (shouldForwardNotification())
        {
          paramSubscriber.onNext(paramAnonymousT);
          return;
        }
        handleLostBinding("onNext");
      }
    };
  }
}
