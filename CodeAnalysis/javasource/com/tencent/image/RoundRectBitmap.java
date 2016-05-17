package com.tencent.image;

import android.graphics.Bitmap;

public class RoundRectBitmap
{
  public final Bitmap mBitmap;
  public final int mBoardColor;
  public final float mBorderWidth;
  public final float mCornerRadius;
  public int mDisplayHeight;
  public int mDisplayWidth;
  
  public RoundRectBitmap(Bitmap paramBitmap, float paramFloat)
  {
    this(paramBitmap, paramFloat, -16777216, 0.0F);
  }
  
  public RoundRectBitmap(Bitmap paramBitmap, float paramFloat1, int paramInt, float paramFloat2)
  {
    mBitmap = paramBitmap;
    mCornerRadius = paramFloat1;
    mBoardColor = paramInt;
    mBorderWidth = paramFloat2;
  }
}
