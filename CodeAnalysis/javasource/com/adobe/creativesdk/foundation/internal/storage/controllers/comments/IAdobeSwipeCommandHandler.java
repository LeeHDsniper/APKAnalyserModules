package com.adobe.creativesdk.foundation.internal.storage.controllers.comments;

public abstract interface IAdobeSwipeCommandHandler
{
  public abstract boolean canSwipe();
  
  public abstract void handleDeleteVisibility(boolean paramBoolean1, boolean paramBoolean2);
  
  public abstract boolean isSwiping();
  
  public abstract boolean isVisible();
  
  public abstract void startedSwiping();
  
  public abstract void stoppedSwiping();
}
