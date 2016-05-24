package com.adobe.creativesdk.aviary.widget;

import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Handler;
import android.util.AttributeSet;
import android.util.Log;
import android.view.GestureDetector;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import com.adobe.creativesdk.aviary.internal.graphics.RectD;
import com.aviary.android.feather.sdk.R.styleable;
import it.sephiroth.android.library.imagezoom.ImageViewTouch;
import it.sephiroth.android.library.imagezoom.graphics.IBitmapDrawable;

public class CropImageView
  extends ImageViewTouch
{
  protected double mAspectRatio = 0.0D;
  private boolean mAspectRatioFixed;
  private int mCropMinSize = 10;
  protected Handler mHandler = new Handler();
  private int mHighlighStyle;
  private OnHighlightSingleTapUpConfirmedListener mHighlightSingleTapUpListener;
  private HighlightView mHighlightView;
  private int mMotionEdge = 1;
  private HighlightView mMotionHighlightView;
  private Rect mRect1 = new Rect();
  private Rect mRect2 = new Rect();
  Runnable onLayoutRunnable = new Runnable()
  {
    public void run()
    {
      Drawable localDrawable = getDrawable();
      if ((localDrawable != null) && (((IBitmapDrawable)localDrawable).getBitmap() != null) && (mHighlightView != null))
      {
        if (mHighlightView.isRunning()) {
          mHandler.post(this);
        }
      }
      else {
        return;
      }
      mHighlightView.getMatrix().set(getImageMatrix());
      mHighlightView.invalidate();
    }
  };
  
  public CropImageView(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public CropImageView(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
  }
  
  private RectD computeFinalCropRect(double paramDouble)
  {
    float f1 = getScale();
    float f2 = getDrawable().getIntrinsicWidth();
    float f3 = getDrawable().getIntrinsicHeight();
    RectF localRectF = new RectF(0.0F, 0.0F, getWidth(), getHeight());
    Object localObject = getBitmapRect();
    localObject = new RectF(Math.max(left, left), Math.max(top, top), Math.min(right, right), Math.min(bottom, bottom));
    double d3 = Math.min(Math.min(f2 / f1, ((RectF)localObject).width()), Math.min(f3 / f1, ((RectF)localObject).height())) * 0.8F;
    double d4 = d3;
    double d1 = d4;
    double d2 = d3;
    if (paramDouble != 0.0D)
    {
      if (paramDouble <= 1.0D) {
        break label269;
      }
      d1 = d4 / paramDouble;
      d2 = d3;
    }
    for (;;)
    {
      localObject = getImageMatrix();
      Matrix localMatrix = new Matrix();
      if (!((Matrix)localObject).invert(localMatrix)) {
        Log.e("ImageViewTouchBase", "cannot invert matrix");
      }
      localMatrix.mapRect(localRectF);
      paramDouble = localRectF.centerX() - d2 / 2.0D;
      d3 = localRectF.centerY() - d1 / 2.0D;
      return new RectD(paramDouble, d3, paramDouble + d2, d3 + d1);
      label269:
      d2 = d3 * paramDouble;
      d1 = d4;
    }
  }
  
  private boolean ensureVisible(HighlightView paramHighlightView)
  {
    boolean bool = false;
    paramHighlightView = paramHighlightView.getDrawRect();
    int i = Math.max(0, getLeft() - left);
    int m = Math.min(0, getRight() - right);
    int j = Math.max(0, getTop() - top);
    int k = Math.min(0, getBottom() - bottom);
    if (i != 0) {
      if (j == 0) {
        break label102;
      }
    }
    for (;;)
    {
      if ((i != 0) || (j != 0))
      {
        panBy(i, j);
        bool = true;
      }
      return bool;
      i = m;
      break;
      label102:
      j = k;
    }
  }
  
  private void updateAspectRatio(double paramDouble, HighlightView paramHighlightView, boolean paramBoolean)
  {
    float f1 = getDrawable().getIntrinsicWidth();
    float f2 = getDrawable().getIntrinsicHeight();
    RectD localRectD1 = new RectD(0.0D, 0.0D, (int)f1, (int)f2);
    Matrix localMatrix = getImageMatrix();
    RectD localRectD2 = computeFinalCropRect(paramDouble);
    if (paramBoolean)
    {
      paramHighlightView.animateTo(this, localMatrix, localRectD1, localRectD2, mAspectRatioFixed);
      return;
    }
    paramHighlightView.setup(localMatrix, localRectD1, localRectD2, mAspectRatioFixed);
    postInvalidate();
  }
  
  public double getAspectRatio()
  {
    return mAspectRatio;
  }
  
  public boolean getAspectRatioIsFixed()
  {
    return mAspectRatioFixed;
  }
  
  public HighlightView getHighlightView()
  {
    return mHighlightView;
  }
  
  protected void init(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super.init(paramContext, paramAttributeSet, paramInt);
    mGestureDetector = null;
    mGestureListener = null;
    mScaleListener = null;
    mGestureDetector = new GestureDetector(getContext(), new CropGestureListener(), null, true);
    mGestureDetector.setIsLongpressEnabled(false);
    paramContext = paramContext.getTheme().obtainStyledAttributes(paramAttributeSet, R.styleable.AdobeImageCropImageView, paramInt, 0);
    mCropMinSize = paramContext.getDimensionPixelSize(R.styleable.AdobeImageCropImageView_adobe_minCropSize, 50);
    mHighlighStyle = paramContext.getResourceId(R.styleable.AdobeImageCropImageView_adobe_highlightStyle, -1);
    paramContext.recycle();
  }
  
  public void onConfigurationChanged(Configuration paramConfiguration)
  {
    if (getHandler() != null) {
      getHandler().postDelayed(new Runnable()
      {
        public void run()
        {
          setAspectRatio(mAspectRatio, getAspectRatioIsFixed());
        }
      }, 500L);
    }
    postInvalidate();
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    super.onDraw(paramCanvas);
    if (mHighlightView != null) {
      mHighlightView.draw(paramCanvas);
    }
  }
  
  protected void onDrawableChanged(Drawable paramDrawable)
  {
    super.onDrawableChanged(paramDrawable);
    if (getHandler() != null) {
      getHandler().post(new Runnable()
      {
        public void run()
        {
          updateCropView(true);
        }
      });
    }
  }
  
  protected void onLayoutChanged(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onLayoutChanged(paramInt1, paramInt2, paramInt3, paramInt4);
    mHandler.post(onLayoutRunnable);
  }
  
  protected void onSizeChanged(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.onSizeChanged(paramInt1, paramInt2, paramInt3, paramInt4);
    if (mHighlightView != null) {
      mHighlightView.onSizeChanged(this, paramInt1, paramInt2, paramInt3, paramInt4);
    }
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    super.onTouchEvent(paramMotionEvent);
    switch (paramMotionEvent.getAction() & 0xFF)
    {
    default: 
      return true;
    }
    if (mHighlightView != null)
    {
      mHighlightView.setMode(HighlightView.Mode.None, 1);
      postInvalidate();
    }
    mMotionHighlightView = null;
    mMotionEdge = 1;
    return true;
  }
  
  protected void postScale(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    if (mHighlightView != null)
    {
      if (mHighlightView.isRunning()) {
        return;
      }
      RectD localRectD = mHighlightView.getCropRectD();
      mHighlightView.getDisplayRect(getImageViewMatrix(), mHighlightView.getCropRectD(), mRect1);
      super.postScale(paramFloat1, paramFloat2, paramFloat3);
      mHighlightView.getDisplayRect(getImageViewMatrix(), mHighlightView.getCropRectD(), mRect2);
      float[] arrayOfFloat = new float[9];
      getImageViewMatrix().getValues(arrayOfFloat);
      paramFloat1 = arrayOfFloat[0];
      localRectD.offset((mRect1.left - mRect2.left) / paramFloat1, (mRect1.top - mRect2.top) / paramFloat1);
      right += -(mRect2.width() - mRect1.width()) / paramFloat1;
      bottom += -(mRect2.height() - mRect1.height()) / paramFloat1;
      mHighlightView.getMatrix().set(getImageMatrix());
      mHighlightView.getCropRectD().set(localRectD);
      mHighlightView.invalidate();
      return;
    }
    super.postScale(paramFloat1, paramFloat2, paramFloat3);
  }
  
  protected void postTranslate(float paramFloat1, float paramFloat2)
  {
    super.postTranslate(paramFloat1, paramFloat2);
    if ((mHighlightView == null) || (mHighlightView.isRunning())) {
      return;
    }
    if (getScale() != 1.0F)
    {
      float[] arrayOfFloat = new float[9];
      getImageMatrix().getValues(arrayOfFloat);
      float f = arrayOfFloat[0];
      mHighlightView.getCropRectD().offset(-paramFloat1 / f, -paramFloat2 / f);
    }
    mHighlightView.getMatrix().set(getImageMatrix());
    mHighlightView.invalidate();
  }
  
  public void setAspectRatio(double paramDouble, boolean paramBoolean)
  {
    if (getDrawable() != null)
    {
      mAspectRatio = paramDouble;
      mAspectRatioFixed = paramBoolean;
      updateCropView(false);
    }
  }
  
  public void setHighlightView(HighlightView paramHighlightView)
  {
    if (mHighlightView != null) {
      mHighlightView.dispose();
    }
    mMotionHighlightView = null;
    mHighlightView = paramHighlightView;
    if (mHighlightView != null) {
      mHighlightView.fadeIn(this);
    }
    invalidate();
  }
  
  public void setImageBitmap(Bitmap paramBitmap, double paramDouble, boolean paramBoolean)
  {
    mAspectRatio = paramDouble;
    mAspectRatioFixed = paramBoolean;
    setImageBitmap(paramBitmap, null, -1.0F, 8.0F);
  }
  
  public void setImageDrawable(Drawable paramDrawable, Matrix paramMatrix, float paramFloat1, float paramFloat2)
  {
    mMotionHighlightView = null;
    super.setImageDrawable(paramDrawable, paramMatrix, paramFloat1, paramFloat2);
  }
  
  @Deprecated
  public void setMinCropSize(int paramInt)
  {
    mCropMinSize = paramInt;
    if (mHighlightView != null) {
      mHighlightView.setMinSize(paramInt);
    }
  }
  
  public void setOnHighlightSingleTapUpConfirmedListener(OnHighlightSingleTapUpConfirmedListener paramOnHighlightSingleTapUpConfirmedListener)
  {
    mHighlightSingleTapUpListener = paramOnHighlightSingleTapUpConfirmedListener;
  }
  
  public void updateCropView(boolean paramBoolean)
  {
    if (paramBoolean) {
      setHighlightView(null);
    }
    if (getDrawable() == null)
    {
      setHighlightView(null);
      invalidate();
      return;
    }
    if (getHighlightView() != null) {
      updateAspectRatio(mAspectRatio, getHighlightView(), true);
    }
    for (;;)
    {
      invalidate();
      return;
      HighlightView localHighlightView = new HighlightView(this, mHighlighStyle);
      localHighlightView.setMinSize(mCropMinSize);
      updateAspectRatio(mAspectRatio, localHighlightView, false);
      setHighlightView(localHighlightView);
    }
  }
  
  class CropGestureListener
    extends GestureDetector.SimpleOnGestureListener
  {
    CropGestureListener() {}
    
    public boolean onDoubleTap(MotionEvent paramMotionEvent)
    {
      if (mDoubleTapEnabled)
      {
        CropImageView.access$102(CropImageView.this, null);
        float f = getScale();
        f = onDoubleTapPost(f, getMaxScale(), getMinScale());
        f = Math.min(getMaxScale(), Math.max(f, 1.0F));
        zoomTo(f, paramMotionEvent.getX(), paramMotionEvent.getY(), 200L);
        invalidate();
      }
      return super.onDoubleTap(paramMotionEvent);
    }
    
    public boolean onDown(MotionEvent paramMotionEvent)
    {
      CropImageView.access$102(CropImageView.this, null);
      Object localObject = mHighlightView;
      int i;
      HighlightView localHighlightView;
      if (localObject != null)
      {
        i = ((HighlightView)localObject).getHit(paramMotionEvent.getX(), paramMotionEvent.getY());
        if (i != 1)
        {
          CropImageView.access$202(CropImageView.this, i);
          CropImageView.access$102(CropImageView.this, (HighlightView)localObject);
          localHighlightView = mMotionHighlightView;
          if (i != 32) {
            break label96;
          }
        }
      }
      label96:
      for (localObject = HighlightView.Mode.Move;; localObject = HighlightView.Mode.Grow)
      {
        localHighlightView.setMode((HighlightView.Mode)localObject, i);
        postInvalidate();
        return super.onDown(paramMotionEvent);
      }
    }
    
    public boolean onFling(MotionEvent paramMotionEvent1, MotionEvent paramMotionEvent2, float paramFloat1, float paramFloat2)
    {
      if ((paramMotionEvent1.getPointerCount() > 1) || (paramMotionEvent2.getPointerCount() > 1)) {}
      while ((mScaleDetector.isInProgress()) || (mMotionHighlightView != null)) {
        return false;
      }
      return super.onFling(paramMotionEvent1, paramMotionEvent2, paramFloat1, paramFloat2);
    }
    
    public boolean onScroll(MotionEvent paramMotionEvent1, MotionEvent paramMotionEvent2, float paramFloat1, float paramFloat2)
    {
      if ((paramMotionEvent1 == null) || (paramMotionEvent2 == null)) {}
      while ((paramMotionEvent1.getPointerCount() > 1) || (paramMotionEvent2.getPointerCount() > 1) || (mScaleDetector.isInProgress())) {
        return false;
      }
      if ((mMotionHighlightView != null) && (mMotionEdge != 1))
      {
        mMotionHighlightView.handleMotion(mMotionEdge, -paramFloat1, -paramFloat2);
        if (mMotionEdge == 32) {
          invalidate(mMotionHighlightView.getInvalidateRect());
        }
        for (;;)
        {
          CropImageView.this.ensureVisible(mMotionHighlightView);
          return true;
          postInvalidate();
        }
      }
      scrollBy(-paramFloat1, -paramFloat2);
      invalidate();
      return true;
    }
    
    public boolean onSingleTapConfirmed(MotionEvent paramMotionEvent)
    {
      CropImageView.access$102(CropImageView.this, null);
      return super.onSingleTapConfirmed(paramMotionEvent);
    }
    
    public boolean onSingleTapUp(MotionEvent paramMotionEvent)
    {
      CropImageView.access$102(CropImageView.this, null);
      if ((mHighlightView != null) && (mMotionEdge == 32) && (mHighlightSingleTapUpListener != null)) {
        mHighlightSingleTapUpListener.onSingleTapUpConfirmed();
      }
      return super.onSingleTapUp(paramMotionEvent);
    }
  }
  
  public static abstract interface OnHighlightSingleTapUpConfirmedListener
  {
    public abstract void onSingleTapUpConfirmed();
  }
}
