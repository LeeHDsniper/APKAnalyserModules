package rx.observers;

import java.io.PrintStream;
import java.util.Arrays;
import rx.Subscriber;
import rx.exceptions.CompositeException;
import rx.exceptions.Exceptions;
import rx.exceptions.OnErrorFailedException;
import rx.exceptions.OnErrorNotImplementedException;
import rx.plugins.RxJavaErrorHandler;
import rx.plugins.RxJavaPlugins;

public class SafeSubscriber<T>
  extends Subscriber<T>
{
  private final Subscriber<? super T> actual;
  boolean done = false;
  
  public SafeSubscriber(Subscriber<? super T> paramSubscriber)
  {
    super(paramSubscriber);
    actual = paramSubscriber;
  }
  
  private void handlePluginException(Throwable paramThrowable)
  {
    System.err.println("RxJavaErrorHandler threw an Exception. It shouldn't. => " + paramThrowable.getMessage());
    paramThrowable.printStackTrace();
  }
  
  protected void _onError(Throwable paramThrowable)
  {
    try
    {
      RxJavaPlugins.getInstance().getErrorHandler().handleError(paramThrowable);
    }
    catch (Throwable localThrowable6)
    {
      for (;;)
      {
        try
        {
          actual.onError(paramThrowable);
        }
        catch (Throwable localThrowable2)
        {
          if ((localThrowable2 instanceof OnErrorNotImplementedException))
          {
            try
            {
              unsubscribe();
              throw ((OnErrorNotImplementedException)localThrowable2);
            }
            catch (Throwable localThrowable3) {}
            try
            {
              RxJavaPlugins.getInstance().getErrorHandler().handleError(localThrowable3);
              throw new RuntimeException("Observer.onError not implemented and error while unsubscribing.", new CompositeException(Arrays.asList(new Throwable[] { paramThrowable, localThrowable3 })));
            }
            catch (Throwable localThrowable5)
            {
              handlePluginException(localThrowable5);
              continue;
            }
          }
          try
          {
            RxJavaPlugins.getInstance().getErrorHandler().handleError(localThrowable3);
          }
          catch (Throwable localThrowable6)
          {
            try
            {
              unsubscribe();
              throw new OnErrorFailedException("Error occurred when trying to propagate error to Observer.onError", new CompositeException(Arrays.asList(new Throwable[] { paramThrowable, localThrowable3 })));
            }
            catch (Throwable localThrowable7)
            {
              try
              {
                RxJavaPlugins.getInstance().getErrorHandler().handleError(localThrowable7);
                throw new OnErrorFailedException("Error occurred when trying to propagate error to Observer.onError and during unsubscription.", new CompositeException(Arrays.asList(new Throwable[] { paramThrowable, localThrowable3, localThrowable7 })));
              }
              catch (Throwable localThrowable8)
              {
                for (;;)
                {
                  handlePluginException(localThrowable8);
                }
              }
            }
            localThrowable6 = localThrowable6;
            handlePluginException(localThrowable6);
            continue;
          }
        }
        try
        {
          unsubscribe();
          return;
        }
        catch (RuntimeException paramThrowable) {}
        localThrowable1 = localThrowable1;
        handlePluginException(localThrowable1);
      }
    }
    try
    {
      RxJavaPlugins.getInstance().getErrorHandler().handleError(paramThrowable);
      throw new OnErrorFailedException(paramThrowable);
    }
    catch (Throwable localThrowable4)
    {
      for (;;)
      {
        handlePluginException(localThrowable4);
      }
    }
  }
  
  public void onCompleted()
  {
    if (!done) {
      done = true;
    }
    try
    {
      actual.onCompleted();
      return;
    }
    catch (Throwable localThrowable)
    {
      Exceptions.throwIfFatal(localThrowable);
      _onError(localThrowable);
      return;
    }
    finally
    {
      unsubscribe();
    }
  }
  
  public void onError(Throwable paramThrowable)
  {
    Exceptions.throwIfFatal(paramThrowable);
    if (!done)
    {
      done = true;
      _onError(paramThrowable);
    }
  }
  
  public void onNext(T paramT)
  {
    try
    {
      if (!done) {
        actual.onNext(paramT);
      }
      return;
    }
    catch (Throwable paramT)
    {
      Exceptions.throwIfFatal(paramT);
      onError(paramT);
    }
  }
}
