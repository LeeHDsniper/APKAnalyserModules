package com.adobe.creativesdk.foundation.internal.storage.controllers.comments;

import android.app.Activity;
import com.adobe.creativesdk.foundation.internal.comments.AdobeAssetCommentsManager;

public abstract interface IAdobeCommentsContainerListViewDelegate
{
  public abstract AdobeAssetCommentsManager getCommentsManager();
  
  public abstract Activity getHostActivity();
  
  public abstract void handleEmptyComments();
  
  public abstract void hideDataViewAndShowProgress();
  
  public abstract void hideProgressAndShowDataView();
  
  public abstract void refreshListDueToSwipe();
  
  public abstract void showAddCommentsIcon();
  
  public abstract void showCommentDeletionBanner(int paramInt1, int paramInt2);
}
