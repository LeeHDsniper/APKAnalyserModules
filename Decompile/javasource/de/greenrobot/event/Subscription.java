package de.greenrobot.event;

final class Subscription
{
  volatile boolean active;
  final int priority;
  final Object subscriber;
  final SubscriberMethod subscriberMethod;
  
  Subscription(Object paramObject, SubscriberMethod paramSubscriberMethod, int paramInt)
  {
    subscriber = paramObject;
    subscriberMethod = paramSubscriberMethod;
    priority = paramInt;
    active = true;
  }
  
  public boolean equals(Object paramObject)
  {
    boolean bool2 = false;
    boolean bool1 = bool2;
    if ((paramObject instanceof Subscription))
    {
      paramObject = (Subscription)paramObject;
      bool1 = bool2;
      if (subscriber == subscriber)
      {
        bool1 = bool2;
        if (subscriberMethod.equals(subscriberMethod)) {
          bool1 = true;
        }
      }
    }
    return bool1;
  }
  
  public int hashCode()
  {
    return subscriber.hashCode() + subscriberMethod.methodString.hashCode();
  }
}
