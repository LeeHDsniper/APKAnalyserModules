package com.tencent.beacon.upload;

public abstract interface InitHandleListener
{
  public abstract void onInitEnd();
  
  public abstract void onStrategyQuerySuccess();
}
