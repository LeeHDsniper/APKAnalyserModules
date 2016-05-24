package com.adobe.creativesdk.foundation.internal.comments;

import com.adobe.creativesdk.foundation.internal.comments.models.AdobeAssetCommentsDataSource;

public abstract interface IAdobeGetCommentsCallback
{
  public abstract void onError();
  
  public abstract void onSuccess(AdobeAssetCommentsDataSource paramAdobeAssetCommentsDataSource);
}
