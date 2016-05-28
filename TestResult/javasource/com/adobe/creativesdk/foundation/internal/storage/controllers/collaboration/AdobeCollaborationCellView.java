package com.adobe.creativesdk.foundation.internal.storage.controllers.collaboration;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.collaboration.AdobeCollaborationException;
import com.adobe.creativesdk.foundation.internal.collaboration.AdobeCollaborationSession;
import com.adobe.creativesdk.foundation.internal.collaboration.IAdobeCollaborationRemoveCollaboratorCallback;
import com.adobe.creativesdk.foundation.storage.AdobeAssetFolder;

public class AdobeCollaborationCellView
  extends AdobeCollaborationGenericCellView
{
  private String adobeID;
  private boolean owner;
  private boolean self;
  
  public AdobeCollaborationCellView() {}
  
  private void deleteCollaborator()
  {
    AdobeCollaborationSession.getSharedSession().removeCollaborator(mDelegate.getCollaboratedFolder(), adobeID, new IAdobeCollaborationRemoveCollaboratorCallback()
    {
      public void onComplete()
      {
        mDelegate.enableDataView();
        mDelegate.removeView(getPosition());
      }
      
      public void onError(AdobeCollaborationException paramAnonymousAdobeCollaborationException)
      {
        mDelegate.enableDataView();
        paramAnonymousAdobeCollaborationException = mDelegate.getActivityContext().getResources().getString(R.string.collaboration_delete_failure);
        Toast.makeText(mDelegate.getActivityContext(), paramAnonymousAdobeCollaborationException, 1).show();
      }
    });
  }
  
  private void leaveFolder()
  {
    AdobeCollaborationSession.getSharedSession().removeCollaborator(mDelegate.getCollaboratedFolder(), adobeID, new IAdobeCollaborationRemoveCollaboratorCallback()
    {
      public void onComplete()
      {
        mDelegate.handleSelfDelete();
        mDelegate.enableDataView();
      }
      
      public void onError(AdobeCollaborationException paramAnonymousAdobeCollaborationException)
      {
        mDelegate.enableDataView();
        paramAnonymousAdobeCollaborationException = mDelegate.getActivityContext().getResources().getString(R.string.collaboration_leave_failure);
        Toast.makeText(mDelegate.getActivityContext(), paramAnonymousAdobeCollaborationException, 1).show();
      }
    });
  }
  
  protected void handleDeleteClick()
  {
    mDelegate.disableDataViewAndShowProgress();
    if (self)
    {
      leaveFolder();
      return;
    }
    deleteCollaborator();
  }
  
  protected void initializeFromLayout(View paramView)
  {
    setMainRootView(paramView);
  }
  
  public boolean isSelf()
  {
    return self;
  }
  
  protected void prepareForReuseUtil()
  {
    self = false;
    adobeID = null;
    owner = false;
  }
  
  protected void setID(String paramString)
  {
    adobeID = paramString;
  }
  
  public void setName(String paramString)
  {
    if (owner == true)
    {
      String str = getResourceString(R.string.COLLABORATION_OWNER);
      mNameView.setText(getBoldString(paramString + " " + str, paramString.length()));
    }
    while (isSelf())
    {
      mDeleteName.setText(String.format(mDelegate.getActivityContext().getResources().getString(R.string.collaboration_leave_prompt), new Object[] { mDelegate.getCollaboratedFolder().getName() }));
      return;
      mNameView.setText(getBoldString(paramString, paramString.length()));
    }
    mDeleteName.setText(String.format(mDelegate.getActivityContext().getResources().getString(R.string.collaboration_delete_prompt), new Object[] { paramString }));
  }
  
  public void setOwner(boolean paramBoolean)
  {
    owner = paramBoolean;
  }
  
  public void setProfilePicture(Bitmap paramBitmap)
  {
    mProfilePicture.setImageBitmap(paramBitmap);
  }
  
  public void setSelf(boolean paramBoolean)
  {
    self = paramBoolean;
  }
  
  protected boolean shouldShowDelete()
  {
    return !owner;
  }
}
