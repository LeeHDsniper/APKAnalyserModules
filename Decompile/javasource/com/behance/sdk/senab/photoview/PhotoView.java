package com.behance.sdk.senab.photoview;

import android.content.Context;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.util.AttributeSet;
import android.view.View.OnLongClickListener;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;

public class PhotoView
  extends ImageView
{
  private final PhotoViewAttacher mAttacher;
  private ImageView.ScaleType mPendingScaleType;
  
  public PhotoView(Context paramContext)
  {
    this(paramContext, null);
  }
  
  public PhotoView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public PhotoView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    super.setScaleType(ImageView.ScaleType.MATRIX);
    mAttacher = new PhotoViewAttacher(this);
    if (mPendingScaleType != null)
    {
      setScaleType(mPendingScaleType);
      mPendingScaleType = null;
    }
  }
  
  public RectF getDisplayRect()
  {
    return mAttacher.getDisplayRect();
  }
  
  public float getMaxScale()
  {
    return mAttacher.getMaxScale();
  }
  
  public float getMidScale()
  {
    return mAttacher.getMidScale();
  }
  
  public float getMinScale()
  {
    return mAttacher.getMinScale();
  }
  
  public float getScale()
  {
    return mAttacher.getScale();
  }
  
  public ImageView.ScaleType getScaleType()
  {
    return mAttacher.getScaleType();
  }
  
  protected void onDetachedFromWindow()
  {
    mAttacher.cleanup();
    super.onDetachedFromWindow();
  }
  
  public void setAllowParentInterceptOnEdge(boolean paramBoolean)
  {
    mAttacher.setAllowParentInterceptOnEdge(paramBoolean);
  }
  
  public void setImageDrawable(Drawable paramDrawable)
  {
    super.setImageDrawable(paramDrawable);
    if (mAttacher != null) {
      mAttacher.update();
    }
  }
  
  public void setImageResource(int paramInt)
  {
    super.setImageResource(paramInt);
    if (mAttacher != null) {
      mAttacher.update();
    }
  }
  
  public void setImageURI(Uri paramUri)
  {
    super.setImageURI(paramUri);
    if (mAttacher != null) {
      mAttacher.update();
    }
  }
  
  public void setMaxScale(float paramFloat)
  {
    mAttacher.setMaxScale(paramFloat);
  }
  
  public void setMidScale(float paramFloat)
  {
    mAttacher.setMidScale(paramFloat);
  }
  
  public void setMinScale(float paramFloat)
  {
    mAttacher.setMinScale(paramFloat);
  }
  
  public void setOnLongClickListener(View.OnLongClickListener paramOnLongClickListener)
  {
    mAttacher.setOnLongClickListener(paramOnLongClickListener);
  }
  
  public void setOnMatrixChangeListener(PhotoViewAttacher.OnMatrixChangedListener paramOnMatrixChangedListener)
  {
    mAttacher.setOnMatrixChangeListener(paramOnMatrixChangedListener);
  }
  
  public void setOnPhotoTapListener(PhotoViewAttacher.OnPhotoTapListener paramOnPhotoTapListener)
  {
    mAttacher.setOnPhotoTapListener(paramOnPhotoTapListener);
  }
  
  public void setOnViewTapListener(PhotoViewAttacher.OnViewTapListener paramOnViewTapListener)
  {
    mAttacher.setOnViewTapListener(paramOnViewTapListener);
  }
  
  public void setScaleType(ImageView.ScaleType paramScaleType)
  {
    if (mAttacher != null)
    {
      mAttacher.setScaleType(paramScaleType);
      return;
    }
    mPendingScaleType = paramScaleType;
  }
  
  public void setZoomable(boolean paramBoolean)
  {
    mAttacher.setZoomable(paramBoolean);
  }
}
