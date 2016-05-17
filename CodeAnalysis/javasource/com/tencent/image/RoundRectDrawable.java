package com.tencent.image;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Matrix;
import android.graphics.Matrix.ScaleToFit;
import android.graphics.Paint;
import android.graphics.Paint.Style;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Shader.TileMode;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.ConstantState;
import android.os.Build.VERSION;
import android.util.DisplayMetrics;

public class RoundRectDrawable
  extends Drawable
{
  public static final String TAG = "RoundRectDrawable";
  private final RoundRectDrawableState mBitmapState;
  private float mBorderWidth;
  final RectF mBounds = new RectF();
  private float mCornerRadius;
  private int mHeight;
  private int mTargetDensity = 160;
  private int mWidth;
  boolean reBuildCornerRadius = false;
  
  public RoundRectDrawable(Resources paramResources, RoundRectBitmap paramRoundRectBitmap)
  {
    mBitmapState = new RoundRectDrawableState(paramRoundRectBitmap);
    if (paramResources != null)
    {
      mTargetDensity = getDisplayMetricsdensityDpi;
      mBitmapState.mTargetDensity = mTargetDensity;
    }
    computeBitmapSize();
  }
  
  private RoundRectDrawable(RoundRectDrawableState paramRoundRectDrawableState, Resources paramResources)
  {
    mBitmapState = paramRoundRectDrawableState;
    if (paramResources != null) {}
    for (mTargetDensity = getDisplayMetricsdensityDpi;; mTargetDensity = mTargetDensity)
    {
      computeBitmapSize();
      return;
    }
  }
  
  private void computeBitmapSize()
  {
    mWidth = mBitmapState.mRoundRectBitmap.mBitmap.getScaledWidth(mTargetDensity);
    mHeight = mBitmapState.mRoundRectBitmap.mBitmap.getScaledHeight(mTargetDensity);
    int i = mBitmapState.mRoundRectBitmap.mBitmap.getDensity();
    mBorderWidth = (((int)(mBitmapState.mRoundRectBitmap.mBorderWidth * mTargetDensity) + (i >> 1)) / i);
  }
  
  public void draw(Canvas paramCanvas)
  {
    RectF localRectF1 = mBitmapState.mDrawableRect;
    RectF localRectF2 = mBitmapState.mBorderRect;
    Paint localPaint1 = mBitmapState.mBorderPaint;
    Paint localPaint2 = mBitmapState.mBitmapPaint;
    float f2;
    float f1;
    int i;
    if (reBuildCornerRadius)
    {
      f2 = 1.0F;
      f1 = f2;
      if (Build.VERSION.SDK_INT >= 11)
      {
        float f4 = localRectF1.width();
        float f3 = localRectF1.height();
        i = paramCanvas.getWidth();
        int j = paramCanvas.getHeight();
        f1 = f2;
        if (i != mBitmapState.mRoundRectBitmap.mDisplayWidth)
        {
          f1 = f2;
          if (j != mBitmapState.mRoundRectBitmap.mDisplayHeight)
          {
            f1 = i / f4;
            f2 = j / f3;
            if (f1 >= f2) {
              break label223;
            }
          }
        }
      }
    }
    for (;;)
    {
      i = mBitmapState.mRoundRectBitmap.mBitmap.getDensity();
      mCornerRadius = ((mBitmapState.mRoundRectBitmap.mCornerRadius * mTargetDensity + (i >> 1)) / i / f1);
      reBuildCornerRadius = false;
      if (!mBitmapState.mOval) {
        break label237;
      }
      if (mBorderWidth <= 0.0F) {
        break;
      }
      paramCanvas.drawOval(localRectF1, localPaint2);
      paramCanvas.drawOval(localRectF2, localPaint1);
      return;
      label223:
      f1 = f2;
    }
    paramCanvas.drawOval(localRectF1, localPaint2);
    return;
    label237:
    if (mBorderWidth > 0.0F)
    {
      paramCanvas.drawRoundRect(localRectF1, Math.max(mCornerRadius, 0.0F), Math.max(mCornerRadius, 0.0F), localPaint2);
      paramCanvas.drawRoundRect(localRectF2, mCornerRadius, mCornerRadius, localPaint1);
      return;
    }
    paramCanvas.drawRoundRect(localRectF1, mCornerRadius, mCornerRadius, localPaint2);
  }
  
  public int getChangingConfigurations()
  {
    return super.getChangingConfigurations() | mBitmapState.mChangingConfigurations;
  }
  
  public final Drawable.ConstantState getConstantState()
  {
    mBitmapState.mChangingConfigurations = getChangingConfigurations();
    return mBitmapState;
  }
  
  public int getIntrinsicHeight()
  {
    return mHeight;
  }
  
  public int getIntrinsicWidth()
  {
    return mWidth;
  }
  
  public int getOpacity()
  {
    return -3;
  }
  
  protected void onBoundsChange(Rect paramRect)
  {
    super.onBoundsChange(paramRect);
    mBounds.set(paramRect);
    mBitmapState.updateShaderMatrix(mBounds);
    reBuildCornerRadius = true;
  }
  
  public void setAlpha(int paramInt)
  {
    mBitmapState.mBitmapPaint.setAlpha(paramInt);
    invalidateSelf();
  }
  
  public void setColorFilter(ColorFilter paramColorFilter)
  {
    mBitmapState.mBitmapPaint.setColorFilter(paramColorFilter);
    invalidateSelf();
  }
  
  public void setDither(boolean paramBoolean)
  {
    mBitmapState.mBorderPaint.setDither(paramBoolean);
    mBitmapState.mBitmapPaint.setDither(paramBoolean);
    invalidateSelf();
  }
  
  public void setFilterBitmap(boolean paramBoolean)
  {
    mBitmapState.mBitmapPaint.setFilterBitmap(paramBoolean);
    invalidateSelf();
  }
  
  public RoundRectDrawable setOval(boolean paramBoolean)
  {
    mBitmapState.mOval = paramBoolean;
    return this;
  }
  
  public void setTargetDensity(int paramInt)
  {
    if (paramInt != mTargetDensity)
    {
      int i = paramInt;
      if (paramInt == 0) {
        i = 160;
      }
      mTargetDensity = i;
      computeBitmapSize();
      invalidateSelf();
    }
  }
  
  static final class RoundRectDrawableState
    extends Drawable.ConstantState
  {
    final int mBitmapHeight;
    final Paint mBitmapPaint;
    final RectF mBitmapRect = new RectF();
    final BitmapShader mBitmapShader;
    final int mBitmapWidth;
    final Paint mBorderPaint;
    final RectF mBorderRect = new RectF();
    int mChangingConfigurations;
    final RectF mDrawableRect = new RectF();
    boolean mOval = false;
    final RoundRectBitmap mRoundRectBitmap;
    final Matrix mShaderMatrix = new Matrix();
    int mTargetDensity = 160;
    
    RoundRectDrawableState(RoundRectBitmap paramRoundRectBitmap)
    {
      mRoundRectBitmap = paramRoundRectBitmap;
      mBitmapWidth = mRoundRectBitmap.mBitmap.getWidth();
      mBitmapHeight = mRoundRectBitmap.mBitmap.getHeight();
      mBitmapRect.set(0.0F, 0.0F, mBitmapWidth, mBitmapHeight);
      mBitmapShader = new BitmapShader(mRoundRectBitmap.mBitmap, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP);
      mBitmapShader.setLocalMatrix(mShaderMatrix);
      mBitmapPaint = new Paint();
      mBitmapPaint.setStyle(Paint.Style.FILL);
      mBitmapPaint.setAntiAlias(true);
      mBitmapPaint.setShader(mBitmapShader);
      mBorderPaint = new Paint();
      mBorderPaint.setStyle(Paint.Style.STROKE);
      mBorderPaint.setAntiAlias(true);
      mBorderPaint.setColor(mRoundRectBitmap.mBoardColor);
      mBorderPaint.setStrokeWidth(mRoundRectBitmap.mBorderWidth);
    }
    
    public int getChangingConfigurations()
    {
      return mChangingConfigurations;
    }
    
    public Drawable newDrawable()
    {
      return new RoundRectDrawable(this, null, null);
    }
    
    public Drawable newDrawable(Resources paramResources)
    {
      return new RoundRectDrawable(this, paramResources, null);
    }
    
    void updateShaderMatrix(RectF paramRectF)
    {
      mBorderRect.set(mBitmapRect);
      mShaderMatrix.setRectToRect(mBitmapRect, paramRectF, Matrix.ScaleToFit.CENTER);
      mShaderMatrix.mapRect(mBorderRect);
      mBorderRect.inset(mRoundRectBitmap.mBorderWidth / 2.0F, mRoundRectBitmap.mBorderWidth / 2.0F);
      mShaderMatrix.setRectToRect(mBitmapRect, mBorderRect, Matrix.ScaleToFit.FILL);
      mDrawableRect.set(mBorderRect);
      mBitmapShader.setLocalMatrix(mShaderMatrix);
    }
  }
}
