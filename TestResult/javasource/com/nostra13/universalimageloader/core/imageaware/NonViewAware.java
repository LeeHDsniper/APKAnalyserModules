package com.nostra13.universalimageloader.core.imageaware;

import android.graphics.Bitmap;
import android.graphics.drawable.Drawable;
import android.text.TextUtils;
import android.view.View;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.assist.ViewScaleType;

public class NonViewAware
  implements ImageAware
{
  protected final ImageSize imageSize;
  protected final String imageUri;
  protected final ViewScaleType scaleType;
  
  public NonViewAware(String paramString, ImageSize paramImageSize, ViewScaleType paramViewScaleType)
  {
    if (paramImageSize == null) {
      throw new IllegalArgumentException("imageSize must not be null");
    }
    if (paramViewScaleType == null) {
      throw new IllegalArgumentException("scaleType must not be null");
    }
    imageUri = paramString;
    imageSize = paramImageSize;
    scaleType = paramViewScaleType;
  }
  
  public int getHeight()
  {
    return imageSize.getHeight();
  }
  
  public int getId()
  {
    if (TextUtils.isEmpty(imageUri)) {
      return super.hashCode();
    }
    return imageUri.hashCode();
  }
  
  public ViewScaleType getScaleType()
  {
    return scaleType;
  }
  
  public int getWidth()
  {
    return imageSize.getWidth();
  }
  
  public View getWrappedView()
  {
    return null;
  }
  
  public boolean isCollected()
  {
    return false;
  }
  
  public boolean setImageBitmap(Bitmap paramBitmap)
  {
    return true;
  }
  
  public boolean setImageDrawable(Drawable paramDrawable)
  {
    return true;
  }
}
