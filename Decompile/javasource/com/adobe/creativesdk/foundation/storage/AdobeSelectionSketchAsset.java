package com.adobe.creativesdk.foundation.storage;

public class AdobeSelectionSketchAsset
  extends AdobeSelection
{
  AdobeAssetSketchbook selectedItem;
  int selectedPageIndex;
  
  public AdobeSelectionSketchAsset(AdobeAssetSketchbook paramAdobeAssetSketchbook, int paramInt)
  {
    selectedItem = paramAdobeAssetSketchbook;
    selectedPageIndex = paramInt;
  }
}
