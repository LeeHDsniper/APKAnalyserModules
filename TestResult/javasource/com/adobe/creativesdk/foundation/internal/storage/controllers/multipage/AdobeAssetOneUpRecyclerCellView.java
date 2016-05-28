package com.adobe.creativesdk.foundation.internal.storage.controllers.multipage;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.util.DisplayMetrics;
import android.view.View;
import android.widget.ProgressBar;
import android.widget.RelativeLayout.LayoutParams;
import com.adobe.creativesdk.foundation.internal.storage.controllers.AdobeAssetOneUpBaseCellView;

public class AdobeAssetOneUpRecyclerCellView
  extends AdobeAssetOneUpBaseCellView
{
  protected int _cellPos;
  private IAdobeNoPreviewSizeHandler handler;
  private int height = -1;
  private int width = -1;
  
  public AdobeAssetOneUpRecyclerCellView() {}
  
  private void setNoPreviewSize(int paramInt1, int paramInt2)
  {
    if ((paramInt1 < _displayMetrics.widthPixels) || (paramInt2 < _displayMetrics.heightPixels))
    {
      localLayoutParams = new RelativeLayout.LayoutParams(paramInt1, paramInt2);
      localLayoutParams.addRule(13);
      _noPreviewView.setLayoutParams(localLayoutParams);
      return;
    }
    RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-1, -1);
    localLayoutParams.addRule(13);
    _noPreviewView.setLayoutParams(localLayoutParams);
  }
  
  public void displayThumbnail(Bitmap paramBitmap, int paramInt)
  {
    if (_cellPos == paramInt)
    {
      super.displayThumbnail(paramBitmap);
      _imageView.setAlpha(1.0F);
    }
  }
  
  public void displayThumbnail(BitmapDrawable paramBitmapDrawable, int paramInt)
  {
    if ((width == -1) || (height == -1))
    {
      int i = paramBitmapDrawable.getIntrinsicWidth();
      int j = paramBitmapDrawable.getIntrinsicHeight();
      if ((handler.getWidth() == -1) || (handler.getHeight() == -1)) {
        handler.setMeasurements(i, j);
      }
      setNoPreviewSize(i, j);
    }
    if (_cellPos == paramInt)
    {
      super.displayThumbnail(paramBitmapDrawable);
      _imageView.setAlpha(1.0F);
    }
  }
  
  protected void handleNetworkOnline()
  {
    super.handleNetworkOnline();
  }
  
  protected void handleOffline(boolean paramBoolean)
  {
    if (!paramBoolean)
    {
      _imageView.setVisibility(8);
      if ((width == -1) || (height == -1))
      {
        width = handler.getWidth();
        height = handler.getHeight();
        setNoPreviewSize(width, height);
      }
      _noPreviewView.setVisibility(0);
      _spinner.setVisibility(8);
    }
    super.handleOffline(paramBoolean);
  }
  
  public void performInitialization(Context paramContext)
  {
    super.performInitialization(paramContext);
    _noInternetConnView.setVisibility(8);
    _noPreviewView.setVisibility(8);
  }
  
  protected void prepareForReuse()
  {
    _imageView.setVisibility(0);
    _noPreviewView.setVisibility(8);
    RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-1, -1);
    localLayoutParams.addRule(13);
    _imageView.setLayoutParams(localLayoutParams);
    _imageView.setAlpha(0.0F);
    _spinner.setVisibility(0);
  }
  
  public void setCellPos(int paramInt)
  {
    _cellPos = paramInt;
  }
  
  public void setNoPreviewHandler(IAdobeNoPreviewSizeHandler paramIAdobeNoPreviewSizeHandler)
  {
    handler = paramIAdobeNoPreviewSizeHandler;
  }
}
