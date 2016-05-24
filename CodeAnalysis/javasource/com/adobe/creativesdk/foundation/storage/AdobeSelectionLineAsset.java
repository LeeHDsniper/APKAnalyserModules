package com.adobe.creativesdk.foundation.storage;

public class AdobeSelectionLineAsset
  extends AdobeSelection
{
  AdobeAssetLineFile selectedItem;
  int selectedPageIndex;
  
  public AdobeSelectionLineAsset(AdobeAssetLineFile paramAdobeAssetLineFile, int paramInt)
  {
    selectedItem = paramAdobeAssetLineFile;
    selectedPageIndex = paramInt;
  }
}
