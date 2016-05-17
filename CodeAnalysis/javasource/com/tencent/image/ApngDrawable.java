package com.tencent.image;

import android.content.res.Resources;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.Drawable.ConstantState;
import android.util.DisplayMetrics;
import android.view.Gravity;
import java.io.File;
import java.io.IOException;
import java.io.RandomAccessFile;

public class ApngDrawable
  extends Drawable
  implements AnimationCallback
{
  private static final byte[] SIGNATURE = { -119, 80, 78, 71, 13, 10, 26, 10 };
  private int mApngHeight;
  private ApngState mApngState;
  private int mApngWidth;
  private boolean mApplyGravity;
  private final Rect mDstRect = new Rect();
  private int mTargetDensity = 160;
  boolean mUseAnimation = true;
  
  public ApngDrawable(ApngState paramApngState, Resources paramResources)
  {
    mApngState = paramApngState;
    mApng.addCallBack(this);
    if (paramResources != null) {}
    for (mTargetDensity = getDisplayMetricsdensityDpi;; mTargetDensity = mTargetDensity)
    {
      computeImageSize();
      return;
    }
  }
  
  public ApngDrawable(ApngImage paramApngImage)
  {
    this(paramApngImage, null);
  }
  
  public ApngDrawable(ApngImage paramApngImage, Resources paramResources)
  {
    this(new ApngState(paramApngImage), paramResources);
    mApngState.mTargetDensity = mTargetDensity;
  }
  
  public ApngDrawable(File paramFile, Resources paramResources)
    throws IOException
  {
    this(paramFile, paramResources, false);
  }
  
  public ApngDrawable(File paramFile, Resources paramResources, boolean paramBoolean)
    throws IOException
  {
    this(new ApngImage(paramFile, paramBoolean), paramResources);
  }
  
  private void computeImageSize()
  {
    mApngWidth = mApngState.mApng.getScaledWidth(mTargetDensity);
    mApngHeight = mApngState.mApng.getScaledHeight(mTargetDensity);
  }
  
  public static boolean isApngFile(File paramFile)
    throws IOException
  {
    paramFile = new RandomAccessFile(paramFile, "r");
    byte[] arrayOfByte = new byte[SIGNATURE.length];
    paramFile.read(arrayOfByte);
    paramFile.close();
    int i = 0;
    while (i < SIGNATURE.length)
    {
      if (arrayOfByte[i] != SIGNATURE[i]) {
        return false;
      }
      i += 1;
    }
    return true;
  }
  
  public void draw(Canvas paramCanvas)
  {
    if (mApplyGravity)
    {
      Gravity.apply(mApngState.mGravity, mApngWidth, mApngHeight, getBounds(), mDstRect);
      mApplyGravity = false;
    }
    mApngState.mApng.draw(paramCanvas, mDstRect, mApngState.mPaint, mUseAnimation);
  }
  
  protected void finalize()
    throws Throwable
  {
    super.finalize();
    mApngState.mApng.removeCallBack(this);
  }
  
  public Drawable.ConstantState getConstantState()
  {
    return mApngState;
  }
  
  public int getGravity()
  {
    return mApngState.mGravity;
  }
  
  public ApngImage getImage()
  {
    return mApngState.mApng;
  }
  
  public int getIntrinsicHeight()
  {
    return mApngHeight;
  }
  
  public int getIntrinsicWidth()
  {
    return mApngWidth;
  }
  
  public int getOpacity()
  {
    return -2;
  }
  
  public void invalidateSelf()
  {
    super.invalidateSelf();
  }
  
  protected void onBoundsChange(Rect paramRect)
  {
    super.onBoundsChange(paramRect);
    mApplyGravity = true;
  }
  
  public void setAlpha(int paramInt)
  {
    mApngState.mPaint.setAlpha(paramInt);
  }
  
  public void setColorFilter(ColorFilter paramColorFilter)
  {
    mApngState.mPaint.setColorFilter(paramColorFilter);
  }
  
  public void setDither(boolean paramBoolean)
  {
    mApngState.mPaint.setDither(paramBoolean);
  }
  
  public void setFilterBitmap(boolean paramBoolean)
  {
    mApngState.mPaint.setFilterBitmap(paramBoolean);
  }
  
  public void setGravity(int paramInt)
  {
    mApngState.mGravity = paramInt;
    mApplyGravity = true;
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
      computeImageSize();
      invalidateSelf();
    }
  }
  
  static final class ApngState
    extends Drawable.ConstantState
  {
    ApngImage mApng;
    int mChangingConfigurations;
    int mGravity = 119;
    Paint mPaint = new Paint(6);
    int mTargetDensity = 160;
    
    public ApngState(ApngImage paramApngImage)
    {
      mApng = paramApngImage;
    }
    
    public int getChangingConfigurations()
    {
      return mChangingConfigurations;
    }
    
    public Drawable newDrawable()
    {
      return new ApngDrawable(this, null);
    }
    
    public Drawable newDrawable(Resources paramResources)
    {
      return new ApngDrawable(this, paramResources);
    }
  }
}
