package com.adobe.creativesdk.foundation.storage;

public class AdobeSelectionAssetFile
  extends AdobeSelectionAsset
{
  AdobeSelectionAssetFile(AdobeAssetFile paramAdobeAssetFile)
  {
    selectedItem = paramAdobeAssetFile;
  }
  
  public AdobeAssetFile getSelectedItem()
  {
    return (AdobeAssetFile)selectedItem;
  }
}
