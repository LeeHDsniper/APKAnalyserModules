package uk.co.senab.photoview;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.util.AttributeSet;
import android.view.GestureDetector.OnDoubleTapListener;
import android.view.View.OnLongClickListener;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;

public class PhotoView
  extends ImageView
  implements IPhotoView
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
  
  public PhotoViewAttacher getAttacher()
  {
    return mAttacher;
  }
  
  public Matrix getDisplayMatrix()
  {
    return mAttacher.getDrawMatrix();
  }
  
  public RectF getDisplayRect()
  {
    return mAttacher.getDisplayRect();
  }
  
  public IPhotoView getIPhotoViewImplementation()
  {
    return mAttacher;
  }
  
  @Deprecated
  public float getMaxScale()
  {
    return getMaximumScale();
  }
  
  public float getMaximumScale()
  {
    return mAttacher.getMaximumScale();
  }
  
  public float getMediumScale()
  {
    return mAttacher.getMediumScale();
  }
  
  @Deprecated
  public float getMidScale()
  {
    return getMediumScale();
  }
  
  @Deprecated
  public float getMinScale()
  {
    return getMinimumScale();
  }
  
  public float getMinimumScale()
  {
    return mAttacher.getMinimumScale();
  }
  
  public PhotoViewAttacher.OnPhotoTapListener getOnPhotoTapListener()
  {
    return mAttacher.getOnPhotoTapListener();
  }
  
  public PhotoViewAttacher.OnViewTapListener getOnViewTapListener()
  {
    return mAttacher.getOnViewTapListener();
  }
  
  public float getScale()
  {
    return mAttacher.getScale();
  }
  
  public ImageView.ScaleType getScaleType()
  {
    return mAttacher.getScaleType();
  }
  
  public Bitmap getVisibleRectangleBitmap()
  {
    return mAttacher.getVisibleRectangleBitmap();
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
  
  @Deprecated
  public void setMaxScale(float paramFloat)
  {
    setMaximumScale(paramFloat);
  }
  
  public void setMaximumScale(float paramFloat)
  {
    mAttacher.setMaximumScale(paramFloat);
  }
  
  public void setMediumScale(float paramFloat)
  {
    mAttacher.setMediumScale(paramFloat);
  }
  
  @Deprecated
  public void setMidScale(float paramFloat)
  {
    setMediumScale(paramFloat);
  }
  
  @Deprecated
  public void setMinScale(float paramFloat)
  {
    setMinimumScale(paramFloat);
  }
  
  public void setMinimumScale(float paramFloat)
  {
    mAttacher.setMinimumScale(paramFloat);
  }
  
  public void setOnDoubleTapListener(GestureDetector.OnDoubleTapListener paramOnDoubleTapListener)
  {
    mAttacher.setOnDoubleTapListener(paramOnDoubleTapListener);
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
  
  public void setPhotoViewRotation(float paramFloat)
  {
    mAttacher.setRotationTo(paramFloat);
  }
  
  public void setRotationBy(float paramFloat)
  {
    mAttacher.setRotationBy(paramFloat);
  }
  
  public void setRotationTo(float paramFloat)
  {
    mAttacher.setRotationTo(paramFloat);
  }
  
  public void setScale(float paramFloat)
  {
    mAttacher.setScale(paramFloat);
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
  
  public void setZoomTransitionDuration(int paramInt)
  {
    mAttacher.setZoomTransitionDuration(paramInt);
  }
  
  public void setZoomable(boolean paramBoolean)
  {
    mAttacher.setZoomable(paramBoolean);
  }
}
