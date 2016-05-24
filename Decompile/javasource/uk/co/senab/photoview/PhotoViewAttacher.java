package uk.co.senab.photoview;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.Matrix.ScaleToFit;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.os.Build.VERSION;
import android.util.FloatMath;
import android.util.Log;
import android.view.GestureDetector.OnDoubleTapListener;
import android.view.GestureDetector.SimpleOnGestureListener;
import android.view.MotionEvent;
import android.view.View;
import android.view.View.OnLongClickListener;
import android.view.View.OnTouchListener;
import android.view.ViewParent;
import android.view.ViewTreeObserver;
import android.view.ViewTreeObserver.OnGlobalLayoutListener;
import android.view.animation.AccelerateDecelerateInterpolator;
import android.view.animation.Interpolator;
import android.widget.ImageView;
import android.widget.ImageView.ScaleType;
import java.lang.ref.WeakReference;
import uk.co.senab.photoview.gestures.OnGestureListener;
import uk.co.senab.photoview.gestures.VersionedGestureDetector;
import uk.co.senab.photoview.log.LogManager;
import uk.co.senab.photoview.log.Logger;
import uk.co.senab.photoview.scrollerproxy.ScrollerProxy;

public class PhotoViewAttacher
  implements View.OnTouchListener, ViewTreeObserver.OnGlobalLayoutListener, IPhotoView, OnGestureListener
{
  private static final boolean DEBUG = Log.isLoggable("PhotoViewAttacher", 3);
  static final Interpolator sInterpolator = new AccelerateDecelerateInterpolator();
  int ZOOM_DURATION = 200;
  private boolean mAllowParentInterceptOnEdge = true;
  private final Matrix mBaseMatrix = new Matrix();
  private FlingRunnable mCurrentFlingRunnable;
  private final RectF mDisplayRect = new RectF();
  private final Matrix mDrawMatrix = new Matrix();
  private android.view.GestureDetector mGestureDetector;
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
  private float mMinScale = 1.0F;
  private OnPhotoTapListener mPhotoTapListener;
  private uk.co.senab.photoview.gestures.GestureDetector mScaleDragDetector;
  private ImageView.ScaleType mScaleType = ImageView.ScaleType.FIT_CENTER;
  private int mScrollEdge = 2;
  private final Matrix mSuppMatrix = new Matrix();
  private OnViewTapListener mViewTapListener;
  private IPhotoViewZoomDelegate mZoomDelegate;
  private boolean mZoomEnabled;
  private float mZoomFocusX = 0.0F;
  private float mZoomFocusY = 0.0F;
  private float mZoomScale = 1.0F;
  
  public PhotoViewAttacher(ImageView paramImageView)
  {
    mImageView = new WeakReference(paramImageView);
    paramImageView.setDrawingCacheEnabled(true);
    paramImageView.setOnTouchListener(this);
    ViewTreeObserver localViewTreeObserver = paramImageView.getViewTreeObserver();
    if (localViewTreeObserver != null) {
      localViewTreeObserver.addOnGlobalLayoutListener(this);
    }
    setImageViewScaleTypeMatrix(paramImageView);
    if (paramImageView.isInEditMode()) {
      return;
    }
    mScaleDragDetector = VersionedGestureDetector.newInstance(paramImageView.getContext(), this);
    mGestureDetector = new android.view.GestureDetector(paramImageView.getContext(), new GestureDetector.SimpleOnGestureListener()
    {
      public void onLongPress(MotionEvent paramAnonymousMotionEvent)
      {
        if (mLongClickListener != null) {
          mLongClickListener.onLongClick(getImageView());
        }
      }
    });
    mGestureDetector.setOnDoubleTapListener(new DefaultOnDoubleTapListener(this));
    setZoomable(true);
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
    if (checkMatrixBounds()) {
      setImageViewMatrix(getDrawMatrix());
    }
  }
  
  private void checkImageViewScaleType()
  {
    ImageView localImageView = getImageView();
    if ((localImageView != null) && (!(localImageView instanceof IPhotoView)) && (!ImageView.ScaleType.MATRIX.equals(localImageView.getScaleType()))) {
      throw new IllegalStateException("The ImageView's ScaleType has been changed since attaching a PhotoViewAttacher");
    }
  }
  
  private boolean checkMatrixBounds()
  {
    ImageView localImageView = getImageView();
    if (localImageView == null) {}
    RectF localRectF;
    do
    {
      return false;
      localRectF = getDisplayRect(getDrawMatrix());
    } while (localRectF == null);
    float f4 = localRectF.height();
    float f3 = localRectF.width();
    float f2 = 0.0F;
    float f1 = 0.0F;
    int i = getImageViewHeight(localImageView);
    if (f4 <= i) {
      switch (mScaleType)
      {
      default: 
        f1 = (i - f4) / 2.0F - top;
        i = getImageViewWidth(localImageView);
        if (f3 <= i) {
          switch (mScaleType)
          {
          default: 
            f2 = (i - f3) / 2.0F - left;
            label174:
            mScrollEdge = 2;
          }
        }
        break;
      }
    }
    for (;;)
    {
      mSuppMatrix.postTranslate(f2, f1);
      return true;
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
      break label174;
      f2 = i - f3 - left;
      break label174;
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
      throw new IllegalArgumentException("MinZoom has to be less than MidZoom");
    }
    if (paramFloat2 >= paramFloat3) {
      throw new IllegalArgumentException("MidZoom has to be less than MaxZoom");
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
  
  private int getImageViewHeight(ImageView paramImageView)
  {
    if (paramImageView == null) {
      return 0;
    }
    return paramImageView.getHeight() - paramImageView.getPaddingTop() - paramImageView.getPaddingBottom();
  }
  
  private int getImageViewWidth(ImageView paramImageView)
  {
    if (paramImageView == null) {
      return 0;
    }
    return paramImageView.getWidth() - paramImageView.getPaddingLeft() - paramImageView.getPaddingRight();
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
    switch (paramScaleType)
    {
    default: 
      return true;
    }
    throw new IllegalArgumentException(paramScaleType.name() + " is not supported in PhotoView");
  }
  
  private void resetMatrix()
  {
    mSuppMatrix.reset();
    setScale(mZoomScale, mZoomFocusX, mZoomFocusY, false);
    setImageViewMatrix(getDrawMatrix());
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
    if ((paramImageView != null) && (!(paramImageView instanceof IPhotoView)) && (!ImageView.ScaleType.MATRIX.equals(paramImageView.getScaleType()))) {
      paramImageView.setScaleType(ImageView.ScaleType.MATRIX);
    }
  }
  
  private void updateBaseMatrix(Drawable paramDrawable)
  {
    Object localObject = getImageView();
    if ((localObject == null) || (paramDrawable == null)) {
      return;
    }
    float f1 = getImageViewWidth((ImageView)localObject);
    float f2 = getImageViewHeight((ImageView)localObject);
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
        switch (mScaleType)
        {
        default: 
          break;
        case FIT_CENTER: 
          mBaseMatrix.setRectToRect(paramDrawable, (RectF)localObject, Matrix.ScaleToFit.CENTER);
          break;
        case FIT_START: 
          mBaseMatrix.setRectToRect(paramDrawable, (RectF)localObject, Matrix.ScaleToFit.START);
          break;
        case FIT_END: 
          mBaseMatrix.setRectToRect(paramDrawable, (RectF)localObject, Matrix.ScaleToFit.END);
          break;
        case FIT_XY: 
          mBaseMatrix.setRectToRect(paramDrawable, (RectF)localObject, Matrix.ScaleToFit.FILL);
        }
      }
    }
  }
  
  public void cleanup()
  {
    if (mImageView == null) {
      return;
    }
    ImageView localImageView = (ImageView)mImageView.get();
    ViewTreeObserver localViewTreeObserver;
    if (localImageView != null)
    {
      localViewTreeObserver = localImageView.getViewTreeObserver();
      if ((localViewTreeObserver != null) && (localViewTreeObserver.isAlive()))
      {
        if (Build.VERSION.SDK_INT >= 16) {
          break label97;
        }
        localViewTreeObserver.removeGlobalOnLayoutListener(this);
      }
    }
    for (;;)
    {
      localImageView.setOnTouchListener(null);
      cancelFling();
      if (mGestureDetector != null) {
        mGestureDetector.setOnDoubleTapListener(null);
      }
      mMatrixChangeListener = null;
      mPhotoTapListener = null;
      mViewTapListener = null;
      mImageView = null;
      return;
      label97:
      localViewTreeObserver.removeOnGlobalLayoutListener(this);
    }
  }
  
  public RectF getDisplayRect()
  {
    checkMatrixBounds();
    return getDisplayRect(getDrawMatrix());
  }
  
  public Matrix getDrawMatrix()
  {
    mDrawMatrix.set(mBaseMatrix);
    mDrawMatrix.postConcat(mSuppMatrix);
    return mDrawMatrix;
  }
  
  public ImageView getImageView()
  {
    ImageView localImageView = null;
    if (mImageView != null) {
      localImageView = (ImageView)mImageView.get();
    }
    if (localImageView == null)
    {
      cleanup();
      Log.i("PhotoViewAttacher", "ImageView no longer exists. You should not use this PhotoViewAttacher any more.");
    }
    return localImageView;
  }
  
  public float getMaximumScale()
  {
    return mMaxScale;
  }
  
  public float getMediumScale()
  {
    return mMidScale;
  }
  
  public float getMinimumScale()
  {
    return mMinScale;
  }
  
  public OnPhotoTapListener getOnPhotoTapListener()
  {
    return mPhotoTapListener;
  }
  
  public OnViewTapListener getOnViewTapListener()
  {
    return mViewTapListener;
  }
  
  public float getScale()
  {
    return FloatMath.sqrt((float)Math.pow(getValue(mSuppMatrix, 0), 2.0D) + (float)Math.pow(getValue(mSuppMatrix, 3), 2.0D));
  }
  
  public ImageView.ScaleType getScaleType()
  {
    return mScaleType;
  }
  
  public Bitmap getVisibleRectangleBitmap()
  {
    ImageView localImageView = getImageView();
    if (localImageView == null) {
      return null;
    }
    return localImageView.getDrawingCache();
  }
  
  public IPhotoViewZoomDelegate getZoomDelegate()
  {
    return mZoomDelegate;
  }
  
  public void onDrag(float paramFloat1, float paramFloat2)
  {
    if (mScaleDragDetector.isScaling()) {}
    Object localObject;
    do
    {
      do
      {
        do
        {
          return;
          if (DEBUG) {
            LogManager.getLogger().d("PhotoViewAttacher", String.format("onDrag: dx: %.2f. dy: %.2f", new Object[] { Float.valueOf(paramFloat1), Float.valueOf(paramFloat2) }));
          }
          localObject = getImageView();
          mSuppMatrix.postTranslate(paramFloat1, paramFloat2);
          checkAndDisplayMatrix();
          localObject = ((ImageView)localObject).getParent();
          if ((!mAllowParentInterceptOnEdge) || (mScaleDragDetector.isScaling())) {
            break;
          }
        } while (((mScrollEdge != 2) && ((mScrollEdge != 0) || (paramFloat1 < 1.0F)) && ((mScrollEdge != 1) || (paramFloat1 > -1.0F))) || (localObject == null));
        ((ViewParent)localObject).requestDisallowInterceptTouchEvent(false);
      } while (mZoomDelegate == null);
      mZoomDelegate.signalDragDetected(paramFloat1, paramFloat2);
      return;
    } while (localObject == null);
    ((ViewParent)localObject).requestDisallowInterceptTouchEvent(true);
  }
  
  public void onFling(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    if (DEBUG) {
      LogManager.getLogger().d("PhotoViewAttacher", "onFling. sX: " + paramFloat1 + " sY: " + paramFloat2 + " Vx: " + paramFloat3 + " Vy: " + paramFloat4);
    }
    ImageView localImageView = getImageView();
    mCurrentFlingRunnable = new FlingRunnable(localImageView.getContext());
    mCurrentFlingRunnable.fling(getImageViewWidth(localImageView), getImageViewHeight(localImageView), (int)paramFloat3, (int)paramFloat4);
    localImageView.post(mCurrentFlingRunnable);
  }
  
  public void onGlobalLayout()
  {
    ImageView localImageView = getImageView();
    if (localImageView != null)
    {
      if (!mZoomEnabled) {
        break label107;
      }
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
    return;
    label107:
    updateBaseMatrix(localImageView.getDrawable());
  }
  
  public void onScale(float paramFloat1, float paramFloat2, float paramFloat3)
  {
    Log.d("PhotoView.Scale", String.format("in onScale with scaleFactor %f", new Object[] { Float.valueOf(paramFloat1) }));
    if (DEBUG) {
      LogManager.getLogger().d("PhotoViewAttacher", String.format("onScale: scale: %.2f. fX: %.2f. fY: %.2f", new Object[] { Float.valueOf(paramFloat1), Float.valueOf(paramFloat2), Float.valueOf(paramFloat3) }));
    }
    if ((getScale() < mMaxScale) || (paramFloat1 < 1.0F))
    {
      mSuppMatrix.postScale(paramFloat1, paramFloat1, paramFloat2, paramFloat3);
      if (mZoomDelegate != null) {
        mZoomDelegate.signalZoomHandled(getScale(), paramFloat2, paramFloat3);
      }
      checkAndDisplayMatrix();
    }
  }
  
  public boolean onTouch(View paramView, MotionEvent paramMotionEvent)
  {
    boolean bool3 = false;
    boolean bool2 = false;
    boolean bool1 = bool3;
    Object localObject;
    if (mZoomEnabled)
    {
      bool1 = bool3;
      if (hasDrawable((ImageView)paramView))
      {
        localObject = paramView.getParent();
        bool1 = bool2;
        switch (paramMotionEvent.getAction())
        {
        default: 
          bool1 = bool2;
        }
      }
    }
    for (;;)
    {
      bool2 = bool1;
      if (mScaleDragDetector != null)
      {
        bool2 = bool1;
        if (mScaleDragDetector.onTouchEvent(paramMotionEvent)) {
          bool2 = true;
        }
      }
      bool1 = bool2;
      if (mGestureDetector != null)
      {
        bool1 = bool2;
        if (mGestureDetector.onTouchEvent(paramMotionEvent)) {
          bool1 = true;
        }
      }
      return bool1;
      if (localObject != null) {
        ((ViewParent)localObject).requestDisallowInterceptTouchEvent(true);
      }
      for (;;)
      {
        cancelFling();
        bool1 = bool2;
        break;
        Log.i("PhotoViewAttacher", "onTouch getParent() returned null");
      }
      bool1 = bool2;
      if (getScale() < mMinScale)
      {
        localObject = getDisplayRect();
        bool1 = bool2;
        if (localObject != null)
        {
          paramView.post(new AnimatedZoomRunnable(getScale(), mMinScale, ((RectF)localObject).centerX(), ((RectF)localObject).centerY()));
          bool1 = true;
        }
      }
    }
  }
  
  public void setAllowParentInterceptOnEdge(boolean paramBoolean)
  {
    mAllowParentInterceptOnEdge = paramBoolean;
  }
  
  public void setMaximumScale(float paramFloat)
  {
    checkZoomLevels(mMinScale, mMidScale, paramFloat);
    mMaxScale = paramFloat;
  }
  
  public void setMediumScale(float paramFloat)
  {
    checkZoomLevels(mMinScale, paramFloat, mMaxScale);
    mMidScale = paramFloat;
  }
  
  public void setMinimumScale(float paramFloat)
  {
    checkZoomLevels(paramFloat, mMidScale, mMaxScale);
    mMinScale = paramFloat;
  }
  
  public void setOnDoubleTapListener(GestureDetector.OnDoubleTapListener paramOnDoubleTapListener)
  {
    if (paramOnDoubleTapListener != null)
    {
      mGestureDetector.setOnDoubleTapListener(paramOnDoubleTapListener);
      return;
    }
    mGestureDetector.setOnDoubleTapListener(new DefaultOnDoubleTapListener(this));
  }
  
  public void setOnLongClickListener(View.OnLongClickListener paramOnLongClickListener)
  {
    mLongClickListener = paramOnLongClickListener;
  }
  
  public void setOnMatrixChangeListener(OnMatrixChangedListener paramOnMatrixChangedListener)
  {
    mMatrixChangeListener = paramOnMatrixChangedListener;
  }
  
  public void setOnPhotoTapListener(OnPhotoTapListener paramOnPhotoTapListener)
  {
    mPhotoTapListener = paramOnPhotoTapListener;
  }
  
  public void setOnViewTapListener(OnViewTapListener paramOnViewTapListener)
  {
    mViewTapListener = paramOnViewTapListener;
  }
  
  public void setRotationBy(float paramFloat)
  {
    mSuppMatrix.postRotate(paramFloat % 360.0F);
    checkAndDisplayMatrix();
  }
  
  public void setRotationTo(float paramFloat)
  {
    mSuppMatrix.setRotate(paramFloat % 360.0F);
    checkAndDisplayMatrix();
  }
  
  public void setScale(float paramFloat)
  {
    setScale(paramFloat, false);
  }
  
  public void setScale(float paramFloat1, float paramFloat2, float paramFloat3, boolean paramBoolean)
  {
    ImageView localImageView = getImageView();
    float f2;
    if (localImageView != null)
    {
      if (paramFloat1 >= mMinScale)
      {
        f2 = paramFloat1;
        if (paramFloat1 <= mMaxScale) {}
      }
      else
      {
        LogManager.getLogger().i("PhotoViewAttacher", "Scale must be within the range of minScale and maxScale");
        float f1 = paramFloat1;
        if (paramFloat1 > mMaxScale) {
          f1 = mMaxScale;
        }
        f2 = f1;
        if (f1 < mMinScale) {
          f2 = mMinScale;
        }
      }
      if (paramBoolean) {
        localImageView.post(new AnimatedZoomRunnable(getScale(), f2, paramFloat2, paramFloat3));
      }
    }
    else
    {
      return;
    }
    mSuppMatrix.setScale(f2, f2, paramFloat2, paramFloat3);
    mZoomScale = f2;
    checkAndDisplayMatrix();
  }
  
  public void setScale(float paramFloat, boolean paramBoolean)
  {
    ImageView localImageView = getImageView();
    if (localImageView != null) {
      setScale(paramFloat, localImageView.getRight() / 2, localImageView.getBottom() / 2, paramBoolean);
    }
  }
  
  public void setScaleType(ImageView.ScaleType paramScaleType)
  {
    if ((isSupportedScaleType(paramScaleType)) && (paramScaleType != mScaleType))
    {
      mScaleType = paramScaleType;
      update();
    }
  }
  
  public void setZoomDelegate(IPhotoViewZoomDelegate paramIPhotoViewZoomDelegate)
  {
    mZoomDelegate = paramIPhotoViewZoomDelegate;
  }
  
  public void setZoomFocusX(float paramFloat)
  {
    mZoomFocusX = paramFloat;
  }
  
  public void setZoomFocusY(float paramFloat)
  {
    mZoomFocusY = paramFloat;
  }
  
  public void setZoomTransitionDuration(int paramInt)
  {
    int i = paramInt;
    if (paramInt < 0) {
      i = 200;
    }
    ZOOM_DURATION = i;
  }
  
  public void setZoomable(boolean paramBoolean)
  {
    mZoomEnabled = paramBoolean;
    update();
  }
  
  public void update()
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
  
  private class AnimatedZoomRunnable
    implements Runnable
  {
    private final float mFocalX;
    private final float mFocalY;
    private final long mStartTime;
    private final float mZoomEnd;
    private final float mZoomStart;
    
    public AnimatedZoomRunnable(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
    {
      mFocalX = paramFloat3;
      mFocalY = paramFloat4;
      mStartTime = System.currentTimeMillis();
      mZoomStart = paramFloat1;
      mZoomEnd = paramFloat2;
    }
    
    private float interpolate()
    {
      float f = Math.min(1.0F, (float)(System.currentTimeMillis() - mStartTime) * 1.0F / ZOOM_DURATION);
      return PhotoViewAttacher.sInterpolator.getInterpolation(f);
    }
    
    public void run()
    {
      ImageView localImageView = getImageView();
      if (localImageView == null) {}
      float f1;
      do
      {
        return;
        f1 = interpolate();
        float f2 = (mZoomStart + (mZoomEnd - mZoomStart) * f1) / getScale();
        mSuppMatrix.postScale(f2, f2, mFocalX, mFocalY);
        PhotoViewAttacher.this.checkAndDisplayMatrix();
      } while (f1 >= 1.0F);
      Compat.postOnAnimation(localImageView, this);
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
        LogManager.getLogger().d("PhotoViewAttacher", "Cancel Fling");
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
          break label220;
        }
        n = 0;
        m = Math.round(localRectF.height() - paramInt2);
      }
      for (paramInt2 = n;; paramInt2 = k)
      {
        mCurrentX = i;
        mCurrentY = k;
        if (PhotoViewAttacher.DEBUG) {
          LogManager.getLogger().d("PhotoViewAttacher", "fling. StartX:" + i + " StartY:" + k + " MaxX:" + j + " MaxY:" + m);
        }
        if ((i == j) && (k == m)) {
          break;
        }
        mScroller.fling(i, k, paramInt3, paramInt4, paramInt1, j, paramInt2, m, 0, 0);
        return;
        j = i;
        paramInt1 = i;
        break label56;
        label220:
        m = k;
      }
    }
    
    public void run()
    {
      if (mScroller.isFinished()) {}
      ImageView localImageView;
      do
      {
        return;
        localImageView = getImageView();
      } while ((localImageView == null) || (!mScroller.computeScrollOffset()));
      int i = mScroller.getCurrX();
      int j = mScroller.getCurrY();
      if (PhotoViewAttacher.DEBUG) {
        LogManager.getLogger().d("PhotoViewAttacher", "fling run(). CurrentX:" + mCurrentX + " CurrentY:" + mCurrentY + " NewX:" + i + " NewY:" + j);
      }
      mSuppMatrix.postTranslate(mCurrentX - i, mCurrentY - j);
      PhotoViewAttacher.this.setImageViewMatrix(getDrawMatrix());
      mCurrentX = i;
      mCurrentY = j;
      Compat.postOnAnimation(localImageView, this);
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
