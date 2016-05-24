package de.greenrobot.event;

public final class SubscriberExceptionEvent
{
  public final Object causingEvent;
  public final Object causingSubscriber;
  public final EventBus eventBus;
  public final Throwable throwable;
  
  public SubscriberExceptionEvent(EventBus paramEventBus, Throwable paramThrowable, Object paramObject1, Object paramObject2)
  {
    eventBus = paramEventBus;
    throwable = paramThrowable;
    causingEvent = paramObject1;
    causingSubscriber = paramObject2;
  }
}
