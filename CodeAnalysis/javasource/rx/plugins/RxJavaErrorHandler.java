package rx.plugins;

import rx.exceptions.Exceptions;

public abstract class RxJavaErrorHandler
{
  public RxJavaErrorHandler() {}
  
  public void handleError(Throwable paramThrowable) {}
  
  public final String handleOnNextValueRendering(Object paramObject)
  {
    try
    {
      String str = render(paramObject);
      return str;
    }
    catch (InterruptedException localInterruptedException)
    {
      Thread.currentThread().interrupt();
      return paramObject.getClass().getName() + ".errorRendering";
    }
    catch (Throwable localThrowable)
    {
      for (;;)
      {
        Exceptions.throwIfFatal(localThrowable);
      }
    }
  }
  
  protected String render(Object paramObject)
    throws InterruptedException
  {
    return null;
  }
}
