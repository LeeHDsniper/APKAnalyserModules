package com.behance.sdk.edmodo.cropper.util;

import android.graphics.Bitmap;
import android.graphics.Rect;
import android.view.View;

public class ImageViewUtil
{
  public static Rect getBitmapRectCenterInside(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    return getBitmapRectCenterInsideHelper(paramInt1, paramInt2, paramInt3, paramInt4);
  }
  
  public static Rect getBitmapRectCenterInside(Bitmap paramBitmap, View paramView)
  {
    return getBitmapRectCenterInsideHelper(paramBitmap.getWidth(), paramBitmap.getHeight(), paramView.getWidth(), paramView.getHeight());
  }
  
  private static Rect getBitmapRectCenterInsideHelper(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    double d1 = paramInt3 / paramInt1;
    double d2 = paramInt4 / paramInt2;
    if ((d1 != Double.POSITIVE_INFINITY) || (d2 != Double.POSITIVE_INFINITY)) {
      if (d1 <= d2)
      {
        d2 = paramInt3;
        d1 = paramInt2 * d2 / paramInt1;
        if (d2 != paramInt3) {
          break label132;
        }
        paramInt1 = 0;
        paramInt2 = (int)Math.round((paramInt4 - d1) / 2.0D);
      }
    }
    for (;;)
    {
      return new Rect(paramInt1, paramInt2, (int)Math.ceil(d2) + paramInt1, (int)Math.ceil(d1) + paramInt2);
      d1 = paramInt4;
      d2 = paramInt1 * d1 / paramInt2;
      break;
      d1 = paramInt2;
      d2 = paramInt1;
      break;
      label132:
      if (d1 == paramInt4)
      {
        paramInt1 = (int)Math.round((paramInt3 - d2) / 2.0D);
        paramInt2 = 0;
      }
      else
      {
        paramInt1 = (int)Math.round((paramInt3 - d2) / 2.0D);
        paramInt2 = (int)Math.round((paramInt4 - d1) / 2.0D);
      }
    }
  }
}
