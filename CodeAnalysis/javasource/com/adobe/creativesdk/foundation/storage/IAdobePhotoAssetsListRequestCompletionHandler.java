package com.adobe.creativesdk.foundation.storage;

import java.util.ArrayList;

public abstract interface IAdobePhotoAssetsListRequestCompletionHandler
{
  public abstract void onCompletion(ArrayList<AdobePhotoAsset> paramArrayList, AdobePhotoPage paramAdobePhotoPage1, AdobePhotoPage paramAdobePhotoPage2);
}
