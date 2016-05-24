package com.adobe.creativesdk.aviary.internal.graphics.drawable;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import it.sephiroth.android.library.imagezoom.graphics.FastBitmapDrawable;

public class FakeBitmapDrawable
  extends FastBitmapDrawable
{
  private int mFakeHeight;
  private int mFakeWidth;
  private Matrix mMatrix;
  private int mRealHeight;
  private int mRealWidth;
  
  public FakeBitmapDrawable(Bitmap paramBitmap, int paramInt1, int paramInt2)
  {
    super(paramBitmap);
    mFakeWidth = paramInt1;
    mFakeHeight = paramInt2;
    mRealWidth = paramBitmap.getWidth();
    mRealHeight = paramBitmap.getHeight();
    update();
  }
  
  private void update()
  {
    float f1 = mFakeWidth;
    float f2 = mFakeHeight;
    float f3 = mRealWidth;
    float f4 = mRealHeight;
    mMatrix = new Matrix();
    mMatrix.postScale(f1 / f3, f2 / f4);
  }
  
  public void draw(Canvas paramCanvas)
  {
    paramCanvas.drawBitmap(mBitmap, mMatrix, mPaint);
  }
  
  public int getIntrinsicHeight()
  {
    return mFakeHeight;
  }
  
  public int getIntrinsicWidth()
  {
    return mFakeWidth;
  }
  
  public void updateBitmap(Bitmap paramBitmap, int paramInt1, int paramInt2)
  {
    setBitmap(paramBitmap);
    mFakeWidth = paramInt1;
    mFakeHeight = paramInt2;
    mRealWidth = paramBitmap.getWidth();
    mRealHeight = paramBitmap.getHeight();
    update();
    invalidateSelf();
  }
}
