package com.adobe.creativesdk.aviary.internal.graphics.drawable;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Paint;
import android.graphics.Paint.FontMetrics;
import android.graphics.Paint.Style;
import android.graphics.Rect;
import android.graphics.RectF;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.util.Log;
import java.util.ArrayList;
import java.util.List;

public class AdobeImageTextDrawable
  extends Drawable
  implements EditableDrawable, FeatherDrawable
{
  final RectF drawRect = new RectF();
  final Rect lastRect = new Rect();
  protected final List<Integer> linesBreak = new ArrayList();
  protected final RectF mBoundsF = new RectF(0.0F, 0.0F, 0.0F, 0.0F);
  protected float mCursorDistance = 1.0F;
  protected final Paint mCursorPaint;
  protected float mCursorWidth = 2.0F;
  protected final Paint mDebugPaint;
  protected float mDefaultTextSize;
  protected boolean mEditing = false;
  protected String mHintString;
  protected float mIntrinsicHeight;
  protected float mIntrinsicWidth;
  protected float mMinHeight;
  protected float mMinTextSize = 14.0F;
  protected float mMinWidth;
  protected long mNow = 0L;
  protected final Paint mPaint = new Paint(451);
  protected int mPaintAlpha;
  protected boolean mShowCursor = false;
  private EditableDrawable.OnSizeChange mSizeChangeListener;
  protected int mStrokeAlpha;
  protected boolean mStrokeEnabled = true;
  protected final Paint mStrokePaint;
  protected String mText = "";
  protected boolean mTextHint = false;
  Paint.FontMetrics metrics = new Paint.FontMetrics();
  
  public AdobeImageTextDrawable(String paramString, float paramFloat)
  {
    this(paramString, paramFloat, null);
  }
  
  public AdobeImageTextDrawable(String paramString, float paramFloat, Typeface paramTypeface)
  {
    mDefaultTextSize = paramFloat;
    if (mMinTextSize > mDefaultTextSize) {
      mMinTextSize = (mDefaultTextSize - 1.0F);
    }
    mPaint.setDither(true);
    mPaint.setStyle(Paint.Style.FILL);
    mPaint.setTextSize(paramFloat);
    if (paramTypeface != null)
    {
      Log.i("text-drawable", "typeface: " + paramTypeface);
      mPaint.setTypeface(paramTypeface);
    }
    mCursorPaint = new Paint(mPaint);
    mStrokePaint = new Paint(mPaint);
    mStrokePaint.setStyle(Paint.Style.STROKE);
    mStrokePaint.setStrokeWidth(paramFloat / 10.0F);
    mDebugPaint = null;
    setTextColor(-1);
    setStrokeColor(-16777216);
    setText(paramString);
    computeMinSize();
  }
  
  public void beginEdit()
  {
    mEditing = true;
  }
  
  protected void computeMinSize()
  {
    mMinWidth = getMinTextWidth();
    mMinHeight = (getMinTextSize() * getNumLines());
    Log.i("text-drawable", "computeMinSize, minHeight: " + mMinHeight);
  }
  
  protected float computeTextHeight()
  {
    float f = getTextSize();
    Log.i("text-drawable", "computeTextHeight. single line height: " + f);
    if (mText.length() < 1) {
      return (int)f;
    }
    return Math.max(f, getNumLines() * f);
  }
  
  protected float computeTextWidth()
  {
    float f2 = 0.0F;
    float f1 = 0.0F;
    if (mText.length() > 0)
    {
      if (getNumLines() == 1) {
        f1 = getTextWidth(0, mText.length()) + mCursorWidth + mCursorDistance;
      }
    }
    else {
      return Math.max(f1, mMinWidth);
    }
    int j = 0;
    int i = 0;
    for (;;)
    {
      f1 = f2;
      if (i >= linesBreak.size()) {
        break;
      }
      int k = ((Integer)linesBreak.get(i)).intValue();
      f2 = Math.max(f2, getTextWidth(j, k) + mCursorWidth + mCursorDistance);
      j = k + 1;
      i += 1;
    }
  }
  
  protected void copyBounds(RectF paramRectF)
  {
    paramRectF.set(mBoundsF);
  }
  
  public void draw(Canvas paramCanvas)
  {
    copyBounds(drawRect);
    if (mDebugPaint != null) {
      paramCanvas.drawRect(drawRect, mDebugPaint);
    }
    int k = getNumLines();
    getFontMetrics(metrics);
    float f3 = metrics.descent;
    float f4 = metrics.leading;
    float f5 = metrics.bottom;
    float f6 = metrics.descent;
    float f7 = metrics.ascent - (metrics.top - metrics.ascent);
    float f1 = drawRect.top;
    float f8 = drawRect.left;
    int j = 0;
    int i = 0;
    if (i < k)
    {
      float f9 = f1 - f7;
      int m = ((Integer)linesBreak.get(i)).intValue();
      String str = mText.substring(j, m);
      if ((!isTextHint()) && (mStrokeEnabled)) {
        paramCanvas.drawText(str, f8, f9, mStrokePaint);
      }
      paramCanvas.drawText(str, f8, f9, mPaint);
      boolean bool;
      label258:
      float f10;
      float f11;
      float f12;
      label330:
      float f13;
      float f14;
      float f15;
      float f16;
      if ((mEditing) && (i == k - 1))
      {
        long l = System.currentTimeMillis();
        if (l - mNow > 400L)
        {
          if (mShowCursor) {
            break label453;
          }
          bool = true;
          mShowCursor = bool;
          mNow = l;
        }
        if (mShowCursor)
        {
          getLineBounds(k - 1, lastRect);
          f10 = drawRect.left;
          f11 = lastRect.right;
          f12 = mCursorDistance;
          if ((!isTextHint()) && (mStrokeEnabled)) {
            break label459;
          }
          f1 = 0.0F;
          f13 = drawRect.left;
          f14 = lastRect.right;
          f15 = mCursorWidth;
          f16 = mCursorDistance;
          if ((!isTextHint()) && (mStrokeEnabled)) {
            break label472;
          }
        }
      }
      label453:
      label459:
      label472:
      for (float f2 = 0.0F;; f2 = mStrokePaint.getStrokeWidth() / 2.0F)
      {
        paramCanvas.drawRect(f12 + (f10 + f11) + f1, f9 + f7, f16 + (f13 + f14 + f15) + f2, f9 + metrics.descent, mCursorPaint);
        j = m + 1;
        f1 = f9 + (f3 + f4 - (f5 - f6));
        i += 1;
        break;
        bool = false;
        break label258;
        f1 = mStrokePaint.getStrokeWidth() / 2.0F;
        break label330;
      }
    }
  }
  
  public void endEdit()
  {
    mEditing = false;
    if (((getText() == null) || (getText().length() < 1)) && (mHintString != null)) {
      setTextHint(mHintString);
    }
  }
  
  public float getCurrentHeight()
  {
    if (mIntrinsicHeight < 0.0F) {
      mIntrinsicHeight = computeTextHeight();
    }
    Log.i("text-drawable", "getIntrinsicHeight: " + mIntrinsicHeight);
    return mIntrinsicHeight;
  }
  
  public float getCurrentWidth()
  {
    if (mIntrinsicWidth < 0.0F) {
      mIntrinsicWidth = Math.max(mMinWidth, computeTextWidth());
    }
    Log.i("text-drawable", "getIntrinsicWidth: " + mIntrinsicWidth);
    return mIntrinsicWidth;
  }
  
  public float getDefaultTextSize()
  {
    return mDefaultTextSize;
  }
  
  public float getFontMetrics(Paint.FontMetrics paramFontMetrics)
  {
    return mPaint.getFontMetrics(paramFontMetrics);
  }
  
  public boolean getHorizontalFlip()
  {
    return false;
  }
  
  public boolean getHorizontalFlipEnabled()
  {
    return false;
  }
  
  public int getIntrinsicHeight()
  {
    return (int)getCurrentHeight();
  }
  
  public int getIntrinsicWidth()
  {
    return (int)getCurrentWidth();
  }
  
  protected void getLineBounds(int paramInt, Rect paramRect)
  {
    if (mText.length() > 0)
    {
      if (getNumLines() == 1)
      {
        mPaint.getTextBounds(mText, 0, mText.length(), paramRect);
        left = 0;
        return;
      }
      mPaint.getTextBounds(mText, ((Integer)linesBreak.get(paramInt - 1)).intValue() + 1, ((Integer)linesBreak.get(paramInt)).intValue(), paramRect);
      left = 0;
      right = ((int)getTextWidth(((Integer)linesBreak.get(paramInt - 1)).intValue() + 1, ((Integer)linesBreak.get(paramInt)).intValue()));
      return;
    }
    mPaint.getTextBounds(mText, 0, mText.length(), paramRect);
    left = 0;
    right = 0;
  }
  
  public float getMinHeight()
  {
    Log.i("text-drawable", "getMinHeight");
    return mMinHeight;
  }
  
  public float getMinTextSize()
  {
    return mMinTextSize;
  }
  
  protected float getMinTextWidth()
  {
    float[] arrayOfFloat = new float[1];
    mPaint.getTextWidths(" ", arrayOfFloat);
    return arrayOfFloat[0] / 2.0F;
  }
  
  public float getMinWidth()
  {
    return Float.MAX_VALUE;
  }
  
  public int getNumLines()
  {
    return Math.max(linesBreak.size(), 1);
  }
  
  public int getOpacity()
  {
    return mPaint.getAlpha();
  }
  
  public float getScaleX()
  {
    return 1.0F;
  }
  
  public boolean getStrokeEnabled()
  {
    return mStrokeEnabled;
  }
  
  public CharSequence getText()
  {
    return mText;
  }
  
  public int getTextColor()
  {
    return mPaint.getColor();
  }
  
  public float getTextSize()
  {
    return mPaint.getTextSize();
  }
  
  public int getTextStrokeColor()
  {
    return mStrokePaint.getColor();
  }
  
  protected float getTextWidth(int paramInt1, int paramInt2)
  {
    float[] arrayOfFloat = new float[paramInt2 - paramInt1];
    Log.d("text-drawable", "getTextWidth: " + mText.substring(paramInt1, paramInt2));
    mPaint.getTextWidths(mText, paramInt1, paramInt2, arrayOfFloat);
    return getTotal(arrayOfFloat);
  }
  
  protected float getTotal(float[] paramArrayOfFloat)
  {
    float f = 0.0F;
    int j = paramArrayOfFloat.length;
    int i = 0;
    while (i < j)
    {
      f += paramArrayOfFloat[i];
      i += 1;
    }
    return f;
  }
  
  protected void invalidateSize()
  {
    mIntrinsicHeight = -1.0F;
    mIntrinsicWidth = -1.0F;
  }
  
  public boolean isEditing()
  {
    return mEditing;
  }
  
  public boolean isTextHint()
  {
    return mTextHint;
  }
  
  protected void onTextInvalidate()
  {
    Log.i("text-drawable", "onTextInvalidate");
    if (isTextHint())
    {
      mPaint.setAlpha(mPaintAlpha / 2);
      mStrokePaint.setAlpha(mStrokeAlpha / 2);
    }
    for (;;)
    {
      linesBreak.clear();
      int i = 0;
      for (;;)
      {
        int j = mText.indexOf('\n', i);
        if (j <= -1) {
          break;
        }
        i = j + 1;
        linesBreak.add(Integer.valueOf(j));
      }
      mPaint.setAlpha(mPaintAlpha);
      mStrokePaint.setAlpha(mStrokeAlpha);
    }
    linesBreak.add(Integer.valueOf(mText.length()));
    invalidateSize();
    if (mSizeChangeListener != null)
    {
      EditableDrawable.OnSizeChange localOnSizeChange = mSizeChangeListener;
      float f1 = mBoundsF.left;
      float f2 = mBoundsF.top;
      float f3 = mBoundsF.left;
      float f4 = getIntrinsicWidth();
      float f5 = mBoundsF.top;
      localOnSizeChange.onSizeChanged(this, f1, f2, f4 + f3, getIntrinsicHeight() + f5);
    }
  }
  
  public void setAlpha(int paramInt)
  {
    mPaint.setAlpha(paramInt);
  }
  
  public void setBounds(float paramFloat1, float paramFloat2, float paramFloat3, float paramFloat4)
  {
    if ((paramFloat1 != mBoundsF.left) || (paramFloat2 != mBoundsF.top) || (paramFloat3 != mBoundsF.right) || (paramFloat4 != mBoundsF.bottom))
    {
      Log.i("text-drawable", "setBounds: " + paramFloat1 + ", " + paramFloat2 + ", " + paramFloat3 + ", " + paramFloat4);
      mBoundsF.set(paramFloat1, paramFloat2, paramFloat3, paramFloat4);
      setTextSize(paramFloat4 - paramFloat2);
    }
  }
  
  public void setBounds(int paramInt1, int paramInt2, int paramInt3, int paramInt4)
  {
    super.setBounds(paramInt1, paramInt2, paramInt3, paramInt4);
    setBounds(paramInt1, paramInt2, paramInt3, paramInt4);
  }
  
  public void setColorFilter(ColorFilter paramColorFilter)
  {
    mPaint.setColorFilter(paramColorFilter);
    mStrokePaint.setColorFilter(paramColorFilter);
    mCursorPaint.setColorFilter(paramColorFilter);
  }
  
  public void setCursorWidth(int paramInt)
  {
    mCursorWidth = paramInt;
  }
  
  public void setHorizontalFlip(boolean paramBoolean) {}
  
  public void setMinSize(float paramFloat1, float paramFloat2) {}
  
  public void setMinTextSize(float paramFloat)
  {
    Log.i("text-drawable", "setMinTextSize: " + paramFloat);
    mMinTextSize = paramFloat;
  }
  
  public void setOnSizeChangeListener(EditableDrawable.OnSizeChange paramOnSizeChange)
  {
    mSizeChangeListener = paramOnSizeChange;
  }
  
  public void setScaleX(float paramFloat) {}
  
  public void setStrokeColor(int paramInt)
  {
    mStrokePaint.setColor(paramInt);
    mStrokeAlpha = mStrokePaint.getAlpha();
  }
  
  public void setStrokeEnabled(boolean paramBoolean)
  {
    mStrokeEnabled = paramBoolean;
  }
  
  public void setText(CharSequence paramCharSequence)
  {
    setText((String)paramCharSequence);
  }
  
  public void setText(String paramString)
  {
    Log.i("text-drawable", "setText: " + paramString);
    mText = paramString;
    mTextHint = false;
    onTextInvalidate();
  }
  
  public void setTextColor(int paramInt)
  {
    mPaint.setColor(paramInt);
    mCursorPaint.setColor(paramInt);
    mPaintAlpha = mPaint.getAlpha();
  }
  
  public void setTextHint(CharSequence paramCharSequence)
  {
    setTextHint((String)paramCharSequence);
  }
  
  public void setTextHint(String paramString)
  {
    String str;
    if (paramString == null)
    {
      str = "";
      mText = str;
      if (paramString == null) {
        break label47;
      }
    }
    label47:
    for (boolean bool = true;; bool = false)
    {
      mTextHint = bool;
      str = paramString;
      if (paramString == null) {
        str = "";
      }
      mHintString = str;
      onTextInvalidate();
      return;
      str = paramString;
      break;
    }
  }
  
  public void setTextSize(float paramFloat)
  {
    if (!Float.valueOf(paramFloat / getNumLines()).equals(Float.valueOf(mPaint.getTextSize())))
    {
      Log.i("text-drawable", "setTextSize: " + paramFloat);
      int i = getNumLines();
      mPaint.setTextSize(paramFloat / i);
      mCursorPaint.setTextSize(paramFloat / i);
      mStrokePaint.setTextSize(paramFloat / i);
      mStrokePaint.setStrokeWidth(paramFloat / i / 10.0F);
      invalidateSize();
      computeMinSize();
    }
  }
  
  public boolean validateSize(RectF paramRectF)
  {
    Log.i("text-drawable", "validateSize: " + paramRectF.width() + "x" + paramRectF.height() + " == " + mMinHeight);
    return paramRectF.height() >= mMinHeight;
  }
}
