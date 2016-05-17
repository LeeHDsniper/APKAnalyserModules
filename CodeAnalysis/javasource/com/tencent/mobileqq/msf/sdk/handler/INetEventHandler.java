package com.tencent.mobileqq.msf.sdk.handler;

public abstract interface INetEventHandler
  extends IMsfHandler
{
  public abstract void onNetChangeEvent(boolean paramBoolean);
}
