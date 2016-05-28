package com.adobe.creativesdk.foundation.internal.storage.controllers.comments;

import com.adobe.creativesdk.foundation.storage.AdobeAsset;

public class AdobeAssetViewCommentsTargetAssetController
{
  private static AdobeAsset _targetAsset;
  
  public static AdobeAsset getTargetAsset()
  {
    return _targetAsset;
  }
  
  public static void setTargetAsset(AdobeAsset paramAdobeAsset)
  {
    _targetAsset = paramAdobeAsset;
  }
}
