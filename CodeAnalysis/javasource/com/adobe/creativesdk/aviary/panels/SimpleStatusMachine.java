package com.adobe.creativesdk.aviary.panels;

public class SimpleStatusMachine
{
  private int currentStatus = -1;
  private OnStatusChangeListener mStatusListener;
  private int previousStatus = -1;
  
  public SimpleStatusMachine() {}
  
  public int getCurrentStatus()
  {
    return currentStatus;
  }
  
  public int getPreviousStatus()
  {
    return previousStatus;
  }
  
  public void setOnStatusChangeListener(OnStatusChangeListener paramOnStatusChangeListener)
  {
    mStatusListener = paramOnStatusChangeListener;
  }
  
  public void setStatus(int paramInt)
  {
    if (paramInt != currentStatus)
    {
      previousStatus = currentStatus;
      currentStatus = paramInt;
      if (mStatusListener != null) {
        mStatusListener.onStatusChanged(previousStatus, currentStatus);
      }
    }
    while (mStatusListener == null) {
      return;
    }
    mStatusListener.onStatusUpdated(paramInt);
  }
  
  public static abstract interface OnStatusChangeListener
  {
    public abstract void onStatusChanged(int paramInt1, int paramInt2);
    
    public abstract void onStatusUpdated(int paramInt);
  }
}
