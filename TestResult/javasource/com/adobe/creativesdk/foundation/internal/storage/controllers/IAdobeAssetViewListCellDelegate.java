package com.adobe.creativesdk.foundation.internal.storage.controllers;

public abstract interface IAdobeAssetViewListCellDelegate
{
  public abstract boolean getSelectionOverallVisibility();
  
  public abstract void handleAssetCellSelectionToggle(AdobeAssetViewListBaseCellView paramAdobeAssetViewListBaseCellView);
}
