package android.support.v4.widget;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Paint.Cap;
import android.graphics.Paint.Style;
import android.graphics.Path;
import android.graphics.Path.FillType;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Animatable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.Callback;
import android.support.v4.view.animation.FastOutSlowInInterpolator;
import android.util.DisplayMetrics;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.Animation.AnimationListener;
import android.view.animation.Interpolator;
import android.view.animation.LinearInterpolator;
import android.view.animation.Transformation;
import java.util.ArrayList;

class MaterialProgressDrawable
  extends Drawable
  implements Animatable
{
  private static final Interpolator LINEAR_INTERPOLATOR = new LinearInterpolator();
  private static final Interpolator MATERIAL_INTERPOLATOR = new FastOutSlowInInterpolator();
  private final int[] COLORS = { -16777216 };
  private Animation mAnimation;
  private final ArrayList<Animation> mAnimators = new ArrayList();
  private final Drawable.Callback mCallback = new Drawable.Callback()
  {
    public void invalidateDrawable(Drawable paramAnonymousDrawable)
    {
      invalidateSelf();
    }
    
    public void scheduleDrawable(Drawable paramAnonymousDrawable, Runnable paramAnonymousRunnable, long paramAnonymousLong)
    {
      scheduleSelf(paramAnonymousRunnable, paramAnonymousLong);
    }
    
    public void unscheduleDrawable(Drawable paramAnonymousDrawable, Runnable paramAnonymousRunnable)
    {
      unscheduleSelf(paramAnonymousRunnable);
    }
  };
  boolean mFinishing;
  private double mHeight;
  private View mParent;
  private Resources mResources;
  private final Ring mRing;
  private float mRotation;
  private float mRotationCount;
  private double mWidth;
  
  public MaterialProgressDrawable(Context paramContext, View paramView)
  {
    mParent = paramView;
    mResources = paramContext.getResources();
    mRing = new Ring(mCallback);
    mRing.setColors(COLORS);
    updateSizes(1);
    setupAnimators();
  }
  
  private void applyFinishTranslation(float paramFloat, Ring paramRing)
  {
    updateRingColor(paramFloat, paramRing);
    float f1 = (float)(Math.floor(paramRing.getStartingRotation() / 0.8F) + 1.0D);
    float f2 = getMinProgressArc(paramRing);
    paramRing.setStartTrim(paramRing.getStartingStartTrim() + (paramRing.getStartingEndTrim() - f2 - paramRing.getStartingStartTrim()) * paramFloat);
    paramRing.setEndTrim(paramRing.getStartingEndTrim());
    paramRing.setRotation(paramRing.getStartingRotation() + (f1 - paramRing.getStartingRotation()) * paramFloat);
  }
  
  private int evaluateColorChange(float paramFloat, int paramInt1, int paramInt2)
  {
    int k = Integer.valueOf(paramInt1).intValue();
    paramInt1 = k >> 24 & 0xFF;
    int i = k >> 16 & 0xFF;
    int j = k >> 8 & 0xFF;
    k &= 0xFF;
    paramInt2 = Integer.valueOf(paramInt2).intValue();
    return (int)(((paramInt2 >> 24 & 0xFF) - paramInt1) * paramFloat) + paramInt1 << 24 | (int)(((paramInt2 >> 16 & 0xFF) - i) * paramFloat) + i << 16 | (int)(((paramInt2 >> 8 & 0xFF) - j) * paramFloat) + j << 8 | (int)(((paramInt2 & 0xFF) - k) * paramFloat) + k;
  }
  
  private float getMinProgressArc(Ring paramRing)
  {
    return (float)Math.toRadians(paramRing.getStrokeWidth() / (6.283185307179586D * paramRing.getCenterRadius()));
  }
  
  private void setSizeParameters(double paramDouble1, double paramDouble2, double paramDouble3, double paramDouble4, float paramFloat1, float paramFloat2)
  {
    Ring localRing = mRing;
    float f = mResources.getDisplayMetrics().density;
    mWidth = (f * paramDouble1);
    mHeight = (f * paramDouble2);
    localRing.setStrokeWidth((float)paramDouble4 * f);
    localRing.setCenterRadius(f * paramDouble3);
    localRing.setColorIndex(0);
    localRing.setArrowDimensions(paramFloat1 * f, paramFloat2 * f);
    localRing.setInsets((int)mWidth, (int)mHeight);
  }
  
  private void setupAnimators()
  {
    final Ring localRing = mRing;
    Animation local1 = new Animation()
    {
      public void applyTransformation(float paramAnonymousFloat, Transformation paramAnonymousTransformation)
      {
        if (mFinishing)
        {
          MaterialProgressDrawable.this.applyFinishTranslation(paramAnonymousFloat, localRing);
          return;
        }
        float f1 = MaterialProgressDrawable.this.getMinProgressArc(localRing);
        float f2 = localRing.getStartingEndTrim();
        float f4 = localRing.getStartingStartTrim();
        float f3 = localRing.getStartingRotation();
        MaterialProgressDrawable.this.updateRingColor(paramAnonymousFloat, localRing);
        if (paramAnonymousFloat <= 0.5F)
        {
          float f5 = paramAnonymousFloat / 0.5F;
          f5 = MaterialProgressDrawable.MATERIAL_INTERPOLATOR.getInterpolation(f5);
          localRing.setStartTrim(f4 + (0.8F - f1) * f5);
        }
        if (paramAnonymousFloat > 0.5F)
        {
          f4 = (paramAnonymousFloat - 0.5F) / 0.5F;
          f4 = MaterialProgressDrawable.MATERIAL_INTERPOLATOR.getInterpolation(f4);
          localRing.setEndTrim(f2 + f4 * (0.8F - f1));
        }
        localRing.setRotation(f3 + 0.25F * paramAnonymousFloat);
        f1 = mRotationCount / 5.0F;
        setRotation(216.0F * paramAnonymousFloat + 1080.0F * f1);
      }
    };
    local1.setRepeatCount(-1);
    local1.setRepeatMode(1);
    local1.setInterpolator(LINEAR_INTERPOLATOR);
    local1.setAnimationListener(new Animation.AnimationListener()
    {
      public void onAnimationEnd(Animation paramAnonymousAnimation) {}
      
      public void onAnimationRepeat(Animation paramAnonymousAnimation)
      {
        localRing.storeOriginals();
        localRing.goToNextColor();
        localRing.setStartTrim(localRing.getEndTrim());
        if (mFinishing)
        {
          mFinishing = false;
          paramAnonymousAnimation.setDuration(1332L);
          localRing.setShowArrow(false);
          return;
        }
        MaterialProgressDrawable.access$402(MaterialProgressDrawable.this, (mRotationCount + 1.0F) % 5.0F);
      }
      
      public void onAnimationStart(Animation paramAnonymousAnimation)
      {
        MaterialProgressDrawable.access$402(MaterialProgressDrawable.this, 0.0F);
      }
    });
    mAnimation = local1;
  }
  
  private void updateRingColor(float paramFloat, Ring paramRing)
  {
    if (paramFloat > 0.75F) {
      paramRing.setColor(evaluateColorChange((paramFloat - 0.75F) / 0.25F, paramRing.getStartingColor(), paramRing.getNextColor()));
    }
  }
  
  public void draw(Canvas paramCanvas)
  {
    Rect localRect = getBounds();
    int i = paramCanvas.save();
    paramCanvas.rotate(mRotation, localRect.exactCenterX(), localRect.exactCenterY());
    mRing.draw(paramCanvas, localRect);
    paramCanvas.restoreToCount(i);
  }
  
  public int getAlpha()
  {
    return mRing.getAlpha();
  }
  
  public int getIntrinsicHeight()
  {
    return (int)mHeight;
  }
  
  public int getIntrinsicWidth()
  {
    return (int)mWidth;
  }
  
  public int getOpacity()
  {
    return -3;
  }
  
  public boolean isRunning()
  {
    ArrayList localArrayList = mAnimators;
    int j = localArrayList.size();
    int i = 0;
    while (i < j)
    {
      Animation localAnimation = (Animation)localArrayList.get(i);
      if ((localAnimation.hasStarted()) && (!localAnimation.hasEnded())) {
        return true;
      }
      i += 1;
    }
    return false;
  }
  
  public void setAlpha(int paramInt)
  {
    mRing.setAlpha(paramInt);
  }
  
  public void setArrowScale(float paramFloat)
  {
    mRing.setArrowScale(paramFloat);
  }
  
  public void setBackgroundColor(int paramInt)
  {
    mRing.setBackgroundColor(paramInt);
  }
  
  public void setColorFilter(ColorFilter paramColorFilter)
  {
    mRing.setColorFilter(paramColorFilter);
  }
  
  public void setColorSchemeColors(int... paramVarArgs)
  {
    mRing.setColors(paramVarArgs);
    mRing.setColorIndex(0);
  }
  
  public void setProgressRotation(float paramFloat)
  {
    mRing.setRotation(paramFloat);
  }
  
  void setRotation(float paramFloat)
  {
    mRotation = paramFloat;
    invalidateSelf();
  }
  
  public void setStartEndTrim(float paramFloat1, float paramFloat2)
  {
    mRing.setStartTrim(paramFloat1);
    mRing.setEndTrim(paramFloat2);
  }
  
  public void showArrow(boolean paramBoolean)
  {
    mRing.setShowArrow(paramBoolean);
  }
  
  public void start()
  {
    mAnimation.reset();
    mRing.storeOriginals();
    if (mRing.getEndTrim() != mRing.getStartTrim())
    {
      mFinishing = true;
      mAnimation.setDuration(666L);
      mParent.startAnimation(mAnimation);
      return;
    }
    mRing.setColorIndex(0);
    mRing.resetOriginals();
    mAnimation.setDuration(1332L);
    mParent.startAnimation(mAnimation);
  }
  
  public void stop()
  {
    mParent.clearAnimation();
    setRotation(0.0F);
    mRing.setShowArrow(false);
    mRing.setColorIndex(0);
    mRing.resetOriginals();
  }
  
  public void updateSizes(int paramInt)
  {
    if (paramInt == 0)
    {
      setSizeParameters(56.0D, 56.0D, 12.5D, 3.0D, 12.0F, 6.0F);
      return;
    }
    setSizeParameters(40.0D, 40.0D, 8.75D, 2.5D, 10.0F, 5.0F);
  }
  
  private static class Ring
  {
    private int mAlpha;
    private Path mArrow;
    private int mArrowHeight;
    private final Paint mArrowPaint = new Paint();
    private float mArrowScale;
    private int mArrowWidth;
    private int mBackgroundColor;
    private final Drawable.Callback mCallback;
    private final Paint mCirclePaint = new Paint(1);
    private int mColorIndex;
    private int[] mColors;
    private int mCurrentColor;
    private float mEndTrim = 0.0F;
    private final Paint mPaint = new Paint();
    private double mRingCenterRadius;
    private float mRotation = 0.0F;
    private boolean mShowArrow;
    private float mStartTrim = 0.0F;
    private float mStartingEndTrim;
    private float mStartingRotation;
    private float mStartingStartTrim;
    private float mStrokeInset = 2.5F;
    private float mStrokeWidth = 5.0F;
    private final RectF mTempBounds = new RectF();
    
    public Ring(Drawable.Callback paramCallback)
    {
      mCallback = paramCallback;
      mPaint.setStrokeCap(Paint.Cap.SQUARE);
      mPaint.setAntiAlias(true);
      mPaint.setStyle(Paint.Style.STROKE);
      mArrowPaint.setStyle(Paint.Style.FILL);
      mArrowPaint.setAntiAlias(true);
    }
    
    private void drawTriangle(Canvas paramCanvas, float paramFloat1, float paramFloat2, Rect paramRect)
    {
      if (mShowArrow)
      {
        if (mArrow != null) {
          break label213;
        }
        mArrow = new Path();
        mArrow.setFillType(Path.FillType.EVEN_ODD);
      }
      for (;;)
      {
        float f1 = (int)mStrokeInset / 2;
        float f2 = mArrowScale;
        float f3 = (float)(mRingCenterRadius * Math.cos(0.0D) + paramRect.exactCenterX());
        float f4 = (float)(mRingCenterRadius * Math.sin(0.0D) + paramRect.exactCenterY());
        mArrow.moveTo(0.0F, 0.0F);
        mArrow.lineTo(mArrowWidth * mArrowScale, 0.0F);
        mArrow.lineTo(mArrowWidth * mArrowScale / 2.0F, mArrowHeight * mArrowScale);
        mArrow.offset(f3 - f1 * f2, f4);
        mArrow.close();
        mArrowPaint.setColor(mCurrentColor);
        paramCanvas.rotate(paramFloat1 + paramFloat2 - 5.0F, paramRect.exactCenterX(), paramRect.exactCenterY());
        paramCanvas.drawPath(mArrow, mArrowPaint);
        return;
        label213:
        mArrow.reset();
      }
    }
    
    private int getNextColorIndex()
    {
      return (mColorIndex + 1) % mColors.length;
    }
    
    private void invalidateSelf()
    {
      mCallback.invalidateDrawable(null);
    }
    
    public void draw(Canvas paramCanvas, Rect paramRect)
    {
      RectF localRectF = mTempBounds;
      localRectF.set(paramRect);
      localRectF.inset(mStrokeInset, mStrokeInset);
      float f1 = (mStartTrim + mRotation) * 360.0F;
      float f2 = (mEndTrim + mRotation) * 360.0F - f1;
      mPaint.setColor(mCurrentColor);
      paramCanvas.drawArc(localRectF, f1, f2, false, mPaint);
      drawTriangle(paramCanvas, f1, f2, paramRect);
      if (mAlpha < 255)
      {
        mCirclePaint.setColor(mBackgroundColor);
        mCirclePaint.setAlpha(255 - mAlpha);
        paramCanvas.drawCircle(paramRect.exactCenterX(), paramRect.exactCenterY(), paramRect.width() / 2, mCirclePaint);
      }
    }
    
    public int getAlpha()
    {
      return mAlpha;
    }
    
    public double getCenterRadius()
    {
      return mRingCenterRadius;
    }
    
    public float getEndTrim()
    {
      return mEndTrim;
    }
    
    public int getNextColor()
    {
      return mColors[getNextColorIndex()];
    }
    
    public float getStartTrim()
    {
      return mStartTrim;
    }
    
    public int getStartingColor()
    {
      return mColors[mColorIndex];
    }
    
    public float getStartingEndTrim()
    {
      return mStartingEndTrim;
    }
    
    public float getStartingRotation()
    {
      return mStartingRotation;
    }
    
    public float getStartingStartTrim()
    {
      return mStartingStartTrim;
    }
    
    public float getStrokeWidth()
    {
      return mStrokeWidth;
    }
    
    public void goToNextColor()
    {
      setColorIndex(getNextColorIndex());
    }
    
    public void resetOriginals()
    {
      mStartingStartTrim = 0.0F;
      mStartingEndTrim = 0.0F;
      mStartingRotation = 0.0F;
      setStartTrim(0.0F);
      setEndTrim(0.0F);
      setRotation(0.0F);
    }
    
    public void setAlpha(int paramInt)
    {
      mAlpha = paramInt;
    }
    
    public void setArrowDimensions(float paramFloat1, float paramFloat2)
    {
      mArrowWidth = ((int)paramFloat1);
      mArrowHeight = ((int)paramFloat2);
    }
    
    public void setArrowScale(float paramFloat)
    {
      if (paramFloat != mArrowScale)
      {
        mArrowScale = paramFloat;
        invalidateSelf();
      }
    }
    
    public void setBackgroundColor(int paramInt)
    {
      mBackgroundColor = paramInt;
    }
    
    public void setCenterRadius(double paramDouble)
    {
      mRingCenterRadius = paramDouble;
    }
    
    public void setColor(int paramInt)
    {
      mCurrentColor = paramInt;
    }
    
    public void setColorFilter(ColorFilter paramColorFilter)
    {
      mPaint.setColorFilter(paramColorFilter);
      invalidateSelf();
    }
    
    public void setColorIndex(int paramInt)
    {
      mColorIndex = paramInt;
      mCurrentColor = mColors[mColorIndex];
    }
    
    public void setColors(int[] paramArrayOfInt)
    {
      mColors = paramArrayOfInt;
      setColorIndex(0);
    }
    
    public void setEndTrim(float paramFloat)
    {
      mEndTrim = paramFloat;
      invalidateSelf();
    }
    
    public void setInsets(int paramInt1, int paramInt2)
    {
      float f = Math.min(paramInt1, paramInt2);
      if ((mRingCenterRadius <= 0.0D) || (f < 0.0F)) {}
      for (f = (float)Math.ceil(mStrokeWidth / 2.0F);; f = (float)(f / 2.0F - mRingCenterRadius))
      {
        mStrokeInset = f;
        return;
      }
    }
    
    public void setRotation(float paramFloat)
    {
      mRotation = paramFloat;
      invalidateSelf();
    }
    
    public void setShowArrow(boolean paramBoolean)
    {
      if (mShowArrow != paramBoolean)
      {
        mShowArrow = paramBoolean;
        invalidateSelf();
      }
    }
    
    public void setStartTrim(float paramFloat)
    {
      mStartTrim = paramFloat;
      invalidateSelf();
    }
    
    public void setStrokeWidth(float paramFloat)
    {
      mStrokeWidth = paramFloat;
      mPaint.setStrokeWidth(paramFloat);
      invalidateSelf();
    }
    
    public void storeOriginals()
    {
      mStartingStartTrim = mStartTrim;
      mStartingEndTrim = mEndTrim;
      mStartingRotation = mRotation;
    }
  }
}
