package it.sephiroth.android.library.imagezoom.graphics;

import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;

public class FastBitmapDrawable
  extends Drawable
  implements IBitmapDrawable
{
  protected Bitmap mBitmap;
  protected int mIntrinsicHeight;
  protected int mIntrinsicWidth;
  protected Paint mPaint;
  
  public FastBitmapDrawable(Bitmap paramBitmap)
  {
    mBitmap = paramBitmap;
    if (mBitmap != null) {
      mIntrinsicWidth = mBitmap.getWidth();
    }
    for (mIntrinsicHeight = mBitmap.getHeight();; mIntrinsicHeight = 0)
    {
      mPaint = new Paint();
      mPaint.setDither(true);
      mPaint.setFilterBitmap(true);
      return;
      mIntrinsicWidth = 0;
    }
  }
  
  public void draw(Canvas paramCanvas)
  {
    if ((mBitmap != null) && (!mBitmap.isRecycled()))
    {
      Rect localRect = getBounds();
      if (!localRect.isEmpty()) {
        paramCanvas.drawBitmap(mBitmap, null, localRect, mPaint);
      }
    }
    else
    {
      return;
    }
    paramCanvas.drawBitmap(mBitmap, 0.0F, 0.0F, mPaint);
  }
  
  public Bitmap getBitmap()
  {
    return mBitmap;
  }
  
  public int getIntrinsicHeight()
  {
    return mIntrinsicHeight;
  }
  
  public int getIntrinsicWidth()
  {
    return mIntrinsicWidth;
  }
  
  public int getMinimumHeight()
  {
    return mIntrinsicHeight;
  }
  
  public int getMinimumWidth()
  {
    return mIntrinsicWidth;
  }
  
  public int getOpacity()
  {
    return -3;
  }
  
  public Paint getPaint()
  {
    return mPaint;
  }
  
  public void setAlpha(int paramInt)
  {
    mPaint.setAlpha(paramInt);
  }
  
  public void setBitmap(Bitmap paramBitmap)
  {
    mBitmap = paramBitmap;
  }
  
  public void setColorFilter(ColorFilter paramColorFilter)
  {
    mPaint.setColorFilter(paramColorFilter);
  }
}
