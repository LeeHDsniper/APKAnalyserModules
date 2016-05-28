package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.content.Intent;

public abstract interface IAdobeAssetViewBrowserFragmentHostActivity
{
  public abstract void handleOpenSelectedFilesAction(Intent paramIntent);
  
  public abstract void handleUserSignOutAction();
  
  public abstract void hideCollaborationFrameOnBackPressed();
}
