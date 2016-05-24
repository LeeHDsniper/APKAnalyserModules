package com.adobe.creativesdk.foundation.internal.storage.controllers.edit;

public abstract interface IAdobeCCFilesEditDelegate
{
  public abstract boolean getControllerState();
  
  public abstract void handleAssetSelectionToggle(int paramInt);
}
