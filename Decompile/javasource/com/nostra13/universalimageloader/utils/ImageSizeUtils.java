package com.nostra13.universalimageloader.utils;

import android.opengl.GLES10;
import com.nostra13.universalimageloader.core.assist.ImageSize;
import com.nostra13.universalimageloader.core.assist.ViewScaleType;
import com.nostra13.universalimageloader.core.imageaware.ImageAware;

public final class ImageSizeUtils
{
  private static ImageSize maxBitmapSize;
  
  static
  {
    int[] arrayOfInt = new int[1];
    GLES10.glGetIntegerv(3379, arrayOfInt, 0);
    int i = Math.max(arrayOfInt[0], 2048);
    maxBitmapSize = new ImageSize(i, i);
  }
  
  public static int computeImageSampleSize(ImageSize paramImageSize1, ImageSize paramImageSize2, ViewScaleType paramViewScaleType, boolean paramBoolean)
  {
    int j = paramImageSize1.getWidth();
    int i = paramImageSize1.getHeight();
    int i2 = paramImageSize2.getWidth();
    int i3 = paramImageSize2.getHeight();
    int n = 1;
    int i1 = 1;
    int k = 1;
    int m = j / i2;
    int i4 = i / i3;
    switch (1.$SwitchMap$com$nostra13$universalimageloader$core$assist$ViewScaleType[paramViewScaleType.ordinal()])
    {
    default: 
      i = k;
    }
    for (;;)
    {
      j = i;
      if (i < 1) {
        j = 1;
      }
      return j;
      if (paramBoolean)
      {
        m = j;
        k = i;
        j = n;
        for (;;)
        {
          if (m / 2 < i2)
          {
            i = j;
            if (k / 2 < i3) {
              break;
            }
          }
          m /= 2;
          k /= 2;
          j *= 2;
        }
      }
      i = Math.max(m, i4);
      continue;
      if (paramBoolean)
      {
        m = j;
        k = i;
        j = i1;
        for (;;)
        {
          i = j;
          if (m / 2 < i2) {
            break;
          }
          i = j;
          if (k / 2 < i3) {
            break;
          }
          m /= 2;
          k /= 2;
          j *= 2;
        }
      }
      i = Math.min(m, i4);
    }
  }
  
  public static float computeImageScale(ImageSize paramImageSize1, ImageSize paramImageSize2, ViewScaleType paramViewScaleType, boolean paramBoolean)
  {
    int k = paramImageSize1.getWidth();
    int m = paramImageSize1.getHeight();
    int j = paramImageSize2.getWidth();
    int i = paramImageSize2.getHeight();
    float f1 = k / j;
    float f2 = m / i;
    if (((paramViewScaleType == ViewScaleType.FIT_INSIDE) && (f1 >= f2)) || ((paramViewScaleType == ViewScaleType.CROP) && (f1 < f2))) {
      i = (int)(m / f1);
    }
    for (;;)
    {
      f2 = 1.0F;
      if ((paramBoolean) || (j >= k) || (i >= m))
      {
        f1 = f2;
        if (paramBoolean)
        {
          f1 = f2;
          if (j != k)
          {
            f1 = f2;
            if (i == m) {}
          }
        }
      }
      else
      {
        f1 = j / k;
      }
      return f1;
      j = (int)(k / f2);
    }
  }
  
  public static int computeMinImageSampleSize(ImageSize paramImageSize)
  {
    int i = paramImageSize.getWidth();
    int j = paramImageSize.getHeight();
    int k = maxBitmapSize.getWidth();
    int m = maxBitmapSize.getHeight();
    return Math.max((int)Math.ceil(i / k), (int)Math.ceil(j / m));
  }
  
  public static ImageSize defineTargetSizeForView(ImageAware paramImageAware, ImageSize paramImageSize)
  {
    int j = paramImageAware.getWidth();
    int i = j;
    if (j <= 0) {
      i = paramImageSize.getWidth();
    }
    int k = paramImageAware.getHeight();
    j = k;
    if (k <= 0) {
      j = paramImageSize.getHeight();
    }
    return new ImageSize(i, j);
  }
}
