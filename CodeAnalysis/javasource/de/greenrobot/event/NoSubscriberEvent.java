package de.greenrobot.event;

public final class NoSubscriberEvent
{
  public final EventBus eventBus;
  public final Object originalEvent;
  
  public NoSubscriberEvent(EventBus paramEventBus, Object paramObject)
  {
    eventBus = paramEventBus;
    originalEvent = paramObject;
  }
}
