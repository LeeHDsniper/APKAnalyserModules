package com.tencent.mobileqq.msf.sdk.handler;

public abstract interface INetInfoHandler
  extends IMsfHandler
{
  public abstract void onNetMobile2None();
  
  public abstract void onNetMobile2Wifi(String paramString);
  
  public abstract void onNetNone2Mobile(String paramString);
  
  public abstract void onNetNone2Wifi(String paramString);
  
  public abstract void onNetWifi2Mobile(String paramString);
  
  public abstract void onNetWifi2None();
}
