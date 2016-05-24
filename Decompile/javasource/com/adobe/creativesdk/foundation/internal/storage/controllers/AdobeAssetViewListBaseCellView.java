package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.graphics.Bitmap;
import android.graphics.Color;
import android.support.v4.view.ViewCompat;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnTouchListener;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.AnimationUtils;
import android.widget.ImageView;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.assets.R.drawable;
import java.lang.ref.WeakReference;

public abstract class AdobeAssetViewListBaseCellView
{
  protected float _aspectRatioHint = 1.0F;
  private WeakReference<IAdobeAssetViewListCellDelegate> _cellDelegate;
  protected boolean _disable;
  protected String _guid;
  private boolean _hasValidThumnailRendition;
  private String _imageAssetMD5;
  protected ImageView _imageViewAssetPicture;
  private boolean _isImageEmpty = false;
  private boolean _isSelectionEnabledOnCell = false;
  protected View _mainRootView;
  private int _position;
  private Object _rootViewTag;
  protected View _selectBtn;
  protected boolean _selected = false;
  protected String _title;
  protected TextView _titleView;
  protected TextView _videoDuration;
  protected ImageView _videoIndicator;
  
  public AdobeAssetViewListBaseCellView() {}
  
  private void updateSelectionBtnVisibility()
  {
    View localView;
    if (_selectBtn != null)
    {
      localView = _selectBtn;
      if ((!_isSelectionEnabledOnCell) || (isMarkedDisabled())) {
        break label34;
      }
    }
    label34:
    for (int i = 0;; i = 8)
    {
      localView.setVisibility(i);
      return;
    }
  }
  
  protected int GetNoPreviewImageResId()
  {
    return R.drawable.asset_browser_no_preview_icon;
  }
  
  protected void HandleTitleChange()
  {
    _titleView.setText(_title);
  }
  
  protected void SetThumbnailOnAssetCell(Bitmap paramBitmap)
  {
    if (paramBitmap != null) {
      _imageViewAssetPicture.setImageBitmap(paramBitmap);
    }
    for (;;)
    {
      handleAfterImageLoadingComplete();
      return;
      _imageViewAssetPicture.setImageResource(GetNoPreviewImageResId());
      _imageViewAssetPicture.setBackgroundColor(-1);
    }
  }
  
  protected void changeSelectionOverlay()
  {
    if (_selected)
    {
      _mainRootView.setBackgroundColor(Color.rgb(237, 240, 241));
      return;
    }
    _mainRootView.setBackgroundColor(0);
  }
  
  public void displayThumnail(Bitmap paramBitmap, final float paramFloat, boolean paramBoolean)
  {
    boolean bool = false;
    _isImageEmpty = false;
    _imageViewAssetPicture.setVisibility(0);
    if (paramBitmap != null) {
      bool = true;
    }
    _hasValidThumnailRendition = bool;
    SetThumbnailOnAssetCell(paramBitmap);
    updateSelectionBtnVisibility();
    if (paramBoolean)
    {
      paramBitmap = AnimationUtils.loadAnimation(_mainRootView.getContext(), 17432576);
      paramBitmap.setAnimationListener(new Animation.AnimationListener()
      {
        public void onAnimationEnd(Animation paramAnonymousAnimation)
        {
          setImageAssetAlpha(paramFloat);
        }
        
        public void onAnimationRepeat(Animation paramAnonymousAnimation) {}
        
        public void onAnimationStart(Animation paramAnonymousAnimation) {}
      });
      paramBitmap.setDuration(200L);
      _imageViewAssetPicture.startAnimation(paramBitmap);
      return;
    }
    setImageAssetAlpha(paramFloat);
  }
  
  public View findViewById(int paramInt)
  {
    return _mainRootView.findViewById(paramInt);
  }
  
  public String getGuid()
  {
    return _guid;
  }
  
  public String getImageMD5()
  {
    return _imageAssetMD5;
  }
  
  public int getPosition()
  {
    return _position;
  }
  
  public View getRootView()
  {
    return _mainRootView;
  }
  
  public String getTitle()
  {
    return _title;
  }
  
  public void handleAfterImageLoadingComplete() {}
  
  protected void handleAttachToCellDelegate()
  {
    setUpSelectionButtonState();
  }
  
  protected void handleDisableChange()
  {
    ImageView localImageView;
    if (_imageViewAssetPicture != null)
    {
      localImageView = _imageViewAssetPicture;
      if (!_disable) {
        break label28;
      }
    }
    label28:
    for (float f = 0.3F;; f = 1.0F)
    {
      ViewCompat.setAlpha(localImageView, f);
      return;
    }
  }
  
  protected void handleGuidChange() {}
  
  protected abstract void handleOnFinishInflate();
  
  protected void handlePostInflate() {}
  
  protected void handleSelectionMarkChange()
  {
    if (_selectBtn == null) {
      return;
    }
    _selectBtn.setSelected(_selected);
    changeSelectionOverlay();
  }
  
  public boolean hasValidThumbnailRendition()
  {
    return _hasValidThumnailRendition;
  }
  
  public void initializeFromLayout(LayoutInflater paramLayoutInflater, int paramInt, ViewGroup paramViewGroup)
  {
    setMainRootView(paramLayoutInflater.inflate(paramInt, paramViewGroup, false));
    performOnFinishInflate();
  }
  
  public boolean isMarkedDisabled()
  {
    return _disable;
  }
  
  public boolean isMarkedSelected()
  {
    return _selected;
  }
  
  public void markSelected(boolean paramBoolean)
  {
    _selected = paramBoolean;
    handleSelectionMarkChange();
  }
  
  protected void performOnFinishInflate()
  {
    handleOnFinishInflate();
    handlePostInflate();
  }
  
  public void prepareForReuse()
  {
    _rootViewTag = null;
    _guid = null;
    _position = 0;
    _title = null;
    _imageViewAssetPicture.setVisibility(4);
    if (_selectBtn != null) {
      _selectBtn.setVisibility(8);
    }
    _disable = false;
    _isImageEmpty = true;
    _aspectRatioHint = 1.0F;
    _cellDelegate = null;
    _hasValidThumnailRendition = false;
  }
  
  protected abstract boolean providesSelection();
  
  public void setAssetImageAspectRatioHint(float paramFloat)
  {
    _aspectRatioHint = paramFloat;
  }
  
  public void setCellDelegate(IAdobeAssetViewListCellDelegate paramIAdobeAssetViewListCellDelegate)
  {
    _cellDelegate = new WeakReference(paramIAdobeAssetViewListCellDelegate);
    if (paramIAdobeAssetViewListCellDelegate != null) {
      handleAttachToCellDelegate();
    }
  }
  
  public void setDisabled(boolean paramBoolean)
  {
    _disable = paramBoolean;
    handleDisableChange();
  }
  
  public void setGuid(String paramString)
  {
    _guid = paramString;
    handleGuidChange();
  }
  
  protected void setImageAssetAlpha(float paramFloat)
  {
    ViewCompat.setAlpha(_imageViewAssetPicture, paramFloat);
  }
  
  public void setImageMD5(String paramString)
  {
    _imageAssetMD5 = paramString;
  }
  
  public void setMainRootView(View paramView)
  {
    _mainRootView = paramView;
  }
  
  public void setPosition(int paramInt)
  {
    _position = paramInt;
  }
  
  public void setTitle(String paramString)
  {
    _title = paramString;
    HandleTitleChange();
  }
  
  protected void setUpSelectionButtonState()
  {
    if ((providesSelection()) && (_selectBtn != null))
    {
      _isSelectionEnabledOnCell = ((IAdobeAssetViewListCellDelegate)_cellDelegate.get()).getSelectionOverallVisibility();
      if (_isSelectionEnabledOnCell)
      {
        markSelected(false);
        _selectBtn.setOnTouchListener(new View.OnTouchListener()
        {
          public boolean onTouch(View paramAnonymousView, MotionEvent paramAnonymousMotionEvent)
          {
            switch (paramAnonymousMotionEvent.getAction())
            {
            case 2: 
            default: 
              return true;
            case 1: 
              toggleItemMarkSelection();
              _selectBtn.getParent().requestDisallowInterceptTouchEvent(false);
              return true;
            case 0: 
              _selectBtn.getParent().requestDisallowInterceptTouchEvent(true);
              return true;
            }
            _selectBtn.getParent().requestDisallowInterceptTouchEvent(false);
            return true;
          }
        });
      }
      return;
    }
    _isSelectionEnabledOnCell = false;
  }
  
  protected void toggleItemMarkSelection()
  {
    ((IAdobeAssetViewListCellDelegate)_cellDelegate.get()).handleAssetCellSelectionToggle(this);
  }
}
