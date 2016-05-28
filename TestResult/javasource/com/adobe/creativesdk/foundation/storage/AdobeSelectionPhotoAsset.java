package com.adobe.creativesdk.foundation.storage;

public class AdobeSelectionPhotoAsset
  extends AdobeSelection
{
  protected AdobePhotoAsset selectedItem;
  
  protected AdobeSelectionPhotoAsset(AdobePhotoAsset paramAdobePhotoAsset)
  {
    selectedItem = paramAdobePhotoAsset;
  }
}
