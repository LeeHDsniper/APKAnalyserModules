package com.adobe.creativesdk.aviary.internal.graphics.drawable;

import android.annotation.SuppressLint;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Paint.FontMetrics;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;

public class AdobeImageMemeTextDrawable
  extends AdobeImageTextDrawable
  implements EditableDrawable, FeatherDrawable
{
  private boolean mBoundsChanged = true;
  protected int mContentHeight;
  protected int mContentWidth;
  private Paint mTempPaint;
  private boolean mTextChanged = true;
  boolean mTop;
  private float maxSize;
  private float padW;
  private float xoff;
  private float yoff;
  
  public AdobeImageMemeTextDrawable(String paramString, float paramFloat, Typeface paramTypeface, boolean paramBoolean)
  {
    super(paramString, paramFloat, paramTypeface);
    mTop = paramBoolean;
    mTempPaint = new Paint(mPaint);
    setText(paramString);
  }
  
  public void draw(Canvas paramCanvas)
  {
    copyBounds(drawRect);
    if (mDebugPaint != null) {
      paramCanvas.drawRect(drawRect, mDebugPaint);
    }
    int i = getNumLines();
    getFontMetrics(metrics);
    float f2 = metrics.ascent - (metrics.top - metrics.ascent);
    float f1;
    float f3;
    long l;
    if (mTop)
    {
      f1 = drawRect.top - f2;
      f3 = drawRect.left + xoff;
      paramCanvas.drawText(mText, f3, f1, mStrokePaint);
      paramCanvas.drawText(mText, f3, f1, mPaint);
      if (mEditing)
      {
        l = System.currentTimeMillis();
        if (l - mNow > 300L) {
          if (mShowCursor) {
            break label281;
          }
        }
      }
    }
    label281:
    for (boolean bool = true;; bool = false)
    {
      mShowCursor = bool;
      mNow = l;
      if (mShowCursor)
      {
        getLineBounds(i - 1, lastRect);
        f3 = mCursorDistance + f3 + lastRect.width();
        f2 = f1 + f2;
        float f4 = f3 + mCursorWidth;
        paramCanvas.drawRect(f3, f2, f4, f1, mStrokePaint);
        paramCanvas.drawRect(f3, f2, f4, f1, mCursorPaint);
      }
      return;
      f1 = drawRect.bottom - (metrics.bottom - metrics.descent);
      break;
    }
  }
  
  public int getIntrinsicHeight()
  {
    return (int)mPaint.getTextSize();
  }
  
  public int getIntrinsicWidth()
  {
    return mContentWidth;
  }
  
  public int getNumLines()
  {
    return 1;
  }
  
  protected void onTextInvalidate()
  {
    invalidateSize();
  }
  
  public void setBounds(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    if ((paramFloat1 != mBoundsF.left) || (paramFloat2 != mBoundsF.top) || (paramFloat3 != mBoundsF.right) || (paramFloat4 != mBoundsF.bottom))
    {
      mBoundsF.set(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
      mBoundsChanged = true;
      mContentWidth = ((int)mBoundsF.width());
    }
    if ((mTextChanged) || (mBoundsChanged))
    {
      paramFloat2 = mDefaultTextSize;
      mTempPaint.setTextSize(paramFloat2);
      if (mText.length() <= 0) {
        break label244;
      }
      paramFloat1 = mTempPaint.measureText(mText);
      paramFloat2 = Math.min(paramFloat2 * ((mBoundsF.width() - padW * 2.0F) / paramFloat1), maxSize);
      mPaint.setTextSize(paramFloat2);
      mStrokePaint.setTextSize(paramFloat2);
      mStrokePaint.setStrokeWidth(paramFloat2 / 10.0F);
      mCursorDistance = mStrokePaint.getStrokeWidth();
      if (mText.length() <= 0) {
        break label257;
      }
    }
    label244:
    label257:
    for (paramFloat1 = mPaint.measureText(mText);; paramFloat1 = mPaint.measureText("a"))
    {
      yoff = paramFloat2;
      xoff = ((mBoundsF.width() - paramFloat1) / 2.0F);
      mTextChanged = false;
      mBoundsChanged = false;
      return;
      paramFloat1 = mTempPaint.measureText("a");
      break;
    }
  }
  
  public void setContentSize(float paramFloat1, float paramFloat2)
  {
    mContentWidth = ((int)paramFloat1);
    mContentHeight = ((int)paramFloat2);
    maxSize = (Math.min(paramFloat1, paramFloat2) / 7.0F);
    padW = (paramFloat1 / 40.0F);
  }
  
  @SuppressLint({"DefaultLocale"})
  public void setText(String paramString)
  {
    super.setText(paramString.toUpperCase());
    mTextChanged = true;
  }
  
  public void setTextSize(float paramFloat)
  {
    if (paramFloat != getTextSize()) {
      mTextChanged = true;
    }
  }
  
  public boolean validateSize(RectF paramRectF)
  {
    return true;
  }
}
