package com.adobe.creativesdk.foundation.storage;

import com.adobe.creativesdk.foundation.IAdobeGenericErrorCallback;
import java.util.ArrayList;

public abstract interface IAdobeAssetFolderNextPageCallback
  extends IAdobeGenericErrorCallback<AdobeAssetException>
{
  public abstract void onCompletion(ArrayList<AdobeAsset> paramArrayList, int paramInt);
}
