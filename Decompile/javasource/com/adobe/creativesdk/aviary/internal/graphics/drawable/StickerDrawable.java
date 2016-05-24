package com.adobe.creativesdk.aviary.internal.graphics.drawable;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BlurMaskFilter;
import android.graphics.BlurMaskFilter.Blur;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.BitmapDrawable;

public class StickerDrawable
  extends BitmapDrawable
  implements FeatherDrawable
{
  BlurMaskFilter mBlurFilter;
  boolean mDrawShadow = false;
  boolean mFlip;
  Matrix mMirrorMatrix = new Matrix();
  private String mPackIdentifier;
  float mScaleX = 1.0F;
  Bitmap mShadowBitmap;
  private Paint mShadowBitmapPaint;
  Paint mShadowPaint;
  private String mStickerIdentifier;
  Rect mTempRect = new Rect();
  private float minHeight = 0.0F;
  private float minWidth = 0.0F;
  
  public StickerDrawable(Resources paramResources, Bitmap paramBitmap, String paramString1, String paramString2)
  {
    super(paramResources, paramBitmap);
    mStickerIdentifier = paramString1;
    mPackIdentifier = paramString2;
    initializeShadow();
  }
  
  public StickerDrawable(Resources paramResources, String paramString1, String paramString2, String paramString3)
  {
    this(paramResources, BitmapFactory.decodeFile(paramString1), paramString2, paramString3);
  }
  
  private void initializeShadow()
  {
    if ((mDrawShadow) && (mShadowBitmap == null) && (getBitmap() != null))
    {
      mBlurFilter = new BlurMaskFilter(5.0F, BlurMaskFilter.Blur.OUTER);
      mShadowPaint = new Paint(1);
      mShadowPaint.setMaskFilter(mBlurFilter);
      int[] arrayOfInt = new int[2];
      mShadowBitmap = getBitmap().extractAlpha(mShadowPaint, arrayOfInt);
      mShadowBitmapPaint = new Paint(1);
    }
  }
  
  public void draw(Canvas paramCanvas)
  {
    int i = paramCanvas.save();
    copyBounds(mTempRect);
    mMirrorMatrix.reset();
    mMirrorMatrix.postScale(mScaleX, 1.0F, mTempRect.centerX(), mTempRect.centerY());
    paramCanvas.concat(mMirrorMatrix);
    if (mDrawShadow) {
      paramCanvas.drawBitmap(mShadowBitmap, null, mTempRect, mShadowBitmapPaint);
    }
    super.draw(paramCanvas);
    paramCanvas.restoreToCount(i);
  }
  
  public int getAlpha()
  {
    return super.getAlpha();
  }
  
  public int getBitmapHeight()
  {
    return getBitmap().getHeight();
  }
  
  public int getBitmapWidth()
  {
    return getBitmap().getWidth();
  }
  
  public float getCurrentHeight()
  {
    return getIntrinsicHeight();
  }
  
  public float getCurrentWidth()
  {
    return getIntrinsicWidth();
  }
  
  public boolean getHorizontalFlip()
  {
    return mFlip;
  }
  
  public boolean getHorizontalFlipEnabled()
  {
    return true;
  }
  
  public String getIdentifier()
  {
    return mStickerIdentifier;
  }
  
  public float getMinHeight()
  {
    return minHeight;
  }
  
  public float getMinWidth()
  {
    return minWidth;
  }
  
  public String getPackIdentifier()
  {
    return mPackIdentifier;
  }
  
  public float getScaleX()
  {
    return mScaleX;
  }
  
  public void setAlpha(int paramInt)
  {
    super.setAlpha(paramInt);
    if (mShadowBitmapPaint != null) {
      mShadowBitmapPaint.setAlpha(paramInt);
    }
  }
  
  public void setDropShadow(boolean paramBoolean)
  {
    mDrawShadow = paramBoolean;
    initializeShadow();
    invalidateSelf();
  }
  
  public void setHorizontalFlip(boolean paramBoolean)
  {
    if (paramBoolean) {}
    for (float f = -1.0F;; f = 1.0F)
    {
      mScaleX = f;
      mFlip = paramBoolean;
      invalidateSelf();
      return;
    }
  }
  
  public void setMinSize(float paramFloat1, float paramFloat2)
  {
    minWidth = paramFloat1;
    minHeight = paramFloat2;
  }
  
  public void setScaleX(float paramFloat)
  {
    mScaleX = paramFloat;
    invalidateSelf();
  }
  
  public boolean validateSize(RectF paramRectF)
  {
    return (paramRectF.width() >= minWidth) && (paramRectF.height() >= minHeight);
  }
}
