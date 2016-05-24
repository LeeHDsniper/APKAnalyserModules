package rx.subscriptions;

import rx.Subscription;
import rx.functions.Action0;

public final class Subscriptions
{
  private static final Unsubscribed UNSUBSCRIBED = new Unsubscribed(null);
  
  public static Subscription create(Action0 paramAction0)
  {
    return BooleanSubscription.create(paramAction0);
  }
  
  public static Subscription empty()
  {
    return BooleanSubscription.create();
  }
  
  public static Subscription unsubscribed()
  {
    return UNSUBSCRIBED;
  }
  
  private static final class Unsubscribed
    implements Subscription
  {
    private Unsubscribed() {}
    
    public boolean isUnsubscribed()
    {
      return true;
    }
    
    public void unsubscribe() {}
  }
}
