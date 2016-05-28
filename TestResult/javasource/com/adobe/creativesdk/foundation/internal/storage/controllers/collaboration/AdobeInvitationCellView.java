package com.adobe.creativesdk.foundation.internal.storage.controllers.collaboration;

import android.content.Context;
import android.content.res.Resources;
import android.view.View;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.TextView;
import android.widget.Toast;
import com.adobe.creativesdk.foundation.assets.R.drawable;
import com.adobe.creativesdk.foundation.assets.R.id;
import com.adobe.creativesdk.foundation.assets.R.string;
import com.adobe.creativesdk.foundation.internal.collaboration.AdobeCollaborationException;
import com.adobe.creativesdk.foundation.internal.collaboration.AdobeCollaborationSession;
import com.adobe.creativesdk.foundation.internal.collaboration.IAdobeCollaborationAcceptOrRejectInviteCallBack;

public class AdobeInvitationCellView
  extends AdobeCollaborationGenericCellView
{
  private String inviteId;
  
  public AdobeInvitationCellView() {}
  
  private void deleteInvitation()
  {
    AdobeCollaborationSession.getSharedSession().rejectInvite(inviteId, new IAdobeCollaborationAcceptOrRejectInviteCallBack()
    {
      public void onComplete()
      {
        mDelegate.removeView(getPosition());
        mDelegate.enableDataView();
      }
      
      public void onError(AdobeCollaborationException paramAnonymousAdobeCollaborationException)
      {
        paramAnonymousAdobeCollaborationException = mDelegate.getActivityContext().getResources().getString(R.string.COLLABORATION_INVITATION_DELETE_ERROR);
        Toast.makeText(mDelegate.getActivityContext(), paramAnonymousAdobeCollaborationException, 1).show();
        mDelegate.enableDataView();
      }
    });
  }
  
  private void performOnFinishInflate()
  {
    mNameView = ((TextView)_mainRootView.findViewById(R.id.adobe_collaborator_name));
    mProfilePicture = ((ImageView)_mainRootView.findViewById(R.id.adobe_collaborator_profile_pic));
  }
  
  protected void handleDeleteClick()
  {
    mDelegate.disableDataViewAndShowProgress();
    deleteInvitation();
  }
  
  protected void initializeFromLayout(View paramView)
  {
    setMainRootView(paramView);
    performOnFinishInflate();
  }
  
  protected void prepareForReuseUtil()
  {
    inviteId = null;
  }
  
  public void setInviteId(String paramString)
  {
    inviteId = paramString;
  }
  
  public void setInviteProfilePicture()
  {
    mProfilePicture.setScaleType(ImageView.ScaleType.CENTER);
    mProfilePicture.setImageResource(R.drawable.no_image);
  }
  
  public void setName(String paramString)
  {
    String str = getResourceString(R.string.COLLABORATION_INVITEE);
    mNameView.setText(getBoldString(paramString + " " + str, paramString.length()));
    mDeleteName.setText(String.format(mDelegate.getActivityContext().getResources().getString(R.string.collaboration_delete_prompt), new Object[] { paramString }));
  }
  
  protected boolean shouldShowDelete()
  {
    return true;
  }
}
