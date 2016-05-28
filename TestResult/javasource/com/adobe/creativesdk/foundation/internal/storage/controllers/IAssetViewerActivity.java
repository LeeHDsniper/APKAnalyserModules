package com.adobe.creativesdk.foundation.internal.storage.controllers;

public abstract interface IAssetViewerActivity
{
  public abstract int fetchCurrentPageIndex();
  
  public abstract void handleAssetCollectionChanged();
  
  public abstract void handleAssetSelectionChanged();
  
  public abstract void hideOrShowActionsBar();
  
  public abstract void showActionsBar();
}
