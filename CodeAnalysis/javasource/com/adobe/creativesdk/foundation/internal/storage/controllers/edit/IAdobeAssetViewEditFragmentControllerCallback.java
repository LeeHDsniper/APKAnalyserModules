package com.adobe.creativesdk.foundation.internal.storage.controllers.edit;

public abstract interface IAdobeAssetViewEditFragmentControllerCallback
{
  public abstract void handleMultipleAssetSelection(int paramInt);
  
  public abstract void handleNoAssetSelection();
  
  public abstract void handleSingleAssetSelection();
}
