package com.adobe.creativesdk.foundation.storage;

public class AdobeSelectionDrawAsset
  extends AdobeSelection
{
  AdobeAssetDrawFile selectedItem;
  int selectedPageIndex;
  
  public AdobeSelectionDrawAsset(AdobeAssetDrawFile paramAdobeAssetDrawFile, int paramInt)
  {
    selectedItem = paramAdobeAssetDrawFile;
    selectedPageIndex = paramInt;
  }
}
