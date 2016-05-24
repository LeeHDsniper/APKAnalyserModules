package rx.internal.operators;

import java.io.Serializable;
import rx.Observer;

public final class NotificationLite<T>
{
  private static final NotificationLite INSTANCE = new NotificationLite();
  private static final Object ON_COMPLETED_SENTINEL = new Serializable()
  {
    private static final long serialVersionUID = 1L;
    
    public String toString()
    {
      return "Notification=>Completed";
    }
  };
  private static final Object ON_NEXT_NULL_SENTINEL = new Serializable()
  {
    private static final long serialVersionUID = 2L;
    
    public String toString()
    {
      return "Notification=>NULL";
    }
  };
  
  private NotificationLite() {}
  
  public static <T> NotificationLite<T> instance()
  {
    return INSTANCE;
  }
  
  public boolean accept(Observer<? super T> paramObserver, Object paramObject)
  {
    if (paramObject == ON_COMPLETED_SENTINEL)
    {
      paramObserver.onCompleted();
      return true;
    }
    if (paramObject == ON_NEXT_NULL_SENTINEL)
    {
      paramObserver.onNext(null);
      return false;
    }
    if (paramObject != null)
    {
      if (paramObject.getClass() == OnErrorSentinel.class)
      {
        paramObserver.onError(e);
        return true;
      }
      paramObserver.onNext(paramObject);
      return false;
    }
    throw new IllegalArgumentException("The lite notification can not be null");
  }
  
  public Object completed()
  {
    return ON_COMPLETED_SENTINEL;
  }
  
  public Object error(Throwable paramThrowable)
  {
    return new OnErrorSentinel(paramThrowable);
  }
  
  public T getValue(Object paramObject)
  {
    Object localObject = paramObject;
    if (paramObject == ON_NEXT_NULL_SENTINEL) {
      localObject = null;
    }
    return localObject;
  }
  
  public boolean isCompleted(Object paramObject)
  {
    return paramObject == ON_COMPLETED_SENTINEL;
  }
  
  public Object next(T paramT)
  {
    Object localObject = paramT;
    if (paramT == null) {
      localObject = ON_NEXT_NULL_SENTINEL;
    }
    return localObject;
  }
  
  private static class OnErrorSentinel
    implements Serializable
  {
    private static final long serialVersionUID = 3L;
    private final Throwable e;
    
    public OnErrorSentinel(Throwable paramThrowable)
    {
      e = paramThrowable;
    }
    
    public String toString()
    {
      return "Notification=>Error:" + e;
    }
  }
}
