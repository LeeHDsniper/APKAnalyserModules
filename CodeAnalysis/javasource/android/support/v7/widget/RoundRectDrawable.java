package android.support.v7.widget;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Outline;
import android.graphics.Paint;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;

class RoundRectDrawable
  extends Drawable
{
  private final RectF mBoundsF;
  private final Rect mBoundsI;
  private boolean mInsetForPadding = false;
  private boolean mInsetForRadius = true;
  private float mPadding;
  private final Paint mPaint;
  private float mRadius;
  
  public RoundRectDrawable(int paramInt, float paramFloat)
  {
    mRadius = paramFloat;
    mPaint = new Paint(5);
    mPaint.setColor(paramInt);
    mBoundsF = new RectF();
    mBoundsI = new Rect();
  }
  
  private void updateBounds(Rect paramRect)
  {
    Rect localRect = paramRect;
    if (paramRect == null) {
      localRect = getBounds();
    }
    mBoundsF.set(left, top, right, bottom);
    mBoundsI.set(localRect);
    if (mInsetForPadding)
    {
      float f1 = RoundRectDrawableWithShadow.calculateVerticalPadding(mPadding, mRadius, mInsetForRadius);
      float f2 = RoundRectDrawableWithShadow.calculateHorizontalPadding(mPadding, mRadius, mInsetForRadius);
      mBoundsI.inset((int)Math.ceil(f2), (int)Math.ceil(f1));
      mBoundsF.set(mBoundsI);
    }
  }
  
  public void draw(Canvas paramCanvas)
  {
    paramCanvas.drawRoundRect(mBoundsF, mRadius, mRadius, mPaint);
  }
  
  public int getOpacity()
  {
    return -3;
  }
  
  public void getOutline(Outline paramOutline)
  {
    paramOutline.setRoundRect(mBoundsI, mRadius);
  }
  
  float getPadding()
  {
    return mPadding;
  }
  
  public float getRadius()
  {
    return mRadius;
  }
  
  protected void onBoundsChange(Rect paramRect)
  {
    super.onBoundsChange(paramRect);
    updateBounds(paramRect);
  }
  
  public void setAlpha(int paramInt) {}
  
  public void setColor(int paramInt)
  {
    mPaint.setColor(paramInt);
    invalidateSelf();
  }
  
  public void setColorFilter(ColorFilter paramColorFilter) {}
  
  void setPadding(float paramFloat, boolean paramBoolean1, boolean paramBoolean2)
  {
    if ((paramFloat == mPadding) && (mInsetForPadding == paramBoolean1) && (mInsetForRadius == paramBoolean2)) {
      return;
    }
    mPadding = paramFloat;
    mInsetForPadding = paramBoolean1;
    mInsetForRadius = paramBoolean2;
    updateBounds(null);
    invalidateSelf();
  }
  
  void setRadius(float paramFloat)
  {
    if (paramFloat == mRadius) {
      return;
    }
    mRadius = paramFloat;
    updateBounds(null);
    invalidateSelf();
  }
}
