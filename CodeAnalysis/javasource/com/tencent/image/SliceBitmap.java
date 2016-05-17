package com.tencent.image;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.util.DisplayMetrics;

public class SliceBitmap
{
  public static final int DENSITY_NONE = 0;
  private static final int SLICE_SIZE = 2048;
  boolean hasAlpha;
  Bitmap[] mBitmaps;
  int mChangingConfigurations;
  int mColumnCount;
  int mDensity;
  int mHeight;
  int mRowCount;
  int mWidth;
  
  public SliceBitmap(Bitmap paramBitmap)
  {
    if (needSlice(paramBitmap))
    {
      mWidth = paramBitmap.getWidth();
      mHeight = paramBitmap.getHeight();
      mDensity = paramBitmap.getDensity();
      hasAlpha = paramBitmap.hasAlpha();
      mRowCount = ((mWidth + 2048 - 1) / 2048);
      mColumnCount = ((mHeight + 2048 - 1) / 2048);
      Bitmap[] arrayOfBitmap = new Bitmap[mRowCount * mColumnCount];
      int j = 0;
      int i = 0;
      while (i < mRowCount)
      {
        int k = 0;
        if (k < mColumnCount)
        {
          int i1 = i * 2048;
          int i2 = k * 2048;
          int m;
          if (i1 + 2048 > mWidth)
          {
            m = mWidth - i1;
            label154:
            if (i2 + 2048 <= mHeight) {
              break label213;
            }
          }
          label213:
          for (int n = mHeight - i2;; n = 2048)
          {
            arrayOfBitmap[j] = Bitmap.createBitmap(paramBitmap, i1, i2, m, n);
            j += 1;
            k += 1;
            break;
            m = 2048;
            break label154;
          }
        }
        i += 1;
      }
      mBitmaps = arrayOfBitmap;
      return;
    }
    throw new IllegalArgumentException("the bitmap no need to Slice");
  }
  
  public static boolean needSlice(Bitmap paramBitmap)
  {
    return (paramBitmap.getWidth() > 2048) || (paramBitmap.getHeight() > 2048);
  }
  
  public static int scaleFromDensity(int paramInt1, int paramInt2, int paramInt3)
  {
    if ((paramInt2 == 0) || (paramInt2 == paramInt3)) {
      return paramInt1;
    }
    return (paramInt1 * paramInt3 + (paramInt2 >> 1)) / paramInt2;
  }
  
  void draw(Canvas paramCanvas, Rect paramRect, Paint paramPaint)
  {
    int m = paramCanvas.save();
    boolean bool = paramCanvas.isHardwareAccelerated();
    int n = paramCanvas.getDensity();
    paramCanvas.translate(left, top);
    if ((paramRect.width() != mWidth) || (paramRect.height() != mHeight)) {
      paramCanvas.scale(paramRect.width() / mWidth, paramRect.height() / mHeight);
    }
    int j = 0;
    if (!bool) {
      paramCanvas.setDensity(mDensity);
    }
    int i = 0;
    while (i < mRowCount)
    {
      int k = 0;
      while (k < mColumnCount)
      {
        paramRect = mBitmaps[j];
        if (paramRect != null) {
          paramCanvas.drawBitmap(paramRect, i * 2048, k * 2048, paramPaint);
        }
        j += 1;
        k += 1;
      }
      i += 1;
    }
    if (!bool) {
      paramCanvas.setDensity(n);
    }
    paramCanvas.restoreToCount(m);
  }
  
  public Bitmap getBitmap(int paramInt)
  {
    if ((mBitmaps != null) && (mBitmaps.length > paramInt)) {
      return mBitmaps[paramInt];
    }
    return null;
  }
  
  public final int getByteCount()
  {
    int j = 0;
    Bitmap[] arrayOfBitmap = mBitmaps;
    int k = arrayOfBitmap.length;
    int i = 0;
    while (i < k)
    {
      j += Utils.getBitmapSize(arrayOfBitmap[i]);
      i += 1;
    }
    return j;
  }
  
  public int getColumnCount()
  {
    return mColumnCount;
  }
  
  public final int getHeight()
  {
    return mHeight;
  }
  
  public int getRowCount()
  {
    return mRowCount;
  }
  
  public int getScaledHeight(int paramInt)
  {
    return scaleFromDensity(getHeight(), mDensity, paramInt);
  }
  
  public int getScaledHeight(Canvas paramCanvas)
  {
    return scaleFromDensity(getHeight(), mDensity, paramCanvas.getDensity());
  }
  
  public int getScaledHeight(DisplayMetrics paramDisplayMetrics)
  {
    return scaleFromDensity(getHeight(), mDensity, densityDpi);
  }
  
  public int getScaledWidth(int paramInt)
  {
    return scaleFromDensity(getWidth(), mDensity, paramInt);
  }
  
  public int getScaledWidth(Canvas paramCanvas)
  {
    return scaleFromDensity(getWidth(), mDensity, paramCanvas.getDensity());
  }
  
  public int getScaledWidth(DisplayMetrics paramDisplayMetrics)
  {
    return scaleFromDensity(getWidth(), mDensity, densityDpi);
  }
  
  public final int getWidth()
  {
    return mWidth;
  }
  
  public final boolean hasAlpha()
  {
    return hasAlpha;
  }
  
  public void recyle()
  {
    Bitmap[] arrayOfBitmap = mBitmaps;
    int j = arrayOfBitmap.length;
    int i = 0;
    while (i < j)
    {
      Bitmap localBitmap = arrayOfBitmap[i];
      if (localBitmap != null) {
        localBitmap.recycle();
      }
      i += 1;
    }
  }
}
