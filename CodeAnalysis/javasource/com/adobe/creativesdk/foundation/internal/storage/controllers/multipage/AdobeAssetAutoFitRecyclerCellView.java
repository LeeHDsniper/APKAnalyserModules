package com.adobe.creativesdk.foundation.internal.storage.controllers.multipage;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.drawable.BitmapDrawable;
import android.os.Build.VERSION;
import android.util.DisplayMetrics;
import android.view.View;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import android.widget.RelativeLayout.LayoutParams;
import com.adobe.creativesdk.foundation.assets.R.id;

public class AdobeAssetAutoFitRecyclerCellView
{
  protected int _cellPos;
  protected DisplayMetrics _displayMetrics;
  protected View _imageView;
  protected View _mainRootView;
  protected Context _oneUpViewContext;
  
  public AdobeAssetAutoFitRecyclerCellView() {}
  
  public void displayThumbnail(Bitmap paramBitmap, int paramInt)
  {
    RelativeLayout.LayoutParams localLayoutParams;
    if (_cellPos == paramInt)
    {
      if ((paramBitmap.getWidth() >= _displayMetrics.widthPixels) && (paramBitmap.getHeight() >= _displayMetrics.heightPixels)) {
        break label80;
      }
      localLayoutParams = new RelativeLayout.LayoutParams(-1, -1);
      localLayoutParams.addRule(13);
      _imageView.setLayoutParams(localLayoutParams);
    }
    for (;;)
    {
      ((ImageView)_imageView).setImageBitmap(paramBitmap);
      _imageView.setAlpha(1.0F);
      return;
      label80:
      localLayoutParams = new RelativeLayout.LayoutParams(-2, -2);
      localLayoutParams.addRule(13);
      _imageView.setLayoutParams(localLayoutParams);
    }
  }
  
  public void displayThumbnail(BitmapDrawable paramBitmapDrawable, int paramInt)
  {
    if (_cellPos == paramInt)
    {
      paramInt = paramBitmapDrawable.getIntrinsicWidth();
      int i = paramBitmapDrawable.getIntrinsicHeight();
      if ((paramInt >= _displayMetrics.widthPixels) && (i >= _displayMetrics.heightPixels)) {
        break label87;
      }
    }
    label87:
    for (RelativeLayout.LayoutParams localLayoutParams = new RelativeLayout.LayoutParams(-1, -1);; localLayoutParams = new RelativeLayout.LayoutParams(-2, -2))
    {
      localLayoutParams.addRule(13);
      _imageView.setLayoutParams(localLayoutParams);
      ((ImageView)_imageView).setImageDrawable(paramBitmapDrawable);
      _imageView.setAlpha(1.0F);
      return;
    }
  }
  
  public View findViewById(int paramInt)
  {
    return _mainRootView.findViewById(paramInt);
  }
  
  public View getRootView()
  {
    return _mainRootView;
  }
  
  public void performInitialization(Context paramContext)
  {
    _imageView = findViewById(R.id.asset_image_view);
    if (Build.VERSION.SDK_INT >= 18) {
      ((ImageView)_imageView).setScaleType(ImageView.ScaleType.CENTER_CROP);
    }
    for (;;)
    {
      _oneUpViewContext = paramContext;
      return;
      ((ImageView)_imageView).setScaleType(ImageView.ScaleType.FIT_CENTER);
    }
  }
  
  protected void prepareForReuse()
  {
    _imageView.setAlpha(0.0F);
  }
  
  public void setCellPos(int paramInt)
  {
    _cellPos = paramInt;
  }
  
  public void setDisplayMetrics(DisplayMetrics paramDisplayMetrics)
  {
    _displayMetrics = paramDisplayMetrics;
  }
  
  public void setMainRootView(View paramView)
  {
    _mainRootView = paramView;
  }
}
