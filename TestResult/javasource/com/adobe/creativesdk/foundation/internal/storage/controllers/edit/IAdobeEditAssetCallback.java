package com.adobe.creativesdk.foundation.internal.storage.controllers.edit;

public abstract interface IAdobeEditAssetCallback
{
  public abstract void onAbort();
  
  public abstract void onComplete();
  
  public abstract void onProgress(double paramDouble);
}
