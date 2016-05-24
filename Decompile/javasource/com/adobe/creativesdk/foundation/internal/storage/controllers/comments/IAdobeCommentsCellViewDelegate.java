package com.adobe.creativesdk.foundation.internal.storage.controllers.comments;

import android.content.Context;

public abstract interface IAdobeCommentsCellViewDelegate
{
  public abstract void deleteComment(String paramString, int paramInt);
  
  public abstract Context getActivityContext();
  
  public abstract int getToken();
  
  public abstract void handleDeleteVisibility(IAdobeCommentsViewDeleteVisibiltyDelegate paramIAdobeCommentsViewDeleteVisibiltyDelegate);
  
  public abstract long isCellSwiping();
  
  public abstract void setCellSwiping(long paramLong);
  
  public abstract void setDeleteVisibilityDelegate(IAdobeCommentsViewDeleteVisibiltyDelegate paramIAdobeCommentsViewDeleteVisibiltyDelegate);
  
  public abstract void setToken(int paramInt);
}
