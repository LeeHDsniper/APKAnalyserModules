package com.adobe.creativesdk.foundation.internal.storage.controllers.multipage;

public abstract interface IAdobeNoPreviewSizeHandler
{
  public abstract int getHeight();
  
  public abstract int getWidth();
  
  public abstract void setMeasurements(int paramInt1, int paramInt2);
}
