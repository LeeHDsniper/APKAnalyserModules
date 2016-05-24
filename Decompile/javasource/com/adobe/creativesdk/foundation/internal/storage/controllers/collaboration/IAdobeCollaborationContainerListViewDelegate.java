package com.adobe.creativesdk.foundation.internal.storage.controllers.collaboration;

import android.app.Activity;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolder;

public abstract interface IAdobeCollaborationContainerListViewDelegate
{
  public abstract void disableDataView();
  
  public abstract void enableDataView();
  
  public abstract AdobeAssetFolder getCollaboratedFolder();
  
  public abstract Activity getHostActivity();
  
  public abstract void handleSelfDelete();
  
  public abstract void hideAddCollaboratorIcon();
  
  public abstract void refreshListDueToSwipe();
  
  public abstract void showAddCollaboratorIcon();
}
