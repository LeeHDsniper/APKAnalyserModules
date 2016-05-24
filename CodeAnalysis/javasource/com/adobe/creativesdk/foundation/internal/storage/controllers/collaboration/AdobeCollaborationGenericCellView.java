package com.adobe.creativesdk.foundation.internal.storage.controllers.collaboration;

import android.content.Context;
import android.content.res.Resources;
import android.text.SpannableStringBuilder;
import android.text.style.StyleSpan;
import android.view.View;
import android.view.View.OnClickListener;
import android.view.View.OnLongClickListener;
import android.widget.ImageView;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.assets.R.id;

public abstract class AdobeCollaborationGenericCellView
{
  protected View _mainRootView;
  protected boolean isDeleteVisible = false;
  protected boolean isEnabled = true;
  protected IAdobeCollaborationCellViewDelegate mDelegate;
  private View mDeleteButton;
  protected TextView mDeleteName;
  protected View mDeleteView;
  protected View mInfoView;
  protected TextView mNameView;
  private int mPosition;
  protected ImageView mProfilePicture;
  
  public AdobeCollaborationGenericCellView() {}
  
  private void hideDeleteView()
  {
    mInfoView.setVisibility(0);
    mDeleteView.setVisibility(8);
    isDeleteVisible = false;
  }
  
  private boolean isEnabled()
  {
    return isEnabled;
  }
  
  private void performOnFinishInflate()
  {
    mNameView = ((TextView)_mainRootView.findViewById(R.id.adobe_collaborator_name));
    mInfoView = _mainRootView.findViewById(R.id.adobe_collaborator_name_container);
    mInfoView.setOnLongClickListener(new View.OnLongClickListener()
    {
      public boolean onLongClick(View paramAnonymousView)
      {
        if ((mDelegate.getToken() == -1) && (shouldShowDelete()) && (AdobeCollaborationGenericCellView.this.isEnabled()))
        {
          AdobeCollaborationGenericCellView.this.showDeleteView();
          mDelegate.setToken(mPosition);
        }
        return true;
      }
    });
    mProfilePicture = ((ImageView)_mainRootView.findViewById(R.id.adobe_collaborator_profile_pic));
    mDeleteView = _mainRootView.findViewById(R.id.adobe_collaborator_delete_container);
    mDeleteName = ((TextView)_mainRootView.findViewById(R.id.adobe_collaborator_delete_textview));
    mDeleteButton = _mainRootView.findViewById(R.id.adobe_collaborator_delete_button);
    mDeleteButton.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        if (AdobeCollaborationGenericCellView.this.isEnabled()) {
          handleDeleteClick();
        }
      }
    });
  }
  
  private void showDeleteView()
  {
    mInfoView.setVisibility(8);
    mDeleteView.setVisibility(0);
    isDeleteVisible = true;
  }
  
  protected SpannableStringBuilder getBoldString(String paramString, int paramInt)
  {
    StyleSpan localStyleSpan = new StyleSpan(1);
    paramString = new SpannableStringBuilder(paramString);
    paramString.setSpan(localStyleSpan, 0, paramInt, 33);
    return paramString;
  }
  
  protected int getPosition()
  {
    return mPosition;
  }
  
  protected String getResourceString(int paramInt)
  {
    return mDelegate.getActivityContext().getResources().getString(paramInt);
  }
  
  protected abstract void handleDeleteClick();
  
  protected abstract void initializeFromLayout(View paramView);
  
  protected void prepareForReuse()
  {
    mPosition = -1;
    mProfilePicture.setImageBitmap(null);
    isEnabled = true;
    prepareForReuseUtil();
  }
  
  protected abstract void prepareForReuseUtil();
  
  public void setDelegate(IAdobeCollaborationCellViewDelegate paramIAdobeCollaborationCellViewDelegate)
  {
    mDelegate = paramIAdobeCollaborationCellViewDelegate;
  }
  
  public void setDeleteVisibility(boolean paramBoolean)
  {
    isDeleteVisible = paramBoolean;
    if (isDeleteVisible)
    {
      showDeleteView();
      return;
    }
    hideDeleteView();
  }
  
  public void setEnabled(boolean paramBoolean)
  {
    isEnabled = paramBoolean;
  }
  
  protected void setMainRootView(View paramView)
  {
    _mainRootView = paramView;
    performOnFinishInflate();
  }
  
  public void setPosition(int paramInt)
  {
    mPosition = paramInt;
  }
  
  protected abstract boolean shouldShowDelete();
}
