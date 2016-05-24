package com.adobe.creativesdk.foundation.internal.storage.controllers.comments;

import android.animation.ObjectAnimator;
import android.content.Context;
import android.content.res.Resources;
import android.graphics.Bitmap;
import android.text.Html;
import android.text.SpannableStringBuilder;
import android.text.style.StyleSpan;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.View.OnClickListener;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.assets.R.drawable;
import com.adobe.creativesdk.foundation.assets.R.id;

public class AdobeAssetViewCommentsCellView
  implements IAdobeCommentsViewDeleteVisibiltyDelegate, IAdobeSwipeCommandHandler
{
  private View _mainDataView;
  protected View _mainRootView;
  private String commentURL;
  private int deleteViewWidth = 60;
  protected boolean isDeleteVisible = false;
  private boolean isEnabled = true;
  private boolean isSwiping = false;
  private AdobeSwipeToShowDeleteListener listener;
  protected TextView mCommentContent;
  protected TextView mDateOfComment;
  protected IAdobeCommentsCellViewDelegate mDelegate;
  protected View mDeleteView;
  private float mDeleteViewWidth = 0.0F;
  protected View mInfoView;
  protected TextView mNameView;
  private int mPosition;
  protected ImageView mProfilePicture;
  
  public AdobeAssetViewCommentsCellView() {}
  
  private void disableCellView()
  {
    _mainRootView.setAlpha(0.4F);
  }
  
  private void enableCellView()
  {
    _mainRootView.setAlpha(1.0F);
  }
  
  private SpannableStringBuilder getBoldString(String paramString, int paramInt)
  {
    StyleSpan localStyleSpan = new StyleSpan(1);
    paramString = new SpannableStringBuilder(paramString);
    paramString.setSpan(localStyleSpan, 0, paramInt, 33);
    return paramString;
  }
  
  private float getDeleteViewWidth()
  {
    if (mDeleteViewWidth == 0.0F)
    {
      float f = mDelegate.getActivityContext().getResources().getDisplayMetrics().density;
      return Math.round(deleteViewWidth * f);
    }
    return mDeleteViewWidth;
  }
  
  private void handleDeleteClick()
  {
    disableCellView();
    isEnabled = false;
    if (mDelegate != null)
    {
      mDelegate.setToken(-1);
      mDelegate.deleteComment(commentURL, getPosition());
      setDeleteInvisible();
    }
  }
  
  private void performOnFinishInflate()
  {
    mNameView = ((TextView)_mainRootView.findViewById(R.id.adobe_commenter_name));
    mInfoView = _mainRootView.findViewById(R.id.adobe_comment_content_container);
    mDateOfComment = ((TextView)_mainRootView.findViewById(R.id.adobe_comment_date));
    mCommentContent = ((TextView)_mainRootView.findViewById(R.id.adobe_comments_content));
    _mainDataView = _mainRootView.findViewById(R.id.adobe_comment_content_container);
    mProfilePicture = ((ImageView)_mainRootView.findViewById(R.id.adobe_commenter_profile_pic));
    mDeleteView = _mainRootView.findViewById(R.id.adobe_comment_delete_container);
    mDeleteView.setOnClickListener(new View.OnClickListener()
    {
      public void onClick(View paramAnonymousView)
      {
        if ((!isSwiping) && (isEnabled)) {
          AdobeAssetViewCommentsCellView.this.handleDeleteClick();
        }
      }
    });
  }
  
  public boolean canSwipe()
  {
    return ((isEnabled) && (mDelegate.isCellSwiping() == -1L)) || (mDelegate.isCellSwiping() == getPosition());
  }
  
  protected void createSwipeListener()
  {
    if (_mainDataView != null)
    {
      listener = new AdobeSwipeToShowDeleteListener(_mainDataView, this, (int)getDeleteViewWidth());
      _mainDataView.setOnTouchListener(listener);
    }
  }
  
  public int getPosition()
  {
    return mPosition;
  }
  
  public void handleDeleteVisibility(boolean paramBoolean1, boolean paramBoolean2)
  {
    isSwiping = false;
    isDeleteVisible = paramBoolean1;
    if (paramBoolean1 == true)
    {
      mDelegate.setDeleteVisibilityDelegate(this);
      mDelegate.setToken(getPosition());
    }
    while (!paramBoolean2) {
      return;
    }
    mDelegate.setToken(-1);
  }
  
  public void hideDeleteButton()
  {
    isDeleteVisible = false;
    if (_mainDataView != null)
    {
      ObjectAnimator localObjectAnimator = ObjectAnimator.ofFloat(_mainDataView, "x", new float[] { 0.0F });
      localObjectAnimator.setDuration(50L);
      localObjectAnimator.start();
    }
  }
  
  protected void initializeFromLayout(View paramView)
  {
    setMainRootView(paramView);
    performOnFinishInflate();
  }
  
  public boolean isSwiping()
  {
    return isSwiping;
  }
  
  public boolean isVisible()
  {
    return isDeleteVisible;
  }
  
  protected void prepareForReuse()
  {
    mPosition = -1;
    mProfilePicture.setImageBitmap(null);
    setDeleteInvisible();
  }
  
  public void setCommentContent(String paramString)
  {
    mCommentContent.setText(Html.fromHtml(paramString));
  }
  
  public void setCommentDate(String paramString)
  {
    mDateOfComment.setText(paramString);
  }
  
  public void setCommentURL(String paramString)
  {
    commentURL = paramString;
  }
  
  public void setCommenterName(String paramString)
  {
    mNameView.setText(getBoldString(paramString, paramString.length()));
  }
  
  public void setDelegate(IAdobeCommentsCellViewDelegate paramIAdobeCommentsCellViewDelegate)
  {
    mDelegate = paramIAdobeCommentsCellViewDelegate;
  }
  
  public void setDeleteInvisible()
  {
    isDeleteVisible = false;
    if (_mainDataView != null)
    {
      ObjectAnimator localObjectAnimator = ObjectAnimator.ofFloat(_mainDataView, "x", new float[] { 0.0F });
      localObjectAnimator.setDuration(0L);
      localObjectAnimator.start();
    }
  }
  
  public void setDeleteVisible()
  {
    isDeleteVisible = true;
    if (_mainDataView != null)
    {
      ObjectAnimator localObjectAnimator = ObjectAnimator.ofFloat(_mainDataView, "x", new float[] { -getDeleteViewWidth() });
      localObjectAnimator.setDuration(0L);
      localObjectAnimator.start();
    }
  }
  
  public void setIsEnabled(boolean paramBoolean)
  {
    isEnabled = paramBoolean;
    if (!paramBoolean)
    {
      disableCellView();
      return;
    }
    enableCellView();
  }
  
  protected void setMainRootView(View paramView)
  {
    _mainRootView = paramView;
    performOnFinishInflate();
  }
  
  public void setNoImage(int paramInt)
  {
    if (getPosition() == paramInt)
    {
      mProfilePicture.setScaleType(ImageView.ScaleType.CENTER);
      mProfilePicture.setImageResource(R.drawable.adobe_place_holder_image);
    }
  }
  
  public void setPosition(int paramInt)
  {
    mPosition = paramInt;
  }
  
  public void setProfilePicture(Bitmap paramBitmap, int paramInt)
  {
    if (getPosition() == paramInt)
    {
      mProfilePicture.setScaleType(ImageView.ScaleType.CENTER_CROP);
      mProfilePicture.setImageBitmap(paramBitmap);
    }
  }
  
  public void startedSwiping()
  {
    if (mDelegate != null)
    {
      mDelegate.handleDeleteVisibility(this);
      if (mDelegate.getToken() != -1)
      {
        isSwiping = true;
        mDelegate.setToken(-1);
      }
      mDelegate.setCellSwiping(getPosition());
    }
  }
  
  public void stoppedSwiping()
  {
    isSwiping = false;
    mDelegate.setCellSwiping(-1L);
  }
}
