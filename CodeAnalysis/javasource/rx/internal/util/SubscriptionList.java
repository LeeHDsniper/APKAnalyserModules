package rx.internal.util;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import rx.Subscription;
import rx.exceptions.Exceptions;

public final class SubscriptionList
  implements Subscription
{
  private LinkedList<Subscription> subscriptions;
  private volatile boolean unsubscribed;
  
  public SubscriptionList() {}
  
  public SubscriptionList(Subscription paramSubscription)
  {
    subscriptions = new LinkedList();
    subscriptions.add(paramSubscription);
  }
  
  public SubscriptionList(Subscription... paramVarArgs)
  {
    subscriptions = new LinkedList(Arrays.asList(paramVarArgs));
  }
  
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
          LinkedList localLinkedList2 = subscriptions;
          LinkedList localLinkedList1 = localLinkedList2;
          if (localLinkedList2 == null)
          {
            localLinkedList1 = new LinkedList();
            subscriptions = localLinkedList1;
          }
          localLinkedList1.add(paramSubscription);
          return;
        }
      }
      finally {}
    }
    paramSubscription.unsubscribe();
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
        LinkedList localLinkedList = subscriptions;
        if ((unsubscribed) || (localLinkedList == null)) {
          return;
        }
        boolean bool = localLinkedList.remove(paramSubscription);
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
        LinkedList localLinkedList = subscriptions;
        subscriptions = null;
        unsubscribeFromAll(localLinkedList);
        return;
      }
      finally {}
    }
  }
}
