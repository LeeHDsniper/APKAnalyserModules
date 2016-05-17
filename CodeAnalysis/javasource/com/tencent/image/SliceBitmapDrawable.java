package com.tencent.image;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.ConstantState;
import android.util.DisplayMetrics;

public class SliceBitmapDrawable
  extends Drawable
{
  private static final int DEFAULT_PAINT_FLAGS = 6;
  private static final int SLICE_SIZE = 2048;
  private BitmapState mBitmapState;
  private int mHeight;
  private boolean mMutated;
  private int mTargetDensity;
  private int mWidth;
  
  public SliceBitmapDrawable(Resources paramResources, Bitmap paramBitmap)
  {
    this(new BitmapState(paramBitmap), paramResources);
    mBitmapState.mTargetDensity = mTargetDensity;
  }
  
  public SliceBitmapDrawable(Resources paramResources, SliceBitmap paramSliceBitmap)
  {
    this(new BitmapState(paramSliceBitmap), paramResources);
    mBitmapState.mTargetDensity = mTargetDensity;
  }
  
  private SliceBitmapDrawable(BitmapState paramBitmapState, Resources paramResources)
  {
    mBitmapState = paramBitmapState;
    if (paramResources != null) {}
    for (mTargetDensity = getDisplayMetricsdensityDpi;; mTargetDensity = mTargetDensity)
    {
      computeBitmapSize();
      return;
    }
  }
  
  private void computeBitmapSize()
  {
    mWidth = mBitmapState.mSliceBitmap.getScaledWidth(mTargetDensity);
    mHeight = mBitmapState.mSliceBitmap.getScaledHeight(mTargetDensity);
  }
  
  public static boolean needSlice(Bitmap paramBitmap)
  {
    return (paramBitmap.getWidth() > 2048) || (paramBitmap.getHeight() > 2048);
  }
  
  public void draw(Canvas paramCanvas)
  {
    Rect localRect = getBounds();
    mBitmapState.mSliceBitmap.draw(paramCanvas, localRect, mBitmapState.mPaint);
  }
  
  public Bitmap getBitmap(int paramInt)
  {
    return mBitmapState.mSliceBitmap.getBitmap(paramInt);
  }
  
  public int getChangingConfigurations()
  {
    return super.getChangingConfigurations() | mBitmapState.mChangingConfigurations;
  }
  
  public int getColumnCount()
  {
    return mBitmapState.mSliceBitmap.getColumnCount();
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
    if ((mBitmapState.mSliceBitmap.hasAlpha) || (mBitmapState.mPaint.getAlpha() < 255)) {
      return -3;
    }
    return -1;
  }
  
  public final Paint getPaint()
  {
    return mBitmapState.mPaint;
  }
  
  public int getRowCount()
  {
    return mBitmapState.mSliceBitmap.getRowCount();
  }
  
  public Drawable mutate()
  {
    if ((!mMutated) && (super.mutate() == this))
    {
      mBitmapState = new BitmapState(mBitmapState);
      mMutated = true;
    }
    return this;
  }
  
  public void setAlpha(int paramInt)
  {
    if (paramInt != mBitmapState.mPaint.getAlpha())
    {
      mBitmapState.mPaint.setAlpha(paramInt);
      invalidateSelf();
    }
  }
  
  public void setAntiAlias(boolean paramBoolean)
  {
    mBitmapState.mPaint.setAntiAlias(paramBoolean);
    invalidateSelf();
  }
  
  public void setColorFilter(ColorFilter paramColorFilter)
  {
    mBitmapState.mPaint.setColorFilter(paramColorFilter);
    invalidateSelf();
  }
  
  public void setDither(boolean paramBoolean)
  {
    mBitmapState.mPaint.setDither(paramBoolean);
    invalidateSelf();
  }
  
  public void setFilterBitmap(boolean paramBoolean)
  {
    mBitmapState.mPaint.setFilterBitmap(paramBoolean);
    invalidateSelf();
  }
  
  public void setTargetDensity(int paramInt)
  {
    if (mTargetDensity != paramInt)
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
  
  public void setTargetDensity(Canvas paramCanvas)
  {
    setTargetDensity(paramCanvas.getDensity());
  }
  
  public void setTargetDensity(DisplayMetrics paramDisplayMetrics)
  {
    setTargetDensity(densityDpi);
  }
  
  static final class BitmapState
    extends Drawable.ConstantState
  {
    int mChangingConfigurations;
    Paint mPaint = new Paint(6);
    SliceBitmap mSliceBitmap;
    int mTargetDensity = 160;
    
    BitmapState(Bitmap paramBitmap)
    {
      mSliceBitmap = new SliceBitmap(paramBitmap);
    }
    
    BitmapState(SliceBitmap paramSliceBitmap)
    {
      mSliceBitmap = paramSliceBitmap;
    }
    
    BitmapState(BitmapState paramBitmapState)
    {
      mSliceBitmap = mSliceBitmap;
      mChangingConfigurations = mChangingConfigurations;
      mTargetDensity = mTargetDensity;
      mPaint = new Paint(mPaint);
    }
    
    public int getChangingConfigurations()
    {
      return mChangingConfigurations;
    }
    
    public Drawable newDrawable()
    {
      return new SliceBitmapDrawable(this, null, null);
    }
    
    public Drawable newDrawable(Resources paramResources)
    {
      return new SliceBitmapDrawable(this, paramResources, null);
    }
  }
}
