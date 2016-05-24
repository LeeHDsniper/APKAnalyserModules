package com.adobe.creativesdk.foundation.storage;

public class AdobeSelectionCompFile
  extends AdobeSelection
{
  AdobeAssetCompFile selectedItem;
  int selectedPageIndex;
  
  public AdobeSelectionCompFile(AdobeAssetCompFile paramAdobeAssetCompFile, int paramInt)
  {
    selectedItem = paramAdobeAssetCompFile;
    selectedPageIndex = paramInt;
  }
}
