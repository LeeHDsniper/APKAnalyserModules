package rx;

public abstract interface Subscription
{
  public abstract boolean isUnsubscribed();
  
  public abstract void unsubscribe();
}
