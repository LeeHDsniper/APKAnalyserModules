package com.adobe.creativesdk.aviary.widget;

import android.content.Context;
import android.content.res.Resources.Theme;
import android.content.res.TypedArray;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Path;
import android.graphics.PointF;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
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
import android.view.animation.AccelerateDecelerateInterpolator;
import com.aviary.android.feather.sdk.R.styleable;
import com.nineoldandroids.animation.Animator;
import com.nineoldandroids.animation.Animator.AnimatorListener;
import com.nineoldandroids.animation.ValueAnimator;
import com.nineoldandroids.animation.ValueAnimator.AnimatorUpdateListener;
import it.sephiroth.android.library.imagezoom.ImageViewTouch;
import it.sephiroth.android.library.imagezoom.graphics.FastBitmapDrawable;

public class ImageViewWithIntensity
  extends ImageViewTouch
{
  private static final float RAD = (float)Math.toRadians(10.0D);
  private static final float RAD_COS = (float)Math.cos(RAD);
  private static final float RAD_SIN = (float)Math.sin(RAD);
  private PointF mCurrentPoint = new PointF();
  private long mDemoDelay;
  private long mDemoDuration;
  private PointF mDownPoint;
  private GestureDetector mGestureDetector = new GestureDetector(paramContext, getGestureListener());
  private float mIntensity;
  private boolean mIntensityInitiated;
  private OnIntensityChange mIntensityListener;
  private Path mPath1;
  private Path mPath2;
  private Path mPath3;
  private ValueAnimator mPlayDemoAnimator;
  private FastBitmapDrawable mPreviewBitmapDrawable;
  private boolean mScrollVerticalStarted;
  private boolean mSwipeGestureEnabled;
  private Paint mTextPaint;
  private Paint mTipArcPaint;
  private float mTipArcStrokeWeight;
  private int mTipBackgroundColor;
  private Paint mTipPaint;
  private int mTipRadius;
  private final RectF mTipRect = new RectF();
  private int mTipSize;
  private int mTipTextColor;
  private float mTouchSlop;
  private boolean mVaryTipHue = true;
  private boolean mVaryTipStroke = true;
  private final Rect tempRect = new Rect();
  
  public ImageViewWithIntensity(Context paramContext, AttributeSet paramAttributeSet)
  {
    this(paramContext, paramAttributeSet, 0);
  }
  
  public ImageViewWithIntensity(Context paramContext, AttributeSet paramAttributeSet, int paramInt)
  {
    super(paramContext, paramAttributeSet, paramInt);
    mTouchSlop = ViewConfiguration.get(paramContext).getScaledTouchSlop();
    paramContext = paramContext.getTheme().obtainStyledAttributes(paramAttributeSet, R.styleable.AdobeImageViewIntensity, paramInt, 0);
    mTipSize = paramContext.getDimensionPixelSize(R.styleable.AdobeImageViewIntensity_adobe_tooltipSize, 200);
    mTipArcStrokeWeight = paramContext.getDimension(R.styleable.AdobeImageViewIntensity_adobe_strokeSize, 14.0F);
    paramInt = paramContext.getResourceId(R.styleable.AdobeImageViewIntensity_adobe_strokeColor, 0);
    Log.e("ImageViewTouchBase", "color: " + paramInt);
    mTipBackgroundColor = paramContext.getColor(R.styleable.AdobeImageViewIntensity_adobe_strokeColor, -16777216);
    mTipTextColor = paramContext.getColor(R.styleable.AdobeImageViewIntensity_android_textColor, -16777216);
    mDemoDuration = paramContext.getInteger(R.styleable.AdobeImageViewIntensity_adobe_demo_duration, 1000);
    mDemoDelay = paramContext.getInteger(R.styleable.AdobeImageViewIntensity_adobe_demo_delay, 100);
    mTipRadius = (mTipSize / 2);
    paramContext.recycle();
    mPath1 = new Path();
    mPath2 = new Path();
    mPath3 = new Path();
    mTipPaint = new Paint(1);
    mTipPaint.setColor(mTipBackgroundColor);
    mTipArcPaint = new Paint(1);
    mTipArcPaint.setStyle(Paint.Style.FILL);
    mTextPaint = new Paint(1);
    mTextPaint.setTextSize(mTipSize / 3);
    mTextPaint.setColor(mTipTextColor);
    mTextPaint.setAntiAlias(true);
    mTextPaint.setLinearText(true);
  }
  
  private boolean onDown(float paramFloat1, float paramFloat2, boolean paramBoolean)
  {
    if (!mSwipeGestureEnabled) {
      return true;
    }
    if ((paramBoolean) && (mPlayDemoAnimator != null) && (mPlayDemoAnimator.isStarted()))
    {
      mPlayDemoAnimator.cancel();
      mPlayDemoAnimator = null;
    }
    mDownPoint = new PointF(paramFloat1, paramFloat2);
    mCurrentPoint.set(mDownPoint);
    mScrollVerticalStarted = false;
    return true;
  }
  
  private boolean onScroll(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4, boolean paramBoolean)
  {
    if ((!mSwipeGestureEnabled) || (mDownPoint == null)) {
      return true;
    }
    paramFloat3 = paramFloat1 - mDownPoint.x;
    paramFloat4 = paramFloat2 - mDownPoint.y;
    if (!mScrollVerticalStarted)
    {
      if ((Math.abs(paramFloat3) > mTouchSlop) || (Math.abs(paramFloat4) > mTouchSlop))
      {
        if (Math.abs(paramFloat3) > Math.abs(paramFloat4))
        {
          mScrollVerticalStarted = false;
          mDownPoint = null;
          return false;
        }
        mScrollVerticalStarted = true;
        if ((mIntensityListener != null) && (!mIntensityInitiated))
        {
          mIntensityListener.onIntensityInit();
          mIntensityInitiated = true;
        }
        if (mIntensityListener != null) {
          mIntensityListener.onIntensitySwipeStarted(mIntensity);
        }
      }
      return true;
    }
    paramFloat3 = mCurrentPoint.y;
    mCurrentPoint.set(paramFloat1, paramFloat2);
    paramFloat1 = (paramFloat2 - paramFloat3) / (getHeight() / 2.0F);
    setIntensity(Math.min(255.0F, Math.max(0.0F, mIntensity - paramFloat1 * 255.0F)));
    if (mIntensityListener != null) {
      mIntensityListener.onIntensitySwipeChanging(mIntensity);
    }
    return true;
  }
  
  public void finishIntensityChanging()
  {
    onUp(null);
  }
  
  public void generateBitmap(Bitmap paramBitmap, float paramFloat)
  {
    paramBitmap = new Canvas(paramBitmap);
    if (mPreviewBitmapDrawable != null)
    {
      mPreviewBitmapDrawable.setAlpha((int)paramFloat);
      mPreviewBitmapDrawable.draw(paramBitmap);
    }
  }
  
  protected GestureDetector.OnGestureListener getGestureListener()
  {
    return new MyGestureListener(null);
  }
  
  public float getIntensity()
  {
    return mIntensity;
  }
  
  protected ScaleGestureDetector.OnScaleGestureListener getScaleListener()
  {
    return new MyScaleListener();
  }
  
  public int getTooltipSize()
  {
    return mTipSize;
  }
  
  public boolean onDown(MotionEvent paramMotionEvent)
  {
    if (mSwipeGestureEnabled) {
      return onDown(paramMotionEvent.getX(), paramMotionEvent.getY(), true);
    }
    return super.onDown(paramMotionEvent);
  }
  
  protected void onDraw(Canvas paramCanvas)
  {
    super.onDraw(paramCanvas);
    int k;
    float f2;
    float f5;
    int i;
    int j;
    float f1;
    float f6;
    float f3;
    float f4;
    if (getDrawable() != null)
    {
      if (mPreviewBitmapDrawable != null)
      {
        mPreviewBitmapDrawable.setAlpha((int)mIntensity);
        paramCanvas.save();
        paramCanvas.concat(getImageMatrix());
        mPreviewBitmapDrawable.draw(paramCanvas);
        paramCanvas.restore();
      }
      if (mScrollVerticalStarted)
      {
        k = paramCanvas.save();
        int m = (int)(mIntensity / 2.55D);
        localObject1 = String.valueOf(m);
        f2 = mCurrentPoint.x - mTipSize * 1.2F;
        f5 = mCurrentPoint.y;
        i = 0;
        j = 10;
        f1 = f2;
        if (f2 - mTipRadius - mTipArcStrokeWeight * 2.0F < 0.0F)
        {
          f1 = mCurrentPoint.x + mTipSize * 1.2F;
          j = 10 + '´';
          i = 1;
        }
        mTipRect.set(f1 - mTipRadius, f5 - mTipRadius, mTipRadius + f1, mTipRadius + f5);
        f2 = mTipRect.width() / 2.0F * RAD_COS;
        f6 = mTipRect.height() / 2.0F * RAD_SIN;
        mPath1.reset();
        mPath1.addArc(mTipRect, j, 340.0F);
        localObject2 = mPath1;
        if (i == 0) {
          break label1000;
        }
        f3 = -f2;
        if (i == 0) {
          break label1006;
        }
        f4 = f5 + f6;
        label289:
        ((Path)localObject2).moveTo(f1 + f3, f4);
        localObject2 = mPath1;
        if (i == 0) {
          break label1016;
        }
        f3 = -f2 - mTipRadius / 4;
        label323:
        ((Path)localObject2).lineTo(f3 + f1, f5);
        localObject2 = mPath1;
        f3 = f2;
        if (i != 0) {
          f3 = -f2;
        }
        if (i == 0) {
          break label1030;
        }
        f2 = f5 - f6;
        label363:
        ((Path)localObject2).lineTo(f1 + f3, f2);
        paramCanvas.drawPath(mPath1, mTipPaint);
        mTextPaint.getTextBounds((String)localObject1, 0, ((String)localObject1).length(), tempRect);
        f2 = (mTipSize - tempRect.width()) / 2;
        paramCanvas.drawText((String)localObject1, f1 - mTipRadius + f2, tempRect.height() / 2 + f5, mTextPaint);
        mTipArcPaint.setColor(mTipBackgroundColor);
        mTipRect.inset(-2.0F, -2.0F);
        mPath2.reset();
        mPath2.moveTo(mTipRect.centerX(), mTipRect.bottom);
        localObject1 = mPath2;
        localObject2 = mTipRect;
        if (i == 0) {
          break label1039;
        }
        f2 = -180.0F;
        label525:
        ((Path)localObject1).arcTo((RectF)localObject2, 90.0F, f2);
        if (!mVaryTipStroke) {
          break label1046;
        }
        mTipRect.inset(-mTipArcStrokeWeight, -mTipArcStrokeWeight);
        mTipRect.offset(0.0F, -(mTipArcStrokeWeight * 0.65F));
        label577:
        mPath2.lineTo(mTipRect.centerX(), mTipRect.top);
        localObject1 = mPath2;
        localObject2 = mTipRect;
        if (i == 0) {
          break label1074;
        }
        f2 = 180.0F;
        label619:
        ((Path)localObject1).arcTo((RectF)localObject2, -90.0F, f2);
        mPath2.lineTo(mTipRect.centerX(), mTipRect.bottom - mTipArcStrokeWeight * 0.35F);
        paramCanvas.drawPath(mPath2, mTipArcPaint);
        mTipRect.set(f1 - mTipRadius, f5 - mTipRadius, mTipRadius + f1, mTipRadius + f5);
        mTipRect.inset(-2.0F, -2.0F);
        if (!mVaryTipHue) {
          break label1081;
        }
        j = Color.HSVToColor(255, new float[] { m * 2, 1.0F, 1.0F });
        label756:
        mTipArcPaint.setColor(j);
        if (m > 0)
        {
          f1 = m / 100.0F * 180.0F;
          mPath3.reset();
          if (!mVaryTipStroke) {
            break label1125;
          }
          mPath3.moveTo(mTipRect.centerX(), mTipRect.bottom);
          localObject1 = mPath3;
          localObject2 = mTipRect;
          if (i == 0) {
            break label1109;
          }
          f2 = -f1;
          label837:
          ((Path)localObject1).arcTo((RectF)localObject2, 90.0F, f2);
          mTipRect.inset(-mTipArcStrokeWeight, -mTipArcStrokeWeight);
          mTipRect.offset(0.0F, -(mTipArcStrokeWeight * 0.65F));
          f2 = (float)Math.sin(Math.toRadians(f1));
          f1 = (float)(f1 - mTipArcStrokeWeight * 1.05F / 3.141592653589793D * f2);
          localObject1 = mPath3;
          localObject2 = mTipRect;
          if (i == 0) {
            break label1114;
          }
          f2 = -f1;
          label933:
          if (i == 0) {
            break label1119;
          }
        }
      }
    }
    for (;;)
    {
      ((Path)localObject1).arcTo((RectF)localObject2, f2 + 90.0F, f1);
      mPath3.lineTo(mTipRect.centerX(), mTipRect.bottom - mTipArcStrokeWeight * 0.35F);
      paramCanvas.drawPath(mPath3, mTipArcPaint);
      paramCanvas.restoreToCount(k);
      return;
      label1000:
      f3 = f2;
      break;
      label1006:
      f4 = f5 - f6;
      break label289;
      label1016:
      f3 = mTipRadius / 4 + f2;
      break label323;
      label1030:
      f2 = f5 + f6;
      break label363;
      label1039:
      f2 = 180.0F;
      break label525;
      label1046:
      mTipRect.inset(-(mTipArcStrokeWeight / 2.0F) - 1.0F, -(mTipArcStrokeWeight / 2.0F) - 1.0F);
      break label577;
      label1074:
      f2 = -180.0F;
      break label619;
      label1081:
      j = Color.HSVToColor(255, new float[] { 200.0F, 1.0F, 1.0F });
      break label756;
      label1109:
      f2 = f1;
      break label837;
      label1114:
      f2 = f1;
      break label933;
      label1119:
      f1 = -f1;
    }
    label1125:
    Object localObject1 = mPath3;
    Object localObject2 = mTipRect;
    if (i != 0)
    {
      f2 = -f1;
      label1145:
      ((Path)localObject1).arcTo((RectF)localObject2, 90.0F, f2);
      mTipRect.inset(-(mTipArcStrokeWeight / 2.0F) - 1.0F, -(mTipArcStrokeWeight / 2.0F) - 1.0F);
      localObject1 = mPath3;
      localObject2 = mTipRect;
      if (i == 0) {
        break label1257;
      }
      f2 = -f1;
      label1201:
      if (i == 0) {
        break label1262;
      }
    }
    for (;;)
    {
      ((Path)localObject1).arcTo((RectF)localObject2, f2 + 90.0F, f1);
      mPath3.lineTo(mTipRect.centerX(), mTipRect.bottom - mTipArcStrokeWeight * 0.35F);
      break;
      f2 = f1;
      break label1145;
      label1257:
      f2 = f1;
      break label1201;
      label1262:
      f1 = -f1;
    }
  }
  
  public boolean onScroll(MotionEvent paramMotionEvent1, MotionEvent paramMotionEvent2, float paramFloat1, float paramFloat2)
  {
    if ((mDownPoint == null) || (getBitmapRect() == null) || (!mSwipeGestureEnabled) || (mScaleDetector.isInProgress())) {
      return false;
    }
    return onScroll(paramMotionEvent2.getX(), paramMotionEvent2.getY(), paramFloat1, paramFloat2, true);
  }
  
  public boolean onTouchEvent(MotionEvent paramMotionEvent)
  {
    if ((getBitmapRect() == null) || (getBitmapRect().isEmpty())) {
      return false;
    }
    mScaleDetector.onTouchEvent(paramMotionEvent);
    if (!mScaleDetector.isInProgress()) {
      mGestureDetector.onTouchEvent(paramMotionEvent);
    }
    switch (paramMotionEvent.getAction() & 0xFF)
    {
    default: 
      return true;
    }
    return onUp(paramMotionEvent);
  }
  
  public boolean onUp(MotionEvent paramMotionEvent)
  {
    mDownPoint = null;
    mScrollVerticalStarted = false;
    if ((mIntensityListener != null) && (mSwipeGestureEnabled)) {
      mIntensityListener.onIntensitySwipeChanged(mIntensity);
    }
    postInvalidate();
    return true;
  }
  
  public PointF playDemo()
  {
    final PointF localPointF = new PointF(getWidth() - mTipRadius / 2, getHeight() / 4);
    mPlayDemoAnimator = ValueAnimator.ofInt(new int[] { 0, getHeight() / 4, 0 });
    mPlayDemoAnimator.setDuration(mDemoDuration);
    mPlayDemoAnimator.setStartDelay(mDemoDelay);
    mPlayDemoAnimator.setInterpolator(new AccelerateDecelerateInterpolator());
    mPlayDemoAnimator.start();
    mPlayDemoAnimator.addUpdateListener(new ValueAnimator.AnimatorUpdateListener()
    {
      public void onAnimationUpdate(ValueAnimator paramAnonymousValueAnimator)
      {
        if (mDownPoint == null) {
          return;
        }
        paramAnonymousValueAnimator = (Integer)paramAnonymousValueAnimator.getAnimatedValue();
        ImageViewWithIntensity.this.onScroll(mDownPoint.x, mDownPoint.y + paramAnonymousValueAnimator.intValue(), 0.0F, paramAnonymousValueAnimator.intValue(), false);
      }
    });
    mPlayDemoAnimator.addListener(new Animator.AnimatorListener()
    {
      public void onAnimationCancel(Animator paramAnonymousAnimator) {}
      
      public void onAnimationEnd(Animator paramAnonymousAnimator)
      {
        onUp(null);
      }
      
      public void onAnimationRepeat(Animator paramAnonymousAnimator) {}
      
      public void onAnimationStart(Animator paramAnonymousAnimator)
      {
        ImageViewWithIntensity.this.onDown(localPointFx, localPointFy, false);
      }
    });
    return localPointF;
  }
  
  public void setIntensity(float paramFloat)
  {
    mIntensity = paramFloat;
    invalidate();
  }
  
  public void setOnIntensityChangeListener(OnIntensityChange paramOnIntensityChange)
  {
    mIntensityListener = paramOnIntensityChange;
  }
  
  public void setPreviewBitmap(Bitmap paramBitmap, float paramFloat)
  {
    if (paramBitmap == null) {}
    for (mPreviewBitmapDrawable = null;; mPreviewBitmapDrawable = new FastBitmapDrawable(paramBitmap)) {
      do
      {
        mIntensity = paramFloat;
        postInvalidate();
        return;
      } while ((getDrawable() == null) || (getDrawable().getIntrinsicWidth() != paramBitmap.getWidth()) || (getDrawable().getIntrinsicHeight() != paramBitmap.getHeight()));
    }
  }
  
  public void setSwipeGestureEnabled(boolean paramBoolean)
  {
    mSwipeGestureEnabled = paramBoolean;
  }
  
  public void setVaryTipHue(boolean paramBoolean)
  {
    mVaryTipHue = paramBoolean;
  }
  
  public void setVaryTipStroke(boolean paramBoolean)
  {
    mVaryTipStroke = paramBoolean;
  }
  
  private class MyGestureListener
    extends GestureDetector.SimpleOnGestureListener
  {
    private MyGestureListener() {}
    
    public boolean onDoubleTap(MotionEvent paramMotionEvent)
    {
      return false;
    }
    
    public boolean onDown(MotionEvent paramMotionEvent)
    {
      return ImageViewWithIntensity.this.onDown(paramMotionEvent);
    }
    
    public boolean onFling(MotionEvent paramMotionEvent1, MotionEvent paramMotionEvent2, float paramFloat1, float paramFloat2)
    {
      return false;
    }
    
    public void onLongPress(MotionEvent paramMotionEvent) {}
    
    public boolean onScroll(MotionEvent paramMotionEvent1, MotionEvent paramMotionEvent2, float paramFloat1, float paramFloat2)
    {
      return ImageViewWithIntensity.this.onScroll(paramMotionEvent1, paramMotionEvent2, paramFloat1, paramFloat2);
    }
    
    public boolean onSingleTapUp(MotionEvent paramMotionEvent)
    {
      return false;
    }
  }
  
  public class MyScaleListener
    extends ScaleGestureDetector.SimpleOnScaleGestureListener
  {
    public MyScaleListener() {}
    
    public boolean onScale(ScaleGestureDetector paramScaleGestureDetector)
    {
      ImageViewWithIntensity.access$102(ImageViewWithIntensity.this, null);
      ImageViewWithIntensity.access$402(ImageViewWithIntensity.this, false);
      return true;
    }
  }
  
  public static abstract interface OnIntensityChange
  {
    public abstract void onIntensityInit();
    
    public abstract void onIntensitySwipeChanged(float paramFloat);
    
    public abstract void onIntensitySwipeChanging(float paramFloat);
    
    public abstract void onIntensitySwipeStarted(float paramFloat);
  }
}
