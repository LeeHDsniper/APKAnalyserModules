package com.adobe.creativesdk.foundation.storage;

public class AdobeSelectionPSMixFile
  extends AdobeSelection
{
  AdobeAssetPSMixFile selectedItem;
  int selectedPageIndex;
  
  public AdobeSelectionPSMixFile(AdobeAssetPSMixFile paramAdobeAssetPSMixFile, int paramInt)
  {
    selectedItem = paramAdobeAssetPSMixFile;
    selectedPageIndex = paramInt;
  }
}
