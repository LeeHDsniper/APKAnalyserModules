package rx.subscriptions;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import rx.Subscription;
import rx.exceptions.Exceptions;

public final class CompositeSubscription
  implements Subscription
{
  private Set<Subscription> subscriptions;
  private volatile boolean unsubscribed;
  
  public CompositeSubscription() {}
  
  private static void unsubscribeFromAll(Collection<Subscription> paramCollection)
  {
    if (paramCollection == null) {
      return;
    }
    Object localObject = null;
    Iterator localIterator = paramCollection.iterator();
    paramCollection = (Collection<Subscription>)localObject;
    while (localIterator.hasNext())
    {
      localObject = (Subscription)localIterator.next();
      try
      {
        ((Subscription)localObject).unsubscribe();
      }
      catch (Throwable localThrowable)
      {
        localObject = paramCollection;
        if (paramCollection == null) {
          localObject = new ArrayList();
        }
        ((List)localObject).add(localThrowable);
        paramCollection = (Collection<Subscription>)localObject;
      }
    }
    Exceptions.throwIfAny(paramCollection);
  }
  
  public void add(Subscription paramSubscription)
  {
    if (paramSubscription.isUnsubscribed()) {
      return;
    }
    if (!unsubscribed) {
      try
      {
        if (!unsubscribed)
        {
          if (subscriptions == null) {
            subscriptions = new HashSet(4);
          }
          subscriptions.add(paramSubscription);
          return;
        }
      }
      finally {}
    }
    paramSubscription.unsubscribe();
  }
  
  public void clear()
  {
    if (!unsubscribed) {
      try
      {
        if ((unsubscribed) || (subscriptions == null)) {
          return;
        }
        Set localSet = subscriptions;
        subscriptions = null;
        unsubscribeFromAll(localSet);
        return;
      }
      finally {}
    }
  }
  
  public boolean isUnsubscribed()
  {
    return unsubscribed;
  }
  
  public void remove(Subscription paramSubscription)
  {
    if (!unsubscribed) {
      try
      {
        if ((unsubscribed) || (subscriptions == null)) {
          return;
        }
        boolean bool = subscriptions.remove(paramSubscription);
        if (bool)
        {
          paramSubscription.unsubscribe();
          return;
        }
      }
      finally {}
    }
  }
  
  public void unsubscribe()
  {
    if (!unsubscribed) {
      try
      {
        if (unsubscribed) {
          return;
        }
        unsubscribed = true;
        Set localSet = subscriptions;
        subscriptions = null;
        unsubscribeFromAll(localSet);
        return;
      }
      finally {}
    }
  }
}
