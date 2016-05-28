package rx;

import rx.internal.util.SubscriptionList;

public abstract class Subscriber<T>
  implements Observer<T>, Subscription
{
  private final SubscriptionList cs;
  private final Subscriber<?> op;
  private Producer p;
  private long requested = Long.MIN_VALUE;
  
  protected Subscriber()
  {
    this(null, false);
  }
  
  protected Subscriber(Subscriber<?> paramSubscriber)
  {
    this(paramSubscriber, true);
  }
  
  protected Subscriber(Subscriber<?> paramSubscriber, boolean paramBoolean)
  {
    op = paramSubscriber;
    if ((paramBoolean) && (paramSubscriber != null)) {}
    for (paramSubscriber = cs;; paramSubscriber = new SubscriptionList())
    {
      cs = paramSubscriber;
      return;
    }
  }
  
  public final void add(Subscription paramSubscription)
  {
    cs.add(paramSubscription);
  }
  
  public final boolean isUnsubscribed()
  {
    return cs.isUnsubscribed();
  }
  
  public void onStart() {}
  
  protected final void request(long paramLong)
  {
    if (paramLong < 0L) {
      throw new IllegalArgumentException("number requested cannot be negative: " + paramLong);
    }
    Producer localProducer = null;
    for (;;)
    {
      try
      {
        if (p != null)
        {
          localProducer = p;
          if (localProducer != null) {
            localProducer.request(paramLong);
          }
          return;
        }
        if (requested == Long.MIN_VALUE)
        {
          requested = paramLong;
          continue;
        }
        l = requested + paramLong;
      }
      finally {}
      long l;
      if (l < 0L) {
        requested = Long.MAX_VALUE;
      } else {
        requested = l;
      }
    }
  }
  
  public void setProducer(Producer paramProducer)
  {
    int j = 0;
    long l;
    try
    {
      l = requested;
      p = paramProducer;
      int i = j;
      if (op != null)
      {
        i = j;
        if (l == Long.MIN_VALUE) {
          i = 1;
        }
      }
      if (i != 0)
      {
        op.setProducer(p);
        return;
      }
    }
    finally {}
    if (l == Long.MIN_VALUE)
    {
      p.request(Long.MAX_VALUE);
      return;
    }
    p.request(l);
  }
  
  public final void unsubscribe()
  {
    cs.unsubscribe();
  }
}
