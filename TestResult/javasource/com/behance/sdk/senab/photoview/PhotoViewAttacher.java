package com.behance.sdk.senab.photoview;

import android.content.Context;
import android.graphics.Matrix;
import android.graphics.Matrix.ScaleToFit;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.util.Log;
import android.view.GestureDetector;
import android.view.GestureDetector.OnDoubleTapListener;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnLongClickListener;
import android.view.View.OnTouchListener;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import java.lang.ref.WeakReference;

public class PhotoViewAttacher
  implements GestureDetector.OnDoubleTapListener, View.OnTouchListener, ViewTreeObserver.OnGlobalLayoutListener, VersionedGestureDetector.OnGestureListener
{
  static final boolean DEBUG = Log.isLoggable("PhotoViewAttacher", 3);
  private boolean mAllowParentInterceptOnEdge = true;
  private final Matrix mBaseMatrix = new Matrix();
  private FlingRunnable mCurrentFlingRunnable;
  private final RectF mDisplayRect = new RectF();
  private final Matrix mDrawMatrix = new Matrix();
  private GestureDetector mGestureDetector;
  private WeakReference<ImageView> mImageView;
  private int mIvBottom;
  private int mIvLeft;
  private int mIvRight;
  private int mIvTop;
  private View.OnLongClickListener mLongClickListener;
  private OnMatrixChangedListener mMatrixChangeListener;
  private final float[] mMatrixValues = new float[9];
  private float mMaxScale = 3.0F;
  private float mMidScale = 1.75F;
  private float mMinScale = 0.3F;
  private OnPhotoTapListener mPhotoTapListener;
  private VersionedGestureDetector mScaleDragDetector;
  private ImageView.ScaleType mScaleType = ImageView.ScaleType.FIT_CENTER;
  private int mScrollEdge = 2;
  private final Matrix mSuppMatrix = new Matrix();
  private OnViewTapListener mViewTapListener;
  private ViewTreeObserver mViewTreeObserver;
  private boolean mZoomEnabled;
  private boolean zoomEventLoggedForAnalytics = false;
  
  public PhotoViewAttacher(ImageView paramImageView)
  {
    mImageView = new WeakReference(paramImageView);
    paramImageView.setOnTouchListener(this);
    mViewTreeObserver = paramImageView.getViewTreeObserver();
    mViewTreeObserver.addOnGlobalLayoutListener(this);
    setImageViewScaleTypeMatrix(paramImageView);
    if (!paramImageView.isInEditMode())
    {
      mScaleDragDetector = VersionedGestureDetector.newInstance(paramImageView.getContext(), this);
      mGestureDetector = new GestureDetector(paramImageView.getContext(), new GestureDetector.SimpleOnGestureListener()
      {
        public void onLongPress(MotionEvent paramAnonymousMotionEvent)
        {
          if (mLongClickListener != null) {
            mLongClickListener.onLongClick((View)mImageView.get());
          }
        }
      });
      mGestureDetector.setOnDoubleTapListener(this);
      setZoomable(true);
    }
  }
  
  private void cancelFling()
  {
    if (mCurrentFlingRunnable != null)
    {
      mCurrentFlingRunnable.cancelFling();
      mCurrentFlingRunnable = null;
    }
  }
  
  private void checkAndDisplayMatrix()
  {
    checkMatrixBounds();
    setImageViewMatrix(getDisplayMatrix());
  }
  
  private void checkImageViewScaleType()
  {
    ImageView localImageView = getImageView();
    if ((localImageView != null) && (!(localImageView instanceof PhotoView)) && (localImageView.getScaleType() != ImageView.ScaleType.MATRIX)) {
      throw new IllegalStateException("The ImageView's ScaleType has been changed since attaching a PhotoViewAttacher");
    }
  }
  
  private void checkMatrixBounds()
  {
    ImageView localImageView = getImageView();
    if (localImageView == null) {}
    RectF localRectF;
    do
    {
      return;
      localRectF = getDisplayRect(getDisplayMatrix());
    } while (localRectF == null);
    float f4 = localRectF.height();
    float f3 = localRectF.width();
    float f2 = 0.0F;
    float f1 = 0.0F;
    int i = localImageView.getHeight();
    if (f4 <= i) {
      switch (2.$SwitchMap$android$widget$ImageView$ScaleType[mScaleType.ordinal()])
      {
      default: 
        f1 = (i - f4) / 2.0F - top;
        i = localImageView.getWidth();
        if (f3 <= i) {
          switch (2.$SwitchMap$android$widget$ImageView$ScaleType[mScaleType.ordinal()])
          {
          default: 
            f2 = (i - f3) / 2.0F - left;
            label170:
            mScrollEdge = 2;
          }
        }
        break;
      }
    }
    for (;;)
    {
      mSuppMatrix.postTranslate(f2, f1);
      return;
      f1 = -top;
      break;
      f1 = i - f4 - top;
      break;
      if (top > 0.0F)
      {
        f1 = -top;
        break;
      }
      if (bottom >= i) {
        break;
      }
      f1 = i - bottom;
      break;
      f2 = -left;
      break label170;
      f2 = i - f3 - left;
      break label170;
      if (left > 0.0F)
      {
        mScrollEdge = 0;
        f2 = -left;
      }
      else if (right < i)
      {
        f2 = i - right;
        mScrollEdge = 1;
      }
      else
      {
        mScrollEdge = -1;
      }
    }
  }
  
  private static void checkZoomLevels(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    if (paramFloat1 >= paramFloat2) {
      throw new IllegalArgumentException("MinZoom should be less than MidZoom");
    }
    if (paramFloat2 >= paramFloat3) {
      throw new IllegalArgumentException("MidZoom should be less than MaxZoom");
    }
  }
  
  private RectF getDisplayRect(Matrix paramMatrix)
  {
    Object localObject = getImageView();
    if (localObject != null)
    {
      localObject = ((ImageView)localObject).getDrawable();
      if (localObject != null)
      {
        mDisplayRect.set(0.0F, 0.0F, ((Drawable)localObject).getIntrinsicWidth(), ((Drawable)localObject).getIntrinsicHeight());
        paramMatrix.mapRect(mDisplayRect);
        return mDisplayRect;
      }
    }
    return null;
  }
  
  private float getValue(Matrix paramMatrix, int paramInt)
  {
    paramMatrix.getValues(mMatrixValues);
    return mMatrixValues[paramInt];
  }
  
  private static boolean hasDrawable(ImageView paramImageView)
  {
    return (paramImageView != null) && (paramImageView.getDrawable() != null);
  }
  
  private static boolean isSupportedScaleType(ImageView.ScaleType paramScaleType)
  {
    if (paramScaleType == null) {
      return false;
    }
    switch (2.$SwitchMap$android$widget$ImageView$ScaleType[paramScaleType.ordinal()])
    {
    default: 
      return true;
    }
    throw new IllegalArgumentException(paramScaleType.name() + " is not supported in PhotoView");
  }
  
  private void resetMatrix()
  {
    mSuppMatrix.reset();
    setImageViewMatrix(getDisplayMatrix());
    checkMatrixBounds();
  }
  
  private void setImageViewMatrix(Matrix paramMatrix)
  {
    ImageView localImageView = getImageView();
    if (localImageView != null)
    {
      checkImageViewScaleType();
      localImageView.setImageMatrix(paramMatrix);
      if (mMatrixChangeListener != null)
      {
        paramMatrix = getDisplayRect(paramMatrix);
        if (paramMatrix != null) {
          mMatrixChangeListener.onMatrixChanged(paramMatrix);
        }
      }
    }
  }
  
  private static void setImageViewScaleTypeMatrix(ImageView paramImageView)
  {
    if ((paramImageView == null) || ((paramImageView instanceof PhotoView))) {
      return;
    }
    paramImageView.setScaleType(ImageView.ScaleType.MATRIX);
  }
  
  private void updateBaseMatrix(Drawable paramDrawable)
  {
    Object localObject = getImageView();
    if ((localObject == null) || (paramDrawable == null)) {
      return;
    }
    float f1 = ((ImageView)localObject).getWidth();
    float f2 = ((ImageView)localObject).getHeight();
    int i = paramDrawable.getIntrinsicWidth();
    int j = paramDrawable.getIntrinsicHeight();
    mBaseMatrix.reset();
    float f3 = f1 / i;
    float f4 = f2 / j;
    if (mScaleType == ImageView.ScaleType.CENTER) {
      mBaseMatrix.postTranslate((f1 - i) / 2.0F, (f2 - j) / 2.0F);
    }
    for (;;)
    {
      resetMatrix();
      return;
      if (mScaleType == ImageView.ScaleType.CENTER_CROP)
      {
        f3 = Math.max(f3, f4);
        mBaseMatrix.postScale(f3, f3);
        mBaseMatrix.postTranslate((f1 - i * f3) / 2.0F, (f2 - j * f3) / 2.0F);
      }
      else if (mScaleType == ImageView.ScaleType.CENTER_INSIDE)
      {
        f3 = Math.min(1.0F, Math.min(f3, f4));
        mBaseMatrix.postScale(f3, f3);
        mBaseMatrix.postTranslate((f1 - i * f3) / 2.0F, (f2 - j * f3) / 2.0F);
      }
      else
      {
        paramDrawable = new RectF(0.0F, 0.0F, i, j);
        localObject = new RectF(0.0F, 0.0F, f1, f2);
        switch (2.$SwitchMap$android$widget$ImageView$ScaleType[mScaleType.ordinal()])
        {
        default: 
          break;
        case 2: 
          mBaseMatrix.setRectToRect(paramDrawable, (RectF)localObject, Matrix.ScaleToFit.START);
          break;
        case 4: 
          mBaseMatrix.setRectToRect(paramDrawable, (RectF)localObject, Matrix.ScaleToFit.CENTER);
          break;
        case 3: 
          mBaseMatrix.setRectToRect(paramDrawable, (RectF)localObject, Matrix.ScaleToFit.END);
          break;
        case 5: 
          mBaseMatrix.setRectToRect(paramDrawable, (RectF)localObject, Matrix.ScaleToFit.FILL);
        }
      }
    }
  }
  
  public final void cleanup()
  {
    if (mImageView != null) {
      ((ImageView)mImageView.get()).getViewTreeObserver().removeGlobalOnLayoutListener(this);
    }
    mViewTreeObserver = null;
    mMatrixChangeListener = null;
    mPhotoTapListener = null;
    mViewTapListener = null;
    mImageView = null;
  }
  
  protected Matrix getDisplayMatrix()
  {
    mDrawMatrix.set(mBaseMatrix);
    mDrawMatrix.postConcat(mSuppMatrix);
    return mDrawMatrix;
  }
  
  public final RectF getDisplayRect()
  {
    checkMatrixBounds();
    return getDisplayRect(getDisplayMatrix());
  }
  
  public final ImageView getImageView()
  {
    ImageView localImageView = null;
    if (mImageView != null) {
      localImageView = (ImageView)mImageView.get();
    }
    if (localImageView == null)
    {
      cleanup();
      Log.e("PhotoViewAttacher", "ImageView no longer exists. You should not use this PhotoViewAttacher any more.", new IllegalStateException("ImageView no longer exists. You should not use this PhotoViewAttacher any more."));
    }
    return localImageView;
  }
  
  public float getMaxScale()
  {
    return mMaxScale;
  }
  
  public float getMidScale()
  {
    return mMidScale;
  }
  
  public float getMinScale()
  {
    return mMinScale;
  }
  
  public final float getScale()
  {
    return getValue(mSuppMatrix, 0);
  }
  
  public final ImageView.ScaleType getScaleType()
  {
    return mScaleType;
  }
  
  public final boolean onDoubleTap(MotionEvent paramMotionEvent)
  {
    try
    {
      float f1 = getScale();
      float f2 = paramMotionEvent.getX();
      float f3 = paramMotionEvent.getY();
      if (f1 < mMidScale) {
        zoomTo(mMidScale, f2, f3);
      } else if ((f1 >= mMidScale) && (f1 < mMaxScale)) {
        zoomTo(mMaxScale, f2, f3);
      } else {
        zoomTo(1.0F, f2, f3);
      }
    }
    catch (ArrayIndexOutOfBoundsException paramMotionEvent)
    {
      for (;;) {}
    }
    return true;
  }
  
  public final boolean onDoubleTapEvent(MotionEvent paramMotionEvent)
  {
    return false;
  }
  
  public final void onDrag(float paramFloat1, float paramFloat2)
  {
    if (DEBUG) {
      Log.d("PhotoViewAttacher", String.format("onDrag: dx: %.2f. dy: %.2f", new Object[] { Float.valueOf(paramFloat1), Float.valueOf(paramFloat2) }));
    }
    ImageView localImageView = getImageView();
    if ((localImageView != null) && (hasDrawable(localImageView)))
    {
      mSuppMatrix.postTranslate(paramFloat1, paramFloat2);
      checkAndDisplayMatrix();
      if ((mAllowParentInterceptOnEdge) && (!mScaleDragDetector.isScaling()) && ((mScrollEdge == 2) || ((mScrollEdge == 0) && (paramFloat1 >= 1.0F)) || ((mScrollEdge == 1) && (paramFloat1 <= -1.0F)))) {
        localImageView.getParent().requestDisallowInterceptTouchEvent(false);
      }
    }
  }
  
  public final void onFling(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    if (DEBUG) {
      Log.d("PhotoViewAttacher", "onFling. sX: " + paramFloat1 + " sY: " + paramFloat2 + " Vx: " + paramFloat3 + " Vy: " + paramFloat4);
    }
    ImageView localImageView = getImageView();
    if (hasDrawable(localImageView))
    {
      mCurrentFlingRunnable = new FlingRunnable(localImageView.getContext());
      mCurrentFlingRunnable.fling(localImageView.getWidth(), localImageView.getHeight(), (int)paramFloat3, (int)paramFloat4);
      localImageView.post(mCurrentFlingRunnable);
    }
  }
  
  public final void onGlobalLayout()
  {
    ImageView localImageView = getImageView();
    if ((localImageView != null) && (mZoomEnabled))
    {
      int i = localImageView.getTop();
      int j = localImageView.getRight();
      int k = localImageView.getBottom();
      int m = localImageView.getLeft();
      if ((i != mIvTop) || (k != mIvBottom) || (m != mIvLeft) || (j != mIvRight))
      {
        updateBaseMatrix(localImageView.getDrawable());
        mIvTop = i;
        mIvRight = j;
        mIvBottom = k;
        mIvLeft = m;
      }
    }
  }
  
  public final void onScale(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    if (DEBUG) {
      Log.d("PhotoViewAttacher", String.format("onScale: scale: %.2f. fX: %.2f. fY: %.2f", new Object[] { Float.valueOf(paramFloat1), Float.valueOf(paramFloat2), Float.valueOf(paramFloat3) }));
    }
    if ((hasDrawable(getImageView())) && ((getScale() < mMaxScale) || (paramFloat1 < 1.0F)))
    {
      mSuppMatrix.postScale(paramFloat1, paramFloat1, paramFloat2, paramFloat3);
      checkAndDisplayMatrix();
    }
  }
  
  public final boolean onSingleTapConfirmed(MotionEvent paramMotionEvent)
  {
    ImageView localImageView = getImageView();
    if (localImageView != null)
    {
      if (mPhotoTapListener != null)
      {
        RectF localRectF = getDisplayRect();
        if (localRectF != null)
        {
          float f2 = paramMotionEvent.getX();
          float f1 = paramMotionEvent.getY();
          if (localRectF.contains(f2, f1))
          {
            f2 = (f2 - left) / localRectF.width();
            f1 = (f1 - top) / localRectF.height();
            mPhotoTapListener.onPhotoTap(localImageView, f2, f1);
            return true;
          }
        }
      }
      if (mViewTapListener != null) {
        mViewTapListener.onViewTap(localImageView, paramMotionEvent.getX(), paramMotionEvent.getY());
      }
    }
    return false;
  }
  
  public final boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    boolean bool1 = false;
    boolean bool2 = false;
    if (mZoomEnabled)
    {
      bool1 = bool2;
      switch (paramMotionEvent.getAction())
      {
      default: 
        bool1 = bool2;
      }
    }
    for (;;)
    {
      bool2 = bool1;
      if (mGestureDetector != null)
      {
        bool2 = bool1;
        if (mGestureDetector.onTouchEvent(paramMotionEvent)) {
          bool2 = true;
        }
      }
      bool1 = bool2;
      if (mScaleDragDetector != null)
      {
        bool1 = bool2;
        if (mScaleDragDetector.onTouchEvent(paramMotionEvent)) {
          bool1 = true;
        }
      }
      return bool1;
      paramView.getParent().requestDisallowInterceptTouchEvent(true);
      cancelFling();
      bool1 = bool2;
      continue;
      bool1 = bool2;
      if (getScale() < mMinScale)
      {
        RectF localRectF = getDisplayRect();
        bool1 = bool2;
        if (localRectF != null)
        {
          paramView.post(new AnimatedZoomRunnable(getScale(), mMinScale, localRectF.centerX(), localRectF.centerY()));
          bool1 = true;
        }
      }
    }
  }
  
  public void setAllowParentInterceptOnEdge(boolean paramBoolean)
  {
    mAllowParentInterceptOnEdge = paramBoolean;
  }
  
  public void setMaxScale(float paramFloat)
  {
    checkZoomLevels(mMinScale, mMidScale, paramFloat);
    mMaxScale = paramFloat;
  }
  
  public void setMidScale(float paramFloat)
  {
    checkZoomLevels(mMinScale, paramFloat, mMaxScale);
    mMidScale = paramFloat;
  }
  
  public void setMinScale(float paramFloat)
  {
    checkZoomLevels(paramFloat, mMidScale, mMaxScale);
    mMinScale = paramFloat;
  }
  
  public final void setOnLongClickListener(View.OnLongClickListener paramOnLongClickListener)
  {
    mLongClickListener = paramOnLongClickListener;
  }
  
  public final void setOnMatrixChangeListener(OnMatrixChangedListener paramOnMatrixChangedListener)
  {
    mMatrixChangeListener = paramOnMatrixChangedListener;
  }
  
  public final void setOnPhotoTapListener(OnPhotoTapListener paramOnPhotoTapListener)
  {
    mPhotoTapListener = paramOnPhotoTapListener;
  }
  
  public final void setOnViewTapListener(OnViewTapListener paramOnViewTapListener)
  {
    mViewTapListener = paramOnViewTapListener;
  }
  
  public final void setScaleType(ImageView.ScaleType paramScaleType)
  {
    if ((isSupportedScaleType(paramScaleType)) && (paramScaleType != mScaleType))
    {
      mScaleType = paramScaleType;
      update();
    }
  }
  
  public final void setZoomable(boolean paramBoolean)
  {
    mZoomEnabled = paramBoolean;
    update();
  }
  
  public final void update()
  {
    ImageView localImageView = getImageView();
    if (localImageView != null)
    {
      if (mZoomEnabled)
      {
        setImageViewScaleTypeMatrix(localImageView);
        updateBaseMatrix(localImageView.getDrawable());
      }
    }
    else {
      return;
    }
    resetMatrix();
  }
  
  public final void zoomTo(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    ImageView localImageView = getImageView();
    if (localImageView != null) {
      localImageView.post(new AnimatedZoomRunnable(getScale(), paramFloat1, paramFloat2, paramFloat3));
    }
    if (!zoomEventLoggedForAnalytics) {
      zoomEventLoggedForAnalytics = true;
    }
  }
  
  private class AnimatedZoomRunnable
    implements Runnable
  {
    private final float mDeltaScale;
    private final float mFocalX;
    private final float mFocalY;
    private final float mTargetZoom;
    
    public AnimatedZoomRunnable(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
    {
      mTargetZoom = paramFloat2;
      mFocalX = paramFloat3;
      mFocalY = paramFloat4;
      if (paramFloat1 < paramFloat2)
      {
        mDeltaScale = 1.07F;
        return;
      }
      mDeltaScale = 0.93F;
    }
    
    public void run()
    {
      ImageView localImageView = getImageView();
      if (localImageView != null)
      {
        mSuppMatrix.postScale(mDeltaScale, mDeltaScale, mFocalX, mFocalY);
        PhotoViewAttacher.this.checkAndDisplayMatrix();
        f = getScale();
        if (((mDeltaScale > 1.0F) && (f < mTargetZoom)) || ((mDeltaScale < 1.0F) && (mTargetZoom < f))) {
          Compat.postOnAnimation(localImageView, this);
        }
      }
      else
      {
        return;
      }
      float f = mTargetZoom / f;
      mSuppMatrix.postScale(f, f, mFocalX, mFocalY);
      PhotoViewAttacher.this.checkAndDisplayMatrix();
    }
  }
  
  private class FlingRunnable
    implements Runnable
  {
    private int mCurrentX;
    private int mCurrentY;
    private final ScrollerProxy mScroller;
    
    public FlingRunnable(Context paramContext)
    {
      mScroller = ScrollerProxy.getScroller(paramContext);
    }
    
    public void cancelFling()
    {
      if (PhotoViewAttacher.DEBUG) {
        Log.d("PhotoViewAttacher", "Cancel Fling");
      }
      mScroller.forceFinished(true);
    }
    
    public void fling(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
    {
      RectF localRectF = getDisplayRect();
      if (localRectF == null) {
        return;
      }
      int i = Math.round(-left);
      int k;
      int j;
      label56:
      int n;
      int m;
      if (paramInt1 < localRectF.width())
      {
        k = 0;
        j = Math.round(localRectF.width() - paramInt1);
        paramInt1 = k;
        k = Math.round(-top);
        if (paramInt2 >= localRectF.height()) {
          break label218;
        }
        n = 0;
        m = Math.round(localRectF.height() - paramInt2);
      }
      for (paramInt2 = n;; paramInt2 = k)
      {
        mCurrentX = i;
        mCurrentY = k;
        if (PhotoViewAttacher.DEBUG) {
          Log.d("PhotoViewAttacher", "fling. StartX:" + i + " StartY:" + k + " MaxX:" + j + " MaxY:" + m);
        }
        if ((i == j) && (k == m)) {
          break;
        }
        mScroller.fling(i, k, paramInt3, paramInt4, paramInt1, j, paramInt2, m, 0, 0);
        return;
        j = i;
        paramInt1 = i;
        break label56;
        label218:
        m = k;
      }
    }
    
    public void run()
    {
      ImageView localImageView = getImageView();
      if ((localImageView != null) && (mScroller.computeScrollOffset()))
      {
        int i = mScroller.getCurrX();
        int j = mScroller.getCurrY();
        if (PhotoViewAttacher.DEBUG) {
          Log.d("PhotoViewAttacher", "fling run(). CurrentX:" + mCurrentX + " CurrentY:" + mCurrentY + " NewX:" + i + " NewY:" + j);
        }
        mSuppMatrix.postTranslate(mCurrentX - i, mCurrentY - j);
        PhotoViewAttacher.this.setImageViewMatrix(getDisplayMatrix());
        mCurrentX = i;
        mCurrentY = j;
        Compat.postOnAnimation(localImageView, this);
      }
    }
  }
  
  public static abstract interface OnMatrixChangedListener
  {
    public abstract void onMatrixChanged(RectF paramRectF);
  }
  
  public static abstract interface OnPhotoTapListener
  {
    public abstract void onPhotoTap(View paramView, float paramFloat1, float paramFloat2);
  }
  
  public static abstract interface OnViewTapListener
  {
    public abstract void onViewTap(View paramView, float paramFloat1, float paramFloat2);
  }
}
