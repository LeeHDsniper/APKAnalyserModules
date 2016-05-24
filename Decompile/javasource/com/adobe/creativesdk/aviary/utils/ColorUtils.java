package com.adobe.creativesdk.aviary.utils;

import android.graphics.Color;

public final class ColorUtils
{
  private static int findMinimumAlpha(int paramInt1, int paramInt2, double paramDouble)
  {
    if (Color.alpha(paramInt2) != 255) {
      throw new IllegalArgumentException("background can not be translucent");
    }
    if (android.support.v4.graphics.ColorUtils.calculateContrast(modifyAlpha(paramInt1, 255), paramInt2) < paramDouble) {
      m = -1;
    }
    int j;
    int k;
    int i;
    do
    {
      do
      {
        return m;
        j = 0;
        k = 0;
        i = 255;
        m = i;
      } while (j > 10);
      m = i;
    } while (i - k <= 10);
    int m = (k + i) / 2;
    if (android.support.v4.graphics.ColorUtils.calculateContrast(modifyAlpha(paramInt1, m), paramInt2) < paramDouble) {
      k = m;
    }
    for (;;)
    {
      j += 1;
      break;
      i = m;
    }
  }
  
  public static int getTextColorForBackground(int paramInt, float paramFloat)
  {
    int i = -1;
    int j = findMinimumAlpha(-1, paramInt, paramFloat);
    if (j >= 0) {
      paramInt = modifyAlpha(-1, j);
    }
    do
    {
      return paramInt;
      j = findMinimumAlpha(-16777216, paramInt, paramFloat);
      paramInt = i;
    } while (j < 0);
    return modifyAlpha(-16777216, j);
  }
  
  public static int modifyAlpha(int paramInt1, int paramInt2)
  {
    return 0xFFFFFF & paramInt1 | paramInt2 << 24;
  }
}
