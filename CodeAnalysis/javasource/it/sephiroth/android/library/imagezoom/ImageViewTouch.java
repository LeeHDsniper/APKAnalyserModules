package it.sephiroth.android.library.imagezoom;

import android.annotation.TargetApi;
import android.content.Context;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.os.SystemClock;
import android.util.AttributeSet;
import android.util.Log;
import android.view.GestureDetector;
import android.view.GestureDetector.OnGestureListener;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.ScaleGestureDetector.OnScaleGestureListener;
import android.view.ScaleGestureDetector.SimpleOnScaleGestureListener;
import android.view.ViewConfiguration;

public class ImageViewTouch
  extends ImageViewTouchBase
{
  public static long MIN_FLING_DELTA_TIME = 150L;
  protected int mDoubleTapDirection;
  protected boolean mDoubleTapEnabled = true;
  private OnImageViewTouchDoubleTapListener mDoubleTapListener;
  protected GestureDetector mGestureDetector;
  protected GestureDetector.OnGestureListener mGestureListener;
  long mPointerUpTime;
  protected ScaleGestureDetector mScaleDetector;
  protected boolean mScaleEnabled = true;
  private float mScaleFactor;
  protected ScaleGestureDetector.OnScaleGestureListener mScaleListener;
  protected boolean mScrollEnabled = true;
  private OnImageViewTouchSingleTapListener mSingleTapListener;
  protected int mTouchSlop;
  
  public ImageViewTouch(Context paramContext, AttributeSet paramAttributeSet)
  {
    super(paramContext, paramAttributeSet);
  }
  
  public ImageViewTouch(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  protected void _setImageDrawable(Drawable paramDrawable, Matrix paramMatrix, float paramFloat1, float paramFloat2)
  {
    super._setImageDrawable(paramDrawable, paramMatrix, paramFloat1, paramFloat2);
  }
  
  public boolean canScroll()
  {
    if (getScale() > 1.0F) {}
    RectF localRectF;
    do
    {
      return true;
      localRectF = getBitmapRect();
    } while (!mViewPort.contains(localRectF));
    return false;
  }
  
  public boolean getDoubleTapEnabled()
  {
    return mDoubleTapEnabled;
  }
  
  protected GestureDetector.OnGestureListener getGestureListener()
  {
    return new GestureListener();
  }
  
  @TargetApi(19)
  public boolean getQuickScaleEnabled()
  {
    if (Build.VERSION.SDK_INT >= 19) {
      return mScaleDetector.isQuickScaleEnabled();
    }
    return false;
  }
  
  public float getScaleFactor()
  {
    return mScaleFactor;
  }
  
  protected ScaleGestureDetector.OnScaleGestureListener getScaleListener()
  {
    return new ScaleListener();
  }
  
  protected void init(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super.init(paramContext, paramAttributeSet, paramInt);
    mTouchSlop = ViewConfiguration.get(getContext()).getScaledTouchSlop();
    mGestureListener = getGestureListener();
    mScaleListener = getScaleListener();
    mScaleDetector = new ScaleGestureDetector(getContext(), mScaleListener);
    mGestureDetector = new GestureDetector(getContext(), mGestureListener, null, true);
    mDoubleTapDirection = 1;
    setQuickScaleEnabled(false);
  }
  
  protected float onDoubleTapPost(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    if (mScaleFactor + paramFloat1 <= paramFloat2) {
      paramFloat3 = paramFloat1 + mScaleFactor;
    }
    return paramFloat3;
  }
  
  public boolean onDown(MotionEvent paramMotionEvent)
  {
    return !getBitmapChanged();
  }
  
  public boolean onFling(MotionEvent paramMotionEvent1, MotionEvent paramMotionEvent2, float paramFloat1, float paramFloat2)
  {
    if (!canScroll()) {
      return false;
    }
    if (DEBUG) {
      Log.i("ImageViewTouchBase", "onFling");
    }
    if ((Math.abs(paramFloat1) > mMinFlingVelocity * 4) || (Math.abs(paramFloat2) > mMinFlingVelocity * 4))
    {
      if (DEBUG)
      {
        Log.v("ImageViewTouchBase", "velocity: " + paramFloat2);
        Log.v("ImageViewTouchBase", "diff: " + (paramMotionEvent2.getY() - paramMotionEvent1.getY()));
      }
      float f = Math.min(Math.max(2.0F, getScale() / 2.0F), 3.0F);
      paramFloat1 = paramFloat1 / mMaxFlingVelocity * (getWidth() * f);
      paramFloat2 = paramFloat2 / mMaxFlingVelocity * (getHeight() * f);
      if (DEBUG)
      {
        Log.v("ImageViewTouchBase", "scale: " + getScale() + ", scale_final: " + f);
        Log.v("ImageViewTouchBase", "scaledDistanceX: " + paramFloat1);
        Log.v("ImageViewTouchBase", "scaledDistanceY: " + paramFloat2);
      }
      mUserScaled = true;
      scrollBy(paramFloat1, paramFloat2, Math.min(Math.max(300.0D, Math.sqrt(Math.pow(paramFloat1, 2.0D) + Math.pow(paramFloat2, 2.0D)) / 5.0D), 800.0D));
      postInvalidate();
      return true;
    }
    return false;
  }
  
  protected void onLayoutChanged(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onLayoutChanged(paramInt1, paramInt2, paramInt3, paramInt4);
    Log.v("ImageViewTouchBase", "min: " + getMinScale() + ", max: " + getMaxScale() + ", result: " + (getMaxScale() - getMinScale()) / 2.0F);
    mScaleFactor = ((getMaxScale() - getMinScale()) / 2.0F + 0.5F);
  }
  
  public boolean onScroll(MotionEvent paramMotionEvent1, MotionEvent paramMotionEvent2, float paramFloat1, float paramFloat2)
  {
    if (!canScroll()) {
      return false;
    }
    mUserScaled = true;
    scrollBy(-paramFloat1, -paramFloat2);
    invalidate();
    return true;
  }
  
  public boolean onSingleTapConfirmed(MotionEvent paramMotionEvent)
  {
    return true;
  }
  
  public boolean onSingleTapUp(MotionEvent paramMotionEvent)
  {
    return !getBitmapChanged();
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if (getBitmapChanged()) {
      return false;
    }
    int i = paramMotionEvent.getActionMasked();
    if (i == 6) {
      mPointerUpTime = paramMotionEvent.getEventTime();
    }
    mScaleDetector.onTouchEvent(paramMotionEvent);
    if (!mScaleDetector.isInProgress()) {
      mGestureDetector.onTouchEvent(paramMotionEvent);
    }
    switch (i)
    {
    default: 
      return true;
    }
    return onUp(paramMotionEvent);
  }
  
  public boolean onUp(MotionEvent paramMotionEvent)
  {
    if (getBitmapChanged()) {
      return false;
    }
    if (getScale() < getMinScale()) {
      zoomTo(getMinScale(), 50L);
    }
    return true;
  }
  
  public void setDoubleTapEnabled(boolean paramBoolean)
  {
    mDoubleTapEnabled = paramBoolean;
  }
  
  public void setDoubleTapListener(OnImageViewTouchDoubleTapListener paramOnImageViewTouchDoubleTapListener)
  {
    mDoubleTapListener = paramOnImageViewTouchDoubleTapListener;
  }
  
  @TargetApi(19)
  public void setQuickScaleEnabled(boolean paramBoolean)
  {
    if (Build.VERSION.SDK_INT >= 19) {
      mScaleDetector.setQuickScaleEnabled(paramBoolean);
    }
  }
  
  public void setScaleEnabled(boolean paramBoolean)
  {
    mScaleEnabled = paramBoolean;
  }
  
  public void setScrollEnabled(boolean paramBoolean)
  {
    mScrollEnabled = paramBoolean;
  }
  
  public void setSingleTapListener(OnImageViewTouchSingleTapListener paramOnImageViewTouchSingleTapListener)
  {
    mSingleTapListener = paramOnImageViewTouchSingleTapListener;
  }
  
  public class GestureListener
    extends GestureDetector.SimpleOnGestureListener
  {
    public GestureListener() {}
    
    public boolean onDoubleTap(MotionEvent paramMotionEvent)
    {
      if (ImageViewTouchBase.DEBUG) {
        Log.i("ImageViewTouchBase", "onDoubleTap. double tap enabled? " + mDoubleTapEnabled);
      }
      if (mDoubleTapEnabled)
      {
        if ((Build.VERSION.SDK_INT >= 19) && (mScaleDetector.isQuickScaleEnabled())) {
          return true;
        }
        mUserScaled = true;
        float f = getScale();
        f = onDoubleTapPost(f, getMaxScale(), getMinScale());
        f = Math.min(getMaxScale(), Math.max(f, getMinScale()));
        zoomTo(f, paramMotionEvent.getX(), paramMotionEvent.getY(), mDefaultAnimationDuration);
      }
      if (mDoubleTapListener != null) {
        mDoubleTapListener.onDoubleTap();
      }
      return super.onDoubleTap(paramMotionEvent);
    }
    
    public boolean onDown(MotionEvent paramMotionEvent)
    {
      if (ImageViewTouchBase.DEBUG) {
        Log.i("ImageViewTouchBase", "onDown");
      }
      stopAllAnimations();
      return ImageViewTouch.this.onDown(paramMotionEvent);
    }
    
    public boolean onFling(MotionEvent paramMotionEvent1, MotionEvent paramMotionEvent2, float paramFloat1, float paramFloat2)
    {
      if (!mScrollEnabled) {}
      while ((paramMotionEvent1 == null) || (paramMotionEvent2 == null) || (paramMotionEvent1.getPointerCount() > 1) || (paramMotionEvent2.getPointerCount() > 1) || (mScaleDetector.isInProgress()) || (SystemClock.uptimeMillis() - mPointerUpTime <= ImageViewTouch.MIN_FLING_DELTA_TIME)) {
        return false;
      }
      return ImageViewTouch.this.onFling(paramMotionEvent1, paramMotionEvent2, paramFloat1, paramFloat2);
    }
    
    public void onLongPress(MotionEvent paramMotionEvent)
    {
      if ((isLongClickable()) && (!mScaleDetector.isInProgress()))
      {
        setPressed(true);
        performLongClick();
      }
    }
    
    public boolean onScroll(MotionEvent paramMotionEvent1, MotionEvent paramMotionEvent2, float paramFloat1, float paramFloat2)
    {
      if (!mScrollEnabled) {}
      while ((paramMotionEvent1 == null) || (paramMotionEvent2 == null) || (paramMotionEvent1.getPointerCount() > 1) || (paramMotionEvent2.getPointerCount() > 1) || (mScaleDetector.isInProgress())) {
        return false;
      }
      return ImageViewTouch.this.onScroll(paramMotionEvent1, paramMotionEvent2, paramFloat1, paramFloat2);
    }
    
    public boolean onSingleTapConfirmed(MotionEvent paramMotionEvent)
    {
      if (mSingleTapListener != null) {
        mSingleTapListener.onSingleTapConfirmed();
      }
      return ImageViewTouch.this.onSingleTapConfirmed(paramMotionEvent);
    }
    
    public boolean onSingleTapUp(MotionEvent paramMotionEvent)
    {
      return ImageViewTouch.this.onSingleTapUp(paramMotionEvent);
    }
  }
  
  public static abstract interface OnImageViewTouchDoubleTapListener
  {
    public abstract void onDoubleTap();
  }
  
  public static abstract interface OnImageViewTouchSingleTapListener
  {
    public abstract void onSingleTapConfirmed();
  }
  
  public class ScaleListener
    extends ScaleGestureDetector.SimpleOnScaleGestureListener
  {
    protected boolean mScaled = false;
    
    public ScaleListener() {}
    
    public boolean onScale(ScaleGestureDetector paramScaleGestureDetector)
    {
      float f1 = paramScaleGestureDetector.getCurrentSpan();
      float f2 = paramScaleGestureDetector.getPreviousSpan();
      float f3 = getScale();
      float f4 = paramScaleGestureDetector.getScaleFactor();
      if (mScaleEnabled)
      {
        if ((!mScaled) || (f1 - f2 == 0.0F)) {
          break label120;
        }
        mUserScaled = true;
        f1 = Math.min(getMaxScale(), Math.max(f3 * f4, getMinScale() - 0.1F));
        zoomTo(f1, paramScaleGestureDetector.getFocusX(), paramScaleGestureDetector.getFocusY());
        mDoubleTapDirection = 1;
        invalidate();
      }
      label120:
      while (mScaled) {
        return true;
      }
      mScaled = true;
      return true;
    }
  }
}
