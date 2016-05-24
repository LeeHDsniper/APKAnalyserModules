package com.adobe.creativesdk.aviary.internal.events;

public class ControllerStateChangedEvent
{
  public final int newState;
  public final int oldState;
  
  public ControllerStateChangedEvent(int paramInt1, int paramInt2)
  {
    newState = paramInt1;
    oldState = paramInt2;
  }
}
