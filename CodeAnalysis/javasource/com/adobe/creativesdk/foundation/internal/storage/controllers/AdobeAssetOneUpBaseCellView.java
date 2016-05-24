package com.adobe.creativesdk.foundation.internal.storage.controllers;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.util.DisplayMetrics;
import android.view.View;
import android.widget.ImageView;
import android.widget.ProgressBar;
import android.widget.RelativeLayout.LayoutParams;
import android.widget.TextView;
import com.adobe.creativesdk.foundation.assets.R.id;
import uk.co.senab.photoview.PhotoView;
import uk.co.senab.photoview.PhotoViewAttacher;
import uk.co.senab.photoview.PhotoViewAttacher.OnViewTapListener;

public class AdobeAssetOneUpBaseCellView
{
  private PhotoViewAttacher _attacher;
  protected DisplayMetrics _displayMetrics;
  protected View _imageView;
  protected View _mainRootView;
  protected View _noInternetConnView;
  protected View _noPreviewView;
  protected Context _oneUpViewContext;
  protected ProgressBar _spinner;
  protected VisibilityHandler _visibilityHandler;
  
  public AdobeAssetOneUpBaseCellView() {}
  
  public void createPhotoTapListenenr()
  {
    if (((PhotoView)_imageView).getAttacher() != null) {}
    for (_attacher = ((PhotoView)_imageView).getAttacher();; _attacher = new PhotoViewAttacher((ImageView)_imageView))
    {
      _attacher.setOnViewTapListener(new PhotoViewAttacher.OnViewTapListener()
      {
        public void onViewTap(View paramAnonymousView, float paramAnonymousFloat1, float paramAnonymousFloat2)
        {
          if (AdobeAssetViewerController.getCurrentAssetViewerActivity() != null) {
            AdobeAssetViewerController.getCurrentAssetViewerActivity().hideOrShowActionsBar();
          }
        }
      });
      return;
    }
  }
  
  public void displayThumbnail(Bitmap paramBitmap)
  {
    RelativeLayout.LayoutParams localLayoutParams;
    if ((paramBitmap.getWidth() < _displayMetrics.widthPixels) || (paramBitmap.getHeight() < _displayMetrics.heightPixels))
    {
      localLayoutParams = new RelativeLayout.LayoutParams(-1, -1);
      localLayoutParams.addRule(13);
      _imageView.setLayoutParams(localLayoutParams);
    }
    for (;;)
    {
      ((ImageView)_imageView).setImageBitmap(paramBitmap);
      _spinner.setVisibility(8);
      return;
      localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
      localLayoutParams.addRule(13);
      _imageView.setLayoutParams(localLayoutParams);
    }
  }
  
  public void displayThumbnail(BitmapDrawable paramBitmapDrawable)
  {
    int i = paramBitmapDrawable.getIntrinsicWidth();
    int j = paramBitmapDrawable.getIntrinsicHeight();
    if ((i < _displayMetrics.widthPixels) || (j < _displayMetrics.heightPixels)) {}
    for (RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-1, -1);; localLayoutParams = new RelativeLayout.LayoutParams(-2, -2))
    {
      localLayoutParams.addRule(13);
      _imageView.setLayoutParams(localLayoutParams);
      ((ImageView)_imageView).setImageDrawable(paramBitmapDrawable);
      _spinner.setVisibility(8);
      return;
    }
  }
  
  public View findViewById(int paramInt)
  {
    return _mainRootView.findViewById(paramInt);
  }
  
  public PhotoViewAttacher getAttacher()
  {
    return _attacher;
  }
  
  protected void handleNetworkOnline()
  {
    _imageView.setVisibility(0);
    _noInternetConnView.setVisibility(8);
    _noPreviewView.setVisibility(8);
  }
  
  public void handleNoNetwork()
  {
    _visibilityHandler.isOffLineOrError(true);
  }
  
  public void handleNoPreview()
  {
    _visibilityHandler.isOffLineOrError(false);
  }
  
  protected void handleNoPreviewWithMsg(int paramInt)
  {
    handleNoPreview();
    ((TextView)_noPreviewView.findViewById(R.id.adobe_common_view_error_message)).setText(paramInt);
  }
  
  protected void handleOffline(boolean paramBoolean)
  {
    _imageView.setVisibility(8);
    if (paramBoolean)
    {
      _noInternetConnView.setVisibility(0);
      _noPreviewView.setVisibility(8);
    }
    for (;;)
    {
      _spinner.setVisibility(8);
      return;
      _noInternetConnView.setVisibility(8);
      _noPreviewView.setVisibility(0);
    }
  }
  
  public void isOnline()
  {
    _visibilityHandler.isOnLine();
  }
  
  public void performInitialization(Context paramContext)
  {
    _imageView = findViewById(R.id.asset_image_view);
    _noInternetConnView = findViewById(R.id.asset_viewer_no_internet_connection);
    _noPreviewView = findViewById(R.id.asset_viewer_no_preview);
    _spinner = ((ProgressBar)findViewById(R.id.asset_image_progressbar_new));
    _spinner.setVisibility(0);
    _oneUpViewContext = paramContext;
    _visibilityHandler = new VisibilityHandler();
  }
  
  public void setContext(Context paramContext)
  {
    _oneUpViewContext = paramContext;
  }
  
  public void setDisplayMetrics(DisplayMetrics paramDisplayMetrics)
  {
    _displayMetrics = paramDisplayMetrics;
  }
  
  public void setMainRootView(View paramView)
  {
    _mainRootView = paramView;
  }
  
  class VisibilityHandler
  {
    VisibilityHandler() {}
    
    void isOffLineOrError(boolean paramBoolean)
    {
      handleOffline(paramBoolean);
    }
    
    void isOnLine()
    {
      handleNetworkOnline();
    }
  }
}
