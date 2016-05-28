package com.adobe.creativesdk.foundation.internal.storage.controllers.collaboration;

import android.content.Context;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolder;

public abstract interface IAdobeCollaborationCellViewDelegate
{
  public abstract void disableDataViewAndShowProgress();
  
  public abstract void enableDataView();
  
  public abstract Context getActivityContext();
  
  public abstract AdobeAssetFolder getCollaboratedFolder();
  
  public abstract int getToken();
  
  public abstract void handleSelfDelete();
  
  public abstract void removeView(int paramInt);
  
  public abstract void setToken(int paramInt);
}
