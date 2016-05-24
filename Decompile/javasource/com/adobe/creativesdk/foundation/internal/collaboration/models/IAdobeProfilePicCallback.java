package com.adobe.creativesdk.foundation.internal.collaboration.models;

import android.graphics.Bitmap;

public abstract interface IAdobeProfilePicCallback
{
  public abstract void onComplete(Bitmap paramBitmap);
  
  public abstract void onError();
}
